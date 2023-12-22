// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestUSDC is ERC20 {
    constructor() ERC20("TestUSDC", "USDC") {
        faucet(msg.sender, 1000000000);
    }

    function decimals() public view virtual override returns (uint8) {
        return 6;
    }

    function faucet(address to, uint256 usd) public {
        require(to != address(0), "invalid to address");
        require(usd > 0 && usd <= 1000000000, "invalid amount");

        uint256 amount = usd * 10**decimals();
        _mint(to, amount);
    }
}
