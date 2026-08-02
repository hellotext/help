Usa el Reporte de ingresos para entender cuántos ingresos de comercio recibió Hellotext, qué compras fueron atribuidas y si la IA, el equipo, una Campaña o un Playbook recibió el crédito.

Ábrelo desde la tarjeta **Reporte de ingresos** del Dashboard. Antes de comparar totales u orígenes, elige un período que coincida con la pregunta que quieres responder.

## Cómo cuenta los resultados este reporte

El período seleccionado se basa en la **fecha de compra**. Las métricas principales, la línea de tiempo, los desgloses de ingresos y las tablas de origen incluyen compras completadas durante ese período.

Los reportes de rendimiento de Campañas y Playbooks usan una fecha diferente porque miden la actividad que originó el resultado. Por ejemplo:

**Mensaje de Campaña entregado el 30 de junio → Compra completada el 5 de julio → Cuenta el 5 de julio en Ingresos y el 30 de junio en el rendimiento de la Campaña.**

Ambos reportes pueden ser correctos. Ingresos responde qué se compró durante el período; el reporte de origen responde qué resultados posteriores produjeron los mensajes, activaciones o conversaciones que comenzaron durante su período.

Una corrección tardía, cancelación, reembolso, reemplazo o actualización de atribución puede cambiar el valor asignado a la fecha de compra original.

## Interpreta las métricas principales

Las métricas principales separan tres tipos de ingresos:

- **Ingresos atribuidos a la IA:** ingresos que el motor de atribución asignó a la IA según evidencia comercial elegible.
- **Ingresos clasificados como gestionados por el equipo:** ingresos clasificados de esa forma por el motor, junto con ingresos históricos elegibles gestionados por una persona que no tienen un veredicto del motor.
- **Ingresos totales:** todos los ingresos compatibles que Hellotext recibió desde actividad de eCommerce, marketplaces y retail durante el período seleccionado, incluidos los atribuidos y no atribuidos.

Los ingresos atribuidos son una parte de los ingresos totales. Una respuesta de soporte u otra participación del equipo no convierte automáticamente una venta en gestionada por el equipo; Hellotext evalúa el camino de origen y la evidencia comercial aplicable.

Selecciona una métrica para actualizar su línea de tiempo. Compara el gráfico solo después de confirmar que la métrica, período, moneda y desglose seleccionados sean los mismos.

## Los ingresos atribuidos no incluyen toda venta influenciada

Hellotext puede interactuar con un cliente sin recibir atribución por una compra posterior.

Una compra recibe atribución solo cuando Hellotext tiene evidencia elegible de cliente, pedido, origen y tiempo, y ninguna fuente reconocida con mayor precedencia. Una compra fuera de la ventana aplicable, vinculada con otro perfil o que contiene una fuente externa reconocida puede permanecer en los ingresos totales sin aparecer en los ingresos atribuidos.

El título de la página puede describir la influencia de Hellotext sobre las ventas, pero **los ingresos influenciados no son una métrica general separada** dentro de este reporte. Usa las métricas atribuidas para los ingresos que cumplen la metodología de Hellotext. La atribución tampoco demuestra que todo el monto sea crecimiento incremental.

Consulta [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para entender evidencia, precedencia, ventanas, participación del equipo y ajustes de pedidos.

## Desglosa la línea de tiempo

Usa el control de desglose para entender de dónde proviene una métrica. Las opciones dependen de la métrica y de los datos disponibles, y pueden incluir:

- canal, Campaña o Playbook;
- segmento, tienda o región;
- categoría de producto, producto o variante;
- estado de suscripción, método de pago o contexto de comercio;
- intención, IA frente al equipo, motivo de atribución, equipo, persona o agente de IA.

Elige solamente las dimensiones necesarias para responder la pregunta. Una fila pequeña puede parecer especialmente fuerte cuando incluye pocas compras, por lo que conviene revisar su volumen antes de decidir.

## Interpreta los widgets de ingresos atribuidos

Los widgets debajo de la línea de tiempo explican la composición de los ingresos atribuidos.

- **Campañas vs Playbooks** compara el monto atribuido a Campañas puntuales y Playbooks siempre activos.
- **Contexto de comercio** separa ingresos compatibles de eCommerce, marketplaces y retail.
- **Canal de comercio** muestra qué canal de venta conectado registró las compras atribuidas.

Estos widgets distribuyen los ingresos atribuidos; no reemplazan los ingresos totales ni agregan la misma compra a cada origen que interactuó con el cliente.

## Revisa las tablas de origen

Las secciones Playbooks, Campañas y Canales agrupan las compras atribuidas incluidas en el período seleccionado según el origen que recibió el crédito.

Usa pedidos atribuidos, valor promedio del pedido atribuido e ingresos atribuidos para comparar el valor asignado a cada origen. Una fila sin ingresos no significa necesariamente que sus mensajes no se hayan enviado: puede indicar que ninguna compra completada durante el período seleccionado fue elegible para ese origen.

Para analizar conversión, ROI, ingresos por mensaje o resultados posteriores asignados a la fecha original de un mensaje o activación, abre el reporte de rendimiento de la Campaña o Playbook correspondiente.

## Exporta e inspecciona compras atribuidas

Usa **Exportar** cuando necesites conciliar pedidos o revisar la evidencia detrás de las filas atribuidas. La exportación puede incluir:

- referencias del pedido, cliente y conversación;
- Campaña, Playbook y canal acreditados;
- monto atribuido y fecha de compra;
- tipo y motivo de atribución;
- evidencia comercial de IA y humana, cuando corresponda;
- estado de la conversación, driver comercial y una explicación en lenguaje simple; y
- un link al contexto del evento o conversación.

La exportación se prepara en segundo plano. Hellotext la descarga cuando está lista y también puede enviar una notificación por email.

## Cuando un número parece incorrecto

Antes de contactar a Soporte:

1. Confirma que ambos sistemas usen la fecha de compra, zona horaria, moneda y reglas de estado de pedido esperadas.
2. Compara referencias individuales de pedidos antes de comparar totales.
3. Separa ingresos totales faltantes de atribución faltante.
4. Confirma que la compra y la actividad de origen pertenezcan al mismo perfil del cliente.
5. Revisa cancelaciones, reembolsos, pedidos de reemplazo y fuentes externas reconocidas.
6. Genera una exportación para revisar el origen acreditado y la explicación.

Para una investigación completa, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
