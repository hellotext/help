Usa el ciclo de una conversación para entender si un cliente necesita acción ahora, quién es responsable de la próxima respuesta y si la conversación está esperando, pospuesta o completa.

El estado describe dónde se encuentra la conversación dentro del flujo de trabajo. Señales como **Necesita atención** o **Mencionados** ayudan a priorizar, pero no reemplazan el estado principal.

## Cómo llega una conversación al Inbox

Una conversación puede aparecer cuando:

- Un cliente escribe por WhatsApp, SMS, Webchat, Instagram, Messenger u otro canal entrante conectado.
- Un cliente responde a un mensaje de una campaña, playbook o ruta.
- Un playbook o agente de IA deriva la conversación a una persona o equipo.
- Un step de Asignación (Assignment) de una ruta abre o asigna la conversación.
- Una nueva actividad del cliente, pedido o negocio crea trabajo que necesita atención.
- Una conversación cerrada o pospuesta recibe actividad que la vuelve a abrir.

El timeline reúne mensajes del cliente, respuestas del equipo, actividad de automatización, asignaciones, notas, etiquetas, cierres y reaperturas para que la próxima persona pueda entender qué pasó.

## Entiende los estados principales

### Abiertas

**Abiertas** reúne las conversaciones que actualmente están asignadas o sin asignar. Es una vista general del trabajo activo, no un estado separado de asignación.

Usa Abiertas cuando quieres ver las conversaciones activas que el equipo podría necesitar gestionar.

### Sin asignar

Una conversación sin asignar está abierta, pero todavía no tiene una persona específica responsable de la próxima acción.

Puede estar disponible para que alguien la tome o esperando a una persona elegible del equipo seleccionado por una regla de enrutamiento o derivación. Cuando el equipo de destino está a capacidad, Hellotext puede mantener la conversación sin asignar y conservar ese equipo como destino previsto.

No asumas que todas las conversaciones sin asignar están disponibles para cualquier persona. Revisa si llegó mediante una derivación a equipo antes de tomarla.

### Asignadas

Una conversación asignada tiene un responsable claro para la próxima acción. Una persona puede asignársela o reasignarla cuando alguien más debería continuar.

Responder una conversación sin asignar normalmente la asigna a la persona que envía la respuesta, siempre que esa conversación esté disponible para que la tome.

Sigue leyendo: [Asigna conversaciones]({% link _team/assigning-conversations.md %}).

### Recordatorios

Usa **Posponer** cuando la conversación no necesita acción ahora, pero debería volver más adelante. Hellotext ofrece tiempos comunes como una hora, cuatro horas, mañana o una fecha y hora personalizada.

Las conversaciones pospuestas aparecen en **Recordatorios** en lugar de la lista activa de Abiertas. Cuando llega el momento del recordatorio, la conversación vuelve a su responsable anterior si esa asignación sigue siendo válida; de lo contrario, vuelve sin asignar. Una nueva actividad del cliente también puede hacerla volver antes.

Pospone el trabajo que realmente está esperando. Cierra el trabajo que ya terminó.

### Cerradas

Cierra una conversación cuando ya no requiere ninguna acción del equipo. El cierre la quita del trabajo activo y limpia la atención vigente, pero no elimina la conversación ni su timeline.

Las conversaciones cerradas siguen disponibles mediante el filtro **Cerradas**. Una persona puede reabrirlas manualmente. Una respuesta del cliente o una nueva actividad también puede reabrirlas y aplicar las reglas actuales de asignación del negocio.

Cuando alguien reabre una conversación manualmente, Hellotext conserva al responsable anterior si esa persona todavía está disponible en el negocio. De lo contrario, la conversación vuelve sin asignar.

## Señales de atención y menciones

### Necesita atención

**Necesita atención** es una señal de prioridad, no un estado del ciclo. Puede aplicarse a una conversación asignada o sin asignar cuando el cliente o workflow espera una acción.

Usa este filtro para encontrar trabajo que debería revisarse antes que otras conversaciones abiertas de menor prioridad. Cerrar la conversación limpia la atención activa porque el trabajo deja de considerarse accionable.

Los indicadores de salud de respuesta pueden agregar contexto sobre cuánto tiempo lleva esperando el cliente. Sigue leyendo: [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %}).

### Mencionados

El filtro **Mencionados** ayuda a encontrar conversaciones donde una persona fue mencionada en una nota interna u otro evento de colaboración compatible.

Una mención llama la atención sobre la conversación, pero no cambia al responsable por sí sola. Confirma quién debería enviar la próxima respuesta visible para el cliente.

## Usa notas y etiquetas sin cambiar el responsable

Agrega una nota interna cuando el equipo necesita contexto que no debería enviarse al cliente. Las notas pueden documentar una decisión, resumir una acción realizada fuera de Hellotext o mencionar a otra persona.

Las notas no cuentan como respuestas para el cliente ni cumplen un tiempo de respuesta. Asigna también la conversación cuando la persona mencionada debería hacerse responsable.

Usa etiquetas para organizar conversaciones mediante una categoría operativa duradera, como un problema de producto, oportunidad de venta, revisión de reembolso o tipo de seguimiento. Las etiquetas permiten filtrar conversaciones relacionadas sin cambiar su estado ni responsable.

## Filtra el Inbox de forma deliberada

El Inbox ofrece filtros de estado para:

- **Abiertas**
- **Necesita atención**
- **Asignadas**
- **Sin asignar**
- **Cerradas**
- **Recordatorios**
- **Mencionados**

Puedes limitar las vistas compatibles por persona y etiqueta. El significado de cada filtro se mantiene separado de la asignación: por ejemplo, una conversación puede estar asignada y al mismo tiempo necesitar atención.

Usa este orden diario simple:

1. Revisa Necesita atención.
2. Toma o deriva el trabajo sin asignar.
3. Continúa las conversaciones asignadas a ti.
4. Revisa menciones que necesiten contexto o una decisión.
5. Cierra conversaciones completadas.
6. Usa recordatorios solamente para trabajo que debería volver en un momento específico.

## Cómo afecta la automatización al ciclo

Los playbooks, agentes de IA y rutas pueden abrir, asignar, cerrar o devolver conversaciones al Inbox.

Cuando una automatización deriva a un equipo:

- El equipo de destino puede aportar inmediatamente una persona elegible.
- Si nadie de ese equipo tiene capacidad, la conversación puede permanecer sin asignar mientras espera a ese equipo.
- La derivación debería incluir suficiente contexto para continuar sin pedirle al cliente que repita la conversación.
- Cerrar una conversación indica que el trabajo activo terminó, incluso cuando un agente de IA gestionó primero una parte.

Sigue leyendo: [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Guías relacionadas

- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Roles y permisos de equipo]({% link _team/understanding-team-roles.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
