pragma solidity >=0.4.22 <0.8.0;

contract Election{
    //Candidate model
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //store accounts that have voted
    mapping(address => bool) public voters;


    //Use a mapping (like map in JS) to create an array with key mapping for each candidate
    mapping(uint => Candidate) public candidates;

    //store candidates count (cant count a mapping so need to store value)
    uint public candidatesCount;

    //Constructor is ran when deployed to blockchain
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    event votedEvent(uint indexed _candidateId);

    //function to allow adding candidate name and increasing count
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }


    //here we are recording that the voter (msg.sender) has their vote recorded for the candidate
    function vote(uint _candidateId) public {
        //require that the address hasn't already voted
        require(!voters[msg.sender]); //provided by solitiy, check if the address (key for mapping) has a bool value of false

        //require that the candidate number is valid
        require(_candidateId > 0 && _candidateId <=candidatesCount);  //make sure that the id of the candidate is below the total that we have created

        //record that voter(with address) has voted
        voters[msg.sender] = true;       //msg.sender = account from which the function call is sent (provided by solidity)

        // update candidate votecount
        candidates[_candidateId].voteCount++;

        //trigger voted event
        emit votedEvent(_candidateId);
    }

}