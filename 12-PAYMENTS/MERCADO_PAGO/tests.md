# 🧪 Tests - Mercado Pago

Pruebas con tarjetas de prueba para validar la integración.

---

## 📋 Tarjetas de Prueba (Sandbox)

### ✅ Tarjeta Aprobada
| Campo | Valor |
|-------|-------|
| **Número** | 5031 4332 1540 6351 |
| **CVV** | 123 |
| **Vencimiento** | 11/25 |
| **Nombre** | APRO |

### ❌ Tarjeta Rechazada
| Campo | Valor |
|-------|-------|
| **Número** | 5031 4332 1540 6351 |
| **CVV** | 123 |
| **Vencimiento** | 11/25 |
| **Nombre** | OTHE |

### ⏳ Tarjeta Pendiente
| Campo | Valor |
|-------|-------|
| **Número** | 5031 4332 1540 6351 |
| **CVV** | 123 |
| **Vencimiento** | 11/25 |
| **Nombre** | CONT |

---

## 🧪 Casos de Prueba

### Test 1: Pago Exitoso
1. Crear preferencia con `monto = 2500`.
2. Pagar con tarjeta aprobada.
3. Verificar webhook `payment.created`.
4. Confirmar emisión de NFT.

### Test 2: Pago Rechazado
1. Crear preferencia con `monto = 5000`.
2. Pagar con tarjeta rechazada.
3. Verificar webhook `payment.failed`.
4. Confirmar notificación al usuario.

### Test 3: Suscripción
1. Crear suscripción con `monto = 500/mes`.
2. Pagar con tarjeta aprobada.
3. Verificar webhook `subscription.created`.
4. Confirmar emisión de NFT de membresía.

### Test 4: Webhook Duplicado
1. Enviar mismo webhook 2 veces.
2. Verificar que no se procese 2 veces.
3. Confirmar idempotencia.

---

## 📊 Resultados Esperados

| Test | Resultado |
|------|-----------|
| Pago exitoso | ✅ NFT emitido |
| Pago rechazado | ✅ Notificación enviada |
| Suscripción | ✅ NFT de membresía |
| Webhook duplicado | ✅ Ignorado |

---

## 📞 Soporte

- **Email:** marco.a.rojas.v@hotmail.com
- **Sandbox:** https://www.mercadopago.com.mx/developers/es/guides/online-payments/checkout-pro/test-integration

---

*"Probar es la única forma de dormir tranquilo."*
