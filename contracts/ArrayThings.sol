pragma solidity ^0.8.0;
contract ArrayThings{
    
    struct Animal{
        uint id;
        string  name;
    }
    
    Animal[] public animal;
    
    constructor(){
        animal.push(Animal(1,'Chihuahua'));
    }
    function getAnimal(uint Idx) public view returns(Animal memory){
        return animal[Idx];
    }
    function addAnimal(uint id, string memory name) public{
        animal.push(Animal(id, name));
    }
    function getLength() public view  returns(uint){
        return animal.length;
    }
    //the following operation is expensive.
    function removeAnimal(uint Idx) public{
        delete animal[Idx];
        for (uint nIdx = Idx;nIdx < animal.length-1;nIdx++){
            animal[nIdx] = animal[nIdx+1];
        }
        animal.pop(); //last element
    }
    
    //2d arrays are expensive, try replace them with mapping of a mapping
    uint[][] public array2d = [[1,2,3],[5,7,1]];
    function get2dRowLength() public view returns(uint){
        return array2d.length;
    }
    
    function getColumnLength() public view  returns(int){
        if (array2d.length > 0)
        {
            return int(array2d[0].length);
        }
        else
        {
            return -1;
        }
    }
    
    function getRow(uint Idx) public view returns(uint[] memory){
        return array2d[Idx];
    }
    
    function addRowIn2d(uint[] memory xRow) public {
        array2d.push(xRow);
    }
    
    function deleteLastRowIn2d() public{
        array2d.pop(); //last element
    }
    
    function deleteRow2d(uint Idx) public{
        for (uint nIdx = Idx; nIdx < array2d.length-1; nIdx++){
            array2d[nIdx] = array2d[nIdx+1];
        }
        array2d.pop();
    }

}