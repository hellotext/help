Los equipos organizan a las personas que pueden recibir conversaciones para un propósito operativo como Ventas, Soporte o Devoluciones. La capacidad del Inbox ayuda a Hellotext a distribuir el trabajo activo entre las personas elegibles del equipo de destino.

Los roles se mantienen separados: el rol controla qué puede ver y hacer una persona, mientras que la pertenencia a equipos y la capacidad controlan el enrutamiento de conversaciones.

## Crea un equipo

Crea equipos alrededor de responsabilidades operativas reales. Un equipo debería describir quién puede hacerse cargo de un tipo de conversación, no solamente quién responde al mismo manager.

1. Abre **Ajustes** y ve a **Tu Equipo**.
2. Abre la pestaña **Equipo**.
3. Selecciona **Nuevo equipo**.
4. Ingresa un nombre claro como Ventas, Soporte o Devoluciones.
5. Agrega a las personas que pueden gestionar conversaciones para ese equipo.
6. Define el **Máximo de conversaciones simultáneas**.
7. Define las **Horas activas de atención por miembro al día**.
8. Guarda el equipo.

Una persona puede pertenecer a más de un equipo. Hellotext usa el equipo seleccionado por el playbook, la ruta o la regla de enrutamiento como contexto para esa asignación.

## Entiende las dos configuraciones de capacidad

### Máximo de conversaciones simultáneas

Es la cantidad máxima de conversaciones activas que cada persona elegible puede gestionar al mismo tiempo mediante el enrutamiento automático del equipo.

La capacidad se calcula con las conversaciones asignadas que todavía necesitan atención de esa persona. No cuenta todas las conversaciones históricas ni todas las que aparecen en el Inbox.

### Horas activas de atención por miembro al día

Es el tiempo que se espera que cada persona dedique activamente a gestionar conversaciones del Inbox, sin contar descansos ni reuniones.

Hellotext usa este valor para el seguimiento de carga de trabajo y capacidad. No es un corte diario fijo que bloquee automáticamente todas las asignaciones nuevas después de esa cantidad de horas.

Empieza con valores realistas y ajústalos después de observar el trabajo sin asignar, la salud de respuesta y la carga real del equipo.

## Elige cómo cada persona gestiona el Inbox

Al invitar a alguien o editar un miembro existente, elige uno de estos modos de capacidad:

- **No gestiona mensajes del Inbox:** impide que la persona reciba o responda conversaciones del Inbox y la excluye del enrutamiento a equipos.
- **Igual que el equipo:** usa los límites de capacidad del equipo elegido como destino de la conversación.
- **Diferente del equipo:** usa valores personalizados de conversaciones simultáneas y horas de atención para esa persona.

Usa una capacidad personalizada cuando el horario o las responsabilidades de alguien sean consistentemente diferentes al resto del equipo. Excluye a quienes necesitan acceder a Hellotext para gestionar o consultar reportes, pero no deberían recibir trabajo del Inbox.

Estas configuraciones se aplican a la atención en el Inbox y al seguimiento de carga. No cambian el rol de la persona.

## Entiende la asignación automática a un equipo

La Derivación de un playbook, un step de Asignación de una ruta u otra regla de enrutamiento puede elegir un equipo como destino de una conversación.

Cuando una conversación tiene un equipo como destino, Hellotext:

1. Busca personas de ese equipo que puedan gestionar mensajes del Inbox.
2. Considera disponibilidad, capacidad de conversaciones y carga activa actual.
3. Asigna la conversación a una persona elegible.

Si todas las personas elegibles están a capacidad, la conversación puede permanecer **Sin asignar** mientras conserva el equipo como destino. Cuando vuelve a haber capacidad, Hellotext puede asignar las conversaciones pendientes a una persona elegible.

Las conversaciones pendientes conservan su orden para ese equipo. Una conversación sin asignar que tiene un equipo de destino no debería tratarse como trabajo disponible sin restricciones para cualquier persona.

Si un equipo no tiene personas elegibles, el enrutamiento automático no puede completarse. Antes de habilitar un playbook o una ruta, confirma que el equipo de destino tenga al menos una persona que gestione el Inbox y prueba la Derivación.

Sigue leyendo: [Asigna conversaciones]({% link _team/assigning-conversations.md %}).

## Elige quién gestiona las conversaciones reabiertas

La pestaña **Opciones** dentro de **Tu Equipo** controla qué ocurre cuando una conversación se reabre. Esta configuración se aplica a todas las conversaciones del negocio.

- **Respuesta más rápida:** asigna la conversación a la mejor persona disponible en ese momento.
- **Mantener mismo agente:** favorece la continuidad con la persona asignada anteriormente.
- **Primero IA:** permite que la IA responda primero y derive la conversación cuando sea necesario.
- **Cola sin asignar:** deja la conversación abierta para que alguien la tome manualmente.

Este protocolo general de asignación es diferente al destino de un equipo. El protocolo decide cómo entran las conversaciones reabiertas al flujo de trabajo; un playbook, ruta o regla de enrutamiento decide qué equipo debería recibir una Derivación específica.

Sigue leyendo: [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %}).

## Supervisa y ajusta la capacidad

Revisa la capacidad cuando observes:

- Conversaciones que esperan sin asignar a un equipo de destino.
- Un equipo que recibe mucho más trabajo activo que otro.
- Tiempos de respuesta que empeoran aunque haya personas disponibles.
- Personas cuyos horarios o responsabilidades ya no coinciden con los valores del equipo.

Cambia la capacidad gradualmente y revisa el efecto en el Inbox. Un límite más alto puede reducir la cola pendiente, pero también puede darle a cada persona más trabajo simultáneo del que puede responder bien.

Usa los reportes de tiempo de respuesta para evaluar el resultado en lugar de interpretar la capacidad como una promesa de nivel de servicio.

Sigue leyendo: [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %}).

## Cambia o elimina un equipo de forma segura

Antes de quitar a una persona de un equipo o eliminar el equipo:

1. Revisa los playbooks, rutas y reglas de enrutamiento que lo usan como destino.
2. Elige un equipo de reemplazo cuando sea necesario.
3. Revisa las conversaciones pendientes y asignadas en el Inbox.
4. Confirma que el equipo de reemplazo tenga personas elegibles y capacidad suficiente.

Eliminar un equipo quita ese destino de las conversaciones que lo estaban esperando. Revisa la cola **Sin asignar** después del cambio para que ninguna conversación quede sin un responsable claro.

## Guías relacionadas

- [Roles y permisos de equipo]({% link _team/understanding-team-roles.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
