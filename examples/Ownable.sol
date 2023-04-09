// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Not a valid address");
        owner = _newOwner;
    }

    function onlyOwnerCanCall() external onlyOwner {
        // ...
    }

    function anyoneCanCall() external {
        // ...
    }
}
