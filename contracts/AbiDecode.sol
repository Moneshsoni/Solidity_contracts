// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract AbiDecode{
    struct MyStruct{
        string name;
        uint[2] nums;
    }

    function encode(uint x,address addr, MyStruct calldata mystruct)external pure returns(bytes memory) {
        return abi.encode(x,addr,mystruct);
    }

    function decode(bytes calldata data)external pure returns(uint x,address addr,MyStruct memory mystruct){
        (x,addr,mystruct) = abi.decode(data,(uint, address, MyStruct));
    }
}

