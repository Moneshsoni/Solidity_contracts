// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract Car{
    string public name;
    string public model;
    address public owner;
    constructor(string memory _name,string memory _model, address _owner)payable{
        name = _name;
        model = _model;
        owner = _owner;
    }
}