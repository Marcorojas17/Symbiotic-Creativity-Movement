# 💰 Integración con Mercado Pago (LATAM)

Mercado Pago es la pasarela de pago líder en Latinoamérica. Ideal para cobrar en MXN, ARS, BRL, CLP, COP.

## 🎯 Productos a Cobrar

| Producto | Precio (MXN) | Tipo |
|----------|--------------|------|
| Certificación Bronce | $2,500 | Pago único |
| Certificación Plata | $5,000 | Pago único |
| Certificación Oro | $10,000 | Pago único |
| Certificación Platino | $25,000 | Pago único |
| Membresía DAO Básica | $500/mes | Suscripción |
| Membresía DAO Premium | $2,000/mes | Suscripción |
| Consultoría (1 hora) | $3,000 | Pago único |

## 🔗 Links de Pago

- **Certificación Bronce:** [Link Mercado Pago]
- **Certificación Plata:** [Link Mercado Pago]
- **Certificación Oro:** [Link Mercado Pago]
- **Certificación Platino:** [Link Mercado Pago]
- **Membresía DAO:** [Link Suscripción]

## ⚙️ Configuración

1. Crea cuenta en [Mercado Pago](https://www.mercadopago.com.mx).
2. Genera credenciales de producción.
3. Configura webhooks para confirmación de pagos.
4. Integra con el Smart Contract `RoyaltySplitter.sol`.

## 📜 Webhooks

- **URL:** `https://tu-dominio.com/webhooks/mercadopago`
- **Eventos:** `payment.created`, `payment.updated`, `subscription.created`
