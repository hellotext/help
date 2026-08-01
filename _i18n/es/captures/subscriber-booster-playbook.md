Usa esta guía cuando quieres que Hellotext convierta conversaciones relevantes con clientes en suscripciones claras y basadas en consentimiento.

Impulsor de Suscriptores es un playbook de captura con IA. Usa el contexto de una conversación activa para decidir cuándo una invitación a suscribirse puede ser útil, adapta la interacción a ese momento y recopila los datos del perfil que configures.

No es una ruta fija y no envía siempre la misma secuencia de suscripción. Puede intervenir cerca del comienzo de una conversación de Webchat o hacia el final de una conversación iniciada por el cliente en WhatsApp.

## Qué hace Impulsor de Suscriptores

Impulsor de Suscriptores ayuda a hacer crecer tu audiencia alcanzable sin separar la suscripción de la conversación que el cliente ya está teniendo.

Puede:

- Invitar a un visitante de Webchat a suscribirse cerca del comienzo de la conversación.
- Usar el teaser de Webchat para presentar un incentivo relevante para la primera compra antes de que el visitante abra el chat.
- Introducir una suscripción hacia el final de una conversación iniciada por el cliente en WhatsApp.
- Presentar un incentivo para una próxima compra cuando encaja con la conversación de WhatsApp.
- Pedir consentimiento explícito antes de marcar el perfil del cliente como suscrito.
- Usar su componente Recolector de Propiedades para recopilar las propiedades del perfil que selecciones.
- Evitar que el descuento ofrecido pueda ser canjeado más de una vez por el mismo cliente.

La IA usa el contexto de la conversación para que la invitación se sienta como un próximo paso útil y no como una interrupción sin relación.

## Cómo cambia el momento de entrada

Impulsor de Suscriptores puede participar en distintos momentos según cómo empezó la conversación.

### Al comienzo de Webchat

Para un visitante del sitio, el playbook puede usar el teaser de Webchat para ofrecer un incentivo para la primera compra. Al abrir el teaser comienza la conversación, donde la IA puede explicar la suscripción y pedir consentimiento.

Este camino funciona bien cuando el visitante es nuevo, todavía no compró y ya está evaluando si interactuar con el negocio.

Widget de Webchat debe estar habilitado e instalado para que los visitantes vean el teaser. Revisa [Playbook Widget de Webchat]({% link _captures/webchat-widget-playbook.md %}) antes de probar este camino.

### Al final de una conversación de WhatsApp

Cuando un cliente inicia una conversación de WhatsApp por otro motivo, Impulsor de Suscriptores puede esperar a que esa necesidad haya sido atendida y luego ofrecer la suscripción como un próximo paso relevante.

En este contexto, el incentivo puede presentarse para una compra futura. El playbook no debería reemplazar el motivo por el que el cliente contactó al negocio ni interrumpir una consulta de soporte o venta que todavía no fue resuelta.

No es un broadcast ni un mensaje saliente de suscripción no solicitado. Funciona dentro de una conversación iniciada por el cliente.

## Cómo trabaja con Recolector de Propiedades

Impulsor de Suscriptores incluye un componente Recolector de Propiedades dentro de su configuración.

Usa ese componente para seleccionar las propiedades del perfil que el playbook debería recopilar durante la suscripción, como nombre, teléfono, email o propiedades personalizadas disponibles en el negocio.

También puedes indicar qué propiedades deben recopilarse. Impulsor de Suscriptores pide solamente los datos configurados que todavía faltan en el perfil.

Recolector de Propiedades maneja esta parte de la conversación sin convertir la experiencia de suscripción en un formulario rígido. Mantén la recopilación lo suficientemente breve como para que el cliente entienda por qué cada respuesta es útil.

Para entender el modelo completo, revisa [Playbook Recolector de Propiedades]({% link _captures/property-collector-playbook.md %}).

## Consentimiento y protección del incentivo

La suscripción debería ocurrir solamente después de que el cliente la acepte claramente.

La conversación debería explicar:

- Que el cliente se está suscribiendo a mensajes promocionales.
- Qué canal se usará.
- Qué incentivo se ofrece, cuando corresponda.
- Que el cliente puede desuscribirse más adelante.

Impulsor de Suscriptores también protege la oferta contra usos repetidos: el descuento presentado por el playbook no puede ser canjeado más de una vez por el mismo cliente.

Esto permite usar un incentivo relevante sin otorgarlo repetidamente a la misma persona en conversaciones posteriores.

## Cuándo usarlo

Usa Impulsor de Suscriptores cuando:

- Los visitantes del sitio necesitan un motivo conversacional para suscribirse.
- Un incentivo para la primera compra puede ayudar a un visitante nuevo a dar el próximo paso.
- Los clientes ya inician conversaciones útiles con el negocio por WhatsApp.
- Quieres ofrecer una suscripción después de resolver la necesidad original del cliente en WhatsApp.
- Necesitas recopilar algunas propiedades del perfil junto con el consentimiento.
- Quieres que la IA adapte la invitación a la conversación en vez de seguir una ruta fija.

Usa un [Popup de Sitio Web]({% link _captures/website-popup.md %}) o un [Formulario de Sitio Web]({% link _captures/forms.md %}) cuando quieres una experiencia visual basada en formularios en vez de una conversación.

Usa un [Suscriptor por Código QR]({% link _captures/qr-codes.md %}) o un [Enlace Compartible]({% link _captures/shareable-link.md %}) cuando el cliente debería iniciar el opt-in desde un escaneo o link.

## Qué necesita antes de lanzarlo

Antes de habilitar Impulsor de Suscriptores, confirma:

- Widget de Webchat está habilitado, instalado y probado si quieres usar el teaser del sitio.
- WhatsApp está conectado y recibe conversaciones iniciadas por clientes si quieres usar el camino de WhatsApp.
- El lenguaje de consentimiento coincide con el canal y la experiencia que quieres ofrecer.
- El incentivo es válido y apropiado para una primera compra o una compra futura.
- Las propiedades seleccionadas en Recolector de Propiedades son útiles y tienen nombres claros.
- Tu equipo entiende cómo encaja Impulsor de Suscriptores junto con otros playbooks de venta o soporte.

## Qué puedes configurar

Abre **Playbooks**, haz clic en **Explorar playbooks**, busca el grupo **Capturas** y elige **Impulsor de Suscriptores**.

Concéntrate en:

- **Incentivo o descuento:** la oferta que Impulsor de Suscriptores puede presentar cuando suscribirse es relevante.
- **Recopilación de propiedades:** qué propiedades del perfil pedir y cuáles deben recopilarse.
- **Teaser de Webchat:** la invitación que aparece junto al lanzador de Webchat para el camino del sitio.

El momento de la conversación es contextual. No necesitas construir una secuencia fija para el comienzo o final de cada conversación.

## Cómo probarlo

Prueba ambos contextos de entrada con perfiles que representen la experiencia prevista.

Para Webchat:

- Abre el sitio como un visitante nuevo.
- Confirma que el teaser aparece con el incentivo esperado.
- Abre el teaser y continúa por la conversación de suscripción.
- Verifica que se pida consentimiento antes de marcar el perfil como suscrito.
- Confirma que las propiedades configuradas se pidan y guarden.

Para WhatsApp:

- Inicia una conversación como cliente por una necesidad realista de venta o soporte.
- Completa primero la tarea original.
- Confirma que Impulsor de Suscriptores introduzca la suscripción solo cuando sea un próximo paso útil.
- Verifica que el incentivo para una compra futura y el consentimiento sean claros.

También prueba con el mismo cliente después de canjear el descuento ofrecido. El playbook no debería permitirle canjearlo otra vez.

## Qué revisar después del lanzamiento

Revisa conversaciones reales en vez de asumir que todas las invitaciones deberían verse iguales.

Comprueba:

- Si el teaser de Webchat atrae visitantes que continúan hacia una conversación útil.
- Si las invitaciones a suscribirse aparecen en un momento natural.
- Si la necesidad original del cliente en WhatsApp se atiende antes de presentar la suscripción.
- Si los clientes entienden la solicitud de consentimiento.
- Si las propiedades configuradas se recopilan correctamente.
- Si el incentivo se entrega y queda protegido contra canjes repetidos.
- Si otro playbook activo debería manejar la conversación antes o después de Impulsor de Suscriptores.

Ajusta el incentivo, las propiedades seleccionadas o el teaser cuando las conversaciones muestren un motivo claro para hacerlo.

## Guías relacionadas

- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Playbook Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Playbook Recolector de Propiedades]({% link _captures/property-collector-playbook.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
