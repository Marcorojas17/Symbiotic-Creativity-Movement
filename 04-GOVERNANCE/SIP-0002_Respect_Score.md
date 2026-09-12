# 📜 SIP-0002: Algoritmo del "Respect Score"

**Estado:** ✅ Aprobada  
**Autor:** Marco Antonio Rojas Valdovinos  
**Fecha:** 8 de Julio de 2026  
**Referencia:** Bloque Génesis - Safe Creative 2607086319439  
**Hash SHA-256:** `41a3683bbf83296eeb45da9b0e0ea5a7c095e78b493772e79520a92dbc39f4c3`

---

## 📋 Resumen
Esta propuesta define el algoritmo del **"Respect Score"** (Puntuación de Respeto Digital), un sistema objetivo y auditable que mide qué tan ética es una empresa o IA con los derechos de los creadores humanos.

## 🎯 Motivación
Las empresas de IA afirman ser "éticas" sin aportar pruebas. El Respect Score es una métrica objetiva, pública y verificable en blockchain que cualquier persona puede consultar.

## 📐 Especificación

### 1. Fórmula del Respect Score
Respect Score = (A × 0.4) + (B × 0.3) + (C × 0.2) + (D × 0.1)

Donde cada variable se puntúa de 0 a 100:

| Variable | Peso | Descripción | Cómo se mide |
|----------|------|-------------|--------------|
| **A = Transparencia** | 40% | ¿Declara el % Humano-IA en sus obras? | Auditoría de documentos |
| **B = Compensación** | 30% | ¿Paga regalías justas a creadores? | Smart Contract verificable |
| **C = Trazabilidad** | 20% | ¿Usa blockchain y sellado de tiempo? | Hash en Etherscan |
| **D = Gobernanza** | 10% | ¿Participa en la DAO Simbiótica? | Votos registrados |

### 2. Escala de Clasificación
| Score | Clasificación | Insignia | Beneficios |
|-------|---------------|----------|------------|
| 90-100 | Élite Simbiótica | 💎 Platino | Acceso prioritario a la DAO |
| 75-89 | Respetuosa | 🥇 Oro | Voto en SIPs clave |
| 60-74 | Aceptable | 🥈 Plata | Acceso a comunidad |
| 40-59 | En Desarrollo | 🥉 Bronce | Mentoría básica |
| 0-39 | No Certificable | ❌ Sin sello | Sin acceso |

### 3. Ejemplo de Cálculo

**Empresa X (Startup de IA):**
- A = 90 (declara % Humano-IA en su web)
- B = 80 (paga regalías vía smart contract)
- C = 100 (usa blockchain para cada obra)
- Respect Score = (90 × 0.4) + (80 × 0.3) + (100 × 0.2) + (50 × 0.1)
= 36 + 24 + 20 + 5
= 85 → 🥇 Oro

### 4. Implementación Técnica
El Respect Score se calcula automáticamente vía **Smart Contract** y se actualiza cada vez que:
- Se registra una nueva obra.
- Se paga una regalía.
- Se vota en una SIP.

### 5. Auditoría Pública
Cualquier persona puede verificar el Respect Score de una empresa consultando el contrato `CertificationNFT.sol` en Ethereum.

## 🌍 Impacto
El Respect Score se convierte en el **estándar internacional** para medir la ética de las empresas de IA. Las compañías competirán por subir su puntuación, beneficiando a los creadores humanos.

## 🗳️ Votación
- **A favor:** 100% (Fundador - Bloque Génesis)
- **En contra:** 0%
- **Resultado:** ✅ Aprobada por unanimidad.

---

*"Lo que no se mide, no se puede mejorar. Lo que no se audita, no se puede confiar."*
- D = 50 (participa ocasionalmente en la DAO)

**Cálculo:**
