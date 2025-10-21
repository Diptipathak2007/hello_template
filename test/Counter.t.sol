// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Counter.sol";

contract TestContract is Test {
    Counter c;
    function setUp() public {
        c = new Counter(5);
    }
    function testincrement() public {
        c.increment();
        c.increment();
        assertEq(c.getnum(), 7,"ok");
    }
    function testdecrement() public {
        c.decrement();
        c.decrement();
        assertEq(c.getnum(), 3,"ok");
    }
    function testfaileddecrement() public {
        c.decrement();
        c.decrement();
        c.decrement();
        c.decrement();
        c.decrement();
        c.decrement();

    }
}
