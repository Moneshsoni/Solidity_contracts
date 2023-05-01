pragma solidity ^0.8.9;
contract B{
    uint public num;
    address public user;
    uint public value;
    string public name;
    function setVars(uint _num,string memory _name)public payable{
        num = _num;
        user = msg.sender;
        value = msg.value;
        name = _name;
    }
}

contract A{
    uint public num;
    uint public user;
    uint public value;
    string public name;

    function setVars(address _contract,uint _num,string memory _name)public payable{
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256,string)", _num,_name)
        );
        require(success,"Transactions failde");
    }
}