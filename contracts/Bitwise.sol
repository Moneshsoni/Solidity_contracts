// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract BitwiOp{
    function andOp(uint x,uint y)public pure returns(uint){
        return x&y;
    }


    function orOp(uint x,uint y)public pure returns(uint){
        return x|y;
    }

    function xorOp(uint x,uint y)public pure returns(uint){
        return x^y;
    }

    


}