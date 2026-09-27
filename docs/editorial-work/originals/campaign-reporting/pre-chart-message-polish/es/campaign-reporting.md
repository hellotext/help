Los reportes de campaña se generan automáticamente después de la entrega. Reúnen la entrega de mensajes, los clics en enlaces rastreados, las compras atribuidas y los ingresos atribuidos para que puedas entender qué ocurrió y qué conviene mejorar.

Para abrir uno, ve a **Campañas → Enviadas** y selecciona una campaña.

## Elige el período del reporte

El reporte se abre con **Primeros 14 días** seleccionado. Puedes cambiar a los primeros 7 o 30 días, o elegir un rango personalizado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y resumen de un reporte de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1000px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile.png" width="746" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es.png" width="2460" height="600" loading="lazy" decoding="async" alt="Reporte de demostración con 14 días seleccionados y las métricas Ingresos atribuidos, ROI promedio, Conversión e Ingresos/mensaje. En móvil se ve la primera tarjeta y la flecha para recorrer las demás." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Captura de la interfaz real en español con datos de demostración; en móvil, las tarjetas se recorren con la flecha.</figcaption>
</figure>

El rango filtra los resultados según cuándo ocurrió cada evento. Un envío o una entrega se cuenta en su día; un clic, en el día del clic; y una compra atribuida, en el día de la compra. Las tarjetas y el gráfico usan esas fechas. La etapa **Interacción** del embudo requiere una entrega y un clic en un enlace rastreado dentro del mismo rango. En la lista de mensajes, el rango afecta las entregas, los clics, las conversiones y los ingresos; el ROI por mensaje compara los ingresos del período con el costo estimado de entrega de ese mensaje. Los desgloses de ingresos y **Tiempo de conversión** incluyen compras atribuidas ocurridas dentro del rango.

Por ejemplo, si un mensaje se entrega el 7 de abril y una compra atribuida ocurre el 10 de abril, selecciona un período que incluya el 10 de abril para ver ese ingreso. La entrega sigue contándose el 7 de abril. Si el rango incluye la compra pero ninguna entrega, la tasa de conversión puede mostrarse en cero porque no hay mensajes entregados en su denominador.

Cambiar el período del reporte no modifica la ventana de atribución utilizada para decidir si una compra corresponde a la campaña.

Un mensaje de la campaña puede permanecer en la lista aunque sus resultados queden fuera del rango seleccionado. En ese caso, su fila puede mostrar valores en cero hasta que elijas un período que incluya su actividad.

## Interpreta el resumen de la campaña

Las cuatro tarjetas del resumen responden preguntas diferentes:

* **Ingresos atribuidos:** ingresos de compras elegibles atribuidas a la campaña y registradas durante el período seleccionado.
* **ROI promedio:** ingresos atribuidos divididos por el costo estimado de entrega de los mensajes de la campaña.
* **Conversión:** compras atribuidas divididas por mensajes entregados.
* **Ingresos/mensaje:** ingresos atribuidos divididos por mensajes entregados.

Selecciona una tarjeta para actualizar el gráfico y ver cómo cambió esa métrica en el tiempo. La conversión se calcula con compras atribuidas y mensajes entregados; no es el porcentaje de personas que hicieron clic y luego compraron.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tarjeta seleccionada y evolución de una métrica de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 740px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/selected-kpi-chart-es-mobile.png" width="750" height="1250" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/selected-kpi-chart-es.png" width="1560" height="1180" loading="lazy" decoding="async" alt="Una tarjeta del resumen seleccionada y su gráfico, que muestra cómo cambia la métrica a lo largo del período elegido." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Gráfico de la interfaz real en español con datos de demostración.</figcaption>
</figure>

## Sigue el embudo de entrega

El **Embudo de entrega de campaña** recorre cuatro etapas:

* **Enviado:** mensajes de la campaña despachados durante el período seleccionado.
* **Entregado:** mensajes que llegaron a los clientes.
* **Interacción:** mensajes de la campaña cuya entrega y al menos un clic en un enlace rastreado ocurrieron dentro del período seleccionado. Cada mensaje cuenta una sola vez, aunque tenga varios clics.
* **Conversión:** compras atribuidas a la campaña ocurridas durante el período. Su porcentaje usa las compras atribuidas divididas por los mensajes entregados, igual que la métrica de conversión del resumen.

El embudo cuenta envíos, entregas y conversiones por fecha de evento, mientras que **Interacción** requiere una entrega y un clic dentro del período seleccionado. En un rango corto, sus etapas pueden no representar la misma cohorte de mensajes. Úsalo para detectar posibles problemas: una diferencia grande entre enviados y entregados puede señalar dificultades de entrega o de contacto; una entrega saludable con poca interacción invita a revisar la audiencia, el mensaje y el llamado a la acción.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Etapas del embudo de entrega de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 740px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-es-mobile.png" width="754" height="820" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-es.png" width="1560" height="880" loading="lazy" decoding="async" alt="Embudo de entrega con las etapas Enviado, Entregado, Interacción y Conversión y sus porcentajes en un reporte de demostración." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Embudo de la interfaz real en español con datos de demostración.</figcaption>
</figure>

## Compara los mensajes de la campaña

La sección **Mensajes** muestra la fecha y la vista previa de cada mensaje de la campaña, junto con:

* **Entregados:** mensajes entregados correctamente.
* **CTR:** clics rastreados divididos por mensajes entregados.
* **ROI promedio:** ingresos atribuidos del período divididos por el costo estimado de entrega de ese mensaje.
* **Conversión:** compras atribuidas divididas por mensajes entregados.
* **Ingresos/mensaje:** ingresos atribuidos divididos por mensajes entregados.
* **Ingresos:** ingresos atribuidos a ese mensaje.

Esto permite comparar los mensajes reales sin mezclar el rendimiento de los clics con el de las compras. Un mensaje puede tener un CTR saludable y una conversión más débil si los clientes hacen clic pero no completan la compra.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Métricas de un mensaje de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 600px; margin: 0 auto;">
      <picture style="width: calc(100% - 10px); display: block; margin: 0 auto;">
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/message-comparison-es-mobile.png" width="628" height="890" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/message-comparison-es.png" width="1200" height="1060" loading="lazy" decoding="async" alt="Fila de un mensaje de demostración con su vista previa y métricas de entrega, CTR, ROI, conversión e ingresos; en móvil se resaltan las métricas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fila de un mensaje de demostración en la interfaz real; la imagen móvil se concentra en sus métricas.</figcaption>
</figure>

## Entiende el tiempo de conversión

**Tiempo de conversión** distribuye las ventas atribuidas ocurridas en el período según cuánto tardaron desde el inicio de la campaña hasta la compra, con rangos como el mismo día, 1–3 días, 4–7 días y períodos posteriores.

Una venta puede ocurrir días después de la entrega y aparecer si su fecha de compra está dentro del período seleccionado y corresponde a la campaña según las reglas de atribución aplicables.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Distribución del tiempo de conversión">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 610px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-es-mobile.png" width="720" height="820" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-es.png" width="1220" height="780" loading="lazy" decoding="async" alt="Gráfico de Tiempo de conversión que distribuye las compras atribuidas entre el mismo día, los días siguientes y períodos posteriores." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Distribución de la interfaz real en español con datos de demostración.</figcaption>
</figure>

## Compara ingresos por canal y segmento

**Ingresos atribuidos por canal** muestra cómo se distribuyen los ingresos atribuidos entre los canales de mensajería disponibles. Úsalo para ver qué canal aportó más ingresos, no solo cuál entregó más mensajes.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Ingresos atribuidos por canal">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 710px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-channel-es-mobile.png" width="720" height="660" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-channel-es.png" width="1420" height="650" loading="lazy" decoding="async" alt="Comparación de ingresos atribuidos a WhatsApp y SMS en un reporte de campaña con datos de demostración." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Desglose por canal de la interfaz real en español con datos de demostración.</figcaption>
</figure>

**Ingresos atribuidos por segmento** muestra la distribución entre segmentos de clientes cuando hay datos de segmentación disponibles. Un cliente puede pertenecer a varios segmentos, por lo que sus porcentajes pueden superponerse y no necesariamente sumar 100 %. Interpreta con cuidado las muestras pequeñas antes de aplicar el resultado a una audiencia futura.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Ingresos atribuidos por segmento">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 740px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-segment-es-mobile.png" width="744" height="520" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/revenue-by-segment-es.png" width="1572" height="520" loading="lazy" decoding="async" alt="Desglose de ingresos atribuidos entre segmentos de demostración, cuyos porcentajes pueden superponerse." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Desglose por segmento de la interfaz real en español con datos de demostración.</figcaption>
</figure>

## Revisa la actividad reciente

**Actividad reciente** lista eventos rastreados de clientes asociados con la campaña durante el período seleccionado. Puedes buscar un cliente o una actividad y abrir un evento para revisar más detalles.

Que un evento aparezca aquí no significa automáticamente que haya generado ingresos atribuidos. La compra todavía necesita evidencia elegible de cliente, pedido, origen y tiempo.

## Separa la actividad de la atribución

Un clic en un enlace corto rastreado es evidencia activa de la campaña y normalmente abre una ventana de atribución de siete días desde el clic elegible. El clic no es la única evidencia posible: una entrega elegible de la campaña puede aportar evidencia pasiva dentro de la ventana predeterminada de 24 horas.

Hellotext evalúa la evidencia disponible y su precedencia antes de asignar una compra. Una fuente de marketing externa reconocida puede tener precedencia sobre la evidencia de Hellotext. Lee [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer la metodología completa.

## Convierte el reporte en una decisión

* **Hay muchos más enviados que entregados:** revisa el consentimiento, que los perfiles de los clientes tengan un canal disponible y los posibles problemas de entrega.
* **La entrega es saludable, pero el CTR es bajo:** revisa la relevancia de la audiencia, la claridad del mensaje y el llamado a la acción.
* **El CTR es saludable, pero la conversión es baja:** revisa el destino, la disponibilidad del producto, la oferta y la experiencia de compra.
* **Hay ingresos, pero el ROI o los ingresos por mensaje son débiles:** compara el costo de entrega, la combinación de canales y la calidad de la audiencia.
* **Un canal o segmento aporta más ingresos:** úsalo como señal para la próxima campaña, considerando también el tamaño de la audiencia y el volumen de mensajes.
* **Las conversiones llegan durante varios días:** espera lo suficiente antes de considerar definitivo el resultado del primer día.

## Cuando faltan resultados o parecen incorrectos

Primero confirma que el período seleccionado incluya las fechas de los resultados que esperas ver: entregas, clics o compras atribuidas. Para interpretar el CTR y la conversión, incluye también las fechas de entrega de los mensajes que forman el denominador; si el rango sólo contiene clics o compras posteriores, esas tasas pueden mostrarse en cero. En el embudo, **Interacción** requiere una entrega y un clic en un enlace rastreado dentro del período seleccionado. Luego verifica que estén disponibles los enlaces rastreados y los eventos de compra. Las integraciones de comercio compatibles pueden enviar los datos de compras automáticamente; las tiendas personalizadas pueden usar [Hellotext.js o la API]({% link _developers/tracking-events.md %}).

Si la actividad sigue sin aparecer, consulta [Soluciona señales o actividad faltantes]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

* [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
* [Buenas prácticas para campañas]({% link _campaigns/campaign-best-practices.md %})
* [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
* [Rastrear enlaces en campañas y recorridos]({% link _developers/tracking-on-campaigns-and-journeys.md %})
* [Usar enlaces rastreados]({% link _analytics-reporting-attribution/tracked-links.md %})
* [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
* [Introducción a Analíticas]({% link _analytics-reporting-attribution/analytics-overview.md %})
