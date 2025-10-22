// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Tiicoin.sol";

contract TestTiicoin is Test {
    Tiicoin tiicoin;
    function setUp() public {
        tiicoin = new Tiicoin();//0.0001
    }
    function testMint() public {
        tiicoin.mint(address(this), 500);
        assertEq(tiicoin.balanceOf(address(this)), 500, "Balance should be 500 TII");
        assertEq(tiicoin.balanceOf(0xbF418c1822274015B142715799C24B4Cb576866e), 0, "Address should be zero");
        tiicoin.mint(address(this), 500);
        assertEq(tiicoin.balanceOf(address(0xbF418c1822274015B142715799C24B4Cb576866e)), 1000, "Balance should be 1000 TII");
    }
    
}
   