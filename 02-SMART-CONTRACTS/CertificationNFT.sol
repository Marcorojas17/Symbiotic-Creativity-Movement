// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title CertificationNFT
 * @author Marco Antonio Rojas Valdovinos
 * @notice Emite el "Sello de Respeto Digital" como NFT a empresas certificadas.
 * @dev Cada NFT representa una certificacion verificable en blockchain.
 */
contract CertificationNFT is ERC721, ERC721URIStorage, Ownable {
    
    // ============ ESTRUCTURAS ============
    
    struct Certification {
        uint256 tokenId;
        address certifiedEntity;
        string entityName;
        string certificationLevel; // "BRONCE", "PLATA", "ORO", "PLATINO"
        uint256 issueDate;
        uint256 expiryDate;
        bool active;
    }
    
    // ============ ESTADO ============
    
    uint256 private _nextTokenId;
    string public baseURI;
    
    mapping(uint256 => Certification) public certifications;
    mapping(address => uint256) public entityCertification;
    
    // Niveles de certificacion
    string public constant LEVEL_BRONZE = "BRONCE";
    string public constant LEVEL_SILVER = "PLATA";
    string public constant LEVEL_GOLD = "ORO";
    string public constant LEVEL_PLATINUM = "PLATINO";
    
    // Duracion de la certificacion (1 ano)
    uint256 public constant CERTIFICATION_DURATION = 365 days;
    
    // ============ EVENTOS ============
    
    event CertificationIssued(
        uint256 indexed tokenId,
        address indexed entity,
        string entityName,
        string level,
        uint256 expiryDate
    );
    event CertificationRevoked(uint256 indexed tokenId, string reason);
    event CertificationRenewed(uint256 indexed tokenId, uint256 newExpiryDate);
    
    // ============ CONSTRUCTOR ============
    
    constructor(address _owner) ERC721("Sello de Respeto Digital", "SRD") Ownable(_owner) {
        _nextTokenId = 1;
    }
    
    // ============ FUNCIONES PRINCIPALES ============
    
    /**
     * @notice Emite una nueva certificacion "Sello de Respeto Digital".
     */
    function issueCertification(
        address _entity,
        string memory _entityName,
        string memory _level,
        string memory _tokenURI
    ) external onlyOwner returns (uint256) {
        require(_entity != address(0), "Entidad invalida");
        require(bytes(_entityName).length > 0, "Nombre de entidad requerido");
        require(_isValidLevel(_level), "Nivel de certificacion invalido");
        require(entityCertification[_entity] == 0, "Entidad ya certificada");
        
        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        
        _safeMint(_entity, tokenId);
        _setTokenURI(tokenId, _tokenURI);
        
        uint256 expiryDate = block.timestamp + CERTIFICATION_DURATION;
        
        certifications[tokenId] = Certification({
            tokenId: tokenId,
            certifiedEntity: _entity,
            entityName: _entityName,
            certificationLevel: _level,
            issueDate: block.timestamp,
            expiryDate: expiryDate,
            active: true
        });
        
        entityCertification[_entity] = tokenId;
        
        emit CertificationIssued(tokenId, _entity, _entityName, _level, expiryDate);
        return tokenId;
    }
    
    /**
     * @notice Renueva una certificacion existente.
     */
    function renewCertification(uint256 _tokenId) external onlyOwner {
        Certification storage cert = certifications[_tokenId];
        require(cert.tokenId != 0, "Certificacion no existe");
        require(cert.active, "Certificacion no activa");
        
        cert.expiryDate = block.timestamp + CERTIFICATION_DURATION;
        emit CertificationRenewed(_tokenId, cert.expiryDate);
    }
    
    /**
     * @notice Revoca una certificacion por incumplimiento.
     */
    function revokeCertification(uint256 _tokenId, string memory _reason) external onlyOwner {
        Certification storage cert = certifications[_tokenId];
        require(cert.tokenId != 0, "Certificacion no existe");
        require(cert.active, "Certificacion ya revocada");
        
        cert.active = false;
        emit CertificationRevoked(_tokenId, _reason);
    }
    
    // ============ FUNCIONES DE CONSULTA ============
    
    function isCertificationValid(uint256 _tokenId) external view returns (bool) {
        Certification storage cert = certifications[_tokenId];
        return cert.active && block.timestamp <= cert.expiryDate;
    }
    
    function getCertification(uint256 _tokenId) external view returns (Certification memory) {
        return certifications[_tokenId];
    }
    
    function getEntityCertification(address _entity) external view returns (uint256) {
        return entityCertification[_entity];
    }
    
    function totalCertifications() external view returns (uint256) {
        return _nextTokenId - 1;
    }
    
    // ============ FUNCIONES INTERNAS ============
    
    function _isValidLevel(string memory _level) internal pure returns (bool) {
        bytes32 levelHash = keccak256(abi.encodePacked(_level));
        return (
            levelHash == keccak256(abi.encodePacked(LEVEL_BRONZE)) ||
            levelHash == keccak256(abi.encodePacked(LEVEL_SILVER)) ||
            levelHash == keccak256(abi.encodePacked(LEVEL_GOLD)) ||
            levelHash == keccak256(abi.encodePacked(LEVEL_PLATINUM))
        );
    }
    
    // ============ OVERRIDES REQUERIDOS ============
    
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
    
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
