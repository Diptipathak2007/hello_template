//₹SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract LockUSDT{
    address private usdtAddress;
    mapping(address => uint256) public balances;
    constructor(address _usdtAddress){

    }
    function deposit(uint256 _amount) public {
       require(IERC20(usdtAddress).allowance(msg.sender, address(this)) >= _amount, "Insufficient allowance");
       IERC20(usdtAddress).transferFrom(msg.sender, address(this), _amount);
       balances[msg.sender] += _amount;
    }
    function withdraw() public {
        uint256 remainingBalance = balances[msg.sender];
        require(remainingBalance > 0, "No balance to withdraw");
        balances[msg.sender] = 0;
        IERC20(usdtAddress).transfer(msg.sender, remainingBalance);
    }
}