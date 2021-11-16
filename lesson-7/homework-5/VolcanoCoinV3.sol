// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VolcanoCoinV3 is ERC20 {

    struct Payment {
        uint amountTransfered;
        address recipientAddress;
    }
    
    struct PaymentHistory {
        Payment[] history;
    }
    
    uint totalSupply;
    address owner;
    mapping (address => uint) public balance;
    Payment[] allPayments;
    mapping (address => Payment[]) public historyPerAddress;
    
    event AddedSupply(uint);
    event Transfer(uint, address);
    event LogPayments(Payment[]);
    
    constructor() ERC20("VolcanoCoin", "VOL") {
        //This internally set a total supply and linked it to the owner
        _mint(msg.sender, 1000);
    }
    
    function getBalance(address user) public view returns(uint) {
        return balance[user];
    }
    
    function getMyBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function transfer(uint amountToTransfer, address recipientAddress) public {
        require(balance[msg.sender] > amountToTransfer);
        balance[msg.sender] -= amountToTransfer;
        balance[recipientAddress] += amountToTransfer;
        allPayments.push(Payment({amountTransfered: amountToTransfer, recipientAddress: recipientAddress}));
        historyPerAddress[msg.sender].push(Payment({amountTransfered: amountToTransfer, recipientAddress: recipientAddress}));
        emit Transfer(amountToTransfer, recipientAddress);
    }
    
    function logMyHistory() public {
        emit LogPayments(historyPerAddress[msg.sender]);
    }
    
    function logHistory(address recipientAddress) public {
        emit LogPayments(historyPerAddress[recipientAddress]);
    }
    
    function getMyHistory() public returns (Payment[] memory) {
        return historyPerAddress[msg.sender];
    }
    
    function getHistory(address recipientAddress) public returns (Payment[] memory) {
        return historyPerAddress[recipientAddress];
    }
 
    function getTransactionsCount() public view returns(uint) {
        return allPayments.length;
    }
    
    
    function getTotal() public view returns(uint) {
        return totalSupply;
    }
    
    modifier onlyOwner {
        if(msg.sender == owner){
            _;
        }
    }
    
    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        balance[msg.sender] += 1000;
        emit AddedSupply(totalSupply);
    }
    
    
}