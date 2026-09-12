# 🔄 Suscripciones - Mercado Pago

Sistema de cobro recurrente para membresías DAO.

---

## 🎯 Planes de Suscripción

### 📘 Membresía DAO Básica - $500 MXN/mes

**Link:** `https://mpago.la/XXXXXX`

**Beneficios:**
- ✅ Voto en Propuestas de Mejora (SIPs)
- ✅ Acceso a GitHub Discussions
- ✅ Newsletter mensual
- ✅ 100 tokens $SYMBIO de regalo

**Ideal para:** Creadores individuales.

---

### 💎 Membresía DAO Premium - $2,000 MXN/mes

**Link:** `https://mpago.la/XXXXXX`

**Beneficios:**
- ✅ Todo lo de Básica
- ✅ Consultoría mensual (1 hora)
- ✅ Prioridad en soporte
- ✅ Acceso a eventos exclusivos
- ✅ 500 tokens $SYMBIO de regalo

**Ideal para:** Empresas y profesionales.

---

## 📋 Cómo Crear una Suscripción

1. Entra a [Mercado Pago](https://www.mercadopago.com.mx).
2. Ve a **"Herramientas" > "Suscripciones"**.
3. Haz clic en **"Crear suscripción"**.
4. Llena los datos:
   - **Título:** Membresía DAO Básica
   - **Precio:** $500 MXN
   - **Frecuencia:** Mensual
   - **Duración:** Indefinida
5. Haz clic en **"Crear"**.
6. Copia el link y pégalo aquí.

---

## 🔔 Webhooks de Suscripción

| Evento | Descripción | Acción |
|--------|-------------|--------|
| `subscription.created` | Nueva suscripción | Emitir NFT de membresía |
| `subscription.updated` | Cambio de plan | Actualizar NFT |
| `subscription.cancelled` | Cancelación | Revocar NFT |
| `payment.created` | Pago exitoso | Confirmar membresía |
| `payment.failed` | Pago fallido | Notificar al usuario |

---

## 💰 Flujo de Ingresos Recurrentes
Mes 1: 10 suscriptores Básica = $5,000 MXN
Mes 2: 25 suscriptores Básica = $12,500 MXN
Mes 3: 50 suscriptores Básica = $25,000 MXN
...
Mes 12: 500 suscriptores Básica = $250,000 MXN/mes

---

## 📞 Soporte

- **Email:** marco.a.rojas.v@hotmail.com

---

*"Los ingresos recurrentes son la base de un negocio sostenible."*
