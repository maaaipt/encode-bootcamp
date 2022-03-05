// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract VolcanoCoinV3 is ERC20('VolcanoCoinV3', 'VOL'), Ownable {
  /*Structs*/
  struct Payment {
    uint256 amountTransfered;
    address recipientAddress;
  }

  struct PaymentHistory {
    Payment[] history;
  }

  /*Variables*/
  Payment[] allPayments;
  mapping(address => Payment[]) public historyPerAddress;

  //This is not needed anymore as inherited by ERC20
  //uint totalSupply;

  //This is not needed anymore as inherited by Ownable
  // address owner;

  //This is not needed anymore as inherited by ERC20
  // mapping (address => uint) public balance;

  /*Events*/
  event AddedSupply(uint256);
  event Transfer(uint256, address);
  event LogPayments(Payment[]);

  /*Constructor*/
  //The constructor call the ERC20 constructor passing the name and currency value
  constructor() {
    //This internally set a total supply and linked it to the owner
    _mint(msg.sender, 1000);
  }

  /*Functions*/
  //This is not needed anymore as inherited by ERC20
  // function getBalance(address _user) public view returns(uint) {
  //     return balance[_user];
  // }

  // function getMyBalance() public view returns(uint) {
  //     return balance[msg.sender];
  // }

  //This has to be overridden
  function transfer(address _recipientAddress, uint256 _amountToTransfer) public virtual override returns (bool) {
    bool result = ERC20.transfer(_recipientAddress, _amountToTransfer);

    if (result) {
      logPayments(msg.sender, _recipientAddress, _amountToTransfer);
    }

    return true;
  }

  function logPayments(
    address _senderAddress,
    address _receiverAddress,
    uint256 _amountToTransfer
  ) private {
    allPayments.push(Payment({amountTransfered: _amountToTransfer, recipientAddress: _receiverAddress}));
    historyPerAddress[_senderAddress].push(
      Payment({amountTransfered: _amountToTransfer, recipientAddress: _receiverAddress})
    );
  }

  function logMyHistory() public {
    emit LogPayments(historyPerAddress[msg.sender]);
  }

  function logHistory(address _recipientAddress) public {
    emit LogPayments(historyPerAddress[_recipientAddress]);
  }

  function getMyHistory() public view returns (Payment[] memory) {
    return historyPerAddress[msg.sender];
  }

  function getHistory(address _recipientAddress) public view returns (Payment[] memory) {
    return historyPerAddress[_recipientAddress];
  }

  function getTransactionsCount() public view returns (uint256) {
    return allPayments.length;
  }

  function getTotal() public view returns (uint256) {
    return totalSupply();
  }

  function increaseSupply() public onlyOwner {
    _mint(msg.sender, 1000);
  }
}
