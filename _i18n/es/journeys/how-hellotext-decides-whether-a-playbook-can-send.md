Usa esta guía cuando una misión está habilitada, pero esperabas un mensaje y todavía no se envió, el mensaje quedó demorado, se usó otro canal o la conversación fue derivada.

La versión corta: **habilitada** significa que la misión puede participar. No significa que cada señal, respuesta o perfil del cliente vaya a producir un mensaje.

Hellotext revisa si la misión tiene una razón para actuar, si el perfil del cliente puede ser contactado, si un canal puede llevar el mensaje y qué límites corresponden a ese flujo. El resultado puede ser enviar, esperar, omitir o derivar. Una misión proactiva de venta, un agente que responde al cliente y una ruta no recorren necesariamente los mismos chequeos.

Las figuras son ejemplos ficticios independientes de definiciones, datos y controles. No muestran una señal procesada, una decisión de envío ni una derivación realizada.

## Primero, separa disparo de envío

Cuando una misión no envía, empieza separando dos preguntas.

**¿La misión se disparó?**

Esto habla de la razón para actuar. Una misión puede no dispararse si falta la señal, el perfil del cliente no coincide con la audiencia, el mensaje del cliente no coincide con una intención, falla una condición de la ruta o la misión no está habilitada para ese objetivo.

**¿La misión se disparó pero no envió?**

Esto habla de preparación de entrega. Una misión puede tener una razón válida para actuar, pero igual esperar u omitir porque el perfil del cliente no es alcanzable, el canal no está disponible, el cliente se dio de baja, se alcanzó un límite de frecuencia, el horario no está permitido, el cliente ya compró o la conversación debería manejarla una persona.

Separa también **señal registrada**, **admisión a la misión**, **candidato o propuesta**, **mensaje creado** y **entrega**. Una omisión anterior a la creación puede no tener un mensaje con error. Que un proveedor acepte un mensaje tampoco confirma que el cliente lo recibió.

Para problemas de actividad o disparadores faltantes, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

Para un diagnóstico paso a paso, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## El mapa de decisión

Los chequeos exactos varían según la misión, pero la decisión normalmente pasa por estas preguntas.

### 1. ¿La misión está habilitada y disponible?

Comprueba que la misión esté habilitada y que su flujo siga disponible. Habilitar permite participar en la admisión correspondiente; todavía deben cumplirse sus requisitos de audiencia, canal y actividad.

Algunas misiones se pueden habilitar una sola vez para el negocio. Otras, como los [agentes personalizados]({% link _journeys/custom-agent-playbook.md %}), pueden permitir varias versiones. La disponibilidad también puede depender de la cuenta, integración, canal o funciones habilitadas.

Deshabilitarla cambia su admisión de nueva actividad. No confirma que todas las conversaciones, rutas, propuestas o trabajos ya existentes se hayan cancelado. Comprueba el último estado de cada intento y las reglas de ese tipo de misión antes de esperar una detención inmediata.

### 2. ¿Ocurrió la señal, intención o condición correcta?

Las misiones activas de venta normalmente necesitan una señal, como carrito abandonado, interés en producto, compra reciente, navegación u otro evento de comercio.

Una **definición de acción** no es una **ocurrencia**. El catálogo de **Acciones** muestra la definición ficticia **appointment.booked / Cita reservada**, con cero eventos registrados. Sirve para localizar el nombre y título de la acción; no demuestra un evento de comercio recibido ni que una misión lo use como disparador.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Definición ficticia de una acción en el catálogo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-es-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-es.png" srcset="/images/developers/custom-actions/catalog-es.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Definición ficticia de una acción en el catálogo" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Definición existente sin ocurrencias; no acredita un disparador procesado.</figcaption>
</figure>

Las misiones reactivas de atención normalmente necesitan un mensaje entrante del cliente que coincida con el propósito de la misión.

Los [agentes personalizados]({% link _journeys/custom-agent-playbook.md %}) pueden depender de intenciones configuradas. Si las intenciones se solapan, el Supervisor puede elegir otro agente o decidir que ninguna misión activa es la responsable adecuada.

Las intenciones se interpretan en el contexto de la conversación y de las misiones disponibles; no funcionan como una coincidencia exacta de palabras. Un mensaje puede continuar una atención ya activa y no abrir un nuevo agente.

En **Intenciones**, la frase ficticia **Quiero consultar una devolución.** está en un borrador sin agregar ni guardar. **Nueva intención** no se pulsó. Esta figura identifica el campo de configuración; no es un mensaje entrante, una intención clasificada ni una solicitud derivada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Frase ficticia sin agregar en el panel Intenciones">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-es-mobile.png 2x" width="764" height="592" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-es.png" srcset="/images/team/ai-handoff-to-inbox/intents-es.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Frase ficticia sin agregar en el panel Intenciones" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador independiente sin guardar ni ejecutar clasificación.</figcaption>
</figure>

Las rutas dependen de su disparador, condiciones, esperas y lógica de ramas. Una ruta puede empezar, esperar, ramificar, asignar o terminar sin enviar otro mensaje si el siguiente paso no aplica.

### 3. ¿El perfil del cliente es elegible para recibir un mensaje?

Antes de enviar, Hellotext revisa si el perfil del cliente puede ser contactado en el canal correspondiente.

Comprueba por separado identidad, destino, permiso y audiencia. Según el flujo, un envío puede bloquearse u omitirse cuando:

- El cliente se dio de baja del contacto proactivo requerido o falta el permiso aplicable.
- El perfil o destino está bloqueado para ese canal.
- Falta una identidad alcanzable de teléfono, WhatsApp, Instagram, Webchat u otro canal requerido.
- El cliente no cumple la audiencia o los requisitos del canal.
- El flujo necesita una ventana de conversación abierta y esa ventana no está disponible.

Una respuesta al cliente y un contacto proactivo tienen condiciones distintas. Tener un dato de contacto o el estado **Suscrito** no autoriza por sí solo cualquier canal, destino o tipo de mensaje.

Para el modelo general de consentimiento y contactabilidad, mira [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %}).

El perfil ficticio **Camila Torres** está **Sin confirmar**, tiene un email de ejemplo y no tiene teléfono. Es útil para identificar estado y métodos de contacto; no demuestra verificación, consentimiento o elegibilidad de envío. La vista estrecha conserva un foco desktop de esa misma fuente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Estado y datos de un perfil ficticio sin confirmar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Estado y datos de un perfil ficticio sin confirmar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Identidad y contacto son comprobaciones distintas de permiso y entrega.</figcaption>
</figure>

### 4. ¿El canal está listo para este mensaje?

Un cliente puede ser alcanzable en un canal y no en otro.

Los requisitos dependen de la tecnología y del flujo: canal activo donde corresponda, identidad y destino alcanzables, permiso aplicable, versión o plantilla utilizable y formato compatible. SMS usa una ruta interna; no necesita el mismo registro de canal conectado que WhatsApp o Instagram. Correo necesita un remitente activo y Push una suscripción utilizable y un canal del negocio, además de las funciones del plan que correspondan.

Por ejemplo, un mensaje enriquecido de WhatsApp, una recomendación de producto, un SMS, una respuesta de Webchat y un DM de Instagram no tienen los mismos requisitos. Botones, medios, plantillas, ventanas de respuesta y ventanas de conversación activa pueden afectar lo que es posible.

Cuando hay varios canales, la selección sigue la política del flujo y los datos disponibles de conversación, tiempo y costo. No garantiza el canal más barato ni un respaldo automático. En planificación proactiva, una propuesta ya generada está ligada a su ruta concreta; perder esa ruta no permite trasladar el mismo contenido a cualquier otro canal. Sin ruta elegible, ese intento no puede enviar.

Un Playground sin perfil del cliente puede mostrar los formatos seleccionados sin comprobar destinos reales. Esa vista previa no confirma que una persona concreta pueda recibirlos.

### 5. ¿Esto enviaría demasiados mensajes al cliente?

Las misiones proactivas pueden aplicar frecuencia de la misión, un límite agregado de contacto y controles de separación entre intentos. Son comprobaciones con poblaciones distintas, no un contador único para todo el negocio.

Hellotext puede detener un intento proactivo cuando:

- La misma misión ya tiene propuestas o actividad de envío contabilizada para ese perfil dentro de su ventana.
- Las misiones proactivas incluidas en el límite agregado de contacto ya consumieron ese presupuesto.
- Otro intento relevante para el control de separación, como una campaña o mensaje de marketing, ocupa el momento previsto.
- El cliente compró recientemente el producto o familia de productos que la misión iba a recuperar o recomendar.

En generación proactiva, las propuestas pendientes pueden contar antes de la entrega. Campañas, rutas y respuestas reactivas no consumen automáticamente el mismo presupuesto agregado de misiones; tienen sus propios controles de admisión o separación. Algunos tipos están excluidos de un límite específico sin quedar exentos de las demás reglas. La compra reciente también se comprueba con el producto o familia y la política de la misión.

Por eso una misión activa puede omitir o esperar por un cliente aunque la señal exista. Revisa qué población, ventana y etapa cuenta cada límite antes de interpretar una cifra como mensajes recibidos.

### 6. ¿Es un horario permitido para enviar?

En planificación proactiva, distingue restricciones de envío de señales de contexto:

- Los horarios silenciosos o nocturnos configurados y las ventanas de comunicación aplicables al país de destino pueden bloquear un horario.
- La zona horaria del negocio determina sus ventanas locales de planificación; las restricciones del destino pueden usar otra zona horaria.
- El calendario de atención es contexto en esta planificación: estar fuera de su horario no bloquea por sí solo un candidato. No lo confundas con el calendario que calcula los objetivos de respuesta de Inbox.
- El historial de interacción aporta evidencia de contexto. La selección actual prioriza el primer horario elegible dentro de las ventanas evaluadas; no promete esperar al pico histórico de interacción.
- La separación con otros intentos y el vencimiento del candidato pueden dejar un horario sin disponibilidad.

Si no queda un horario permitido y útil, el intento puede omitirse o vencer. Si la política permite otro horario, puede esperar y volver a comprobar sus requisitos. Esto no establece un horario universal para todas las misiones, rutas o respuestas reactivas.

### 7. ¿Hellotext puede construir un candidato de envío válido?

Incluso después de pasar elegibilidad, la misión necesita un mensaje que pueda convertirse en un envío real.

La planificación proactiva puede comparar rutas y candidatos antes de generar contenido. La falta temporal de capacidad o evidencia para comparar puede dejar un candidato en espera; no es lo mismo que perder todas las rutas o vencer. Una propuesta compuesta, un mensaje creado y un acuse del proveedor siguen siendo etapas diferentes.

Puede detenerse antes de enviar si:

- No hay una variante válida del mensaje para el canal disponible.
- La ruta o registro del canal desapareció antes del envío.
- Faltan datos requeridos de producto, carrito, orden, link, botón o plantilla.
- La respuesta generada falla una revisión de seguridad o relevancia.
- El agente de IA no puede responder dentro de su alcance.

Los requisitos pueden comprobarse de nuevo al programar, materializar o liberar el envío. Una compra, baja o cambio de canal posterior puede cambiar el resultado, según la misión. Pasar un chequeo anterior no garantiza entrega.

Consulta la configuración, los resultados de Playground ya existentes, la conversación y los reportes disponibles para ese flujo. Una vista previa genérica o un reporte agregado no identifica por sí solo el motivo de un intento individual. Conserva el último estado confirmado antes de crear otra prueba o reintento.

### 8. ¿La conversación debería derivarse?

Algunas misiones no deberían enviar una respuesta final de IA. Deberían traer a una persona o equipo.

Según las reglas y herramientas habilitadas de la misión, esto puede pasar cuando:

- El agente de atención o venta no puede responder con confianza.
- Una regla indica que el caso necesita una persona.
- El cliente está enojado.
- El cliente reporta un producto defectuoso.
- El Supervisor no encuentra otra misión activa que deba encargarse de la solicitud.
- Una ruta llega a un paso de asignación.
- Una intención del agente personalizado coincide, pero el agente llega a sus límites.

Para comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

En el panel **Derivación** de Property Collector, el ejemplo ficticio permite derivar a **Atención demo** sin guardar ni activar el flujo. Identifica el control y el equipo de destino; no muestra una conversación asignada, un equipo que aceptó el caso o una respuesta humana.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Control ficticio de derivación a Atención demo sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Control ficticio de derivación a Atención demo sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Configuración independiente; no acredita asignación ni atención completada.</figcaption>
</figure>

Recepción, dueño, equipo pendiente, capacidad, estado abierto y respuesta son comprobaciones diferentes. Una asignación puede esperar por una persona disponible; el protocolo y el modo de atención determinan si la IA se pausa o continúa. Asignar o cerrar no garantiza una parada permanente de toda actividad de IA ni una respuesta humana inmediata.

## Qué revisar cuando una misión no envió

Usa esta lista antes de cambiar la misión.

Anota perfil, misión o ruta, señal esperada, canal, hora y zona horaria. Revisa sólo la evidencia que ya existe y a la que tienes acceso; no repitas una operación cuyo resultado todavía es incierto.

| Revisión | Dónde mirar |
| --- | --- |
| ¿La misión está habilitada? | Lista de **Misiones** y configuración de la misión. |
| ¿Ocurrió la señal o intención? | Actividad del perfil del cliente, historial de eventos, disparador de ruta o conversación del Inbox. |
| ¿El perfil del cliente es alcanzable? | Métodos de contacto del perfil, estado de suscripción y estado de bloqueo. |
| ¿El canal está activo? | Configuración del canal y preparación de plantillas, remitente o suscripción, según la tecnología. |
| ¿Ya existe otro intento? | Propuestas y mensajes disponibles, timeline del Inbox, actividad de campañas, rutas y reportes de misiones. |
| ¿El timing demoró el envío? | Horarios silenciosos, ventanas del destino, zona horaria, momento previsto y vencimiento del candidato, si están disponibles. |
| ¿La misión derivó? | Dueño, equipo pendiente, modo de atención y notas de la conversación, separados de la respuesta humana. |
| ¿El reporte muestra omisión o baja actividad? | [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %}). |

## Cuándo editar la misión

No cambies la misión hasta saber qué parte falló.

Si guardar, probar o enviar quedó sin respuesta clara, reconcilia primero el intento original con sus registros. Un reintento puede producir otro efecto y no demuestra por sí solo qué ocurrió antes.

Si el problema es falta de datos, corrige primero la integración o tracking.

Si el problema es preparación del canal, termina la configuración del canal antes de cambiar la misión.

Si el problema es frecuencia, compra reciente, consentimiento o timing, puede que la misión esté funcionando correctamente. En ese caso, ajusta límites solo si la estrategia del negocio realmente cambió.

Si el problema es prompt, intenciones, conocimiento, derivación, oferta o lógica de ruta, usa [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Guías relacionadas

- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
