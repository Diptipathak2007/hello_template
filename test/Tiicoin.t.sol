// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Tiicoin.sol";

contract TestTiicoin is Test {
    Tiicoin tiicoin;
    function setUp() public {
        tiicoin = new Tiicoin(); //0.0001
    }
    function testMint() public {
        tiicoin.mint(address(this), 500);
        assertEq(
            tiicoin.balanceOf(address(this)),
            500,
            "Balance should be 500 TII"
        );
        assertEq(
            tiicoin.balanceOf(0xbF418c1822274015B142715799C24B4Cb576866e),
            0,
            "Address should be zero"
        );
        tiicoin.mint(address(this), 500);
        assertEq(
            tiicoin.balanceOf(
                address(0xbF418c1822274015B142715799C24B4Cb576866e)
            ),
            0,
            "Balance should be 1000 TII"
        );
    }
    function testTransfer() public {
        tiicoin.mint(address(this), 1000);
        tiicoin.transfer(
            address(0xbF418c1822274015B142715799C24B4Cb576866e),
            400
        );
        assertEq(
            tiicoin.balanceOf(address(this)),
            600,
            "Balance should be 600 TII"
        );
        assertEq(
            tiicoin.balanceOf(
                address(0xbF418c1822274015B142715799C24B4Cb576866e)
            ),
            400,
            "Balance should be 400 TII"
        );
        vm.prank(address(0xbF418c1822274015B142715799C24B4Cb576866e));
        tiicoin.transfer(address(this), 200);

        assertEq(
            tiicoin.balanceOf(address(this)),
            800,
            "Balance should be 800 TII"
        );
        assertEq(
            tiicoin.balanceOf(
                address(0xbF418c1822274015B142715799C24B4Cb576866e)
            ),
            200,
            "Balance should be 200 TII"
        );
    }
    function testApprovals() public {
        tiicoin.mint(address(this), 1000);
        tiicoin.approve(
            address(0xbF418c1822274015B142715799C24B4Cb576866e),
            300
        );
        vm.prank(address(0xbF418c1822274015B142715799C24B4Cb576866e));
        tiicoin.transferFrom(
            address(this),
            address(0xbF418c1822274015B142715799C24B4Cb576866e),
            200
        );
        assertEq(
            tiicoin.balanceOf(address(this)),
            800,
            "Balance should be 800 TII"
        );
        assertEq(
            tiicoin.balanceOf(
                address(0xbF418c1822274015B142715799C24B4Cb576866e)
            ),
            200,
            "Balance should be 200 TII"
        );
        assertEq(
            tiicoin.allowance(
                address(this),
                address(0xbF418c1822274015B142715799C24B4Cb576866e)
            ),
            100,
            "Remaining Allowance should be 100 TII"
        );
    }
    function test_RevertWhen_ApprovalsExceeded() public {
        tiicoin.mint(address(this), 1000);
        tiicoin.approve(
            address(0xbF418c1822274015B142715799C24B4Cb576866e),
            300
        );

        vm.prank(address(0xbF418c1822274015B142715799C24B4Cb576866e));
        vm.expectRevert(); // Expect the next call to revert
        tiicoin.transferFrom(
            address(this),
            address(0xbF418c1822274015B142715799C24B4Cb576866e),
            400
        );
    }
    function test_RevertWhen_TransferExceedsBalance() public {
        tiicoin.mint(address(this), 1000);

        vm.expectRevert(); // Expect the next call to revert
        tiicoin.transfer(
            address(0xbF418c1822274015B142715799C24B4Cb576866e),
            1200
        );
    }
}
