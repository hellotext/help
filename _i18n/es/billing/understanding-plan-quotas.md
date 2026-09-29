Usa el **Resumen de uso** de Facturación para entender qué ocurrió en un período antes de conciliar una factura.

## Abrir el resumen de uso

1. Abre **Configuración → Facturación**.
2. Busca la tarjeta de tu plan actual.
3. En **Resumen de uso**, selecciona el período que quieres revisar.

La primera tarjeta muestra el plan activo, el importe mensual calculado hasta ese momento y **Cambiar mi Plan**. En la imagen, el mínimo del plan es el monto mayor de una cuenta ficticia sin ventas atribuidas ni mensajes facturables.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Plan activo y monto mensual">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/understanding-plan-quotas/plan-es-mobile.png" width="740" height="528" />
        <img class="ht-editorial-visual__image" src="/images/billing/understanding-plan-quotas/plan-es.png" width="1464" height="464" loading="lazy" decoding="async" alt="Tarjeta del plan Enterprise ficticio con monto mensual de $2,499 y el control Cambiar mi Plan." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La cuenta aislada no registra ventas atribuidas ni mensajes facturables; el monto ilustrado corresponde al plan.</figcaption>
</figure>

La segunda tarjeta separa las ventas atribuidas de su tarifa, y muestra los recuentos y costos de SMS y del resto de mensajes. El selector permite elegir el período disponible. En esta cuenta de demostración esas filas están en cero; la imagen sirve para reconocer los campos, no para representar un negocio con consumo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Resumen de uso y selector de período">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/understanding-plan-quotas/usage-es-mobile.png" width="740" height="1002" />
        <img class="ht-editorial-visual__image" src="/images/billing/understanding-plan-quotas/usage-es.png" width="1464" height="922" loading="lazy" decoding="async" alt="Resumen de uso ficticio con selector Septiembre 2026, ventas atribuidas, tarifa, SMS y otros mensajes sin consumo." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La captura muestra una cuenta ficticia sin transacciones. El selector solo ofrece los períodos disponibles para el negocio.</figcaption>
</figure>

## Interpretar la comparación

Hellotext puede calcular cuatro montos mensuales:

- piso del plan;
- tarifa por rendimiento sobre ingresos atribuidos;
- costos de SMS; y
- monto variable por mensajes que no son SMS.

El cargo de Hellotext usa solamente el monto mayor, no la suma de esos cuatro componentes. Compara el importe de la tarjeta del plan con las filas monetarias de **Resumen de uso**; las filas de ventas y cantidad de mensajes aportan contexto, pero no son cargos adicionales.

Lee [Modelo de precios]({% link _billing/how-pricing-works.md %}) para conocer la regla completa.

## Comparar el período correcto

Elige el mismo mes cuando compares Facturación con un reporte o una factura. Ten en cuenta estas diferencias:

- Un período reciente todavía puede recibir compras atribuidas elegibles antes de finalizarse.
- Los reportes pueden organizar métricas por fecha de activación, envío, interacción o compra, según el reporte.
- Facturación usa el período de facturación aplicable y la moneda de la cuenta.

Cuando la atribución es el monto principal, usa los reportes de ingresos y por fuente para investigar los resultados subyacentes en lugar de comparar columnas de fechas diferentes.

## Revisar saldo e historial de pagos

La página de Facturación también muestra el saldo del negocio cuando corresponde y un control de **Historial de Pagos**. Ábrelo y usa **Seleccionar mes** para revisar los movimientos del mes y año elegidos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Historial de pagos y selector de mes">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/history-es-mobile.png" width="748" height="728" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/history-es.png" width="1770" height="568" loading="lazy" decoding="async" alt="Historial de Pagos abierto en una cuenta ficticia sin movimientos, con el control Seleccionar mes." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Se reutiliza una captura aprobada de la guía de configuración de Facturación; no se creó un pago.</figcaption>
</figure>

Los movimientos de saldo y la comparación mensual responden preguntas diferentes:

- El resumen de uso explica cómo se determinó el monto mensual de Hellotext.
- El historial de pagos explica los movimientos registrados en el saldo del negocio.

## Revisar períodos anteriores

El selector muestra los períodos del plan activo y los anteriores que estén disponibles. Si el negocio cambió de plan, confirma cuál estaba activo durante el mes revisado.

Usa la factura para consultar el monto facturado final y el resumen de uso para entender su contexto operativo.

## Guías relacionadas

- [Facturación, métodos de pago y facturas]({% link _billing/billing-settings-and-invoices.md %})
- [Cálculo de la tarifa por rendimiento]({% link _billing/performance-fee-calculation.md %})
- [Guía del reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Solucionar dudas de facturación]({% link _billing/billing-troubleshooting.md %})
