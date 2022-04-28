import urllib
import os
from flask import Flask,redirect,request
from secrets import token_hex
app = Flask(__name__)
 
@app.route('/fetch')
def fetch():
    url = request.args.get('url', '')
    if url.startswith("https://vuln.com"):
      response = urllib.request.urlopen(url)
      html = response.read()
      return html
    return ""
