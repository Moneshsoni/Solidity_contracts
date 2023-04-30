// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
interface Token {
    // enum TokenType { Fungible, NonFungible }
    // struct Coin { string obverse; string reverse; }
    // function transfer(address recipient, uint amount) external;
    function getValue()external view returns(uint);
    function setValue(uint) external;
}

contract MyCon is Token{ 
    uint number;

    constructor(uint _number){
        number = _number;
    }
    function setValue(uint _number)external{
        number = _number;
    }
    function getValue()external view returns(uint){
        return number;
    }
}


contract Mycon2Factory{

    
    function valueCreate(uint _number)external{
        MyCon mycon = new MyCon(_number);
     
    }
    // MyCon mycon = new MyCon(mycon.getValue());


}