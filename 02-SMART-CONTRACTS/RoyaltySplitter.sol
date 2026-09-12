// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title RoyaltySplitter
 * @author Marco Antonio Rojas Valdovinos
 * @notice Distribuye regalías automaticamente: 51% al Creador Humano, 49% al Fondo del Movimiento.
 * @dev Basado en el Bloque Genesis: Safe Creative ID 2607086319439
 *      Hash SHA-256: 41a3683bbf83296eeb45da9b0e0ea5a7c095e78b493772e79520a92dbc39f4c3
 */
contract RoyaltySplitter {
    
    // ============ ESTADO ============
    
    address public humanCreator;
    address public movementFund;
    uint256 public totalDistributed;
    uint256 public totalHumanShare;
    uint256 public totalMovementShare;
    
    // Constantes de distribución (51% / 49%)
    uint256 public constant HUMAN_PERCENTAGE = 51;
    uint256 public constant MOVEMENT_PERCENTAGE = 49;
    uint256 public constant BASIS_POINTS = 100;
    
    // ============ EVENTOS ============
    
    event RoyaltyReceived(address indexed payer, uint256 amount);
    event RoyaltyDistributed(
        address indexed payer,
        uint256 totalAmount,
        uint256 humanShare,
        uint256 movementShare,
        uint256 timestamp
    );
    event AddressesUpdated(address newHumanCreator, address newMovementFund);
    
    // ============ MODIFICADORES ============
    
    modifier onlyHumanCreator() {
        require(msg.sender == humanCreator, "Solo el creador humano puede ejecutar esto");
        _;
    }
    
    // ============ CONSTRUCTOR ============
    
    constructor(address _humanCreator, address _movementFund) {
        require(_humanCreator != address(0), "Creador humano invalido");
        require(_movementFund != address(0), "Fondo del movimiento invalido");
        humanCreator = _humanCreator;
        movementFund = _movementFund;
    }
    
    // ============ FUNCIONES PRINCIPALES ============
    
    /**
     * @notice Recibe pagos y distribuye automaticamente las regalías.
     */
    receive() external payable {
        _distribute(msg.value);
    }
    
    /**
     * @notice Funcion alternativa para recibir pagos con datos.
     */
    fallback() external payable {
        _distribute(msg.value);
    }
    
    /**
     * @notice Permite recibir pagos explicitamente (por ejemplo desde un contrato).
     */
    function payRoyalties() external payable {
        _distribute(msg.value);
    }
    
    /**
     * @dev Logica interna de distribucion.
     */
    function _distribute(uint256 _amount) internal {
        require(_amount > 0, "El monto debe ser mayor a 0");
        
        uint256 humanAmount = (_amount * HUMAN_PERCENTAGE) / BASIS_POINTS;
        uint256 movementAmount = _amount - humanAmount; // Asegura que no se pierda ni 1 wei
        
        // Enviar al creador humano
        (bool sentHuman, ) = payable(humanCreator).call{value: humanAmount}("");
        require(sentHuman, "Fallo al enviar al creador humano");
        
        // Enviar al fondo del movimiento
        (bool sentMovement, ) = payable(movementFund).call{value: movementAmount}("");
        require(sentMovement, "Fallo al enviar al fondo del movimiento");
        
        // Actualizar contadores
        totalDistributed += _amount;
        totalHumanShare += humanAmount;
        totalMovementShare += movementAmount;
        
        emit RoyaltyReceived(msg.sender, _amount);
        emit RoyaltyDistributed(msg.sender, _amount, humanAmount, movementAmount, block.timestamp);
    }
    
    // ============ FUNCIONES ADMINISTRATIVAS ============
    
    /**
     * @notice Actualiza las direcciones de recepcion (solo el creador humano).
     */
    function updateAddresses(address _newHumanCreator, address _newMovementFund) external onlyHumanCreator {
        require(_newHumanCreator != address(0), "Nuevo creador invalido");
        require(_newMovementFund != address(0), "Nuevo fondo invalido");
        humanCreator = _newHumanCreator;
        movementFund = _newMovementFund;
        emit AddressesUpdated(_newHumanCreator, _newMovementFund);
    }
    
    // ============ FUNCIONES DE CONSULTA ============
    
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
    
    function getStats() external view returns (
        uint256 _totalDistributed,
        uint256 _totalHumanShare,
        uint256 _totalMovementShare
    ) {
        return (totalDistributed, totalHumanShare, totalMovementShare);
    }
}
