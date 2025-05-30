// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract HelloWorld{

    string public message;
    constructor(){
        message="hello world";
    }
    function setMessage(string memory newMessage) public{
    }

    function getMessage() public view returns (string memory){
         return message; 
    }
    
}

