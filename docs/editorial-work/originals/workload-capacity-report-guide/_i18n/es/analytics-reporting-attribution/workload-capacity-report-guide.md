Usa el Reporte de carga y capacidad para entender cómo se distribuye el trabajo del Inbox, cuánta capacidad se consume y dónde necesita atención la cola actual.

Ábrelo desde la tarjeta **Reporte de carga y capacidad** dentro de **Operaciones & Experiencia** en el Dashboard.

## Cómo cuenta los resultados este reporte

Este reporte combina el trabajo histórico del período seleccionado con una instantánea operativa en vivo. El selector de fechas no controla todas las secciones de la misma manera:

- **Manejadas** usa el momento en que un colaborador manejó por primera vez la conversación mediante una respuesta elegible.
- **Resueltas** usa el momento en que la conversación se resolvió o cerró.
- **Carga activa**, concurrencia, presión de capacidad y eficiencia de sesión usan intervalos de trabajo o sesión que se superponen con el período seleccionado.
- **Presión operativa** muestra la cola actual en el momento indicado por la sección. No está limitada por el período histórico seleccionado.

Por ejemplo: **Conversación iniciada el 7 de abril → Manejada por primera vez el 8 de abril → Resuelta el 10 de abril**. Contribuye a Manejadas el 8 de abril y a Resueltas el 10 de abril. Si una conversación sigue esperando ahora, aparece en Presión operativa ahora, sin importar cuándo comenzó.

Este reporte no espera que madure una ventana de atribución. Los valores históricos todavía pueden cambiar si se corrigen responsables, eventos del ciclo de conversación o registros de sesión.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### Carga activa

Es la cantidad promedio de conversaciones abiertas y activas asignadas durante el período seleccionado.

La carga activa describe trabajo en curso, no todas las conversaciones visibles en el Inbox. Compárala con la presión de capacidad, la salud de respuesta y la cola actual antes de concluir que un equipo está sobrecargado.

### Manejadas

Es la cantidad de conversaciones donde un colaborador o equipo envió al menos una respuesta elegible durante el período seleccionado.

Una conversación puede manejarse en un período y resolverse en otro. Manejadas mide el trabajo tomado, no su finalización.

### Resueltas

Es la cantidad de conversaciones resueltas o cerradas por un colaborador o equipo durante el período seleccionado.

Compara Resueltas con Manejadas a lo largo del tiempo. Una diferencia breve puede ser normal cuando las conversaciones duran varios días; una brecha persistente puede indicar que crece el trabajo sin terminar.

### Concurrencia

Es la cantidad promedio de conversaciones atendidas al mismo tiempo durante el período seleccionado.

Una concurrencia alta puede ser apropiada para conversaciones simples o breves. Revísala junto con tiempos de respuesta, riesgo de SLA y calidad de las conversaciones en lugar de usar un mismo objetivo para todos los equipos.

### Asignadas

Es la cantidad de conversaciones atendidas donde el colaborador seleccionado fue el primer responsable humano durante el período.

Esta métrica está disponible por colaborador porque describe responsabilidad individual y no un agregado del equipo.

### Transferidas a

Es la cantidad de conversaciones atendidas que el colaborador seleccionado heredó de otra persona durante el período.

Las transferencias no son automáticamente un problema. Revisa las transferencias repetidas cuando indiquen enrutamiento poco claro, conocimiento faltante o una responsabilidad que comienza en el lugar equivocado.

## Compara colaboradores y equipos

La mayoría de las métricas puede desglosarse por colaborador o equipo. **Asignadas** y **Transferidas a** usan la responsabilidad individual.

Compara elementos equivalentes. Distintos equipos pueden recibir diferentes intenciones, canales, horarios o niveles de complejidad. Un volumen mayor no significa por sí solo mejor rendimiento y uno menor tampoco significa capacidad sin usar.

## Entiende la Presión de capacidad

**Presión de capacidad** compara el tiempo de atención consumido con la capacidad de atención disponible representada en el período seleccionado. Puedes verla por colaborador o equipo.

Cada barra muestra:

- **Capacidad disponible:** capacidad de atención disponible para el período.
- **Capacidad consumida:** tiempo de atención activa usado durante ese período.
- **Presión:** capacidad consumida como porcentaje de la capacidad disponible.

La capacidad depende de la configuración del Inbox para equipos y colaboradores. Un porcentaje alto invita a revisar la cola y la salud de respuesta, pero no demuestra por sí solo que debas aumentar la capacidad inmediatamente.

Consulta [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %}) antes de cambiar esta configuración.

## Entiende la Eficiencia de sesión

**Eficiencia de sesión** compara el tiempo de atención activa con el tiempo total de sesión registrado durante el período seleccionado. Puedes verla por colaborador o equipo.

El gráfico separa:

- **Tiempo total conectado:** tiempo de sesión registrado durante el período.
- **Tiempo activo:** tiempo dedicado a atender conversaciones activamente.
- **Tiempo inactivo:** tiempo conectado sin atención activa de conversaciones.

Usa esta vista para entender cómo se distribuyó el tiempo registrado en el Inbox. No es una medición completa de productividad: reuniones, pausas, tareas administrativas y responsabilidades fuera del Inbox pueden no aparecer como tiempo de atención activa.

## Interpreta Presión operativa

**Presión operativa** es una vista en vivo de la cola actual. Cambiar el período histórico no mueve esta sección hacia el pasado.

Puedes verla por colaborador o equipo e interpretar estas columnas:

- **Sin respuesta:** conversaciones actuales que todavía esperan una respuesta.
- **Mayor espera:** la espera actual más larga de un cliente.
- **Riesgo SLA:** indica si las obligaciones activas están en estado Seguro, En riesgo o Inminente.
- **Utilización:** tiempo actual de atención activa comparado con el tiempo disponible de sesión registrado.
- **Concurrente:** cantidad actual de conversaciones manejadas simultáneamente.
- **Burn:** señal operativa que combina utilización, concurrencia y presión de SLA. Sus estados son Normal, Observación y En riesgo.

Burn es un indicador de presión de la cola, no un diagnóstico ni una evaluación del rendimiento de una persona. Abre las conversaciones involucradas y considera horarios, enrutamiento y capacidad antes de actuar.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Sube la Carga activa | Nuevas asignaciones, trabajo sin resolver, capacidad del equipo y si las conversaciones se cierran al completarse. |
| Manejadas se mantiene por encima de Resueltas | Si el trabajo normalmente atraviesa varios períodos o se acumulan conversaciones sin terminar. |
| Concurrencia alta con respuestas más lentas | Límites de conversaciones simultáneas, complejidad, reglas de respuesta y disponibilidad del equipo. |
| Transferencias concentradas en un colaborador | Destinos de enrutamiento, integrantes del equipo, conocimiento y responsabilidad inicial. |
| Baja eficiencia de sesión registrada | Si el colaborador estaba disponible para el Inbox y si otras responsabilidades explican la diferencia. |
| Aumentan Sin respuesta o Mayor espera | Las colas actuales sin asignar y asignadas, disponibilidad y salud de respuesta. |
| Empeora el riesgo de SLA o Burn | Conversaciones que generan presión, Horario comercial, reglas de respuesta, enrutamiento, concurrencia y capacidad disponible. |

Usa las métricas históricas para identificar un patrón y Presión operativa para decidir qué necesita atención ahora.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- los equipos y modos de capacidad del Inbox de cada colaborador estén configurados correctamente;
- los colaboradores activos tengan valores realistas de conversaciones simultáneas y capacidad diaria de atención;
- las asignaciones y transferencias identifiquen al responsable correcto;
- los colaboradores envíen respuestas y cierren las conversaciones completadas en el Inbox;
- las sesiones y los intervalos de atención activa estén registrados para el período;
- las reglas de respuesta y el Horario comercial estén configurados al revisar riesgo de SLA; y
- ambas comparaciones usen el mismo período, zona horaria, métrica y desglose.

Si los registros de origen existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
