pragma solidity >=0.4.22 <0.8.0;

contract Election{
    //store candidate
    //read candidate
    string public candidate;
    //Constructor is ran when deployed to blockchain
    constructor () public {
        candidate = "Candidate 1"; 
    }
}