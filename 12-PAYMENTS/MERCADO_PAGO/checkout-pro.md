# 🛒 Checkout Pro - Mercado Pago

Integración avanzada para cobrar desde tu propia web.

---

## 📋 ¿Qué es Checkout Pro?

Checkout Pro es la integración de Mercado Pago que permite a tus clientes pagar directamente desde tu sitio web, sin salir de él.

---

## ⚙️ Configuración

### 1. Requisitos
- Cuenta de Mercado Pago verificada
- Credenciales de producción (Access Token)
- Servidor con HTTPS

### 2. Instalación (Backend)
```bash
npm install mercadopago
const mercadopago = require('mercadopago');

mercadopago.configure({
  access_token: process.env.MP_ACCESS_TOKEN
});

app.post('/crear-pago', async (req, res) => {
  const preference = {
    items: [
      {
        title: 'Certificación Oro',
        unit_price: 10000,
        quantity: 1,
        currency_id: 'MXN'
      }
    ],
    back_urls: {
      success: 'https://tudominio.com/success',
      failure: 'https://tudominio.com/failure',
      pending: 'https://tudominio.com/pending'
    },
    auto_return: 'approved',
    notification_url: 'https://tudominio.com/webhooks/mercadopago'
  };

  const response = await mercadopago.preferences.create(preference);
  res.json({ init_point: response.body.init_point });
});
<button onclick="pagar()">Pagar Certificación Oro</button>

<script>
async function pagar() {
  const response = await fetch('/crear-pago', { method: 'POST' });
  const data = await response.json();
  window.location.href = data.init_point;
}
</script>
🔔 Webhooks
Ver webhooks.md para configuración completa.

📊 Flujo Completo
Cliente → Click "Pagar" → Backend crea preferencia → Mercado Pago → Pago → Webhook → Confirmación → NFT
🧪 Tests
Ver tests.md para pruebas con tarjetas de prueba.

📞 Soporte
Email: marco.a.rojas.v@hotmail.com

Docs Oficiales: https://www.mercadopago.com.mx/developers/es/guides/checkout-pro

"Checkout Pro es la integración más robusta para cobrar en serio."
