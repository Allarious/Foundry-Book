// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

error Unauthorized();

contract CounterOwner {
    address public immutable owner;
    uint public counter;
    constructor() {
        owner = msg.sender;
    }

    function increment() external {
        if(msg.sender != owner){
            revert Unauthorized();
        }
        ++counter;
    }
}