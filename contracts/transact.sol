pragma solidity ^0.8.0;

contract HotelRoom{
    
    enum Statuses {Vacant, Occupied}
    Statuses currentStatus;
    
    address payable public owner;
    
    event Occupy(address occupant, uint value);
    
    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    
    modifier OnlyWhileVacant{
        require (currentStatus == Statuses.Vacant, "It's Occupied");
        _;
    }
    
    modifier etherCheck(uint _amount){
        require (msg.value >= _amount, "not enough ether");
        _;
    }
    
    receive() external payable OnlyWhileVacant etherCheck(2 ether) {
        //require (currentStatus == Statuses.Vacant, "It's Occupied");
        //require (msg.value >= 2 ether, "not enough ether");
        owner.transfer(msg.value);
        currentStatus = Statuses.Occupied;
        emit Occupy(msg.sender, msg.value);
    }
}