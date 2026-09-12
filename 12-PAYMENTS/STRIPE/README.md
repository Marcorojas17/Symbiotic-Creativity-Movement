# 🔵 Stripe - Integración Global

**Versión:** 1.0  
**País:** Global (140+ países)  
**Monedas:** USD, EUR, GBP, AUD, CAD, etc.  
**Documentación Oficial:** https://stripe.com/docs

---

## 📋 Resumen

Stripe es la pasarela de pago líder a nivel mundial. Permite cobrar con tarjeta, Apple Pay, Google Pay, transferencias y más.

---

## 🎯 Productos a Cobrar

| Producto | Precio (USD) | Tipo |
|----------|--------------|------|
| Certificación Bronce | $150 | Pago único |
| Certificación Plata | $300 | Pago único |
| Certificación Oro | $600 | Pago único |
| Certificación Platino | $1,500 | Pago único |
| Membresía DAO Básica | $30/mes | Suscripción |
| Membresía DAO Premium | $120/mes | Suscripción |
| Consultoría (1 hora) | $180 | Pago único |
| Auditoría de IA | $900 | Pago único |
| Implementación | $3,000 | Pago único |

---

## ⚙️ Configuración

1. Crea cuenta en [Stripe](https://stripe.com).
2. Verifica tu identidad.
3. Genera API Keys de producción:
   - **Publishable Key:** `pk_live_...`
   - **Secret Key:** `sk_live_...`
4. Configura webhooks en: `https://tu-dominio.com/webhooks/stripe`
5. Copia el archivo `config.example.json` y llena tus datos.

---

## 🔗 Links de Pago (Payment Links)

### Certificación Bronce - $150 USD
**Link:** `https://buy.stripe.com/XXXXXX`

### Certificación Plata - $300 USD
**Link:** `https://buy.stripe.com/XXXXXX`

### Certificación Oro - $600 USD
**Link:** `https://buy.stripe.com/XXXXXX`

### Certificación Platino - $1,500 USD
**Link:** `https://buy.stripe.com/XXXXXX`

### Consultoría - $180 USD
**Link:** `https://buy.stripe.com/XXXXXX`

---

## 📊 Comisiones

| Método | Comisión |
|--------|----------|
| Tarjeta internacional | 2.9% + $0.30 USD |
| Tarjeta europea | 1.4% + €0.25 |
| Apple Pay / Google Pay | 2.9% + $0.30 USD |
| Transferencia | 0.8% |

---

## 🔔 Webhooks

| Evento | Descripción |
|--------|-------------|
| `payment_intent.succeeded` | Pago exitoso |
| `payment_intent.failed` | Pago fallido |
| `customer.subscription.created` | Suscripción creada |
| `customer.subscription.deleted` | Suscripción cancelada |

---

## 📂 Documentación

- [Payment Links](payment-links.md)
- [Suscripciones](subscriptions.md)
- [Checkout](checkout.md)
- [Webhooks](webhooks.md)
- [Configuración](config.example.json)
- [Tests](tests.md)

---

## 📞 Soporte

- **Email:** marco.a.rojas.v@hotmail.com
- **Stripe:** https://support.stripe.com

---

*"Stripe es la puerta de entrada al mercado global."*
