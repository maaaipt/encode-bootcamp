// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoinV2 {
    uint totalSupply;
    address owner;
    /*
    1. In order to keep track of user balances, we need to associate a user’s address with the balance that they have.
    Q. What is the best data structure to hold this association ?
    A. Mapping is a usefull type that helps associate address and amount.
    */
    mapping (address => uint) public balance;
    /*6. We want to keep a record for each user’s transfers. Create a struct called Payment that can be used to hold the transfer amount and the recipient’s address.*/
    struct Payment {
        uint amountTransfered;
        address recipientAddress;
    }
    
    struct PaymentHistory {
        Payment[] history;
    }
    
    //Array containing all the transactions history
    Payment[] allPayments;
    //Mapping containing the payments to the recipient with the amount
    mapping (address => Payment[]) public historyPerAddress;
    
    
    event AddedSupply(uint);
    /*5. Add an event to the transfer function to indicate that a transfer has taken place, it should record the amount and the recipient address.*/
    event Transfer(uint, address);
    
    event LogPayments(Payment[]);

    constructor() {
        totalSupply = 10000;
        owner = msg.sender;
        /*3. Now change the constructor, to give all of the total supply to the owner of the contract.*/
        balance[owner]  = totalSupply;
    }
    
    
    /*
    2. We want to allow the balance variable to be read from the contract, there are 2 ways to do this.
    Q. What are those ways ?
    A.1 With a public function, or defining the variable public.
    A.2 mapping(address => uint) public balance; //in the delcaration
    */
    function getBalance(address user) public view returns(uint) {
        return balance[user];
    }
    
    function getMyBalance() public view returns(uint) {
        return balance[msg.sender];
    }
    
    /*
    4. Now add a public function called transfer to allow a user to transfer their tokens to another address.
    This function should have 2 parameters: the amount to transfer and the recipient address.
    Q. Why do we not need the sender’s address here ?
    A. Becaues it's available as a global variable in the current execution context. "msg.sender"
    Q. What would be the implication of having the sender’s address as a parameter ?
    A. That it could be send to a 3rd entity (valid or not).
    */
    function transfer(uint amountToTransfer, address recipientAddress) public {
        //Check the amount is enough
        require(balance[msg.sender] > amountToTransfer);
        
        //Remove from the owner the amount to tranfer
        balance[msg.sender] -= amountToTransfer;
        
        //Add to the recipient address the amount
        balance[recipientAddress] += amountToTransfer;
        
        //Use a memory variable to work with.
        //Payment memory newPayment;
        //newPayment.amountTransfered = amountToTransfer;
        //newPayment.recipient = recipientAddress;
        //Add to the history of transactions
        allPayments.push(Payment({amountTransfered: amountToTransfer, recipientAddress: recipientAddress}));
        //Add to the list of transfers of the msg.sender
        historyPerAddress[msg.sender].push(Payment({amountTransfered: amountToTransfer, recipientAddress: recipientAddress}));
        
        /*5. Add an event to the transfer function to indicate that a transfer has taken place, it should record the amount and the recipient address.*/
        //Emit the event with amount and address
        emit Transfer(amountToTransfer, recipientAddress);
    }
    
    function logMyHistory() public {
        emit LogPayments(historyPerAddress[msg.sender]);
    }
    
    /*
    7. We want to reference a payments array to each user sending the payment. Create a mapping which returns an array of Payment structs when given this user’s address. 
    This only logs and emit an event containing the tuple of Payments, given the address
    */
    function logHistory(address recipientAddress) public {
        emit LogPayments(historyPerAddress[recipientAddress]);
    }
    
    function getMyHistory() public view returns (Payment[] memory) {
        return historyPerAddress[msg.sender];
    }
    
    /*
    7. We want to reference a payments array to each user sending the payment. Create a mapping which returns an array of Payment structs when given this user’s address. 
    Returns the memory tuple of Payments, given the address
    */
    function getHistory(address recipientAddress) public view returns (Payment[] memory) {
        return historyPerAddress[recipientAddress];
    }
 
    //Returns the number of transactions
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