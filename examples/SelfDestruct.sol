// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Kill {
    constructor() payable {}

    function kill() public {
        // "selfdestruct" has been deprecated. The underlying
        // opcode will eventually undergo breaking changes,
        // and its use is not recommended.
        selfdestruct(payable(msg.sender));
    }

    // Calling this function will fail after the contract is killed.
    function testCall() external pure returns (uint) {
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.kill();
    }
}
