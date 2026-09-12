# 🧾 Facturación y Comprobantes

**Versión:** 1.0  
**País:** México (CFDI 4.0)  
**Sistema:** Facturación electrónica

---

## 📋 Resumen

Sistema de facturación para emitir comprobantes fiscales digitales (CFDI) por los servicios prestados.

---

## 🎯 Tipos de Comprobantes

| Tipo | Descripción | Uso |
|------|-------------|-----|
| **CFDI 4.0** | Factura electrónica | México |
| **Invoice** | Factura internacional | Global |
| **Receipt** | Recibo simple | Cripto |
| **Tax Report** | Reporte fiscal | Anual |

---

## 📋 Datos Fiscales Requeridos (México)

| Campo | Descripción | Obligatorio |
|-------|-------------|-------------|
| **RFC** | Registro Federal de Contribuyentes | ✅ |
| **Razón Social** | Nombre legal | ✅ |
| **Régimen Fiscal** | Tipo de contribuyente | ✅ |
| **Código Postal** | Domicilio fiscal | ✅ |
| **Correo** | Email para factura | ✅ |
| **Uso del CFDI** | G01, G03, P01, etc. | ✅ |

---

## 🧾 Ejemplo de CFDI

```xml
<cfdi:Comprobante
  xmlns:cfdi="http://www.sat.gob.mx/cfd/4"
  Version="4.0"
  Fecha="2026-07-08T07:02:03"
  Moneda="MXN"
  Total="2500.00"
  TipoDeComprobante="I"
  MetodoPago="PUE"
  FormaPago="03"
  LugarExpedicion="06600">
  
  <cfdi:Emisor
    Rfc="XXXX000000XXX"
    Nombre="Movimiento de Co-Creatividad Simbiótica"
    RegimenFiscal="601"/>
  
  <cfdi:Receptor
    Rfc="XXXX000000XXX"
    Nombre="Cliente Ejemplo"
    UsoCFDI="G03"
    RegimenFiscalReceptor="601"
    DomicilioFiscalReceptor="06600"/>
  
  <cfdi:Conceptos>
    <cfdi:Concepto
      ClaveProdServ="80101500"
      Cantidad="1"
      ClaveUnidad="E48"
      Descripcion="Certificación Bronce - Sello de Respeto Digital"
      ValorUnitario="2500.00"
      Importe="2500.00"
      ObjetoImp="02">
    </cfdi:Concepto>
  </cfdi:Conceptos>
  
  <cfdi:Impuestos TotalImpuestosTrasladados="400.00">
    <cfdi:Traslados>
      <cfdi:Traslado
        Base="2500.00"
        Impuesto="002"
        TasaOCuota="0.160000"
        Importe="400.00"/>
    </cfdi:Traslados>
  </cfdi:Impuestos>
</cfdi:Comprobante>
