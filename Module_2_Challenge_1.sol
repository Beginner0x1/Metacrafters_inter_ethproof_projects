// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract StorageAndMemoryExample {
    // State variables (stored in contract storage)

    uint256 public storedValue; // Example of a storage variable
    

    // Constructor - executed only once when the contract is deployed
    
    constructor() {
        storedValue = 0;
    }

    // Function to update the value in storage
    function updateStoredValue(uint256 newValue) public {
        storedValue = newValue;
    }

    // Function to read the stored value from storage
    function getStoredValue() public view returns (uint256) {
        return storedValue;
    }

    // Function that uses memory variables
    function addValues(uint256 a, uint256 b) public pure returns (uint256) {
        // Example of memory variables
        uint256 result = a + b;
        return result;
    }
}
