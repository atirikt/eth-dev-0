pragma solidity ^0.8.0;
contract MakeFunctions{
    uint8 integer = 5;
    string  strOnBlockchain = "Very expensive";
    function Add(uint8 addition) internal returns(uint8){
        integer += addition; 
        return integer;
    }
    function getIntegerAndString() public view returns(uint8, string memory){
        return (integer, strOnBlockchain);
    }
    function modifiyIntAndStr(string memory str, uint8 val) public{
        integer += val;
        strOnBlockchain = str;
    }
}