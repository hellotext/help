Usa el Reporte de carga y capacidad para entender cómo se distribuye el trabajo del Inbox, cuánta capacidad se consume y dónde necesita atención la cola actual.

Ábrelo desde la tarjeta **Reporte de carga y capacidad** dentro de **Operaciones & Experiencia** en el Dashboard.

## Cómo cuenta los resultados este reporte

Este reporte combina el trabajo histórico del período seleccionado con una instantánea operativa en vivo. El selector de fechas no controla todas las secciones de la misma manera:

- **Manejadas** cuenta conversaciones distintas con atención humana que se superpone con el período seleccionado.
- **Resueltas** usa el momento en que terminó una interacción resuelta por una persona.
- **Carga activa**, concurrencia, presión de capacidad y eficiencia de sesión usan intervalos de atención o sesión que se superponen con el período.
- En **Presión operativa**, Sin respuesta, Mayor espera y Riesgo SLA muestran la cola actual; Utilización y Concurrente usan el período seleccionado, y Burn combina ambas fuentes.

Por ejemplo, una conversación atendida el 8 y el 9 de abril y resuelta por una persona el 10 aparece en **Manejadas** de ambos días, pero una sola vez en el total del 8 al 10; aparece en **Resueltas** el 10. Si otra conversación tiene ahora un ciclo de respuesta SLA sin resolver, esa espera permanece actual al cambiar las fechas, mientras Utilización, Concurrente y Burn pueden variar.

Este reporte no espera que madure una ventana de atribución. Los valores históricos todavía pueden cambiar si se corrigen responsables, eventos del ciclo de conversación o registros de sesión.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### Carga activa

Es el porcentaje de capacidad de atención disponible que consumió el tiempo de atención registrado durante el período seleccionado. La capacidad disponible suma, para cada sesión, su duración multiplicada por el límite de conversaciones simultáneas guardado en ella.

No cuenta cuántas conversaciones están asignadas o visibles ahora. Compárala con la presión de capacidad, la salud de respuesta y la cola actual antes de concluir que un equipo está sobrecargado.

### Manejadas

Es la cantidad de conversaciones distintas con un intervalo de atención humana que se superpone con el período seleccionado. Una respuesta, nota interna o cierre humano puede iniciar ese intervalo cuando hay una sesión activa.

Una conversación puede contarse en varios días y en filas de más de un colaborador o equipo si recibió atención de ellos. El total del período la cuenta una sola vez.

### Resueltas

Es la cantidad de conversaciones distintas cuya interacción terminó resuelta por una persona durante el período seleccionado. Una resolución exclusiva de IA no entra en esta métrica.

Manejadas y Resueltas usan hechos y fechas diferentes. No restes una cifra de la otra para estimar la cola pendiente; revisa las conversaciones y esperas actuales por separado.

### Concurrencia

Es el promedio de conversaciones atendidas al mismo tiempo durante la atención activa del período seleccionado, no durante todo el tiempo conectado.

Una concurrencia alta puede ser apropiada para conversaciones simples o breves. Revísala junto con tiempos de respuesta, riesgo de SLA y calidad de las conversaciones en lugar de usar un mismo objetivo para todos los equipos.

### Asignadas

Es la cantidad de conversaciones distintas atendidas en el período bajo un tramo de responsabilidad del colaborador que no comenzó con una transferencia desde otra persona.

Ese tramo pudo comenzar antes del período y no demuestra que la persona haya sido la primera responsable de toda la conversación. La métrica está disponible por colaborador porque describe responsabilidad individual.

### Transferidas a

Es la cantidad de conversaciones distintas atendidas en el período bajo un tramo de responsabilidad que el colaborador heredó de otra persona. La transferencia pudo haber ocurrido antes del período.

Las transferencias no son automáticamente un problema. Revisa las transferencias repetidas cuando indiquen enrutamiento poco claro, conocimiento faltante o una responsabilidad que comienza en el lugar equivocado.

## Compara colaboradores y equipos

La mayoría de las métricas puede desglosarse por colaborador o equipo. **Asignadas** y **Transferidas a** usan la responsabilidad individual.

Compara elementos equivalentes. Distintos equipos pueden recibir diferentes intenciones, canales, horarios o niveles de complejidad. Un volumen mayor no significa por sí solo mejor rendimiento y uno menor tampoco significa capacidad sin usar.

## Entiende la Presión de capacidad

**Presión de capacidad** compara el tiempo de atención consumido con la capacidad de atención disponible representada en el período seleccionado. Puedes verla por colaborador o equipo.

Cada barra muestra:

- **Capacidad disponible:** para cada colaborador, tiempo de sesión multiplicado por el límite de conversaciones simultáneas registrado en ella.
- **Capacidad consumida:** suma del tiempo de atención de las conversaciones durante el período; dos conversaciones simultáneas aportan tiempo cada una.
- **Presión:** capacidad consumida como porcentaje de la capacidad disponible.

La capacidad mostrada depende de las sesiones registradas y sus límites de conversaciones simultáneas. Un porcentaje alto invita a revisar la cola y la salud de respuesta, pero no demuestra por sí solo que debas aumentar la capacidad inmediatamente.

En las barras por equipo, el reporte reparte la capacidad de una sesión entre los equipos a los que se atribuyó atención durante el período. Por eso, la capacidad de un equipo no equivale necesariamente a sumar todas las sesiones completas de sus integrantes.

Consulta [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %}) antes de cambiar esta configuración.

## Entiende la Eficiencia de sesión

**Eficiencia de sesión** compara el tiempo de atención activa con el tiempo total de sesión registrado durante el período seleccionado. Puedes verla por colaborador o equipo.

El gráfico separa:

- **Tiempo total conectado:** tiempo de sesión registrado durante el período.
- **Tiempo activo:** tiempo de reloj dedicado a atender conversaciones; los intervalos simultáneos se cuentan una vez.
- **Tiempo inactivo:** tiempo conectado sin atención activa de conversaciones.

Usa esta vista para entender cómo se distribuyó el tiempo registrado en el Inbox. No es una medición completa de productividad: reuniones, pausas, tareas administrativas y responsabilidades fuera del Inbox pueden no aparecer como tiempo de atención activa.

Ejemplo ilustrativo: una persona está conectada 60 minutos con un límite de dos conversaciones simultáneas. Dispone de 120 minutos de capacidad de atención. Si atiende dos conversaciones a la vez durante 30 minutos, consume 60 minutos de esa capacidad: **Carga activa** y **Presión de capacidad** son 50 % para esa persona. Su concurrencia durante el trabajo activo es 2, mientras **Eficiencia de sesión** muestra 30 minutos activos y 30 inactivos.

## Interpreta Presión operativa

**Presión operativa** combina obligaciones de respuesta actuales con estadísticas de atención del período seleccionado. Cambiar las fechas puede modificar Utilización, Concurrente y Burn, pero no convierte Sin respuesta, Mayor espera ni Riesgo SLA en datos históricos.

Puedes verla por colaborador o equipo e interpretar estas columnas:

- **Sin respuesta:** conversaciones actuales con un ciclo de respuesta SLA activo o vencido que aún no se respondió.
- **Mayor espera:** el tiempo transcurrido del ciclo de respuesta sin resolver más antiguo de ese conjunto.
- **Riesgo SLA:** indica si las obligaciones activas están en estado Seguro, En riesgo o Inminente.
- **Utilización:** proporción del tiempo de sesión registrado en el período que se dedicó a atención activa.
- **Concurrente:** promedio de conversaciones simultáneas durante la atención activa del período seleccionado.
- **Burn:** señal que combina Utilización y Concurrente del período con la presión SLA actual. Sus estados son Normal, Observación y En riesgo.

Burn es una señal combinada, no un diagnóstico ni una evaluación del rendimiento de una persona. Revisa las conversaciones actuales con espera y considera horarios, enrutamiento y capacidad antes de actuar.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Sube la Carga activa | Tiempo de atención, sesiones y límites de simultaneidad registrados; luego compáralos con la espera y la salud de respuesta actuales. |
| Manejadas se mantiene por encima de Resueltas | Fechas e intervalos de atención y resolución. La resta no mide la cola pendiente; revísala directamente. |
| Concurrencia alta con respuestas más lentas | Límites de conversaciones simultáneas, complejidad, reglas de respuesta y disponibilidad del equipo. |
| Transferencias concentradas en un colaborador | Destinos de enrutamiento, integrantes del equipo, conocimiento y responsabilidad inicial. |
| Baja eficiencia de sesión registrada | Si el colaborador estaba disponible para el Inbox y si otras responsabilidades explican la diferencia. |
| Aumentan Sin respuesta o Mayor espera | Las colas actuales sin asignar y asignadas, disponibilidad y salud de respuesta. |
| Empeora el riesgo de SLA o Burn | Si cambió la cola actual o el período seleccionado; revisa Horario comercial, reglas de respuesta, enrutamiento, concurrencia y capacidad disponible. |

Distingue las columnas del período de las señales de la cola actual antes de decidir qué necesita atención.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- los equipos y modos de capacidad del Inbox de cada colaborador estén configurados correctamente;
- las sesiones tengan límites realistas de conversaciones simultáneas registrados;
- las asignaciones y transferencias identifiquen al responsable correcto;
- las respuestas, notas internas y cierres humanos que inician atención estén registrados en el Inbox;
- las sesiones y los intervalos de atención activa estén registrados para el período;
- las reglas de respuesta y el Horario comercial estén configurados al revisar riesgo de SLA; y
- ambas comparaciones usen el mismo período, zona horaria, métrica y desglose, separando las señales actuales de Presión operativa.

Si los registros de origen existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
