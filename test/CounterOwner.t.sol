// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CounterOwner.sol";

contract CounterOwnerTest is Test {
    CounterOwner public counterOwner;

    function setUp() public {
        counterOwner = new CounterOwner();
    }

    function testIncrement() public {
        assertEq(counterOwner.counter(), 0);
        counterOwner.increment();
        assertEq(counterOwner.counter(), 1);
    }

    function testIncrementAsNotOwner() public {
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        counterOwner.increment();
    }
}