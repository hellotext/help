Usa el Reporte de calidad de servicio para entender cómo se resuelven las conversaciones, si se cumplen los tiempos de respuesta y dónde necesitan atención los agentes de IA, colaboradores, equipos o canales.

Ábrelo desde la tarjeta **Reporte de calidad de servicio** dentro de **Operaciones & Experiencia** en el Dashboard.

## Cómo cuenta los resultados este reporte

El período seleccionado se basa en cuándo comenzó una conversación. La resolución, derivación, SLA y otros resultados elegibles que ocurren después permanecen asignados a la conversación de origen.

Por ejemplo: **Conversación iniciada el 7 de abril → Resuelta el 10 de abril → Cuenta el 7 de abril.**

Las fechas recientes pueden cambiar mientras las conversaciones sigan abiertas o su ventana de análisis de servicio no haya cerrado. Compara períodos anteriores cuando necesites resultados estables y usa el Inbox o Carga y capacidad cuando necesites revisar la cola actual en lugar del resultado de conversaciones iniciadas durante un período.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### Tasa de resolución por IA

Es el porcentaje de conversaciones resueltas completamente por IA sin Derivación a un colaborador.

Una tasa mayor significa que la IA completó por sí sola más conversaciones elegibles. No significa que la IA haya participado en todas las demás resoluciones y no debería optimizarse sin revisar si los clientes recibieron resultados correctos y útiles.

### Resueltas por equipo

Es la cantidad de conversaciones resueltas o cerradas por colaboradores dentro de la población seleccionada.

Una conversación puede incluir actividad de IA antes de que el equipo la tome. Cuando un colaborador completa la resolución final, pertenece al resultado resuelto por el equipo.

### Cumplimiento de SLA

Es el porcentaje de obligaciones de respuesta elegibles que cumplieron el tiempo configurado.

Hellotext aplica la política de respuesta y el Horario comercial vigentes cuando comenzó cada temporizador. Las notas internas, borradores, Campañas y actividad exclusiva del sistema no cuentan como respuestas para el cliente.

Consulta [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %}) para entender los temporizadores de primera respuesta y respuestas posteriores.

### Tasa de no resueltas

Es el porcentaje de conversaciones que permanecen sin resolver o pendientes dentro de la población seleccionada.

Esta métrica puede disminuir a medida que se cierran conversaciones recientes. Úsala para encontrar un patrón por canal, equipo, colaborador, gestión por IA o humana, o ruta de resolución en lugar de interpretar cada conversación abierta como una falla de servicio.

## Usa los desgloses

Los desgloses disponibles dependen de la métrica seleccionada:

- **Tasa de resolución por IA:** canal, agente de IA o ruta de resolución.
- **Resueltas por equipo:** equipo, colaborador, canal o ruta de resolución.
- **Cumplimiento de SLA:** equipo, colaborador, canal, agente de IA o gestión por IA frente a humana.
- **Tasa de no resueltas:** canal, equipo, colaborador, gestión por IA frente a humana o ruta de resolución.

Usa una dimensión por vez cuando investigues un cambio. Una diferencia por canal puede venir de la intención del cliente o del horario operativo; una diferencia por equipo puede venir del enrutamiento, la capacidad o los tipos de conversaciones que recibe.

## Entiende la Ruta de resolución

**Ruta de resolución** compara las conversaciones cuya resolución final fue completada por IA con las completadas por el equipo.

Este gráfico describe quién completó la resolución final, no todos los participantes. Una conversación que empezó con IA y luego fue resuelta por un colaborador aparece como **Resuelta por equipo**. Una resolución de IA debe completarse sin Derivación para aparecer como **Resuelta por IA**.

Usa el desglose de la línea de tiempo cuando necesites más detalle, como solo IA, humano desde el inicio, escalada a humano, activa con IA o activa con humano.

## Entiende la Distribución del tiempo de respuesta

**Distribución del tiempo de respuesta** muestra cómo se distribuyen las esperas respondidas entre estos rangos:

- menos de 1 minuto;
- 1–3 minutos;
- 3–5 minutos;
- 5–10 minutos; y
- más de 10 minutos.

Usa el selector para comparar todas las conversaciones, las gestionadas por IA, las gestionadas por personas o las derivadas al equipo.

El porcentaje de cada barra es la proporción de esperas respondidas que cayó dentro de ese rango. **No es el cumplimiento de SLA**. El cumplimiento de SLA compara cada respuesta elegible con su tiempo configurado, que puede variar según el canal y el Horario comercial.

## Compara el rendimiento de agentes

La tabla **Rendimiento de agentes** puede mostrar todos los agentes individuales, equipos, agentes de IA o colaboradores.

La vista **Todos** compara colaboradores individuales con agentes de IA. Los equipos no aparecen allí porque agrupan el mismo trabajo humano y lo duplicarían.

La tabla puede incluir:

- **Conversaciones:** volumen de conversaciones vinculado con ese agente o equipo.
- **Resueltas:** conversaciones completadas por esa fila.
- **Primera respuesta:** tiempo promedio hasta la primera respuesta elegible.
- **Atención promedio:** tiempo activo de atención humana dividido entre conversaciones atendidas. Los agentes de IA no muestran un valor porque no existe un intervalo de trabajo activo comparable.
- **Tiempo de resolución:** tiempo desde el inicio de la responsabilidad hasta la resolución, o hasta la Derivación cuando la IA entregó la conversación.
- **FCR:** conversaciones resueltas sin Derivación, reasignación ni reapertura.
- **SLA:** obligaciones de respuesta elegibles completadas dentro del tiempo configurado.

Compara roles similares antes de sacar conclusiones. La IA y los colaboradores pueden recibir intenciones diferentes y tener distintas mediciones de tiempo, por lo que un valor vacío no equivale a rendimiento cero.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Baja la Tasa de resolución por IA | Agente de IA, canal, ruta de resolución, conocimiento faltante, solicitudes no compatibles y reglas de Derivación. |
| Suben las resoluciones por equipo | Si más conversaciones se están enviando intencionalmente a personas o si la IA deriva casos que debería resolver. |
| Baja el cumplimiento de SLA | Políticas de respuesta, Horario comercial, diferencias por canal, capacidad del equipo y conversaciones sin asignar. |
| Sube la tasa de no resueltas | Conversaciones recientes abiertas, enrutamiento, responsable, capacidad y tipos de problema repetidos. |
| Muchas esperas superan los 10 minutos | Si la demora se concentra en actividad humana, derivada, de un canal, equipo o colaborador. |
| FCR bajo en una fila | Derivaciones, reasignaciones, conversaciones reabiertas y si la responsabilidad llega al destino correcto. |

Abre conversaciones representativas antes de cambiar un Playbook, regla de enrutamiento, política de respuesta o capacidad del equipo. El reporte identifica un patrón; el historial de la conversación explica qué ocurrió.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- las conversaciones tengan registrados su inicio, responsable y resultado del ciclo;
- las resoluciones y Derivaciones de IA hayan sido registradas por el Playbook o la ruta;
- los colaboradores cierren las conversaciones completadas en lugar de dejarlas abiertas;
- las reglas de respuesta y el Horario comercial estén configurados para los canales comparados;
- las asignaciones a equipos y colaboradores identifiquen quién gestionó la conversación; y
- ambas comparaciones usen el mismo período, zona horaria, métrica y desglose.

Si los registros de origen existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
