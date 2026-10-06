// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CrossDimensionCrypto is ERC20, ERC20Burnable, Ownable {
    uint256 private immutable _maxSupply;

    constructor() ERC20("CrossDimensionCrypto", "XDC") Ownable(msg.sender) {
        _maxSupply = 1_000_000_000 * 10 ** decimals();
        _mint(msg.sender, _maxSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= _maxSupply, "CrossDimensionCrypto: max supply exceeded");
        _mint(to, amount);
    }
}
