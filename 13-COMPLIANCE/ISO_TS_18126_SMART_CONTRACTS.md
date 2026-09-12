# 📜 ISO/TS 18126 - Taxonomy and Classification for Smart Contracts

**Estado:** 🟢 Alineado  
**Responsable:** Marco Antonio Rojas Valdovinos  
**Última actualización:** 8 de Julio de 2026

---

## 📋 Resumen

ISO/TS 18126 proporciona una taxonomía y clasificación para smart contracts, facilitando su auditoría, comprensión e interoperabilidad.

---

## 📐 Taxonomía de Nuestros Smart Contracts

| Contrato | Tipo | Categoría | Función |
|----------|------|-----------|---------|
| **RoyaltySplitter.sol** | Financiero | Distribución | Regalías 51/49 |
| **SymbioticToken.sol** | Token | ERC-20 | Gobernanza |
| **GenesisDAO.sol** | Gobernanza | DAO | Votaciones |
| **CertificationNFT.sol** | Certificación | ERC-721 | Sello de Respeto |

---

## 📋 Clasificación según ISO/TS 18126

### 1. Por Función

| Función | Contrato | Descripción |
|---------|----------|-------------|
| **Pago** | RoyaltySplitter | Distribuye regalías |
| **Token** | SymbioticToken | Representa valor |
| **Votación** | GenesisDAO | Gobernanza |
| **Certificación** | CertificationNFT | Emite sellos |

### 2. Por Grado de Autonomía

| Grado | Descripción | Ejemplo |
|-------|-------------|---------|
| **Totalmente autónomo** | Sin intervención humana | RoyaltySplitter |
| **Semi-autónomo** | Requiere input humano | GenesisDAO |
| **Controlado** | Admin humano | CertificationNFT |

### 3. Por Nivel de Riesgo

| Nivel | Contrato | Justificación |
|-------|----------|---------------|
| **Alto** | RoyaltySplitter | Maneja fondos |
| **Medio** | SymbioticToken | Valor económico |
| **Medio** | GenesisDAO | Gobernanza |
| **Bajo** | CertificationNFT | Solo emisión |

---

## 🔒 Seguridad en Smart Contracts (ISO/WD 24875-1.3)

| Práctica | Implementación |
|----------|----------------|
| **Uso de librerías auditadas** | OpenZeppelin |
| **Modificadores de acceso** | `onlyOwner`, `onlyHumanCreator` |
| **Validación de inputs** | `require()` en todas las funciones |
| **Prevención de reentrancy** | Patrón checks-effects-interactions |
| **Límites de gas** | Optimización de código |
| **Eventos** | Logs para auditoría |
| **Upgradability** | No implementado (inmutabilidad) |

---

## 📋 Documentación Requerida

Cada contrato debe incluir:
- [x] Propósito y funcionalidad
- [x] Eventos y sus parámetros
- [x] Funciones públicas y privadas
- [x] Modificadores de acceso
- [x] Dependencias externas
- [x] Auditoría de seguridad
- [ ] Tests unitarios
- [ ] Tests de integración

---

## 🎯 Hoja de Ruta

| Fase | Acción | Plazo |
|------|--------|-------|
| 1 | Documentar taxonomía | Mes 1 |
| 2 | Auditoría de seguridad | Mes 3-4 |
| 3 | Tests unitarios | Mes 4-5 |
| 4 | Certificación ISO/TS 18126 | Mes 6-9 |

---

## 📞 Contacto

- **Email:** marco.a.rojas.v@hotmail.com

---

*"Un smart contract sin taxonomía es una caja negra; con ella, es una herramienta auditable."*
