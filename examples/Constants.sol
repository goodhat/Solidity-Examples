// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// 21442 gas
contract Constants {
    // coding convention to uppercase constant variables
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
}

// 23553 gas
contract Var {
    address public MY_ADDRESS = address(0); // cost more gas than constant
}