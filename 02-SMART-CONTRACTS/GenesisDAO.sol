// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title GenesisDAO
 * @author Marco Antonio Rojas Valdovinos
 * @notice Gobernanza descentralizada del Movimiento de Co-Creatividad Simbiotica.
 * @dev Utiliza el token $SYMBIO para votar Propuestas de Mejora Simbiotica (SIPs).
 */
contract GenesisDAO {
    
    struct Proposal {
        uint256 id;
        string title;
        string description;
        address proposer;
        uint256 forVotes;
        uint256 againstVotes;
        uint256 startTime;
        uint256 endTime;
        bool executed;
        bool canceled;
        mapping(address => bool) hasVoted;
    }
    
    address public symbioticToken;
    uint256 public proposalCount;
    uint256 public votingPeriod = 7 days;
    uint256 public proposalThreshold = 1000 * 10**18;
    uint256 public quorumPercentage = 10;
    
    mapping(uint256 => Proposal) public proposals;
    
    event ProposalCreated(
        uint256 indexed id,
        address indexed proposer,
        string title,
        uint256 startTime,
        uint256 endTime
    );
    event VoteCast(address indexed voter, uint256 indexed proposalId, bool support, uint256 weight);
    event ProposalExecuted(uint256 indexed id);
    event ProposalCanceled(uint256 indexed id);
    
    modifier onlyTokenHolder() {
        require(IERC20Like(symbioticToken).balanceOf(msg.sender) >= proposalThreshold, "No tienes suficientes $SYMBIO");
        _;
    }
    
    constructor(address _symbioticToken) {
        require(_symbioticToken != address(0), "Token invalido");
        symbioticToken = _symbioticToken;
    }
    
    function propose(
        string memory _title,
        string memory _description
    ) external onlyTokenHolder returns (uint256) {
        proposalCount++;
        uint256 proposalId = proposalCount;
        
        Proposal storage newProposal = proposals[proposalId];
        newProposal.id = proposalId;
        newProposal.title = _title;
        newProposal.description = _description;
        newProposal.proposer = msg.sender;
        newProposal.startTime = block.timestamp;
        newProposal.endTime = block.timestamp + votingPeriod;
        newProposal.executed = false;
        newProposal.canceled = false;
        
        emit ProposalCreated(proposalId, msg.sender, _title, newProposal.startTime, newProposal.endTime);
        return proposalId;
    }
    
    function vote(uint256 _proposalId, bool _support) external {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.id != 0, "Propuesta no existe");
        require(block.timestamp >= proposal.startTime, "Votacion no ha comenzado");
        require(block.timestamp <= proposal.endTime, "Votacion ha terminado");
        require(!proposal.hasVoted[msg.sender], "Ya has votado");
        
        uint256 weight = IERC20Like(symbioticToken).balanceOf(msg.sender);
        require(weight > 0, "No tienes $SYMBIO para votar");
        
        proposal.hasVoted[msg.sender] = true;
        
        if (_support) {
            proposal.forVotes += weight;
        } else {
            proposal.againstVotes += weight;
        }
        
        emit VoteCast(msg.sender, _proposalId, _support, weight);
    }
    
    function execute(uint256 _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.id != 0, "Propuesta no existe");
        require(block.timestamp > proposal.endTime, "Votacion en curso");
        require(!proposal.executed, "Propuesta ya ejecutada");
        require(!proposal.canceled, "Propuesta cancelada");
        require(proposal.forVotes > proposal.againstVotes, "Propuesta rechazada");
        
        uint256 totalSupply = IERC20Like(symbioticToken).totalSupply();
        uint256 totalVotes = proposal.forVotes + proposal.againstVotes;
        require((totalVotes * 100) / totalSupply >= quorumPercentage, "No alcanzo el quorum");
        
        proposal.executed = true;
        emit ProposalExecuted(_proposalId);
    }
    
    function cancel(uint256 _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.proposer == msg.sender, "Solo el proponente puede cancelar");
        require(!proposal.executed, "Ya ejecutada");
        proposal.canceled = true;
        emit ProposalCanceled(_proposalId);
    }
    
    function getProposal(uint256 _proposalId) external view returns (
        uint256 id,
        string memory title,
        string memory description,
        address proposer,
        uint256 forVotes,
        uint256 againstVotes,
        uint256 startTime,
        uint256 endTime,
        bool executed,
        bool canceled
    ) {
        Proposal storage p = proposals[_proposalId];
        return (
            p.id,
            p.title,
            p.description,
            p.proposer,
            p.forVotes,
            p.againstVotes,
            p.startTime,
            p.endTime,
            p.executed,
            p.canceled
        );
    }
    
    function hasVoted(uint256 _proposalId, address _voter) external view returns (bool) {
        return proposals[_proposalId].hasVoted[_voter];
    }
}

interface IERC20Like {
    function balanceOf(address account) external view returns (uint256);
    function totalSupply() external view returns (uint256);
}
