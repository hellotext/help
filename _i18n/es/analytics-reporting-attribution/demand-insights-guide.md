Usa Insights de demanda para entender qué intentaron comprar los clientes sin poder hacerlo, qué productos fueron afectados y el valor estimado de esas oportunidades perdidas.

Ábrelo desde la tarjeta **Insights de demanda** dentro de **Rendimiento del negocio** en el Dashboard.

## Qué significa una solicitud no satisfecha

Una solicitud no satisfecha es una solicitud de producto que Hellotext identificó con un motivo de falta de disponibilidad compatible, como un producto sin stock o un talle no disponible.

No es lo mismo que:

- una conversación abierta en el Inbox;
- una pregunta de atención que la IA no pudo responder;
- una Derivación de IA a un colaborador; ni
- cualquier consulta de producto de un cliente.

El reporte necesita una señal de demanda compatible y suficiente contexto de producto o comercio para clasificar la solicitud. Una conversación no se convierte en demanda no satisfecha solamente porque terminó sin una compra.

## Cómo cuenta los resultados este reporte

El período seleccionado se basa en cuándo comenzó la solicitud no satisfecha. Una recuperación elegible posterior permanece conectada con esa solicitud de origen y puede actualizar el resultado anterior.

Por ejemplo: **Solicitud de producto iniciada el 7 de abril → Producto disponible y compra realizada el 9 de abril → La recuperación permanece conectada con el 7 de abril.**

Las fechas recientes pueden cambiar mientras las solicitudes sigan dentro de su ventana de recuperación. Compara períodos anteriores cuando necesites resultados estables y períodos recientes con la misma antigüedad.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### No resueltas

Es la cantidad de solicitudes de producto compatibles que Hellotext no pudo satisfacer para el cliente.

Un mismo cliente puede generar más de una solicitud cuando pregunta por diferentes productos o variantes. Este es un volumen de solicitudes, no necesariamente una cantidad de clientes únicos o conversaciones.

### Ingresos perdidos

Es el valor estimado asociado con solicitudes de compra que no pudieron completarse.

Hellotext usa el contexto de producto, valor y comercio disponible para la solicitud para estimar la oportunidad. Este valor es orientativo:

- no son ingresos completados;
- no son ingresos atribuidos;
- no demuestra que el cliente habría comprado; y
- un contexto incompleto de producto o precio puede limitar la estimación.

Úsalo para priorizar patrones de demanda repetidos y valiosos, no para conciliar ventas registradas.

### SKUs afectados

Es la cantidad de productos o variantes únicos relacionados con al menos una señal de demanda no satisfecha.

Esta métrica separa amplitud de volumen. Diez solicitudes para un mismo producto aumentan el volumen de solicitudes, pero no representan diez SKUs afectados.

### Tasa no resuelta

Es el porcentaje de solicitudes elegibles relacionadas con productos que no pudieron satisfacerse.

El denominador es la población elegible de demanda de productos, no todas las conversaciones del Inbox. Revisa la cantidad de solicitudes junto con la tasa: un porcentaje alto sobre una población muy pequeña requiere una acción diferente al mismo porcentaje entre miles de solicitudes.

## Usa los desgloses

Los desgloses disponibles dependen de la métrica seleccionada.

Para **No resueltas**, compara por:

- motivo;
- categoría de producto;
- producto o variante;
- tienda o región;
- canal;
- IA frente a humano;
- intención; o
- contexto de comercio.

Para **Ingresos perdidos**, compara por motivo, categoría de producto, producto, variante, tienda, región, canal o IA frente a humano.

Para **SKUs afectados**, compara por categoría de producto, motivo, tienda, región, canal o IA frente a humano.

Para **Tasa no resuelta**, compara por motivo, categoría de producto, tienda, región, canal o IA frente a humano.

Usa una dimensión por vez cuando investigues un cambio. Una categoría puede contener varios problemas de disponibilidad individuales, mientras una diferencia por contexto de comercio puede señalar datos de catálogo o inventario disponibles en un entorno de venta pero faltantes en otro.

## Entiende los motivos y el contexto de comercio

El desglose por **motivo** agrupa solicitudes según la causa compatible de falta de disponibilidad. Algunos ejemplos son falta de stock o talle solicitado no disponible.

El porcentaje de un motivo representa su proporción entre las solicitudes no satisfechas. La cantidad muestra cuántas solicitudes tienen ese motivo.

El **contexto de comercio** identifica dónde ocurría la compra, como eCommerce, retail o un marketplace. Ayuda a distinguir un problema general de producto de uno limitado a una tienda, catálogo o entorno de venta.

No interpretes un motivo o contexto faltante como demanda cero. Puede significar que la solicitud de origen llegó sin suficiente información estructurada para ese desglose.

## Compara Insights de demanda con otros reportes

| Pregunta | Reporte |
| --- | --- |
| ¿Qué intentaron comprar los clientes sin poder hacerlo? | Insights de demanda |
| ¿Qué conversaciones siguen sin resolver o incumplieron el SLA? | Reporte de calidad de servicio |
| ¿Qué conversaciones actuales esperan al equipo? | Reporte de carga y capacidad |
| ¿Qué compras e ingresos completados se registraron? | Reporte de ingresos |
| ¿Cómo convirtieron las conversaciones después de comenzar? | Reporte de rendimiento |

Insights de demanda describe oportunidades de producto perdidas. No reemplaza los reportes de inventario de la plataforma de comercio ni los reportes operativos de conversaciones del Inbox.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Solicitudes sin stock concentradas en un producto | Tiempos de inventario, sincronización del catálogo y si Vuelta a Stock puede notificar a los clientes interesados cuando regrese el stock. |
| Domina la falta de talles o variantes | Profundidad de variantes, disponibilidad de talles, datos del catálogo y recomendaciones alternativas. |
| Ingresos perdidos concentrados en pocos productos | Prioridad de reposición, contexto de precio, posibilidad de recuperación y demanda repetida. |
| Un contexto de comercio tiene peores resultados | Datos de inventario y catálogo de esa tienda, marketplace o integración de eCommerce. |
| Sube la Tasa no resuelta con un volumen estable | Mezcla de productos, motivos, categorías afectadas y cambios recientes de inventario. |
| Muchas solicitudes no tienen producto o valor | Identificadores del catálogo, datos de variantes, precio, moneda, clasificación de intención y contexto de integración. |

Abre conversaciones representativas y verifica el catálogo de origen antes de cambiar inventario, un Playbook o recomendaciones de productos. El reporte identifica un patrón de demanda; la conversación y los registros de comercio lo explican.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- la fuente conectada de eCommerce, marketplace o retail proporcione información actual del catálogo e inventario;
- las solicitudes de clientes incluyan un motivo compatible de falta de disponibilidad;
- los identificadores de producto y variante coincidan con el catálogo conectado;
- precio, valor y moneda estén presentes cuando deban estimarse los Ingresos perdidos;
- tienda, región, canal, intención y contexto de comercio estén registrados al usar esos desgloses;
- el contexto de gestión por IA o colaborador esté disponible para la comparación entre IA y humano; y
- ambas comparaciones usen el mismo período, zona horaria, métrica y desglose.

Si el cliente preguntó por un producto pero no existe una señal compatible de demanda no satisfecha, revisa primero el Playbook, integración o camino de tracking de origen. Si los registros existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Playbook Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
