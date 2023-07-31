// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;

contract SimplePaymentContract {

    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit() public payable {
        // Allow users to deposit Ether to their balance
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");

        // Transfer the requested amount to the sender
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function withdrawAll() public onlyOwner {
        // Only the contract owner can withdraw the entire contract balance
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "Contract balance is zero.");

        // Transfer the entire contract balance to the owner
        payable(owner).transfer(contractBalance);
    }
}
