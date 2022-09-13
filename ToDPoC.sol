pragma solidity 0.8.0 ;
 
 //EhterAuthority.io
 contract TodPoC{
     
    uint256 public purchaseQuantity;
    uint256 public Price;
    address public Owner;
   
    event BuyEv(address buyer, uint256 _Price, uint256 _quantity);
    event PriceChangeEv(address _owner, uint256 _Price);
    
 modifier onlyOwner(){
    require(msg.sender == Owner);
    _;
    
    }

    constructor()public{
        Owner = msg.sender;
        Price = 5;
    }
    
    function Buy()payable public returns(uint256){
        purchaseQuantity = msg.value/Price;
        emit BuyEv(msg.sender,Price, purchaseQuantity);
        return Price;
    }
    
    function Setprice(uint256 newPrice) public onlyOwner{
         Price = newPrice;
         emit PriceChangeEv(Owner, Price);
        }
}

/*


contract TodPoCSolution{
    uint256 public Price;
    uint256 public PriceChangeIndex;
    uint256 public PurchaseQuantity;
    address public Owner;

    event BuyEv(address buyer, uint256 _Price);
    event PriceChangeEv(address _owner, uint256 _Price);

modifier onlyowner(){
    require(msg.sender == Owner);
    _;
}

constructor()public {
    Owner = msg.sender;
    Price = 5;
    PriceChangeIndex = 0;
    }


    function getPriceChangeIndex() public view returns(uint256){
        return PriceChangeIndex;
    }
    
    function buy(uint256 _PriceChangeIndex) public payable returns(bool){
        require (_PriceChangeIndex == PriceChangeIndex);
        PurchaseQuantity = msg.value/ Price;
        emit BuyEv(msg.sender, Price);
        return true;
    }
    
    function setPrice(uint256 _Price) public onlyowner returns(bool){
        Price = _Price;
        PriceChangeIndex += 1 ;
        emit PriceChangeEv(Owner, Price);
        return true;
    }

}
*/
