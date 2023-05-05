// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract EtherWallet{
    address payable  public owner;
    constructor(){
        owner = payable(msg.sender);
    }  

    function DonateFund()public payable{

    }
    
    receive()payable external{
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"You have not authority to Withdraw");
        _;
    }

    function Withdraw(uint _amount)public payable onlyOwner{
        owner.transfer(_amount);
    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }
}