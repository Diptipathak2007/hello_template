// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TIIcoin is ERC20 {
    constructor(uint256 _initialvalue)ERC20("Tiicoin","TII"){
        _mint(msg.sender,_initialvalue);
    }
}
