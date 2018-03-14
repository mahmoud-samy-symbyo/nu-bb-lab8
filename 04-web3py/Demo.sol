pragma solidity ^0.4.0;


contract Demo {
    uint initial = 0; 
    uint extra = 0;
    address lastSender;
   
    function Demo() public payable {
        initial += msg.value;
    }
    
    function takeMoreEth() public payable{
         extra += msg.value;
         lastSender = msg.sender;
    }

    function giveEthTo(address to) public {
        to.transfer(10000);
    }
    
    function getMyBalance() constant public returns (uint){
        return this.balance;
    }

    function getInitial() constant public returns (uint){
        return initial;
    }
    
    function getExtra() constant public returns (uint){
        return extra;
    }
    
    function getLastSender() constant public returns (address){
        return lastSender;
    }
    
    function () public payable {}
    
    
}




