// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;

contract AdminAccessControl {
    
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can access this function.");
        _;
    }

    // This function can be accessed by anyone
    function publicFunction() external pure returns (string memory) {
        return "This is a public function accessible by anyone.";
    }

    // This function can only be accessed by the admin
    function adminOnlyFunction() external view onlyAdmin returns (string memory) {
        return "This is an admin-only function.";
    }

    // This function can only be accessed by the admin
    function anotherAdminOnlyFunction() external view onlyAdmin returns (uint256) {
        return block.number;
    }

    // Modifier can be applied to multiple functions
    function yetAnotherAdminOnlyFunction() external view onlyAdmin returns (bool) {
        return true;
    }
}

