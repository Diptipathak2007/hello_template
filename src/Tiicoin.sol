// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Tiicoin is ERC20 {
    uint256 public supply;
    constructor() ERC20("Tiicoin", "TII") {
        
    }
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
   
}
