// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniBank {
    mapping (address => uint) private balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    
    function balance() public view returns (uint) {
        return balances[msg.sender];
    }
}
