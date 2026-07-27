Los reportes de campaña muestran entrega, interacción, compras atribuidas e ingresos atribuidos de una campaña entregada. Úsalos para comparar mensajes y canales, revisar la actividad de clientes y entender qué pedidos se vincularon con la campaña según la metodología de atribución de Hellotext.

Para abrir un reporte, ve a **Campañas** y selecciona una campaña entregada. Los reportes están disponibles después de que se entrega una campaña.

## Selecciona el período del reporte

El reporte se abre con la opción **Primeros 14 días**. Puedes cambiar el rango de fechas para revisar otro período.

El período del reporte controla qué actividad aparece. No extiende la ventana de atribución utilizada para decidir si un pedido corresponde a la campaña.

## Interpreta las métricas principales

* **Ingresos:** ingresos activos atribuidos a la campaña durante el período seleccionado.
* **ROI:** ingresos atribuidos a la campaña divididos por el costo estimado de entrega de sus mensajes.
* **Conversión:** cantidad de compras atribuidas dividida por los mensajes entregados.
* **Ingresos/mensaje:** ingresos atribuidos a la campaña divididos por los mensajes entregados.
* **CTR:** clics rastreados divididos por los mensajes entregados.

La conversión no es el porcentaje de clics únicos que realizaron una compra. Se calcula con las compras atribuidas y los mensajes entregados.

## Compara entregas y envíos

El embudo de entrega muestra cómo avanzaron los mensajes por las etapas de entrega e interacción. Cuando una campaña tiene más de un envío o canal, la tabla de envíos permite comparar mensajes entregados, CTR, ROI, conversión, ingresos por mensaje e ingresos atribuidos.

## Cómo los clics y las entregas contribuyen a la atribución

Un clic en un enlace corto rastreado es evidencia activa de la campaña y normalmente abre una ventana de atribución de siete días desde el clic elegible. El clic no es la única evidencia posible: una entrega elegible de la campaña puede aportar evidencia pasiva dentro de la ventana predeterminada de 24 horas.

Hellotext evalúa la evidencia de origen disponible y su precedencia antes de asignar el pedido. Una fuente de marketing externa reconocida puede tener precedencia sobre la evidencia de Hellotext. Lee [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer la metodología completa.

## Explora los ingresos y la actividad

Según la campaña y los datos disponibles, el reporte también puede incluir:

* Tiempo hasta la conversión
* Ingresos por canal
* Ingresos por segmento
* Eventos de entrega e interacción
* Compras y otros eventos rastreados del cliente

Que un evento aparezca en la actividad de la campaña no significa automáticamente que haya creado ingresos atribuidos. El evento todavía necesita evidencia elegible de cliente, pedido, origen y tiempo.

Las integraciones de comercio compatibles pueden enviar los datos de compras automáticamente. Para tiendas y eventos personalizados, usa [Hellotext.js o la API]({% link _developers/tracking-events.md %}).

## Guías relacionadas

* [Rastrear enlaces en campañas y recorridos]({% link _developers/tracking-on-campaigns-and-journeys.md %})
* [Usar enlaces rastreados]({% link _analytics-reporting-attribution/tracked-links.md %})
* [Introducción a Analíticas]({% link _analytics-reporting-attribution/analytics-overview.md %})
