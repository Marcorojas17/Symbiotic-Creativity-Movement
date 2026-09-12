# 🔐 ISO/IEC 27701:2025 - Sistema de Gestión de Privacidad de la Información (PIMS)

**Estado:** 🟡 En progreso  
**Responsable:** Marco Antonio Rojas Valdovinos  
**Última actualización:** 8 de Julio de 2026

---

## 📋 Resumen

ISO 27701 es una extensión de ISO 27001 que establece los requisitos para un **Sistema de Gestión de Privacidad de la Información (PIMS)**. Es la norma clave para cumplir con el **GDPR** europeo y otras leyes de protección de datos.

---

## 🎯 Alcance en el Movimiento

El PIMS cubre:
- **Datos personales:** Nombres, emails, wallets de miembros DAO.
- **Datos de clientes:** Empresas certificadas, información de contacto.
- **Datos de contribuidores:** Desarrolladores, abogados, diseñadores.
- **Datos on-chain:** Direcciones públicas (no personales, pero vinculables).

---

## 📐 Principios de Privacidad (GDPR)

| Principio | Descripción | Implementación |
|-----------|-------------|----------------|
| **Licitud, lealtad y transparencia** | Base legal clara | `PRIVACY_POLICY.md` |
| **Limitación de la finalidad** | Datos solo para fines específicos | Consentimiento explícito |
| **Minimización de datos** | Solo recopilar lo necesario | Formularios mínimos |
| **Exactitud** | Datos correctos y actualizados | Auto-gestión de perfil |
| **Limitación del plazo** | No guardar más de lo necesario | Política de retención |
| **Integridad y confidencialidad** | Cifrado y seguridad | ISO 27001 |
| **Responsabilidad proactiva** | Demostrar cumplimiento | Auditorías anuales |

---

## 📋 Derechos de los Usuarios (GDPR)

| Derecho | Descripción | Cómo lo cumplimos |
|---------|-------------|-------------------|
| **Acceso** | Saber qué datos tenemos | Dashboard de usuario |
| **Rectificación** | Corregir datos erróneos | Auto-edición de perfil |
| **Supresión** | Derecho al olvido | Eliminación en < 30 días |
| **Limitación** | Restringir el tratamiento | Opciones de privacidad |
| **Portabilidad** | Exportar datos | JSON export |
| **Oposición** | Oponerse al tratamiento | Opt-out en formularios |
| **Decisiones automatizadas** | No ser objeto de decisiones sin intervención humana | Revisión manual disponible |

---

## 📊 Registro de Actividades de Tratamiento (RAT)

| # | Actividad | Datos | Finalidad | Base Legal | Retención |
|---|-----------|-------|-----------|------------|-----------|
| 1 | Registro de usuarios | Nombre, email, wallet | Acceso al ecosistema | Consentimiento | Indefinido |
| 2 | Certificación de empresas | Nombre, RFC, contacto | Emisión de sello | Contrato | 5 años |
| 3 | Membresías DAO | Nombre, email, wallet | Gobernanza | Consentimiento | Indefinido |
| 4 | Pagos | Datos fiscales | Facturación | Obligación legal | 5 años |
| 5 | Newsletter | Email | Comunicación | Consentimiento | Hasta baja |

---

## 🔒 Medidas de Seguridad

| Medida | Descripción |
|--------|-------------|
| **Cifrado en tránsito** | HTTPS/TLS 1.3 |
| **Cifrado en reposo** | AES-256 |
| **Seudonimización** | Hashes de emails |
| **Control de acceso** | RBAC + 2FA |
| **Auditoría** | Logs inmutables |
| **Backup cifrado** | Diario, off-site |

---

## 📜 Política de Privacidad

Ver `PRIVACY_POLICY.md` en la raíz del repositorio.

---

## 🎯 Hoja de Ruta de Certificación

| Fase | Acción | Plazo |
|------|--------|-------|
| 1 | Documentar PIMS completo | Días 15-45 |
| 2 | Implementar derechos GDPR | Días 30-60 |
| 3 | Auditoría interna | Días 60-90 |
| 4 | Auditoría externa | Mes 4-6 |
| 5 | Certificación oficial | Mes 6-9 |

---

## 📞 Contacto

- **Email:** marco.a.rojas.v@hotmail.com
- **DPO (Data Protection Officer):** Por designar

---

*"La privacidad no es un lujo, es un derecho fundamental."*
