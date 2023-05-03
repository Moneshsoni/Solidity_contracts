
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.9;

    //userSet 1,monesh,soni
    contract User{
        struct Name{
            string name;
            string surname;
        }
        uint[] public arr;

        mapping(uint=> Name[]) private names;

        function setUser(uint  _id,string memory  name, string memory surname)public{
            // names[_id].push(Name(_name,_surname));
            names[_id].push(Name(name, surname));
        }

        function getValue(uint _id)public view returns(Name[] memory){
            return names[_id];
        }

        function remUser(uint _id)public{
            delete names[_id];
        }

        function setArr(uint[] memory _arr)public{
            arr = _arr;
        }

        function getArr()public view returns(uint[] memory){
            return arr;
        }
        
        function remSpecificUser(uint index)public{
            for(uint256 i= index; i<arr.length-1; i++){
                arr[i] = arr[i+1];
            }
            arr.pop();
        }
    }