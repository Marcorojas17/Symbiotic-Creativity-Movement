# 🟡 Mercado Pago - Integración LATAM

**Versión:** 1.0  
**País:** México, Argentina, Brasil, Chile, Colombia  
**Monedas:** MXN, ARS, BRL, CLP, COP  
**Documentación Oficial:** https://www.mercadopago.com.mx/developers

---

## 📋 Resumen

Mercado Pago es la pasarela de pago líder en Latinoamérica. Permite cobrar con tarjeta de crédito, débito, efectivo, transferencia y meses sin intereses.

---

## 🎯 Productos a Cobrar

| Producto | Precio (MXN) | Tipo | Link |
|----------|--------------|------|------|
| Certificación Bronce | $2,500 | Pago único | [Ver](payment-links.md#bronce) |
| Certificación Plata | $5,000 | Pago único | [Ver](payment-links.md#plata) |
| Certificación Oro | $10,000 | Pago único | [Ver](payment-links.md#oro) |
| Certificación Platino | $25,000 | Pago único | [Ver](payment-links.md#platino) |
| Membresía DAO Básica | $500/mes | Suscripción | [Ver](subscriptions.md#basica) |
| Membresía DAO Premium | $2,000/mes | Suscripción | [Ver](subscriptions.md#premium) |
| Consultoría (1 hora) | $3,000 | Pago único | [Ver](payment-links.md#consultoria) |

---

## ⚙️ Configuración

1. Crea cuenta en [Mercado Pago](https://www.mercadopago.com.mx).
2. Verifica tu identidad (RFC, INE).
3. Genera credenciales de producción:
   - **Public Key:** `APP_USR-...`
   - **Access Token:** `APP_USR-...`
4. Configura webhooks en: [webhooks.md](webhooks.md)
5. Copia el archivo `config.example.json` a `config.json` y llena tus datos.

---

## 📂 Documentación

- [Links de Pago](payment-links.md)
- [Suscripciones](subscriptions.md)
- [Checkout Pro](checkout-pro.md)
- [Webhooks](webhooks.md)
- [Configuración](config.example.json)
- [Tests](tests.md)

---
Cliente → Link de Pago → Mercado Pago → Webhook → Confirmación → NFT


---

## 📊 Comisiones

| Método | Comisión |
|--------|----------|
| Tarjeta de crédito | 3.49% + IVA |
| Tarjeta de débito | 2.89% + IVA |
| Transferencia | 0% |
| Efectivo | 3.99% + IVA |

---

## 📞 Soporte

- **Email:** marco.a.rojas.v@hotmail.com
- **Mercado Pago:** https://www.mercadopago.com.mx/ayuda

---

*"Mercado Pago es la puerta de entrada al mercado latinoamericano."*

## 🔗 Flujo de Pago
