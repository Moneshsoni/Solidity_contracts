// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
library Add{
    function add_func(uint x,uint y)internal pure returns(uint){
        return x+y;
    }
}

contract Library{
    function getReuslt(uint a, uint b)public pure returns(uint){
        return Add.add_func(a,b);
    }
}