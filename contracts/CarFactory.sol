// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Car.sol";
contract CarFactory{
    Car[]  public cars;
    function CarCreate(string memory _name, string memory _model,address _owner)public payable {
        Car car = new Car(_name,_model,_owner);
        cars.push(car);
    }

    function getCar(uint _index)public view returns(string memory name,string memory model,address owner){
        Car car = cars[_index];
        return (car.name(),car.model(),car.owner());
    }

}