// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EtherReceiver {
    // Fallback function to receive Ether when the contract is called with no data or unrecognized function signature
    fallback() external payable {}

    // Function to check the contract's balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
