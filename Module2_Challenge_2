// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MainContract {
    uint public num; // A public variable to store a number
    address public sender; // A public variable to store the sender's address
    uint public value; // A public variable to store the value in wei sent with the transaction

    // Function to set the variables
    function setVars(uint _num) public payable {
        num = _num; // Set the num variable to the provided value
        sender = msg.sender; // Set the sender variable to the address of the sender
        value = msg.value; // Set the value variable to the value sent with the transaction
    }
}

contract ProxyContract {
    uint public num; // A public variable to store a number
    address public sender; // A public variable to store the sender's address
    uint public value; // A public variable to store the value in wei sent with the transaction

    // Function to set variables in another contract using delegatecall
    function setVars(address _contract, uint _num) public payable {
        // Perform a delegatecall to the specified contract with the provided _num argument
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );

        // Note: The result of the delegatecall is stored in `success` and `data` variables, but they are not used here.
        // The reason is that the delegatecall will execute the code in the target contract (MainContract) but store the
        // state in the ProxyContract itself, not in the MainContract. Therefore, the public variables (num, sender, value)
        // of ProxyContract will be updated, not the ones in MainContract.
    }
}

