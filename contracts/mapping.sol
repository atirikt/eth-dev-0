pragma solidity ^0.8.0;


contract Mapping {
    struct Animal{
        uint id;
        string  name;
    }

    //codename=>animal
    mapping (string=>Animal) public names;
    
    constructor() {
        names["alpha"] = Animal(1, 'griffin');
        names["beta"] = Animal(1,'horse');
    }
    
    function AddAnimal(uint _id, string memory _animalName, string memory _codename) public{
        names[_codename] = Animal(_id, _animalName);
    }
    
    //user=>codename=>animal
    mapping(address=>mapping (string=>Animal)) public grouping;
    
    function addMyAnimal(uint _id, string memory _name, string memory _code) public{
        grouping[msg.sender][_code] = Animal(_id, _name);
    }
}