Usa el Reporte de calidad de servicio para entender cómo se resuelven las conversaciones, si se cumplen los tiempos de respuesta y dónde necesitan atención los agentes de IA, colaboradores, equipos o canales.

Ábrelo desde la tarjeta **Reporte de calidad de servicio** dentro de **Operaciones & Experiencia** en el Dashboard.

## Cómo cuenta los resultados este reporte

Las tasas de resolución por IA, de resolución por equipo y de no resueltas agrupan las interacciones de servicio por la fecha en que comenzó cada interacción. Una conversación reabierta puede tener una interacción posterior con otra fecha. El cumplimiento de SLA usa el inicio de cada obligación de respuesta; la satisfacción del cliente usa la fecha en que se respondió la encuesta. En la tabla de rendimiento, cada columna usa las fechas de atención, respuesta o resolución que correspondan.

Por ejemplo: **Interacción de servicio iniciada el 7 de abril → Resuelta el 10 de abril → Cuenta el 7 de abril en las tasas de resolución.**

Los valores recientes pueden cambiar cuando se resuelve una interacción, se responde o vence una obligación de SLA, o llega una respuesta a una encuesta. Compara períodos anteriores cuando necesites resultados más estables. Para revisar la cola actual, usa el Inbox o [Carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %}).

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### Tasa de resolución por IA

Es el porcentaje de interacciones de servicio elegibles resueltas completamente por IA sin Derivación a un colaborador. La base de cálculo también incluye las interacciones que siguen abiertas, derivadas o resueltas por personas.

Una tasa mayor significa que la IA completó por sí sola más conversaciones elegibles. No significa que la IA haya participado en todas las demás resoluciones y no debería optimizarse sin revisar si los clientes recibieron resultados correctos y útiles.

### Resueltas por equipo

Es el porcentaje de interacciones de servicio elegibles resueltas por colaboradores, no la cantidad de conversaciones.

Una conversación puede incluir actividad de IA antes de que el equipo la tome. Cuando un colaborador completa la resolución final, pertenece al resultado resuelto por el equipo.

### Cumplimiento de SLA

Es el porcentaje de obligaciones de primera respuesta o de respuesta a una Derivación humana que cumplieron el tiempo configurado, entre las que terminaron cumplidas o incumplidas. Un plazo vencido sin respuesta cuenta como incumplido; los temporizadores activos o cancelados quedan fuera de esta tasa.

Hellotext aplica la política de respuesta y el Horario comercial vigentes cuando comenzó cada temporizador. Las notas internas, borradores, Campañas y actividad exclusiva del sistema no cuentan como respuestas para el cliente.

Consulta [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %}) para entender las reglas de respuesta. Esta tarjeta del reporte usa las obligaciones de primera respuesta y de Derivación humana.

### Tasa de no resueltas

Es el porcentaje de interacciones de servicio elegibles que siguen abiertas o derivadas a una persona dentro de la población seleccionada.

Esta métrica puede disminuir a medida que se cierran conversaciones recientes. Úsala para encontrar un patrón por canal, equipo, colaborador, gestión por IA o humana, o ruta de resolución en lugar de interpretar cada conversación abierta como una falla de servicio.

## Usa los desgloses

Los desgloses disponibles dependen de la métrica seleccionada:

- **Tasa de resolución por IA:** canal, agente de IA o ruta de resolución.
- **Resueltas por equipo:** equipo, colaborador, canal o ruta de resolución.
- **Cumplimiento de SLA:** equipo, colaborador, canal, agente de IA o gestión por IA frente a humana.
- **Tasa de no resueltas:** canal, equipo, colaborador, gestión por IA frente a humana o ruta de resolución.

Usa una dimensión por vez cuando investigues un cambio. Una diferencia por canal puede venir de la intención del cliente o del horario operativo; una diferencia por equipo puede venir del enrutamiento, la capacidad o los tipos de conversaciones que recibe.

En **Resueltas por equipo**, las barras por equipo muestran su aporte al total seleccionado en puntos porcentuales; no son tasas calculadas sobre el volumen propio de cada equipo.

## Entiende la Ruta de resolución

**Ruta de resolución** compara sólo las interacciones ya resueltas cuya resolución final fue completada por IA con las completadas por el equipo. Las interacciones activas no entran en las proporciones del gráfico.

Este gráfico describe quién completó la resolución final, no todos los participantes. Una conversación que empezó con IA y luego fue resuelta por un colaborador aparece como **Resuelta por equipo**. Una resolución de IA debe completarse sin Derivación para aparecer como **Resuelta por IA**.

Usa el desglose de la línea de tiempo cuando necesites más detalle, como solo IA, humano desde el inicio, escalada a humano, activa con IA o activa con humano.

## Entiende la Satisfacción del cliente

**Satisfacción del cliente** muestra la proporción de respuestas positivas entre las respuestas positivas y negativas de las encuestas recibidas en el período. Se agrupa por la fecha de respuesta y compara la tendencia con un período anterior de la misma duración.

Puedes comparar las respuestas de conversaciones resueltas sólo por IA con las de conversaciones gestionadas por personas desde el inicio o derivadas a una persona. Si no hay respuestas para una categoría, un guion o una vista preliminar no representa una puntuación observada.

## Entiende la Distribución del tiempo de respuesta

**Distribución del tiempo de respuesta** muestra cómo se distribuyen los ciclos de respuesta atendidos entre estos rangos:

- menos de 1 minuto;
- 1–3 minutos;
- 3–5 minutos;
- 5–10 minutos; y
- 10 minutos o más.

Usa el selector para comparar todas las obligaciones de primera respuesta atendidas, o limitar esa muestra a respuestas de IA o de personas. La opción de derivadas muestra las respuestas atendidas tras una Derivación humana.

El porcentaje de cada barra es la proporción de respuestas atendidas de la opción seleccionada que cayó dentro de ese rango. **No es el cumplimiento de SLA**: esa tasa también considera obligaciones que vencieron sin respuesta y compara cada obligación con su propio plazo.

## Compara el rendimiento de agentes

La tabla **Rendimiento de agentes** puede mostrar todos los agentes individuales, equipos, agentes de IA o colaboradores.

La vista **Todos** compara colaboradores individuales con agentes de IA. Los equipos no aparecen allí porque agrupan el mismo trabajo humano y lo duplicarían.

Las columnas no usan todas la misma fecha: **Conversaciones** refleja la atención durante el período, **Resueltas** usa la fecha de resolución y los tiempos de respuesta usan los ciclos iniciados en el período. Tampoco comparten siempre los mismos criterios por rol. No sumes las filas para reconstruir la base de cálculo de las tasas principales.

La tabla puede incluir:

- **Conversaciones:** conversaciones distintas atendidas por ese agente o equipo durante el período.
- **Resueltas:** conversaciones completadas por esa fila durante el período.
- **Primera respuesta:** tiempo promedio de los ciclos de respuesta elegibles; en equipos también puede incluir respuestas a Derivaciones humanas.
- **Atención promedio:** tiempo activo de atención humana dividido entre conversaciones atendidas. Los agentes de IA no muestran un valor porque no existe un intervalo de trabajo activo comparable.
- **Tiempo de resolución:** para personas y equipos, tiempo desde el inicio de su responsabilidad hasta la resolución. Para IA, espera desde el último mensaje del cliente hasta la respuesta de la Misión que resolvió la conversación.
- **FCR (resolución en el primer contacto):** porcentaje de conversaciones resueltas sin Derivación, reasignación ni reapertura posterior.
- **SLA:** porcentaje de obligaciones de respuesta elegibles cumplidas entre las que tuvieron un resultado final.

Compara roles similares antes de sacar conclusiones. La IA y los colaboradores pueden recibir intenciones diferentes y tener distintas mediciones de tiempo. Un valor vacío puede indicar que esa medida no está disponible; un 0 % también puede aparecer si no hubo casos elegibles. Revisa el volumen antes de interpretarlo.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Baja la Tasa de resolución por IA | Agente de IA, canal, ruta de resolución, conocimiento faltante, solicitudes no compatibles y reglas de Derivación. |
| Sube la tasa de Resueltas por equipo | Si más conversaciones se están enviando intencionalmente a personas o si la IA deriva casos que debería resolver. |
| Baja el cumplimiento de SLA | Políticas de respuesta, Horario comercial, diferencias por canal, capacidad del equipo y conversaciones sin asignar. |
| Sube la tasa de no resueltas | Conversaciones recientes abiertas, enrutamiento, responsable, capacidad y tipos de problema repetidos. |
| Muchas esperas llegan a 10 minutos o más | Si la demora se concentra en actividad humana, derivada, de un canal, equipo o colaborador. |
| FCR bajo en una fila | Derivaciones, reasignaciones, conversaciones reabiertas y si la responsabilidad llega al destino correcto. |

Abre conversaciones representativas antes de cambiar una Misión, regla de enrutamiento, política de respuesta o capacidad del equipo. El reporte identifica un patrón; el historial de la conversación explica qué ocurrió.

Por ejemplo, si baja el **Cumplimiento de SLA**, selecciona esa métrica, compara un canal o equipo y usa la **Distribución del tiempo de respuesta** para ver dónde se acumulan las esperas atendidas. Después revisa conversaciones representativas, incluidas obligaciones vencidas sin respuesta: las barras de esperas no muestran por sí solas la tasa de SLA.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- las conversaciones tengan registrados su inicio, responsable y resultado del ciclo;
- las resoluciones y Derivaciones de IA hayan sido registradas por la Misión o la ruta;
- los colaboradores cierren las conversaciones completadas en lugar de dejarlas abiertas;
- las reglas de respuesta y el Horario comercial estén configurados para los canales comparados;
- las encuestas tengan respuestas positivas o negativas con sus fechas registradas si investigas la satisfacción del cliente;
- las asignaciones a equipos y colaboradores identifiquen quién gestionó la conversación; y
- ambas comparaciones usen el mismo período, zona horaria, métrica y desglose.

Si los registros de origen existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
