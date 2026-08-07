Usa SMS cuando necesitas un mensaje de texto conciso y alcance amplio sin depender de una aplicación de mensajería. Hellotext puede usar SMS en campañas, playbooks autónomos, rutas, conversaciones de Inbox, capturas y mensajes por API.

SMS soporta texto y enlaces. No ofrece las experiencias más ricas de productos, botones, adjuntos y ubicaciones disponibles en WhatsApp. SMS no usa el proceso de aprobación de plantillas de WhatsApp de Meta, aunque siguen aplicando las reglas del operador, la cuenta, el consentimiento y el contenido.

Muchos negocios usan ambos canales y dejan que el tipo de mensaje y la disponibilidad de cada cliente determinen cuál encaja mejor.

Las tarifas de mensajería varían según el país de destino, por lo que en algunos mercados SMS puede ser la opción más conveniente por precio. Revisa las tarifas vigentes para el país antes de elegir un canal predeterminado. Consulta [Precios de SMS y tipos de número]({% link _billing/sms-pricing-and-number-types.md %}).

## Antes de usar SMS

Confirma que:

- Haya un remitente SMS aprobado y activo para tu cuenta y país de destino.
- Los perfiles del cliente tengan números de teléfono completos en formato internacional.
- Tu audiencia tenga consentimiento válido para SMS.
- Tu cuenta no tenga una restricción de facturación, saldo o envío temporal que bloquee SMS.
- Las respuestas puedan llegar a las personas o playbooks que deberían atenderlas.

El remitente disponible para tu negocio depende de su país y configuración de cuenta. Hellotext puede usar remitentes aprobados o códigos cortos compartidos donde estén disponibles.

Si tu cuenta no tiene un remitente SMS disponible, contacta a Hellotext antes de preparar un lanzamiento alrededor de SMS.

## Cómo usa Hellotext SMS

### Campañas

Al crear una campaña, puedes elegir:

- **WhatsApp y SMS:** Hellotext intenta enviar primero por WhatsApp y usa SMS cuando WhatsApp no está disponible para un cliente elegible.
- **Solo WhatsApp:** la campaña se mantiene en WhatsApp.
- **Solo SMS:** la campaña se mantiene en SMS.

Las opciones disponibles dependen de los canales conectados al negocio. Usar SMS como alternativa no evita las reglas de suscripción, disponibilidad o consentimiento del canal.

Sigue leyendo: [Mejores prácticas para campañas]({% link _campaigns/campaign-best-practices.md %}).

### Playbooks autónomos

Cuando un playbook autónomo proactivo controla la selección de canal, Hellotext puede evaluar los canales elegibles disponibles para ese cliente y elegir la opción más eficiente en costos. El playbook solo envía cuando su motor de decisión identifica una oportunidad válida según sus reglas.

No asumas que habilitar SMS hace que todos los playbooks envíen un SMS. El cliente debe seguir siendo elegible, la oportunidad debe continuar vigente y el playbook puede seleccionar otro canal disponible.

Un playbook de soporte reactivo normalmente responde en el canal donde el cliente inició la conversación, sujeto a la disponibilidad y reglas de conversación de ese canal.

### Rutas

Una ruta sigue los canales y la lógica configurados en sus pasos. Un paso de envío puede dirigirse a SMS, a otro canal o usar el comportamiento de canal elegible disponible para esa ruta.

Prueba cada rama que pueda enviar o recibir SMS. Confirma qué ocurre cuando falta el número de teléfono, el cliente está desuscrito o el canal elegido no puede entregar.

### Inbox y respuestas

Cuando el remitente activo admite respuestas, una respuesta por SMS puede abrir o continuar una conversación en el Inbox. El equipo puede responder, asignar la conversación o dejar que un playbook elegible la atienda según la configuración del negocio.

Los códigos cortos compartidos pueden ser usados por más de un negocio. El mensaje saliente más reciente ayuda a determinar qué negocio recibe una respuesta, por lo que los negocios que necesitan un remitente dedicado deberían revisar [Códigos cortos exclusivos]({% link _numbers/exclusive-short-codes.md %}).

### Mensajes por API

Los envíos por API siguen el canal, remitente, destino y contenido enviados por la integración. Que una solicitud sea aceptada significa que Hellotext la recibió; todavía no confirma que el operador haya entregado el mensaje.

Sigue leyendo: [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %}).

## Entiende la longitud y las partes de un SMS

Un mensaje en el editor puede usar más de una parte de SMS facturable.

La cantidad de partes depende de:

- la longitud del mensaje;
- los caracteres y la codificación usados;
- la personalización después de reemplazar las etiquetas con datos del cliente; y
- el enlace completo incluido en el mensaje final.

Algunos acentos, símbolos o emojis pueden cambiar la codificación y reducir la cantidad de caracteres que caben en una parte. Un valor personalizado largo también puede hacer que el mensaje final de un cliente sea más extenso que el ejemplo de la vista previa.

Revisa la estimación de partes de SMS que muestra el editor antes de enviar. Mantén el propósito y el llamado a la acción concisos, y prueba con valores de personalización realistas. Cada parte puede afectar el uso y costo de SMS.

Sigue leyendo: [Precios de SMS y tipos de número]({% link _billing/sms-pricing-and-number-types.md %}) y [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}).

## Consentimiento y bajas

Que un número de teléfono sea válido no demuestra que el cliente aceptó recibir SMS de marketing. Hellotext considera tanto el estado de suscripción del perfil del cliente como si el destino está disponible a través del canal seleccionado.

Antes de enviar:

- Explica a qué se suscriben los clientes y qué canal usarás.
- Conserva evidencia del origen de la suscripción.
- Excluye perfiles desuscritos, inválidos, bloqueados, internos y de prueba según corresponda.
- Deja claro qué negocio envía el mensaje y cuál es su propósito.
- Respeta las bajas y no reintentes por SMS para evitar las reglas de consentimiento de otro canal.

Consulta [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}) para entender la diferencia completa entre suscripción, identidad y disponibilidad.

## Estados de entrega y mensajes fallidos

Un SMS puede pasar por estos estados:

- **Pendiente:** espera ser procesado.
- **Enrutado:** fue enviado al proveedor externo.
- **Entregado:** el proveedor confirmó la entrega.
- **No enviado:** Hellotext o el proveedor no pudo completar la entrega y muestra un motivo.

No reintentes mientras un mensaje todavía se está procesando. Si no fue enviado, abre primero el motivo. Algunas causas comunes son un número inválido, rechazo del operador, remitente no disponible, límite de cuenta, condición de facturación o problema temporal del proveedor.

Los negocios nuevos con prepago también pueden comenzar con un límite temporal de SMS mientras Hellotext revisa la calidad de sus envíos.

Sigue leyendo: [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) y [Límites de envío SMS para nuevos negocios]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## Checklist para tu primer lanzamiento por SMS

Antes de tu primer lanzamiento por SMS, confirma que:

1. Haya un remitente SMS activo para el país de destino.
2. La audiencia tenga consentimiento válido para SMS y números de teléfono disponibles.
3. El mensaje final identifique al negocio y tenga un propósito claro.
4. La estimación de partes de SMS sea aceptable después de personalizar.
5. Las respuestas lleguen al Inbox, equipo o playbook esperado.
6. Hayas probado la entrega, respuestas, enlaces, personalización y manejo de bajas.
7. Sepas dónde revisar los motivos de entrega y los reportes después del lanzamiento.

## Guías relacionadas

- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Códigos cortos exclusivos]({% link _numbers/exclusive-short-codes.md %})
- [Precios de SMS y tipos de número]({% link _billing/sms-pricing-and-number-types.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
