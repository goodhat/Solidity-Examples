// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ViewAndPure {
    uint public x = 1;

    // It is not possible to prevent functions from reading
    // the state at the level of the EVM, it is only possible
    // to prevent them from writing to the state (i.e. only
    // view can be enforced at the EVM level, pure can not).

    // Promise not to modify the state.
    // https://docs.soliditylang.org/en/v0.8.19/contracts.html#view-functions
    // If the compiler’s EVM target is Byzantium or newer
    // (default) the opcode STATICCALL is used when view
    // functions are called, which enforces the state to
    // stay unmodified as part of the EVM execution. For
    // library view functions DELEGATECALL is used, because
    // there is no combined DELEGATECALL and STATICCALL.
    // This means library view functions do not have run-time
    // checks that prevent state modifications. This should
    // not impact security negatively because library code is
    // usually known at compile-time and the static checker
    // performs compile-time checks.
    // Getter methods are automatically marked view.
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    // If the compiler’s EVM target is Byzantium or newer
    // (default) the opcode STATICCALL is used, which does
    // not guarantee that the state is not read, but at
    // least that it is not modified.
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}
