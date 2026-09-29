Empieza en **Configuración → Facturación**. Selecciona el período que quieres revisar en el resumen de consumos y, si tienes una factura o registro de pago, compáralos con ese mismo mes.

## El monto es mayor de lo esperado

Revisa estos elementos por separado:

1. Confirma el plan y acuerdo de facturación activos durante el período. Las cuentas prepagas y los acuerdos fijos pueden liquidarse de otra manera.
2. Si tu plan usa la comparación mensual estándar, revisa el resumen de consumos e identifica cuál de los cuatro montos de Hellotext fue el mayor.
3. Comprueba si los ingresos atribuidos aumentaron después de registrar compras elegibles.
4. Revisa las partes facturables de SMS, el país de destino y la tarifa aplicable. La cifra publicada «hasta X SMS» es una equivalencia aproximada, no una bolsa gratuita que se descuente primero.
5. Confirma el volumen de mensajes que no son SMS usado por el cálculo de fair use.
6. Revisa los impuestos aplicables por separado. Las tarifas de WhatsApp pagadas directamente a Meta no aparecen en la factura de Hellotext; consúltalas en la facturación de Meta.

En la comparación mensual estándar, no sumes los cuatro montos de Hellotext: solo el mayor se convierte en el cargo de esa comparación. Consulta [Precios de SMS y tipos de remitente]({% link _billing/sms-pricing-and-number-types.md %}) y [Tarifas de Meta para WhatsApp]({% link _billing/whatsapp-fees.md %}) para separar ambos cargos.

## La atribución no coincide con un reporte

Confirma que ambas vistas usen el mismo rango de fechas, moneda y base temporal. Un reporte de misiones puede organizar resultados por fecha de activación, mientras otro reporte puede usar una fecha de evento diferente.

Usa [Cómo atribuimos ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) e [Integridad de datos y diferencias entre reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}) para conciliar los datos de origen.

## Una factura no está disponible

Las facturas aparecen cuando están disponibles para un período de facturación. En **Facturas**, abre **Seleccionar mes** y elige un mes bajo el año correspondiente. Si el negocio todavía no tiene facturas, verás un estado vacío y el selector no aparecerá.

Si falta un período anterior ya finalizado, contacta a soporte con el identificador del negocio y el mes.

## Falló un método de pago

- Confirma que el método siga vigente y admita la moneda de la cuenta.
- Agrega otro método cuando esté disponible **Agregar método de pago**.
- Revisa el saldo del negocio cuando aplique la facturación mediante saldo.
- Si Shopify aparece como método de pago, revisa el estado de facturación en la cuenta de Shopify conectada.

No envíes códigos de seguridad de tarjetas ni credenciales completas de pago a soporte.

La siguiente vista vacía indica dónde agregar un método alternativo. Las tarjetas de ejemplo dibujadas encima del botón son una vista previa de la interfaz; no representan tarjetas guardadas ni un pago fallido.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Dónde agregar un método de pago">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/payment-methods-es-mobile.png" width="812" height="1040" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/payment-methods-es.png" width="1770" height="1080" loading="lazy" decoding="async" alt="Estado vacío ficticio de Métodos de pago con el botón Agregar método de pago; las tarjetas atenuadas son una vista previa, no métodos guardados." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Esta cuenta ficticia no tiene tarjetas guardadas; la imagen muestra dónde agregar un método alternativo, no un pago fallido.</figcaption>
</figure>

## No se refleja un cambio de plan

Abre la tarjeta del plan actual. Si programaste una reducción de plan o una cancelación, busca el aviso y su fecha efectiva. Un cambio a un plan superior puede hacerse efectivo durante el período actual después de completar el pago; confirma el estado mostrado por tu cuenta.

Actualiza Facturación después de completar correctamente el pago. Si el estado todavía no coincide, informa a soporte el plan actual, plan solicitado, hora de confirmación y cualquier error visible.

## La moneda o los impuestos parecen incorrectos

Abre **Información de facturación** y verifica los datos fiscales. Usa **Cambiar de País** para consultar el país del negocio y el aviso de impuestos; no guardes un cambio si el país actual es correcto. Cambiarlo puede afectar el tratamiento de impuestos, la moneda y los métodos de pago disponibles.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="País e impuestos de facturación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/country-es-mobile.png" width="812" height="564" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/country-es.png" width="1770" height="568" loading="lazy" decoding="async" alt="Formulario ficticio Cambiar de País con Uruguay seleccionado y el aviso sobre impuestos en facturas futuras." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El formulario se abrió para mostrar el aviso; no se guardó ningún cambio.</figcaption>
</figure>

No cambies el país solo para modificar un precio. Debe representar la ubicación de facturación correcta del negocio.

## Qué incluir en una solicitud de soporte

- identificador del negocio o espacio de trabajo;
- mes y moneda de facturación;
- referencia de factura o pago;
- monto esperado y monto mostrado;
- captura del resumen correspondiente sin datos sensibles de pago; y
- fecha y hora de un pago o cambio de plan fallido.

## Guías relacionadas

- [Modelo de precios]({% link _billing/how-pricing-works.md %})
- [Uso del plan y cargos mensuales]({% link _billing/understanding-plan-quotas.md %})
- [Facturación, métodos de pago y facturas]({% link _billing/billing-settings-and-invoices.md %})
- [Cambiar o cancelar tu plan]({% link _billing/change-or-cancel-your-plan.md %})
