pragma solidity ^0.8.0;

contract Ownable {
    address owner;
    
    modifier onlyOwner(){
        require (msg.sender == owner, 'who are you?');
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
}

contract SecretVault{
    string secret;

    constructor(string memory _secret){
        secret = _secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

//inheritance
contract Basic is Ownable {
    address secretVault;
    
    constructor(string memory _secret){
        //contract inside a contract
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view onlyOwner returns(string memory){
        SecretVault _secretVault = SecretVault(secretVault); 
        return _secretVault.getSecret();
    }
    
}