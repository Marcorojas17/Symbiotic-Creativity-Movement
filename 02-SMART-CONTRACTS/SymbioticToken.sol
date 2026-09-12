// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SymbioticToken ($SYMBIO)
 * @author Marco Antonio Rojas Valdovinos
 * @notice Token de gobernanza del Movimiento de Co-Creatividad Simbiotica y Respeto Digital.
 * @dev Suministro maximo: 100,000,000 $SYMBIO. Deflacionario y con gobernanza DAO.
 */
contract SymbioticToken {
    
    string public name = "Symbiotic Token";
    string public symbol = "$SYMBIO";
    uint8 public decimals = 18;
    
    uint256 public constant MAX_SUPPLY = 100_000_000 * 10**18;
    uint256 public totalSupply;
    
    address public founder;
    address public treasury;
    bool public allocationsDistributed;
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event AllocationsDistributed(
        address indexed founder,
        address indexed treasury,
        uint256 communityAmount,
        uint256 founderAmount,
        uint256 treasuryAmount,
        uint256 investorAmount
    );
    
    modifier onlyFounder() {
        require(msg.sender == founder, "Solo el fundador puede ejecutar esto");
        _;
    }
    
    constructor(address _founder, address _treasury) {
        require(_founder != address(0), "Founder invalido");
        require(_treasury != address(0), "Treasury invalido");
        founder = _founder;
        treasury = _treasury;
    }
    
    function distributeAllocations() external onlyFounder {
        require(!allocationsDistributed, "Asignaciones ya distribuidas");
        
        uint256 communityAmount = 40_000_000 * 10**18;
        uint256 founderAmount = 30_000_000 * 10**18;
        uint256 treasuryAmount = 20_000_000 * 10**18;
        uint256 investorAmount = 10_000_000 * 10**18;
        
        _mint(address(this), communityAmount);
        _mint(founder, founderAmount);
        _mint(treasury, treasuryAmount);
        _mint(address(this), investorAmount);
        
        allocationsDistributed = true;
        
        emit AllocationsDistributed(
            founder,
            treasury,
            communityAmount,
            founderAmount,
            treasuryAmount,
            investorAmount
        );
    }
    
    function transfer(address _to, uint256 _amount) external returns (bool) {
        require(_to != address(0), "Destinatario invalido");
        require(balanceOf[msg.sender] >= _amount, "Saldo insuficiente");
        
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
    
    function approve(address _spender, uint256 _amount) external returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool) {
        require(_to != address(0), "Destinatario invalido");
        require(balanceOf[_from] >= _amount, "Saldo insuficiente");
        require(allowance[_from][msg.sender] >= _amount, "Allowance insuficiente");
        
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        allowance[_from][msg.sender] -= _amount;
        
        emit Transfer(_from, _to, _amount);
        return true;
    }
    
    function mintReward(address _to, uint256 _amount) external onlyFounder {
        require(totalSupply + _amount <= MAX_SUPPLY, "Excede el suministro maximo");
        _mint(_to, _amount);
    }
    
    function _mint(address _to, uint256 _amount) internal {
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }
    
    function burn(uint256 _amount) external {
        require(balanceOf[msg.sender] >= _amount, "Saldo insuficiente");
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
    }
}
