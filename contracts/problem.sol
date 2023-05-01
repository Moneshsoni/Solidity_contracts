// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract ContUser{
    mapping(uint=>mapping(string=>string)) userName;
    bool filled;
    function UserSet(uint _id, string memory _name, string  memory _surname)public{
        userName[_id][_name] = _surname;
        filled = true;
    }

    function getUser(uint _id, string memory _name)public view returns(string memory){
        return userName[_id][_name];
    }
    
    function remUser(uint _id, string memory _name)public{
        
        delete userName[_id][_name];
        
    }


}

//userSet 1,monesh,soni