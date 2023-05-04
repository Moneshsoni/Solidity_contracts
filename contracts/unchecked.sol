// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract UnCheck{
    function passOver(uint8 a,uint8 b)public pure returns(uint){
        unchecked {
            return a+b;
        }
    }

    function withCheck(uint8 a, uint8 b)public pure returns(uint){
        return a+b;
    }
}