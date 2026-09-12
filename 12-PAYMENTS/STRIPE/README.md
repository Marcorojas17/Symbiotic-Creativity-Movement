# 💰 Integración con Stripe (GLOBAL)

Stripe es la pasarela de pago líder a nivel mundial. Ideal para cobrar en USD, EUR, GBP.

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

## 🔗 Links de Pago

- **Certificación Bronce:** [Link Stripe]
- **Certificación Plata:** [Link Stripe]
- **Certificación Oro:** [Link Stripe]
- **Certificación Platino:** [Link Stripe]
- **Membresía DAO:** [Link Suscripción]

## ⚙️ Configuración

1. Crea cuenta en [Stripe](https://stripe.com).
2. Genera API Keys (producción).
3. Configura webhooks.
4. Integra con el Smart Contract `RoyaltySplitter.sol`.

## 📜 Webhooks

- **URL:** `https://tu-dominio.com/webhooks/stripe`
- **Eventos:** `payment_intent.succeeded`, `customer.subscription.created`
