// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataTypeExperiment {
    uint256 public myUint = 10;           
    int256 public myInt = -5;        
    bool public myBool = true;            
    address public myAddress = msg.sender;
    string public myString = "Web3";     

    function performOperations(uint256 _newValue) public returns (uint256) {
        uint256 localSum = myUint + _newValue;
        

        myUint = localSum; 
        myBool = !myBool;
        
        return localSum;
    }
}