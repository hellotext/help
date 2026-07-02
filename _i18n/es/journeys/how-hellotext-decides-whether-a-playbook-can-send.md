Usa esta guía cuando un playbook está habilitado, pero esperabas un mensaje y todavía no se envió, el mensaje quedó demorado, se usó otro canal o la conversación fue derivada.

La versión corta: **habilitado** significa que el playbook puede participar. No significa que cada señal, respuesta o perfil del cliente vaya a producir un mensaje.

Hellotext revisa si el playbook tiene una razón para actuar, si el perfil del cliente puede ser contactado, si un canal puede llevar el mensaje, si aplican límites de frecuencia o timing, y si el mejor resultado es enviar, esperar, omitir o derivar.

## Primero, separa disparo de envío

Cuando un playbook no envía, empieza separando dos preguntas.

**¿El playbook se disparó?**

Esto habla de la razón para actuar. Un playbook puede no dispararse si falta la señal, el perfil del cliente no coincide con la audiencia, el mensaje del cliente no coincide con una intención, falla una condición de la ruta o el playbook no está habilitado para esa misión.

**¿El playbook se disparó pero no envió?**

Esto habla de preparación de entrega. Un playbook puede tener una razón válida para actuar, pero igual esperar u omitir porque el perfil del cliente no es alcanzable, el canal no está disponible, el cliente se dio de baja, se alcanzó un límite de frecuencia, el horario no está permitido, el cliente ya compró o la conversación debería manejarla una persona.

Para problemas de actividad o disparadores faltantes, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## El mapa de decisión

Los chequeos exactos varían según el playbook, pero la decisión normalmente pasa por estas preguntas.

### 1. ¿El playbook está habilitado y disponible?

El playbook debe estar habilitado antes de aceptar nuevos clientes o conversaciones elegibles.

Algunos playbooks se pueden habilitar una sola vez para el negocio. Otros, como agentes personalizados, pueden permitir varias versiones. La disponibilidad también puede depender de la cuenta, integración, canal o funciones habilitadas.

Si el playbook está deshabilitado, no debería aceptar nueva actividad. Conversaciones, rutas o candidatos de envío que ya existían pueden necesitar tiempo para terminar según el tipo de playbook.

### 2. ¿Ocurrió la señal, intención o condición correcta?

Los playbooks activos de venta normalmente necesitan una señal, como carrito abandonado, interés en producto, compra reciente, navegación u otro evento de comercio.

Los playbooks reactivos de atención normalmente necesitan un mensaje entrante del cliente que coincida con el propósito del playbook.

Los agentes personalizados pueden depender de intenciones configuradas. Si las intenciones se solapan, el Supervisor puede elegir otro agente o decidir que ningún playbook activo es el dueño correcto.

Las rutas dependen de su disparador, condiciones, esperas y lógica de ramas. Una ruta puede empezar, esperar, ramificar, asignar o terminar sin enviar otro mensaje si el siguiente paso no aplica.

### 3. ¿El perfil del cliente es elegible para recibir un mensaje?

Antes de enviar, Hellotext revisa si el perfil del cliente puede ser contactado en el canal correspondiente.

Un envío puede bloquearse u omitirse cuando:

- El perfil del cliente está desuscrito o se dio de baja.
- El perfil está bloqueado.
- El perfil no tiene un teléfono, WhatsApp, Instagram, Webchat u otra identidad requerida alcanzable.
- El cliente no es elegible para la audiencia o canal.
- El playbook necesita una ventana de conversación activa y esa ventana no está disponible.

Para el modelo general de consentimiento y contactabilidad, mira [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %}).

### 4. ¿El canal está listo para este mensaje?

Un cliente puede ser alcanzable en un canal y no en otro.

Hellotext revisa si el negocio tiene el canal habilitado, si el canal está activo, si el perfil del cliente es alcanzable ahí y si el formato del mensaje puede funcionar en ese canal.

Por ejemplo, un mensaje enriquecido de WhatsApp, una recomendación de producto, un SMS, una respuesta de Webchat y un DM de Instagram no tienen los mismos requisitos. Botones, medios, plantillas, ventanas de respuesta y ventanas de conversación activa pueden afectar lo que es posible.

Si hay varios canales disponibles, el playbook puede preferir el canal que mejor encaje con la conversación y el formato del mensaje. Si no hay un canal elegible, el playbook no puede enviar.

### 5. ¿Esto enviaría demasiados mensajes al cliente?

Algunos playbooks aplican chequeos de frecuencia y supresión antes de enviar.

Hellotext puede detener un intento proactivo cuando:

- El mismo playbook ya contactó a este perfil del cliente demasiado recientemente.
- El perfil del cliente ya recibió demasiada actividad proactiva del negocio en la ventana actual.
- Otra campaña, ruta o playbook ya generó suficiente presión de contacto.
- El cliente compró recientemente el producto o familia de productos que el playbook iba a recuperar o recomendar.

Por eso un playbook activo puede omitir un cliente específico aunque la señal exista. El sistema intenta evitar mensajes duplicados, vencidos o molestos.

### 6. ¿Es un horario permitido para enviar?

Algunos playbooks pueden esperar un mejor momento de envío en lugar de enviar inmediatamente.

El timing puede verse afectado por:

- Horarios silenciosos u horario nocturno.
- La zona horaria del negocio.
- El calendario de atención del negocio.
- Patrones recientes de interacción del cliente.
- Si la ventana de envío ya pasó.

Si todos los horarios posibles están bloqueados, el playbook puede omitir. Si un horario posterior es mejor y está permitido, el playbook puede esperar.

### 7. ¿Hellotext puede construir un candidato de envío válido?

Incluso después de pasar elegibilidad, el playbook necesita un mensaje que pueda convertirse en un envío real.

Puede detenerse antes de enviar si:

- No hay una variante válida del mensaje para el canal disponible.
- La ruta o registro del canal desapareció antes del envío.
- Faltan datos requeridos de producto, carrito, orden, link, botón o plantilla.
- La respuesta generada falla una revisión de seguridad o relevancia.
- El agente de IA no puede responder dentro de su alcance.

Cuando esto pasa, revisa la configuración del playbook, el resultado del Playground, la conversación del Inbox y los reportes para ver qué parte del camino falló.

### 8. ¿La conversación debería derivarse?

Algunos playbooks no deberían enviar una respuesta final de IA. Deberían traer a una persona o equipo.

Esto puede pasar cuando:

- El agente de atención o venta no puede responder con confianza.
- Una regla indica que el caso necesita una persona.
- El cliente está enojado.
- El cliente reporta un producto defectuoso.
- El Supervisor no encuentra otro playbook activo que deba encargarse de la solicitud.
- Una ruta llega a un paso de asignación.
- Una intención del agente personalizado coincide, pero el agente llega a sus límites.

Para comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Qué revisar cuando un playbook no envió

Usa esta lista antes de cambiar el playbook.

| Revisión | Dónde mirar |
| --- | --- |
| ¿El playbook está habilitado? | Lista de **Playbooks** y configuración del playbook. |
| ¿Ocurrió la señal o intención? | Actividad del perfil del cliente, historial de eventos, disparador de ruta o conversación del Inbox. |
| ¿El perfil del cliente es alcanzable? | Métodos de contacto del perfil, estado de suscripción y estado de bloqueo. |
| ¿El canal está activo? | Configuración de canal, WhatsApp/SMS/Webchat/Instagram y preparación de plantillas. |
| ¿Ya ocurrió otro envío? | Timeline del Inbox, actividad de campañas, actividad de rutas y reportes de playbooks. |
| ¿El timing demoró el envío? | Horarios silenciosos, zona horaria del negocio y timestamps de la primera actividad. |
| ¿El playbook derivó? | Asignación en Inbox, equipo dueño y notas de la conversación. |
| ¿El reporte muestra omisión o baja actividad? | [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %}). |

## Cuándo editar el playbook

No cambies el playbook hasta saber qué parte falló.

Si el problema es falta de datos, corrige primero la integración o tracking.

Si el problema es preparación del canal, termina la configuración del canal antes de cambiar el playbook.

Si el problema es frecuencia, compra reciente, consentimiento o timing, puede que el playbook esté funcionando correctamente. En ese caso, ajusta límites solo si la estrategia del negocio realmente cambió.

Si el problema es prompt, intenciones, conocimiento, derivación, oferta o lógica de ruta, usa [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Guías relacionadas

- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
