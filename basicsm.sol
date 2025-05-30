// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TransactionManager {
    // Mapping of addresses to balances (in wei)
    mapping(address => uint256) public balanceOf;

    // Event emitted whenever money is transferred from one user to another
    event Transacted(
        address indexed sender,
        address indexed recipient,
        uint256 amount
    );

    // Function to deposit Ether into the contract
    function topUpBalance() external payable {
        require(msg.value > 0, "Must send Ether to top up balance");
        balanceOf[msg.sender] += msg.value;
    }

    // Function for sending Ether from one account to another
    function sendMoney(address recipient, uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Insufficient funds.");
        require(recipient != address(0), "Invalid recipient address");

        // Update balances
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transacted(msg.sender, recipient, amount);
    }
}
