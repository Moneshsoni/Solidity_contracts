// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
contract SomeContract{
    function someCall()external{
        revert("This is called");
    }
}

contract Try_catch{
    event Try(string message);
    event Catch(string message);
    SomeContract public someContract;
    constructor(){
        someContract = new SomeContract();
    }
    // SomeContract someContract = new SomeContract();

    function getContract()public view returns(SomeContract){
        return someContract;
    }
    function TryCatch()external{
        try someContract.someCall(){
            emit Try("This is called Try Block");
        }catch{
            emit Catch("This is called catch Block");
        }
    }
}