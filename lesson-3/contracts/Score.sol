//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Score {

    //public variable with variable to store in the blockchain
    //Storage is expensive
    uint public score;
    //Address owner to check who can write score
    address owner;
    //Events are cheap
    event ScoreSet (uint);
    
    //Executed once, not endup in the blockchain 
    constructor() {
        //Initialising logic/values
        score = 5;
        //msg.sender is who deploys the contract
        owner = msg.sender;
    }
    
    //Called
    modifier onlyOwner() {
        //Check
        if(msg.sender == owner){
            // This will endup continuing the execution
            _;
        }
        
    }
    
    //Setter function only executed after the modifier
    //publicly available, with a onlyOwner modifier
    function setScore(uint _newScore) public onlyOwner {
        //Assign the new value
        score = _newScore;
        //Emit an event helps logging
        emit ScoreSet(_newScore);
    }



}