// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title GenesisDAO
 * @author Marco Antonio Rojas Valdovinos
 * @notice Gobernanza descentralizada del Movimiento de Co-Creatividad Simbiotica.
 * @dev Utiliza el token $SYMBIO para votar Propuestas de Mejora Simbiotica (SIPs).
 */
contract GenesisDAO {
    
    // ============ ESTRUCTURAS ============
    
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
    
    // ============ ESTADO ============
    
    IERC20 public symbioticToken;
    uint256 public proposalCount;
    uint256 public votingPeriod = 7 days;
    uint256 public proposalThreshold = 1000 * 10**18; // 1000 $SYMBIO para proponer
    uint256 public quorumPercentage = 10; // 10% del suministro para validez
    
    mapping(uint256 => Proposal) public proposals;
    
    // ============ EVENTOS ============
    
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
    
    // ============ MODIFICADORES ============
    
    modifier onlyTokenHolder() {
        require(symbioticToken.balanceOf(msg.sender) >= proposalThreshold, "No tienes suficientes $SYMBIO");
        _;
    }
    
    // ============ CONSTRUCTOR ============
    
    constructor(address _symbioticToken) {
        require(_symbioticToken != address(0), "Token invalido");
        symbioticToken = IERC20(_symbioticToken);
    }
    
    // ============ FUNCIONES PRINCIPALES ============
    
    /**
     * @notice Crea una nueva Propuesta de Mejora Simbiotica (SIP).
     */
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
    
    /**
     * @notice Vota a favor o en contra de una propuesta.
     */
    function vote(uint256 _proposalId, bool _support) external {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.id != 0, "Propuesta no existe");
        require(block.timestamp >= proposal.startTime, "Votacion no ha comenzado");
        require(block.timestamp <= proposal.endTime, "Votacion ha terminado");
        require(!proposal.hasVoted[msg.sender], "Ya has votado");
        
        uint256 weight = symbioticToken.balanceOf(msg.sender);
        require(weight > 0, "No tienes $SYMBIO para votar");
        
        proposal.hasVoted[msg.sender] = true;
        
        if (_support) {
            proposal.forVotes += weight;
        } else {
            proposal.againstVotes += weight;
        }
        
        emit VoteCast(msg.sender, _proposalId, _support, weight);
    }
    
    /**
     * @notice Ejecuta una propuesta aprobada.
     */
    function execute(uint256 _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.id != 0, "Propuesta no existe");
        require(block.timestamp > proposal.endTime, "Votacion en curso");
        require(!proposal.executed, "Propuesta ya ejecutada");
        require(!proposal.canceled, "Propuesta cancelada");
        require(proposal.forVotes > proposal.againstVotes, "Propuesta rechazada");
        
        // Verificar quorum
        uint256 totalSupply = symbioticToken.totalSupply();
        uint256 totalVotes = proposal.forVotes + proposal.againstVotes;
        require((totalVotes * 100) / totalSupply >= quorumPercentage, "No alcanzo el quorum");
        
        proposal.executed = true;
        emit ProposalExecuted(_proposalId);
    }
    
    /**
     * @notice Cancela una propuesta (solo el proponente).
     */
    function cancel(uint256 _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(proposal.proposer == msg.sender, "Solo el proponente puede cancelar");
        require(!proposal.executed, "Ya ejecutada");
        proposal.canceled = true;
        emit ProposalCanceled(_proposalId);
    }
    
    // ============ FUNCIONES DE CONSULTA ============
    
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
    
    // ============ FUNCIONES ADMINISTRATIVAS ============
    
    function setVotingPeriod(uint256 _newPeriod) external {
        require(msg.sender == address(this), "Solo la DAO puede cambiar esto");
        votingPeriod = _newPeriod;
    }
    
    function setQuorum(uint256 _newQuorum) external {
        require(msg.sender == address(this), "Solo la DAO puede cambiar esto");
        quorumPercentage = _newQuorum;
    }
}
