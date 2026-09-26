Usa analítica y reportes para entender la actividad de clientes, los resultados de campañas y misiones, el trabajo del equipo y los ingresos atribuidos a Hellotext.

Esta sección te ayuda a responder:

- ¿Cómo funcionó una campaña, misión o ruta?
- ¿Qué acciones siguieron al mensaje y qué necesidades quedaron sin atender?
- ¿Cómo se resolvieron las conversaciones y se distribuyó el trabajo?
- ¿Qué ingresos se atribuyeron a Hellotext?
- ¿Por qué faltan datos o dos reportes muestran resultados distintos?

## Empieza por el Dashboard

El Dashboard resume los últimos 14 días, las acciones registradas y las campañas programadas o enviadas. Úsalo para detectar un cambio y luego abre el reporte detallado para investigar su origen.

Sigue leyendo: [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %}).

## Reporte de ingresos

El Reporte de ingresos muestra las compras completadas durante el período seleccionado, incluidos los ingresos totales y la parte atribuida a actividad elegible de Hellotext.

Úsalo cuando necesites comparar ingresos atribuidos a la IA o clasificados como gestionados por el equipo, revisar Campañas y Misiones acreditadas o conciliar compras atribuidas individuales.

Sigue leyendo: [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %}).

## Reporte de rendimiento

El Reporte de rendimiento agrupa las interacciones por su fecha de inicio y muestra conversiones y Derivaciones de IA registradas posteriormente.

Úsalo para revisar la tasa de conversión, el tiempo medio hasta conversión sin Derivación de IA, la tasa de Derivación y la distribución de interacciones con o sin Derivación de IA.

Sigue leyendo: [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %}).

## Insights de demanda

Insights de demanda resume ciertas interacciones finalizadas sin una conversión registrada. Muestra un recuento, una estimación de ingresos y una tasa; su tarjeta **SKUs afectados** cuenta Misiones de recomendación distintas asociadas, no productos.

Úsalo para investigar cambios en ese recuento y su tasa. Si necesitas revisar conversiones registradas, consulta los registros de origen por separado; para problemas de inventario, catálogo o disponibilidad, revisa los datos de producto y las conversaciones.

Sigue leyendo: [Guía de Insights de demanda]({% link _analytics-reporting-attribution/demand-insights-guide.md %}).

## Reportes de campañas

Los reportes de campaña te ayudan a revisar entrega, interacción, clicks, conversiones, respuestas e ingresos atribuidos para un envío puntual.

Usa reportes de campaña cuando necesites evaluar una campaña, comparar el rendimiento de los mensajes o decidir qué mejorar antes de la próxima campaña.

Sigue leyendo: [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Reportes de misiones y rutas

Los reportes de misiones te ayudan a revisar flujos siempre activos, agentes de IA y rutas después de que empiezan a recibir actividad real de clientes.

Usa reportes de misiones cuando necesites comparar ingresos atribuidos, comportamiento de conversión, tiempo hasta conversión, tasa de derivación y la calidad de las derivaciones detrás de los números.

Sigue leyendo: [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

## Reporte de calidad de servicio

El Reporte de calidad de servicio compara resolución por IA y equipo, cumplimiento de SLA, conversaciones no resueltas, distribución del tiempo de respuesta y rendimiento de agentes.

Úsalo cuando necesites entender cómo se resuelven las conversaciones y si un problema de servicio se concentra en un canal, equipo, colaborador, agente de IA o ruta de resolución.

Sigue leyendo: [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %}).

## Reporte de carga y capacidad

El Reporte de carga y capacidad compara carga activa, conversaciones manejadas y resueltas, concurrencia, asignaciones, transferencias, presión de capacidad, eficiencia de sesión y la cola operativa actual.

Úsalo cuando necesites entender cómo se distribuye el trabajo del Inbox durante un período y qué necesita atención ahora.

Sigue leyendo: [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %}).

## Atribución

La atribución explica cuándo Hellotext recibe crédito por una venta y cuándo no.

Usa la guía de atribución cuando necesites entender precedencia de fuentes, evidencia elegible, ventanas de atribución, participación del equipo y cambios de pedidos compatibles.

Sigue leyendo: [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Datos de tracking

Los reportes son más fuertes cuando Hellotext recibe actividad útil de clientes desde tu tienda, sitio, integraciones o API como señales.

Si tu tienda está conectada con una integración soportada, muchos eventos pueden rastrearse automáticamente. Si tienes una implementación personalizada, usa Hellotext.js o la API para enviar eventos.

Sigue leyendo:

- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})

## Antes de comparar resultados

Al revisar el rendimiento, verifica:

- La audiencia y el canal usado.
- Si los links y el tracking estaban configurados correctamente.
- Si el reporte está midiendo clicks, respuestas, conversiones o ingresos atribuidos.
- Si el pedido contiene una fuente externa reconocida que tiene precedencia.
- Si la responsabilidad del checkout o la participación del equipo aplicable a ese flujo afectó la decisión.

Antes de comparar reportes, revisa qué fecha y qué población usa cada métrica. En el detalle de una campaña, las compras atribuidas cuentan en su fecha de compra; la etapa **Interacción** del embudo exige que tanto la entrega como un clic en un enlace rastreado ocurran dentro del período seleccionado. Los resultados recientes también pueden cambiar mientras llegan eventos atrasados o sigue abierta una ventana de atribución. Si las cifras no coinciden, sigue [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}) antes de cambiar el tracking.

Si estás revisando tu primer lanzamiento, empieza por [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %}).

## Guías relacionadas

- [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %})
- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía de Insights de demanda]({% link _analytics-reporting-attribution/demand-insights-guide.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Resumen de precios, facturación y planes]({% link _billing/billing-overview.md %})
- [Resumen de desarrolladores y API]({% link _developers/developers-overview.md %})
- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
