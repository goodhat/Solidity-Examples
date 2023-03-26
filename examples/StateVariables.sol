// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StateVariables {
    uint public myUint = 123;

    function foo() pure external {
        uint notStateVariable = 456;
    }
}

contract SimpleStorage {
    // State variable to store a number
    uint public num;

    // You need to send a transaction to write to a state variable.
    function set(uint _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.
    function get() public view returns (uint) {
        return num;
    }
}

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }

contract C is A {
    // This is the correct way to override inherited state variables.
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}