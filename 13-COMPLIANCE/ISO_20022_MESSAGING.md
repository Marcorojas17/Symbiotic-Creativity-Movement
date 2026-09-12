# 💳 ISO 20022 - Universal Financial Industry Message Scheme

**Estado:** 🟡 En progreso  
**Responsable:** Marco Antonio Rojas Valdovinos  
**Última actualización:** 8 de Julio de 2026

---

## 📋 Resumen

ISO 20022 es el estándar global para mensajería financiera. Permite la interoperabilidad entre bancos, sistemas de pago y plataformas de criptomonedas.

---

## 🎯 Alcance en el Movimiento

Aplica a:
- **Pagos de certificaciones:** MXN, USD, EUR.
- **Regalías automáticas:** Distribución 51/49 vía Smart Contracts.
- **Membresías DAO:** Suscripciones mensuales.
- **Facturación:** Facturas electrónicas (CFDI en México).

---

## 📐 Mensajes ISO 20022 Relevantes

| Mensaje | Código | Uso |
|---------|--------|-----|
| **Customer Credit Transfer** | pacs.008 | Pagos de certificaciones |
| **Payment Status Report** | pacs.002 | Confirmación de pagos |
| **Customer Direct Debit** | pacs.003 | Suscripciones DAO |
| **Statement of Account** | camt.053 | Estados de cuenta |
| **Invoice** | - | Facturación (CFDI) |

---

## 📋 Estructura de un Mensaje de Pago (Ejemplo)

```xml
<Document xmlns="urn:iso:std:iso:20022:tech:xsd:pacs.008.001.10">
  <FIToFICstmrCdtTrf>
    <GrpHdr>
      <MsgId>SYMBIO-20260708-001</MsgId>
      <CreDtTm>2026-07-08T07:02:03Z</CreDtTm>
      <NbOfTxs>1</NbOfTxs>
      <TtlIntrBkSttlmAmt Ccy="MXN">2500.00</TtlIntrBkSttlmAmt>
    </GrpHdr>
    <CdtTrfTxInf>
      <PmtId>
        <EndToEndId>CERT-BRONCE-001</EndToEndId>
      </PmtId>
      <IntrBkSttlmAmt Ccy="MXN">2500.00</IntrBkSttlmAmt>
      <Dbtr>
        <Nm>Empresa Certificada S.A. de C.V.</Nm>
      </Dbtr>
      <Cdtr>
        <Nm>Movimiento de Co-Creatividad Simbiótica</Nm>
      </Cdtr>
      <RmtInf>
        <Ustrd>Certificación Bronce - Sello de Respeto Digital</Ustrd>
      </RmtInf>
    </CdtTrfTxInf>
  </FIToFICstmrCdtTrf>
</Document>
