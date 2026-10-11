Usa el ciclo de una conversación para entender si un cliente necesita acción ahora, quién es responsable de la próxima respuesta y si la conversación está esperando, pospuesta o completa.

El estado describe dónde se encuentra la conversación dentro del flujo de trabajo. Señales como **Necesita atención** o **Mencionados** ayudan a priorizar, pero no reemplazan el estado principal.

## Cómo llega una conversación al Inbox

Una conversación puede aparecer cuando:

- Un cliente escribe por WhatsApp, SMS, Webchat, Instagram, Messenger u otro canal entrante conectado.
- Un cliente responde a un mensaje de una campaña, misión o ruta.
- Una misión o un agente de IA deriva la conversación a una persona o equipo.
- Un step de Asignación (Assignment) de una ruta ejecuta una acción para abrir la conversación. Asignar un responsable desde ese step no siempre la abre.
- Una automatización abre o deriva una conversación para atender actividad del cliente, un pedido o el negocio.
- Una conversación cerrada o pospuesta recibe actividad que la vuelve a abrir.

El timeline reúne los mensajes del cliente, respuestas del equipo y cambios registrados, como asignaciones, notas, etiquetas y cierres, para que la próxima persona pueda entender qué pasó.

## Entiende los estados principales

### Abiertas

**Abiertas** reúne las conversaciones que actualmente están asignadas o sin asignar. Es una vista general del trabajo activo, no un estado separado de asignación.

Usa Abiertas cuando quieres ver las conversaciones activas que el equipo podría necesitar gestionar.

### Sin asignar

Una conversación sin asignar está abierta, pero todavía no tiene una persona específica responsable de la próxima acción.

Puede estar disponible para que alguien la tome o esperando a una persona elegible del equipo seleccionado por una regla de enrutamiento o derivación. Cuando el equipo de destino está a capacidad, Hellotext puede mantener la conversación sin asignar y conservar ese equipo como destino previsto.

No asumas que todas las conversaciones sin asignar están disponibles para cualquier persona. Revisa si llegó mediante una derivación a equipo antes de tomarla.

### Asignadas

El filtro **Asignados** reúne conversaciones con un responsable para la próxima acción, que puede ser una persona o un agente de IA. Una persona puede asignársela o reasignarla cuando alguien más debería continuar.

Cuando se registra una respuesta en el Inbox, una conversación sin asignar puede asignarse a quien responde. Si está esperando a un equipo específico, esta autoasignación requiere pertenecer a ese equipo. Registrar la respuesta no confirma que el cliente ya la recibió.

Sigue leyendo: [Asigna conversaciones]({% link _team/assigning-conversations.md %}).

### Recordatorios

Usa **Posponer** cuando la conversación no necesita acción ahora, pero debería volver más adelante. Abre **Acciones** y elige **Posponer** para seleccionar **1 Hora**, **4 Horas**, **Hasta mañana** o **Personalizado**.

<!-- inbox-actions:snooze-options:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="snooze-options" aria-label="Elige cuándo volver a la conversación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/snooze-options-es-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/snooze-options-es-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/snooze-options-es-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Menú Posponer abierto en una conversación del Inbox, con las opciones de tiempo disponibles." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Opciones para posponer una conversación antes de confirmar el recordatorio.</figcaption>
</figure>
<!-- inbox-actions:snooze-options:end -->

Para elegir otro momento, selecciona **Personalizado**, establece la fecha y la hora y confirma con **Snooze**.

<!-- conversation-lifecycle:custom-reminder:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="custom-reminder" aria-label="Elige un recordatorio personalizado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 516px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/custom-reminder-es-mobile-540.png 4x" width="1992" height="1016" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/custom-reminder-es-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/custom-reminder-es-desktop.png 4x" width="1992" height="1032" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Diálogo Posponer conversación con los campos de fecha y hora y el botón Snooze." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. La fecha y la hora están elegidas; este recordatorio todavía no se ha guardado.</figcaption>
</figure>
<!-- conversation-lifecycle:custom-reminder:end -->

Las conversaciones pospuestas aparecen en **Recordatorios** en lugar de la lista activa de Abiertas. Cuando se procesa el recordatorio programado, la conversación vuelve a la persona que conservaba asignada si todavía pertenece al negocio; de lo contrario, vuelve sin asignar. Una nueva actividad del cliente también puede hacerla volver antes.

<!-- inbox-actions:snoozed-result:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="snoozed-result" aria-label="Comprueba la conversación pospuesta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/snoozed-result-es-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/snoozed-result-es-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/snoozed-result-es-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Conversación pospuesta en el Inbox, con Reabrir y el registro de Posponer visibles." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios después de posponer una conversación.</figcaption>
</figure>
<!-- inbox-actions:snoozed-result:end -->

Pospone el trabajo que realmente está esperando. Cierra el trabajo que ya terminó.

### Cerradas

Cierra una conversación cuando ya no requiere ninguna acción del equipo. Selecciona **Completo** en el encabezado cuando aparezca ese control. El cierre la quita del trabajo activo y limpia la atención vigente, pero no elimina la conversación ni su timeline.

<!-- inbox-actions:closed-result:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="closed-result" aria-label="Comprueba la conversación cerrada">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/closed-result-es-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/closed-result-es-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/closed-result-es-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Conversación cerrada en el Inbox, con Reabrir y el registro de cierre visibles." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios después de cerrar una conversación.</figcaption>
</figure>
<!-- inbox-actions:closed-result:end -->

Las conversaciones cerradas siguen disponibles mediante el filtro **Cerrados**. Una persona puede reabrirlas manualmente. Una respuesta del cliente o una nueva actividad también puede reabrirlas y aplicar las reglas actuales de asignación del negocio.

Cuando reabres una conversación manualmente, Hellotext conserva al responsable humano que todavía tenga asignado. Si no tiene uno, vuelve sin asignar. Revisa el responsable antes de continuar.

<!-- inbox-actions:reopened-result:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="reopened-result" aria-label="Comprueba la conversación reabierta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 408px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/inbox-actions-continuation-20261010/reopened-result-es-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/inbox-actions-continuation-20261010/reopened-result-es-mobile.png" srcset="/images/editorial/inbox-actions-continuation-20261010/reopened-result-es-mobile.png 4x" width="1560" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Conversación reabierta en el Inbox, con su responsable humano y los controles activos visibles." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios tras reabrir manualmente una conversación cerrada.</figcaption>
</figure>
<!-- inbox-actions:reopened-result:end -->

## Señales de atención y menciones

### Necesita atención

**Necesita atención** es una señal de prioridad, no un estado del ciclo. Puede aplicarse a una conversación asignada o sin asignar cuando el cliente o workflow espera una acción.

Usa este filtro para encontrar trabajo que debería revisarse antes que otras conversaciones abiertas de menor prioridad. Cerrar la conversación limpia la atención activa porque el trabajo deja de considerarse accionable.

Los indicadores de salud de respuesta pueden agregar contexto sobre cuánto tiempo lleva esperando el cliente. Sigue leyendo: [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %}).

### Mencionados

El filtro **Mencionados** muestra conversaciones con menciones en notas internas. Usa el filtro de integrantes para elegir de quién quieres revisar las menciones.

Una mención llama la atención sobre la conversación, pero no cambia al responsable por sí sola. Confirma quién debería enviar la próxima respuesta visible para el cliente.

<!-- conversation-lifecycle:mentioned-context:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="mentioned-context" aria-label="Reconoce una mención sin cambiar al responsable">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 805px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/mentioned-context-es-mobile.png 4x" width="1560" height="2112" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/mentioned-context-es-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/mentioned-context-es-desktop.png 4x" width="3148" height="2704" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nota interna con una mención en una conversación del Inbox." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios preparados antes de la captura. La nota y la mención ya existen; el responsable de la conversación se conserva.</figcaption>
</figure>
<!-- conversation-lifecycle:mentioned-context:end -->

## Usa notas y etiquetas sin cambiar el responsable

Agrega una nota interna cuando el equipo necesita contexto que no debería enviarse al cliente. Las notas pueden documentar una decisión, resumir una acción realizada fuera de Hellotext o mencionar a otra persona.

Selecciona **Agregar nota privada** en la barra del editor. Escribe `@` y elige al integrante que quieres mencionar.

<!-- conversation-lifecycle:note-mention-draft:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="note-mention-draft" aria-label="Escribe una nota interna con una mención">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 805px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/note-mention-draft-es-mobile.png 4x" width="1560" height="1248" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/note-mention-draft-es-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/note-mention-draft-es-desktop.png 4x" width="3148" height="1220" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Borrador de nota privada con el selector de integrantes para agregar una mención." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Borrador de una nota interna y selector de mención; la nota todavía no se ha guardado.</figcaption>
</figure>
<!-- conversation-lifecycle:note-mention-draft:end -->

Las notas no cuentan como respuestas para el cliente ni cumplen un tiempo de respuesta. Asigna también la conversación cuando la persona mencionada debería hacerse responsable.

Usa etiquetas para organizar conversaciones mediante una categoría operativa duradera, como un problema de producto, oportunidad de venta, revisión de reembolso o tipo de seguimiento. Las etiquetas permiten filtrar conversaciones relacionadas sin cambiar su estado ni responsable.

Abre **Acciones** y selecciona **Etiquetas** para revisar las etiquetas de la conversación.

<!-- conversation-lifecycle:conversation-labels:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-inbox-figure="conversation-labels" aria-label="Revisa las etiquetas de la conversación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 483px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/conversation-lifecycle-20261011/conversation-labels-es-mobile.png 4x" width="1560" height="2008" />
        <img class="ht-editorial-visual__image" src="/images/editorial/conversation-lifecycle-20261011/conversation-labels-es-desktop.png" srcset="/images/editorial/conversation-lifecycle-20261011/conversation-labels-es-desktop.png 4x" width="1860" height="1656" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Menú Etiquetas de una conversación con una etiqueta seleccionada." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. La etiqueta ya estaba aplicada antes de la captura; no se cambió ninguna opción en este menú.</figcaption>
</figure>
<!-- conversation-lifecycle:conversation-labels:end -->

## Filtra el Inbox de forma deliberada

El Inbox ofrece filtros para:

- **Abiertas**
- **Necesita atención**
- **Asignados**
- **Sin asignar**
- **Cerrados**
- **Recordatorios**
- **Mencionados**

Puedes limitar las vistas compatibles por persona y etiqueta. El significado de cada filtro se mantiene separado de la asignación: por ejemplo, una conversación puede estar asignada y al mismo tiempo necesitar atención.

Para conocer el significado exacto de cada combinación y cómo funciona la búsqueda dentro de ella, lee [Filtra y busca conversaciones en el Inbox]({% link _team/filter-and-search-inbox.md %}).

Usa este orden diario simple:

1. Revisa Necesita atención.
2. Toma o deriva el trabajo sin asignar.
3. Continúa las conversaciones asignadas a ti.
4. Revisa menciones que necesiten contexto o una decisión.
5. Cierra conversaciones completadas.
6. Usa recordatorios solamente para trabajo que debería volver en un momento específico.

## Cómo afecta la automatización al ciclo

Las misiones, los agentes de IA y las rutas pueden abrir, asignar, cerrar o devolver conversaciones al Inbox.

Cuando una automatización deriva a un equipo:

- El equipo de destino puede aportar inmediatamente una persona elegible.
- Si nadie de ese equipo tiene capacidad, la conversación puede permanecer sin asignar mientras espera a ese equipo.
- La derivación debería incluir suficiente contexto para continuar sin pedirle al cliente que repita la conversación.
- Cerrar una conversación indica que el trabajo activo terminó, incluso cuando un agente de IA gestionó primero una parte.

Sigue leyendo: [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Guías relacionadas

- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Filtra y busca conversaciones en el Inbox]({% link _team/filter-and-search-inbox.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Roles y permisos de equipo]({% link _team/understanding-team-roles.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
