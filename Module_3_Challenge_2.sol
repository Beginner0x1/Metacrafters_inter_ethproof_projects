// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Abstract Contract
abstract contract Animal {
    string public species;

    // Abstract function
    function makeSound() external virtual;

    // Concrete function
    function setSpecies(string memory _species) external {
        species = _species;
    }
}

// Interface
interface Flying {
    function fly() external;
}

// Smart Contract that implements both the abstract contract and the interface
contract Bird is Animal, Flying {
    string public name;

    constructor(string memory _name) {
        name = _name;
        species = "Bird";
    }

    // Implementation of the abstract function from the Animal abstract contract
    function makeSound() external override {
        // Implement the sound a bird makes here
    }

    // Implementation of the function from the Flying interface
    function fly() external override {
        // Implement the flying behavior of the bird here
    }
}
