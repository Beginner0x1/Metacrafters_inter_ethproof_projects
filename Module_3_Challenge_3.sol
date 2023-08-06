// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18

contract MathOperations {
    // View function: reads data from the blockchain but does not modify it.
    function add(uint256 a, uint256 b) public view returns (uint256) {
        return a + b;
    }

    // View function: computes the difference without modifying the blockchain's state.
    function subtract(uint256 a, uint256 b) public view returns (uint256) {
        require(b <= a, "Subtraction error: b must be less than or equal to a");
        return a - b;
    }

    // Pure function: performs computation based on input parameters but does not read or modify the blockchain's state.
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // Pure function: computes the division result without modifying the blockchain's state.
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b > 0, "Division by zero is not allowed");
        return a / b;
    }
}
