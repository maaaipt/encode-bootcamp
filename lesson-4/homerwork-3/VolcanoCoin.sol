// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint totalSupply;
    address owner;
    event AddedSupply(uint);

    constructor() {
        totalSupply = 10000;
        owner = msg.sender;
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
        totalSupply = totalSupply + 1000;
        emit AddedSupply(totalSupply);
    }
    
    
}