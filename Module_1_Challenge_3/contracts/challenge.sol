
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.18;

contract MessageContextExample {

    address public sender;
    uint256 public value;
    bytes public data;

    constructor() {

        // Set the initial values of the contract state variables

        sender = msg.sender;
        value = msg.value;
        data = msg.data;
    }

    function sendMessage(address _recipient, bytes calldata _message) public payable {

        // Transfer some Ether to the recipient and store the sent data

        payable(_recipient).transfer(msg.value);
        data = _message;

    }

    function getSender() public view returns (address) {

        return msg.sender;

    }

    function getValue() public view returns (uint256) {

        return msg.value;

    }

    function getData() public view returns (bytes memory) {
        
        return msg.data;

    }
}

