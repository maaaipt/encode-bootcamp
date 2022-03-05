// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoinV2 {
    uint256 totalSupply;
    address owner;
    /*
    1. In order to keep track of _user balances, we need to associate a user’s address with the balance that they have.
    Q. What is the best data structure to hold this association ?
    A. Mapping is a usefull type that helps associate address and amount.
    */
    mapping (address => uint256) public balance;
    /*6. We want to keep a record for each user’s transfers. Create a struct called Payment that can be used to hold the transfer amount and the recipient’s address.*/
    struct Payment {
        uint256 amountTransfered;
        address receipientAddress;
    }

    //Array containing all the transactions history
    Payment[] allPayments;
    //Mapping containing the payments to the recipient with the amount
    mapping (address => Payment[]) public historyPerAddress;
    
    
    event AddedSupply(uint256);
    /*5. Add an event to the transfer function to indicate that a transfer has taken place, it should record the amount and the recipient address.*/
    event Transfer(uint256, address);
    
    event LogPayments(Payment[]);

    constructor() {
        totalSupply = 10000;
        owner = msg.sender;
        /*3. Now change the constructor, to give all of the total supply to the owner of the contract.*/
        balance[msg.sender]  = totalSupply;
    }
    
    
    /*
    2. We want to allow the balance variable to be read from the contract, there are 2 ways to do this.
    Q. What are those ways ?
    A.1 With a public function, or defining the variable public.
    A.2 mapping(address => uint256) public balance; //in the delcaration
    */
    function getBalance(address _user) public view returns(uint256) {
        return balance[_user];
    }
    
    function getMyBalance() public view returns(uint256) {
        return balance[msg.sender];
    }
    
    /*
    4. Now add a public function called transfer to allow a _user to transfer their tokens to another address.
    This function should have 2 parameters: the amount to transfer and the recipient address.
    Q. Why do we not need the sender’s address here ?
    A. Becaues it's available as a global variable in the current execution context. "msg.sender"
    Q. What would be the implication of having the sender’s address as a parameter ?
    A. That it could be send to a 3rd entity (valid or not).
    */
    function transfer(uint256 _amountToTransfer, address _receipientAddress) public {
        //Check the amount is enough
        require(balance[msg.sender] >= _amountToTransfer, "Not enough balance");
        
        //Remove from the owner the amount to tranfer
        balance[msg.sender] -= _amountToTransfer;
        
        //Add to the recipient address the amount
        balance[_receipientAddress] += _amountToTransfer;

        /*5. Add an event to the transfer function to indicate that a transfer has taken place, it should record the amount and the recipient address.*/
        //Emit the event with amount and address
        emit Transfer(_amountToTransfer, _receipientAddress);

        //Use a memory variable to work with.
        //Payment memory newPayment;
        //newPayment.amountTransfered = _amountToTransfer;
        //newPayment.receipientAddress = receipientAddress;
        //Add to the history of transactions
        allPayments.push(Payment({amountTransfered: _amountToTransfer, receipientAddress: _receipientAddress}));
        //Add to the list of transfers of the msg.sender
        historyPerAddress[msg.sender].push(Payment({amountTransfered: _amountToTransfer, receipientAddress: _receipientAddress}));
    }
    
    function logMyHistory() public {
        emit LogPayments(historyPerAddress[msg.sender]);
    }
    
    /*
    7. We want to reference a payments array to each _user sending the payment. Create a mapping which returns an array of Payment structs when given this user’s address. 
    This only logs and emit an event containing the tuple of Payments, given the address
    */
    function logHistory(address _receipientAddress) public {
        emit LogPayments(historyPerAddress[_receipientAddress]);
    }
    
    function getMyHistory() public view returns (Payment[] memory) {
        return historyPerAddress[msg.sender];
    }
    
    /*
    7. We want to reference a payments array to each _user sending the payment. Create a mapping which returns an array of Payment structs when given this user’s address. 
    Returns the memory tuple of Payments, given the address
    */
    function getHistory(address _receipientAddress) public view returns (Payment[] memory) {
        return historyPerAddress[_receipientAddress];
    }
 
    //Returns the number of transactions
    function getTransactionsCount() public view returns(uint256) {
        return allPayments.length;
    }
    
    
    function getTotal() public view returns(uint256) {
        return totalSupply;
    }
    
    modifier onlyOwner {
        /*
        if(msg.sender == owner){
            _;
        }*/
        require(msg.sender == owner, "You must be the owner");
        _;
    }
    
    function increaseSupply() public onlyOwner {
        totalSupply += 1000;
        balance[msg.sender] += 1000;
        emit AddedSupply(totalSupply);
    }
    
    
}