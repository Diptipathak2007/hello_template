// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract Counter { 
    uint private num;
    constructor(uint _num){
        num = _num;
    }
    function increment() public {
        num += 1;
    }
    function decrement() public {
        require(num > 0, "Cannot go below zero");
        num -= 1;
    }
    function getnum() public view returns (uint) {
        return num;
    }
}

