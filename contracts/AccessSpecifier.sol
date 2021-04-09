pragma solidity ^0.8.0;
//solidity    c++
//internal ~ protected
//private  ~ private
//public   ~ public
//abstract ~ virtual()=0

abstract contract BaseContract {
    function getHelloString() virtual public returns(string memory);
}

// select ChildContract before deploying in remix. Took me 10 min to resolve this.!
contract ChildContract is BaseContract{
    function getHelloString() public pure override returns(string memory){
        return "Hello";
    }
}

contract InternalParent{
    string internal value="";
    function Getvalue() public view returns(string memory){
        return value;
    }
    function SetValue(string memory Input) public{
        value = Input;
    }
}

contract ChildForInternal is InternalParent{
    function ResetValue() public{
        value = "";
    }
}

