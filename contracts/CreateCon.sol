// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract C {
    uint public a=100;
}

contract M{
    C c = new C();
    function getReturn()public view returns(uint){
        return c.a();
    }

}