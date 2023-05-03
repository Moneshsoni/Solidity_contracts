// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
interface IERC20{
    function transfer(address,uint)external;
}

contract Token{
    function transfer(address,uint)external{}
}

contract AbiEncode{
    function  test(address _contract,bytes calldata data)external{
        (bool ok,) = _contract.call(data);
        require(ok,"Call Failed");
    }

    function encodeWithSignature(address to,uint amount)external pure returns(bytes memory){
        return abi.encodeWithSignature("transfer(address,uint)", to,amount);
    }

    function encodeWithSelector(address to,uint amount)external pure returns(bytes memory){
        return abi.encodeWithSelector(IERC20.transfer.selector, to,amount);
    }

    function encodeCall(address to,uint amount)external pure returns(bytes memory){
        return abi.encodeCall(IERC20.transfer,(to, amount));
    }

    function encodeAdd(uint a,uint b)external pure returns(bytes memory){
        uint c = a+b;
        return abi.encodePacked(c);
    }
}

