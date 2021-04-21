pragma solidity ^0.8.0;
contract Conditionals{
    
    uint[] public numbers = [1,2,3,4];
    function IsEven(uint _number) public pure returns(bool){
        if (_number % 2==0){
            return true;
        }
        else{
            return false;
        }
    }
    function CountEven() public view returns(uint){
        uint count = 0;
        for(uint Idx = 0; Idx < numbers.length; Idx++){
            if (IsEven(numbers[Idx])){
                count++;
            }
        }
        return count;
    }
    function RetCorrespond() public view returns(bool [] memory){
        bool[] memory ret = new bool[](numbers.length);
        for(uint Idx =0; Idx < numbers.length; Idx++){
            if (IsEven(numbers[Idx])){
                ret[Idx] = true;
            }
        }
        return ret;
    }
    
    
    address public owner;
    constructor (){
        owner = msg.sender;
    }
    
    function IsOwner() public view returns(bool){
        return (msg.sender == owner);
    }
}