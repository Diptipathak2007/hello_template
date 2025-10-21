// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Tiicoin.sol";

contract TestTiicoin is Test {
    Tiicoin tiicoin;


    function setUp() public {
        tiicoin = new Tiicoin(1000 ether);
    }
    function testSimple() public {
        assertEq(uint(1),uint(1),"1 is not equal to 1");
    }
    
}
   