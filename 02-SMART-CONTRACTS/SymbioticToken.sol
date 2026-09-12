// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SymbioticToken ($SYMBIO)
 * @author Marco Antonio Rojas Valdovinos
 * @notice Token de gobernanza del Movimiento de Co-Creatividad Simbiotica y Respeto Digital.
 * @dev Suministro maximo: 100,000,000 $SYMBIO. Deflacionario y con gobernanza DAO.
 */
contract SymbioticToken is ERC20, ERC20Burnable, Ownable {
    
    // ============ ESTADO ============
    
    uint256 public constant MAX_SUPPLY = 100_000_000 * 10**18;
    uint256 public constant COMMUNITY_ALLOCATION = 40_000_000 * 10**18; // 40%
    uint256 public constant FOUNDER_ALLOCATION = 30_000_000 * 10**18;   // 30%
    uint256 public constant TREASURY_ALLOCATION = 20_000_000 * 10**18;  // 20%
    uint256 public constant INVESTOR_ALLOCATION = 10_000_000 * 10**18;  // 10%
    
    address public treasury;
    address public founder;
    bool public allocationsDistributed;
    
    // ============ EVENTOS ============
    
    event AllocationsDistributed(
        address indexed founder,
        address indexed treasury,
        uint256 communityAmount,
        uint256 founderAmount,
        uint256 treasuryAmount,
        uint256 investorAmount
    );
    
    event TokensMinted(address indexed to, uint256 amount, string reason);
    
    // ============ CONSTRUCTOR ============
    
    constructor(
        address _founder,
        address _treasury
    ) ERC20("Symbiotic Token", "$SYMBIO") Ownable(_founder) {
        require(_founder != address(0), "Founder invalido");
        require(_treasury != address(0), "Treasury invalido");
        founder = _founder;
        treasury = _treasury;
    }
    
    // ============ FUNCIONES PRINCIPALES ============
    
    /**
     * @notice Distribuye las asignaciones iniciales. Solo puede ejecutarse una vez.
     */
    function distributeAllocations() external onlyOwner {
        require(!allocationsDistributed, "Asignaciones ya distribuidas");
        
        // 40% Comunidad (se mantiene en el contrato para recompensas futuras)
        _mint(address(this), COMMUNITY_ALLOCATION);
        
        // 30% Fundador
        _mint(founder, FOUNDER_ALLOCATION);
        
        // 20% Tesoreria
        _mint(treasury, TREASURY_ALLOCATION);
        
        // 10% Inversores (se mantiene en el contrato para venta)
        _mint(address(this), INVESTOR_ALLOCATION);
        
        allocationsDistributed = true;
        
        emit AllocationsDistributed(
            founder,
            treasury,
            COMMUNITY_ALLOCATION,
            FOUNDER_ALLOCATION,
            TREASURY_ALLOCATION,
            INVESTOR_ALLOCATION
        );
    }
    
    /**
     * @notice Permite a la DAO acunar tokens para recompensas (solo owner/DAO).
     */
    function mintReward(address _to, uint256 _amount, string memory _reason) external onlyOwner {
        require(totalSupply() + _amount <= MAX_SUPPLY, "Excede el suministro maximo");
        _mint(_to, _amount);
        emit TokensMinted(_to, _amount, _reason);
    }
    
    /**
     * @notice Actualiza la tesoreria (solo owner).
     */
    function updateTreasury(address _newTreasury) external onlyOwner {
        require(_newTreasury != address(0), "Tesoreria invalida");
        treasury = _newTreasury;
    }
}
