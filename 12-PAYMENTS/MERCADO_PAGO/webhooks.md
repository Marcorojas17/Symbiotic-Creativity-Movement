
# 🔔 Webhooks - Mercado Pago

Configuración de notificaciones automáticas para confirmar pagos.

---

## 📋 ¿Qué es un Webhook?

Un webhook es una notificación que Mercado Pago envía a tu servidor cuando ocurre un evento (pago, suscripción, etc.).

---

## ⚙️ Configuración

### 1. URL del Webhook
https://tudominio.com/webhooks/mercadopago

### 2. Eventos a Escuchar
| Evento | Descripción |
|--------|-------------|
| `payment.created` | Pago creado |
| `payment.updated` | Pago actualizado |
| `subscription.created` | Suscripción creada |
| `subscription.updated` | Suscripción actualizada |
| `subscription.cancelled` | Suscripción cancelada |

### 3. Código de Ejemplo (Node.js)
```javascript
app.post('/webhooks/mercadopago', async (req, res) => {
  const { type, data } = req.body;

  if (type === 'payment') {
    const paymentId = data.id;
    const payment = await mercadopago.payment.findById(paymentId);

    if (payment.body.status === 'approved') {
      // Pago exitoso
      const email = payment.body.payer.email;
      const amount = payment.body.transaction_amount;

      // 1. Emitir NFT de certificación
      await emitirNFT(email, amount);

      // 2. Enviar email de confirmación
      await enviarEmail(email, 'Pago confirmado');

      // 3. Distribuir regalías (51/49)
      await distribuirRegalias(amount);
    }
  }
🔐 Seguridad
Validación de Firma
const crypto = require('crypto');

function validarFirma(req) {
  const xSignature = req.headers['x-signature'];
  const xRequestId = req.headers['x-request-id'];
  const dataID = req.query['data.id'];

  const secret = process.env.MP_WEBHOOK_SECRET;
  const manifest = `id:${dataID};request-id:${xRequestId};ts:${xSignature.split(',')[1].split('=')[1]};`;

  const hash = crypto
    .createHmac('sha256', secret)
    .update(manifest)
    .digest('hex');

  return hash === xSignature.split(',')[0].split('=')[1];
}
Pago exitoso → Mercado Pago → POST /webhooks/mercadopago → Validar firma → Procesar evento → Responder 200
🧪 Tests
Ver tests.md para simular webhooks.

📞 Soporte
Email: marco.a.rojas.v@hotmail.com

Docs: https://www.mercadopago.com.mx/developers/es/guides/notifications/webhooks

"Los webhooks son los nervios del sistema de pagos."

  res.sendStatus(200);
});
