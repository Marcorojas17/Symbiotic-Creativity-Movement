# 🔒 ISO/IEC 27001:2022 - Sistema de Gestión de Seguridad de la Información (ISMS)

**Estado:** 🟡 En progreso  
**Responsable:** Marco Antonio Rojas Valdovinos  
**Última actualización:** 8 de Julio de 2026

---

## 📋 Resumen

ISO 27001 es el estándar internacional para la gestión de la seguridad de la información. Establece los requisitos para un **Sistema de Gestión de Seguridad de la Información (ISMS)**.

---

## 🎯 Alcance en el Movimiento

El ISMS cubre:
- **Datos de usuarios:** Emails, wallets, información de pago.
- **Smart Contracts:** Código fuente, claves privadas, despliegues.
- **Infraestructura:** Repositorio GitHub, servidores API, base de datos.
- **Información legal:** Contratos, licencias, documentos del Bloque Génesis.

---

## 📐 Controles Implementados (Anexo A de ISO 27001:2022)

### 5. Controles Organizacionales (37 controles)

| Control | Descripción | Estado | Evidencia |
|---------|-------------|--------|-----------|
| 5.1 | Políticas de seguridad de la información | ✅ | Este documento |
| 5.2 | Roles y responsabilidades | ✅ | `CONTRIBUTING.md` |
| 5.3 | Segregación de funciones | 🟡 | En progreso |
| 5.7 | Inteligencia de amenazas | ⚪ | No aplica |
| 5.10 | Uso aceptable de activos | ✅ | `CODE_OF_CONDUCT.md` |
| 5.12 | Clasificación de la información | 🟡 | En progreso |
| 5.15 | Control de acceso | 🟡 | Ver 8.2 |
| 5.23 | Seguridad en servicios cloud | ✅ | GitHub, Ethereum |
| 5.34 | Privacidad y protección de datos | ✅ | ISO 27701 |

### 6. Controles de Personas (8 controles)

| Control | Descripción | Estado |
|---------|-------------|--------|
| 6.3 | Concienciación y formación en seguridad | 🟡 |
| 6.5 | Responsabilidades tras el cese | 🟡 |
| 6.6 | Acuerdos de confidencialidad | ✅ | `TERMS_OF_SERVICE.md` |

### 7. Controles Físicos (14 controles)

| Control | Descripción | Estado |
|---------|-------------|--------|
| 7.1 | Perímetros de seguridad física | ⚪ | No aplica (100% digital) |
| 7.4 | Monitorización de seguridad física | ⚪ | No aplica |
| 7.14 | Eliminación segura de equipos | 🟡 | En progreso |

### 8. Controles Tecnológicos (34 controles)

| Control | Descripción | Estado | Evidencia |
|---------|-------------|--------|-----------|
| 8.1 | Dispositivos de usuario final | 🟡 | En progreso |
| 8.2 | Derechos de acceso privilegiado | ✅ | GitHub 2FA |
| 8.5 | Autenticación segura | ✅ | OpenID Connect (ISO 25791) |
| 8.7 | Protección contra malware | ✅ | GitHub Security |
| 8.9 | Gestión de configuración | ✅ | Repositorio Git |
| 8.12 | Prevención de fuga de datos | 🟡 | En progreso |
| 8.15 | Registro de eventos | ✅ | Git history + Etherscan |
| 8.16 | Actividades de monitorización | ✅ | GitHub Insights |
| 8.24 | Uso de criptografía | ✅ | SHA-256, ECDSA |
| 8.28 | Codificación segura | ✅ | OpenZeppelin en contratos |
| 8.32 | Gestión de cambios | ✅ | Git + Pull Requests |
| 8.34 | Protección de sistemas en auditoría | 🟡 | En progreso |

---

## 📊 Evaluación de Riesgos

| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|---------|------------|
| Hackeo de Smart Contract | Media | Alto | Auditoría externa + OpenZeppelin |
| Robo de claves privadas | Baja | Alto | Hardware Wallet + Multisig |
| Fuga de datos de usuarios | Media | Medio | Cifrado + ISO 27701 |
| Ataque DDoS a API | Alta | Medio | Cloudflare + rate limiting |
| Phishing a miembros DAO | Alta | Medio | Educación + 2FA |

---

## 📜 Políticas de Seguridad

1. **Política de Contraseñas:** Mínimo 12 caracteres, 2FA obligatorio.
2. **Política de Acceso:** Principio de mínimo privilegio.
3. **Política de Backup:** Copias diarias cifradas.
4. **Política de Incidentes:** Reporte en < 24 horas.
5. **Política de Auditoría:** Revisiones trimestrales.

---

## 🎯 Hoja de Ruta de Certificación

| Fase | Acción | Plazo |
|------|--------|-------|
| 1 | Documentar ISMS completo | Días 1-30 |
| 2 | Implementar controles faltantes | Días 15-60 |
| 3 | Auditoría interna | Días 45-75 |
| 4 | Auditoría externa (certificadora) | Mes 4-6 |
| 5 | Certificación oficial | Mes 6-9 |

---

## 📞 Contacto

- **Email:** marco.a.rojas.v@hotmail.com

---

*"La seguridad no es un producto, es un proceso continuo."*
