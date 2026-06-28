Usa esta guía antes de enviar una campaña, publicar un playbook, iniciar una ruta o importar perfiles de cliente.

El objetivo es entender si Hellotext debería contactar a un perfil de cliente, por qué canal y por qué.

Esta es una guía de producto para operar Hellotext. No reemplaza la revisión legal o de cumplimiento para los países y canales que usas.

## La versión corta

Un perfil de cliente normalmente está listo para recibir un mensaje cuando:

- El perfil tiene una dirección de canal alcanzable, como un teléfono o identidad de WhatsApp.
- El perfil está suscrito o es elegible para el canal que planeas usar.
- El perfil no se dio de baja de ese canal.
- El canal, remitente y tipo de mensaje están listos.
- Los horarios silenciosos, límites de frecuencia y otras reglas de envío permiten el mensaje.

Si falta alguna de esas piezas, no asumas que el perfil de cliente puede recibir el mensaje.

## Perfiles de cliente, suscriptores y audiencias

Un **perfil de cliente** es el registro que Hellotext usa para entender a un cliente. Puede incluir identificadores, direcciones de canal, propiedades de perfil, eventos, compras, conversaciones y estado de suscripción.

Un **suscriptor** es un perfil de cliente que aceptó recibir mensajes por un canal.

Una **audiencia** es el grupo de perfiles de cliente seleccionado para una campaña, playbook, ruta o reporte. Una audiencia puede contener perfiles que no son elegibles para todos los canales, por eso siempre revisa elegibilidad antes de enviar.

## El consentimiento es por canal

Trata el consentimiento como específico para cada canal.

Por ejemplo, un perfil de cliente puede estar suscrito a SMS pero no a WhatsApp, o puede recibir una respuesta dentro de una conversación activa pero no un nuevo mensaje saliente.

Antes de enviar, pregunta:

- ¿Qué canal usará este mensaje?
- ¿Cómo se suscribió este perfil de cliente a ese canal?
- ¿El remitente o cuenta está conectado para ese canal?
- ¿El tipo de mensaje encaja con las reglas del canal?
- ¿El cliente puede responder y dónde llegará esa respuesta?

## Estados comunes para revisar

Los nombres exactos pueden variar según el canal y configuración de la cuenta, pero estos son los estados a considerar antes de enviar.

| Estado | Qué significa | Qué hacer |
| --- | --- | --- |
| Suscrito o con opt-in | El perfil normalmente puede recibir mensajes en ese canal si las demás reglas de envío lo permiten. | Confirma mensaje, horario, frecuencia y remitente. |
| Dado de baja o desuscrito | El cliente pidió no recibir mensajes en ese canal. | No incluyas el perfil en envíos por ese canal. |
| Desconocido o sin consentimiento | Hellotext tiene un perfil o dirección de canal, pero no un opt-in claro para ese canal. | Usa una captura o camino de consentimiento antes de enviar. |
| Inválido o no alcanzable | La dirección de canal no se puede usar de forma confiable. | Corrige el dato o quita el perfil de la audiencia de lanzamiento. |
| Perfil duplicado | Más de un perfil puede representar al mismo cliente. | Revisa identidad y comportamiento de unión antes de medir o enviar ampliamente. |

## De dónde puede venir el consentimiento

El consentimiento y estado de suscripción pueden venir de distintos lugares según tu configuración:

- Códigos QR.
- Links compartibles.
- Formularios web y popups.
- Opt-ins de checkout.
- Flujos de opt-in específicos por canal.
- Importaciones de perfiles de cliente con campos de consentimiento.
- Integraciones de comercio o personalizadas que sincronizan estado de suscripción.

Las herramientas de captura suelen ser la forma self-serve más segura de crecer una audiencia alcanzable porque crean un camino de suscripción claro.

## Antes de importar perfiles de cliente

Las importaciones requieren cuidado adicional porque los datos importados pueden no tener el mismo contexto que una captura.

Antes de importar o enviar a perfiles importados, confirma:

- De dónde vinieron los perfiles de cliente.
- Para qué canal es elegible cada perfil.
- Qué campo mapea al estado de suscripción o consentimiento.
- Si los perfiles dados de baja están excluidos o mapeados correctamente.
- Si los duplicados deberían unirse antes del lanzamiento.
- Si el primer envío debería ir a un segmento de prueba más pequeño.

Si la fuente de consentimiento no está clara, deja esos perfiles fuera del primer envío.

## Antes de enviar

Antes de lanzar una campaña, playbook, ruta o agente, revisa:

- La audiencia seleccionada coincide con el objetivo.
- La audiencia tiene consentimiento para el canal.
- Las exclusiones quitan perfiles dados de baja, inválidos, duplicados, de prueba o internos.
- El remitente y canal están conectados.
- El mensaje incluye texto de baja o desuscripción cuando corresponde.
- Las respuestas llegarán al Inbox o responsable esperado.
- Los horarios silenciosos y límites de frecuencia están claros.

Para un primer lanzamiento, empieza con una audiencia pequeña y mira respuestas, bajas, mensajes fallidos y reportes antes de ampliar.

## Si no puedes escribirle a un perfil de cliente

Si un perfil de cliente no es elegible, usa un camino más seguro:

- Pide al cliente que se suscriba mediante una captura.
- Envía desde un canal donde el cliente ya sea elegible.
- Corrige datos inválidos o duplicados del perfil.
- Espera a que el cliente inicie una conversación si el canal solo permite respuestas en ciertas ventanas.
- Excluye el perfil del envío.

No ignores una baja solo para agrandar una campaña, playbook o ruta.

## Guías relacionadas

- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Crea y gestiona listas]({% link _audience/lists.md %})
- [Crea segmentos]({% link _audience/segments.md %})
