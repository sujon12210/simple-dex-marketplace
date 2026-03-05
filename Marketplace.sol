// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title Marketplace
 * @dev A professional primitive for peer-to-peer on-chain commerce.
 */
contract Marketplace is ReentrancyGuard {
    uint256 public itemCount;

    struct Item {
        uint256 id;
        address payable seller;
        string name;
        uint256 price;
        bool isSold;
    }

    mapping(uint256 => Item) public items;

    event ItemListed(uint256 id, address seller, string name, uint256 price);
    event ItemSold(uint256 id, address buyer, address seller, uint256 price);

    /**
     * @dev Creates a new listing in the marketplace.
     */
    function listItem(string memory _name, uint256 _price) external {
        require(_price > 0, "Price must be at least 1 wei");
        itemCount++;
        items[itemCount] = Item(itemCount, payable(msg.sender), _name, _price, false);
        emit ItemListed(itemCount, msg.sender, _name, _price);
    }

    /**
     * @dev Executes the purchase of a listed item.
     */
    function purchaseItem(uint256 _id) external payable nonReentrant {
        Item storage item = items[_id];
        require(_id > 0 && _id <= itemCount, "Item does not exist");
        require(msg.value == item.price, "Please submit the exact asking price");
        require(!item.isSold, "Item already sold");
        require(msg.sender != item.seller, "Seller cannot buy their own item");

        item.isSold = true;
        item.seller.transfer(msg.value);

        emit ItemSold(_id, msg.sender, item.seller, item.price);
    }
}
