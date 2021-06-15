pragma solidity >=0.4.22 <0.8.0;

contract Election{
    //Candidate model
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //Use a mapping (like map in JS) to create an array with key mapping for each candidate
    mapping(uint => Candidate) public candidates;

    //store candidates count (cant count a mapping so need to store value)
    uint public candidatesCount;

    //Constructor is ran when deployed to blockchain
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    //function to allow adding candidate name and increasing count
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}