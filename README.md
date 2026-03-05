# Simple DEX Marketplace

An expert-level decentralized marketplace implementation. This repository provides the core logic for a trustless storefront where users can list items for a specific price in Ether and buyers can purchase them directly through the smart contract.

## Features
* **Non-Custodial:** The contract handles the transfer of value without holding user funds indefinitely.
* **State Management:** Tracks items from "Listed" to "Sold" using efficient enumerations.
* **Security Checks:** Validates price, availability, and ownership before any transaction.

## Getting Started
1. Deploy `Marketplace.sol`.
2. Call `listItem` with a descriptive name and a price in Wei.
3. Buyers call `purchaseItem` sending the exact amount of Ether required.

## License
MIT
