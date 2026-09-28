Usa esta guía después de que una misión, un agente de IA o una ruta lleve suficiente tiempo en actividad como para reunir actividad real de clientes.

Reportar una misión no significa mirar un solo número. Revisa ingresos, rendimiento, atribución y señales operativas juntas para entender si la misión está creando valor, generando carga para el equipo o perdiendo las señales que necesita.

## Por dónde empezar

Empieza por el reporte que responde la pregunta que tienes.

Usa la [guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %}) cuando quieres entender ventas atribuidas, la diferencia entre campañas y misiones, y qué misiones o rutas recibieron ingresos atribuidos.

Usa la [guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %}) para interpretar las tasas generales de conversión y Derivación y el tiempo de conversión. Sus desgloses por Misión, canal o Campaña muestran recuentos, no tasas ni tiempos promedio por categoría.

Usa el **Inbox** y el historial de conversaciones cuando necesitas entender por qué una misión derivó, qué preguntó el cliente y si la derivación le dio suficiente contexto al equipo.

Usa un reporte específico de la misión cuando esté disponible para ese tipo de misión y recopile su propio resultado, como reseñas de productos desde [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}), puntajes de lealtad desde [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) o respuestas de satisfacción desde [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}).

Cuando revises misiones de feedback juntas, mantén separados sus resultados. Generador de Reseñas explica feedback a nivel producto, Pulso CSAT explica si una conversación resuelta funcionó y Pulso NPS explica lealtad de relación después de una experiencia de entrega.

Antes de comparar resultados, elige el rango de fechas correcto y confirma que la misión tuvo suficiente tráfico para aprender algo.

## Entiende cómo se asignan las fechas

La misma compra puede aparecer en fechas diferentes entre reportes porque las métricas no usan siempre la misma fecha. Revisa el indicador concreto antes de comparar períodos:

- Un **reporte específico de misión**, cuando existe, puede combinar activaciones, envíos, entregas o clics según la fecha de cada evento con ingresos o conversiones atribuidos según la fecha del mensaje de origen acreditado. Una tabla de productos también puede usar las fechas de vista y compra. No atribuyas todas sus cifras al día de activación.
- El **resumen de Misiones** registra envíos y entregas según sus eventos. Algunas ventas elegibles se agrupan por la fecha del mensaje de origen acreditado, que puede ser anterior a la compra.
- El **Reporte de ingresos** usa la fecha de compra. Muestra las compras completadas durante el período seleccionado e identifica la misión, campaña u otra fuente que recibió el crédito.
- El **Reporte de rendimiento** agrupa las interacciones por fecha de inicio para sus métricas principales. Una conversión o Derivación registrada después sigue a esa interacción, incluso si no tiene una conversación asociada.

Por ejemplo: **Mensaje de una Misión entregado el 8 de abril → Compra el 10 de abril.** Si la compra es elegible y se acredita a ese mensaje, un indicador de ingresos agrupado por mensaje de origen puede mostrarla en el 8 de abril, mientras que **Ingresos** la cuenta el 10 de abril. El día en que se activó la Misión puede ser distinto de ambos.

Las cifras recientes agrupadas por mensaje de origen pueden crecer mientras las ventanas de resultados y atribución sigan abiertas. Consulta [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer las reglas de elegibilidad y tiempo.

## Revisa ingresos de misiones

En el reporte de Ingresos, mira:

- **Ingresos atribuidos a la IA**, los que el motor asignó a la IA según evidencia comercial elegible, que puede incluir campañas, rutas o misiones.
- **Ingresos clasificados como gestionados por el equipo**, los que el motor clasificó de esa forma, junto con registros históricos elegibles gestionados por personas.
- **Ingresos totales**, todos los ingresos comerciales reportados para el período, incluidos los atribuidos y no atribuidos.
- **Desglose por misión**, para comparar flujos por ingresos atribuidos.
- **Campañas vs Misiones**, para comparar ventas atribuidas vinculadas con envíos puntuales y flujos siempre activos.
- **Sección de Misiones**, para comparar pedidos atribuidos, valor promedio del pedido atribuido e ingresos atribuidos por flujo. Consulta el reporte específico de la misión, si existe, para otras métricas.

Usa reportes de ingresos para responder preguntas como:

- ¿Qué misión o ruta tiene más ingresos atribuidos?
- ¿Qué misión, ruta o campaña recibió el crédito por cada ingreso atribuido?
- ¿Qué ingresos atribuidos clasificó el motor como de IA o gestionados por el equipo?
- ¿Algunos canales, audiencias o flujos rinden mejor que otros?
- ¿La misión necesita mejores datos de producto, timing, lógica de oferta o reglas de derivación?

Si una misión tiene ingresos atribuidos sólidos y, por separado, muchas Derivaciones explícitas de IA, puede seguir siendo valiosa. Revisa interacciones representativas antes de decidir si los traspasos son apropiados y llegan a la persona o equipo correcto. Los **ingresos clasificados como gestionados por el equipo** no demuestran por sí solos que hubo una Derivación.

## Revisa rendimiento y derivaciones

Usa el Reporte de rendimiento para investigar las interacciones asociadas a una misión, sin confundir sus métricas generales con una tasa propia de esa misión. Las tasas principales usan todas las interacciones iniciadas en el período; el desglose por Misión muestra recuentos de resultados, no un denominador por Misión.

Revisa:

- **Tasa de conversión**, proporción de interacciones iniciadas con una conversión registrada, que puede ser una compra atribuida o una meta cargada manualmente.
- **Tiempo de conversión**, promedio visible entre inicio y conversión sólo para interacciones convertidas sin Derivación explícita de IA; no es el tiempo promedio de cada Misión.
- **Tasa de Derivación**, proporción de interacciones iniciadas con una solicitud explícita de traspaso de la IA. La participación de un colaborador por sí sola no cuenta.
- **Desglose por Misión**, recuento de interacciones convertidas o derivadas asociadas a cada flujo. Para calcular una tasa propia, necesitas además el total de interacciones iniciadas en esa categoría.
- **Desglose IA frente a humano**, opción de **Tasa de conversión** y **Tiempo de conversión** que clasifica por asociación con Campaña o flujo de automatización y, en otros casos, por colaborador. No equivale a separar interacciones con y sin Derivación ni a la clasificación de ingresos atribuidos.

Una Tasa de Derivación general alta no siempre es mala. Revisa ejemplos concretos antes de concluir que una misión está fallando: un traspaso puede ser correcto para casos sensibles o no resueltos. Si el mismo tema se deriva repetidamente por conocimiento, contexto o pasos faltantes, ajusta el flujo y vuelve a medir.

## Usa evidencia de atribución

Los reportes y exports de ingresos te ayudan a explicar por qué Hellotext atribuyó una venta.

Al revisar atribución, mira:

- La campaña, ruta o misión conectada con la venta.
- El canal y la fuente que influyeron en el cliente.
- Si el reporte clasificó la compra atribuida como de IA o gestionada por el equipo y, cuando aplica una evaluación del responsable comercial, cómo afectó la participación del equipo a esa decisión.
- La razón de atribución y la evidencia disponible.
- Si hubo otro punto de contacto comercial antes de la compra.

Usa [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) cuando necesites entender precedencia de fuentes, selección de evidencia, ventanas de atribución, cancelaciones, cambios de pedidos o participación del equipo.

## Compara misiones con cuidado

Compara misiones solo cuando el contexto sea suficientemente parecido.

Antes de decidir, revisa:

- El mismo rango de fechas y la regla usada por cada reporte para asignar los resultados a una fecha.
- Tamaño de audiencia y tráfico similares.
- Mezcla de canales comparable.
- Si la misión estuvo activa durante todo el período.
- Si la misión tenía las señales, datos de producto y políticas que necesitaba.
- Si una campaña, descuento, fecha especial o evento de la tienda cambió el resultado.

Evita juzgar una misión con IA nueva contra una ruta madura demasiado rápido. Los primeros resultados suelen revelar conocimiento faltante, prompts débiles o reglas de derivación poco claras antes de mostrar el rendimiento de largo plazo.

## Soluciona resultados débiles o confusos

Usa el patrón que ves para decidir qué revisar después.

| Si ves... | Revisa... |
| --- | --- |
| Poca o ninguna actividad | Disparadores, señales, elegibilidad de audiencia, canal listo y si la misión está activa. |
| Mensajes entregados pero pocas conversiones | Timing, oferta, claridad del mensaje, relevancia del producto y si la audiencia es demasiado amplia. |
| Muchas conversaciones no resueltas | Prompt del agente, documentos cargados, datos de producto, políticas y reglas de derivación. |
| Muchos ingresos clasificados como gestionados por el equipo | La evidencia de atribución y la participación comercial del equipo. Comprueba las Derivaciones por separado: esta clasificación de ingresos no prueba que la IA haya solicitado un traspaso. |
| Ingresos atribuidos faltantes | Tracking, links, eventos de pedidos, ventanas de atribución y si una fuente externa reconocida tuvo precedencia. |
| Muchas bajas o respuestas negativas | Calidad de audiencia, consentimiento, frecuencia, tono y relevancia de la oferta. |
| Poca recopilación de reseñas | Señales de pedido entregado, timing de solicitud, separación entre productos, soporte del canal y si las calificaciones bajas se manejan correctamente. |
| Baja respuesta de NPS o muchos detractores | Señales de pedido entregado, timing de entrega, claridad del mensaje, elegibilidad del canal y si el feedback de detractores crea la recuperación correcta. |
| Baja respuesta de CSAT o muchas respuestas negativas de CSAT | Disparador de resolución, controles de interacción significativa, protección contra preguntas duplicadas, claridad del mensaje, elegibilidad del canal y si el feedback negativo crea la recuperación correcta. |

Si faltan señales o actividad, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) antes de juzgar la misión.

## Qué ajustar después

Ajusta una cosa por vez para que el siguiente reporte sea más fácil de interpretar.

Mejoras comunes:

- Acotar la audiencia o disparador.
- Mejorar el prompt o conocimiento cargado para un agente de IA.
- Sumar datos faltantes de producto, políticas, pedidos o perfil de cliente.
- Ajustar esperas, condiciones o ramas de la ruta.
- Cambiar el mensaje, oferta o lógica de recomendación.
- Actualizar reglas de derivación para que la conversación llegue a la persona o equipo correcto.
- Agregar tracking o configuración de atribución cuando el reporte no puede ver el camino completo.

Después de cambiar una misión, dale suficiente tiempo y tráfico antes de comparar de nuevo.

## Guías relacionadas

- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %})
