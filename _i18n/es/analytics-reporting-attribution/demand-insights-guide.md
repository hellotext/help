Insights de demanda resume interacciones que finalizaron sin una conversión registrada. Muestra su cantidad, una estimación de ingresos y otras métricas que conviene interpretar con cuidado. No identifica por sí solo solicitudes de un producto, faltantes de stock ni ventas perdidas confirmadas.

Ábrelo desde la tarjeta **Insights de demanda** dentro de **Rendimiento del negocio** en el Dashboard.

## Qué significa No resueltas

Aunque la tarjeta se llama **No resueltas**, el reporte cuenta interacciones que terminaron dentro del período, quedaron resueltas por IA o por un colaborador, o cerradas por una automatización, y no tienen una conversión registrada. Una misma persona puede tener varias interacciones.

Esta cifra no representa conversaciones que siguen abiertas en el Inbox. El reporte no distingue si una interacción cerrada fue una pregunta de soporte o una consulta por un producto sin stock. Tampoco demuestra que una persona quiso comprar: el cálculo no exige un producto, motivo de falta de disponibilidad ni dato de inventario.

## Cómo cuenta los resultados este reporte

El período se basa en la **fecha de finalización de cada interacción**, no en la fecha de inicio. Por ejemplo, una interacción que comenzó el 7 de abril y terminó el 9 de abril se considera en un período que incluya el 9 de abril. Si después se registra una conversión para esa interacción, puede dejar de contar como No resueltas al actualizarse el reporte.

No hay una ventana de recuperación de demanda en este cálculo. Al comparar períodos, usa la misma zona horaria y recuerda que los estados y las conversiones registrados posteriormente pueden cambiar las cifras.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses que muestre el reporte.

### No resueltas

Es la cantidad de interacciones finalizadas que cumplen las condiciones anteriores y no tienen una conversión registrada. Es un recuento de interacciones, no de clientes únicos ni de solicitudes de producto.

### Ingresos perdidos

Es una **estimación**, calculada al multiplicar la cantidad de No resueltas por el importe promedio de ingresos positivos rastreados durante el período. Si no hay ingresos positivos para calcular ese promedio, el reporte utiliza un valor de referencia fijo.

No usa el precio del producto que alguien consultó. No son ventas perdidas confirmadas, ingresos atribuidos a esas interacciones ni una previsión de lo que cada cliente habría comprado. Revisa la cantidad de interacciones y el promedio de ingresos antes de interpretar un cambio en esta cifra.

### SKUs afectados

Aunque la tarjeta se llama **SKUs afectados**, el cálculo actual cuenta **Misiones de recomendación distintas** asociadas con las interacciones No resueltas. No cuenta productos, variantes ni SKUs únicos.

No uses esta cifra para decidir cuántos productos necesitan reposición. Para investigar disponibilidad, consulta los datos del catálogo y las conversaciones relacionadas por separado.

### Tasa no resuelta

Es la cantidad de No resueltas dividida entre **todas las interacciones que finalizaron en el período**, expresada como porcentaje. El denominador no se limita a consultas de producto ni a conversaciones del Inbox.

Mira la tasa junto con el recuento: puede subir porque aumentaron las interacciones No resueltas o porque disminuyó el total de interacciones finalizadas.

## Usa los desgloses

El menú ofrece opciones según la métrica seleccionada, pero una opción visible no garantiza que el reporte tenga un cálculo para ella. El desglose por **canal** puede ayudar a comparar recuentos de No resueltas y sus estimaciones de Ingresos perdidos. Contrasta cualquier serie con la métrica principal antes de usarla: algunas series muestran cantidades aunque la tarjeta se presente como tasa u otra unidad.

La comparación **IA frente a humano** usa una fecha de inicio para agrupar interacciones, mientras las métricas principales usan su fecha de finalización. Por eso sus cifras pueden no conciliar con el total del período. Úsala sólo como pista para investigar registros concretos, no como reparto exacto del resultado principal.

Para investigar un cambio:

1. Selecciona la misma métrica y zona horaria en los períodos que comparas.
2. Revisa la cantidad de No resueltas junto con la Tasa no resuelta y el total de interacciones finalizadas.
3. Si el canal aporta datos, identifica dónde cambió el recuento y verifica algunas interacciones de origen antes de tomar medidas.

## Qué no muestran los desgloses

El menú también puede ofrecer **motivo**, categoría, producto, variante, tienda, región, intención o **contexto de comercio**. El cálculo actual no genera resultados para esas dimensiones. Un desglose vacío no significa que no haya actividad, ni que el motivo o el producto tengan valor cero.

Si necesitas saber qué producto faltó, qué talle pidió alguien o en qué tienda ocurrió, revisa los datos de catálogo, inventario y las conversaciones pertinentes en sus sistemas de origen. Este reporte no proporciona esas respuestas.

## Compara Insights de demanda con otros reportes

| Pregunta | Reporte |
| --- | --- |
| ¿Cuántas interacciones resueltas por IA o colaboradores, o cerradas por automatizaciones, no tienen conversión registrada? | Insights de demanda |
| ¿Qué conversaciones siguen sin resolver o incumplieron el SLA? | Reporte de calidad de servicio |
| ¿Qué conversaciones actuales esperan al equipo? | Reporte de carga y capacidad |
| ¿Qué compras e ingresos completados se registraron? | Reporte de ingresos |
| ¿Cómo convirtieron las conversaciones después de comenzar? | Reporte de rendimiento |

Insights de demanda no reemplaza los reportes de inventario de la plataforma de comercio ni los reportes operativos de conversaciones del Inbox.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Aumenta No resueltas | El período, los estados de cierre, las conversiones registradas y algunas interacciones representativas. |
| Aumenta Ingresos perdidos sin cambiar mucho No resueltas | El importe promedio de ingresos positivos rastreados en el período; no infieras un cambio en el precio de productos consultados. |
| Cambia SKUs afectados | Las Misiones de recomendación asociadas; esta tarjeta no identifica SKUs ni variantes. |
| Sube la Tasa no resuelta con un recuento estable | El total de interacciones finalizadas usado como denominador. |
| Un desglose aparece vacío | Si esa dimensión tiene un cálculo disponible antes de interpretar el vacío como ausencia de actividad. |

Verifica los registros de origen antes de cambiar una Misión, recomendaciones o inventario. Una señal de interacción sin conversión no explica por sí sola qué necesitaba el cliente.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- las interacciones tengan fecha de finalización dentro del período seleccionado;
- el estado de cierre y la conversión registrada correspondan a lo que esperas medir;
- haya ingresos positivos rastreados en el período al interpretar Ingresos perdidos; si no los hay, la estimación usa el valor de referencia fijo;
- haya una Misión de recomendación asociada si esperas un valor en SKUs afectados;
- el canal de la interacción esté registrado si utilizas ese desglose; y
- ambas comparaciones usen la misma zona horaria, métrica y período equivalente.

Puede haber interacciones finalizadas en el período y aun así mostrar cero en No resueltas, porque sólo algunos estados de cierre sin conversión integran ese recuento. Si los registros existen pero las cifras siguen siendo inconsistentes, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

Las Misiones Vuelta a Stock y Recomendador Inteligente abordan escenarios de productos por separado; sus resultados no se deducen de las métricas de este reporte.

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Misión Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
