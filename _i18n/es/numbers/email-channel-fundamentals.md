Usa Correo electrónico cuando tus clientes necesiten un mensaje que puedan recibir y responder desde su aplicación de correo habitual. Tu equipo envía desde una dirección del dominio de tu negocio y gestiona las respuestas compatibles en el Inbox de Hellotext, junto a las demás conversaciones del cliente.

Esta guía explica el uso diario del canal de correo electrónico después de agregar un remitente. Para conocer el formulario del remitente, los registros DNS y la verificación del dominio, sigue [Configura el envío de correos]({% link _integrations/set-up-email-sending.md %}).

<div class="note">
  Correo electrónico está disponible en Enterprise. El dominio de un remitente guardado debe terminar de verificarse antes de que su canal esté disponible para enviar.
</div>

## Para qué sirve mejor el correo electrónico

Usa Correo electrónico para:

- Conversaciones individuales con clientes desde el Inbox.
- Respuestas detalladas que necesitan párrafos y un registro escrito.
- Soporte y seguimiento de pedidos con clientes que prefieren el correo.
- Compartir documentos, imágenes y otros archivos compatibles.
- Continuar una conversación después de que el cliente responda a un correo enviado desde Hellotext.

El correo electrónico no requiere que el cliente instale una aplicación de mensajería ni que tenga un número de teléfono en su perfil. Sí necesitas la dirección correcta y permiso para contactar al cliente con el propósito del mensaje.

## Antes de usar el canal

Confirma que:

- Estás trabajando en el negocio correcto de Hellotext.
- El negocio tiene Correo electrónico habilitado y al menos un remitente de correo verificado y activo.
- El perfil del cliente contiene la dirección de correo que quieres usar.
- Tienes acceso a la conversación de ese cliente en el Inbox.
- El cliente y la conversación están disponibles para el contacto que quieres realizar.
- Alguien de tu equipo es responsable de gestionar las respuestas.

La integración del remitente y la dirección de correo del cliente cumplen funciones distintas. Agregar un remitente no agrega direcciones de correo a los perfiles de clientes. Agregar la dirección de un cliente no verifica tu dominio de envío ni establece el consentimiento de ese cliente.

Sigue leyendo: [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %}) y [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Dónde puedes usar correo electrónico

El Inbox ofrece un destino de correo electrónico para los clientes que tienen una dirección de correo cuando el negocio cuenta con un remitente de correo activo.

Correo electrónico no es actualmente una opción de canal en el creador de campañas ni en los selectores de canales de agentes de IA personalizados y misiones autónomas. Conectar un remitente no agrega Correo electrónico a esos selectores ni cambia los canales de envío de una campaña o una misión existente.

El envío de correos mediante rutas tampoco está disponible actualmente, aunque Correo electrónico aparezca en el selector de canales de una ruta. Usa el Inbox para las conversaciones de correo que se describen en esta guía.

## Entiende el remitente, el destinatario y la dirección de respuesta

Una conversación por correo utiliza tres direcciones o identidades:

| Dato | Qué significa | De dónde proviene |
| --- | --- | --- |
| **Remitente** | El nombre y la dirección de correo del negocio que aparecen como remitente del mensaje. | El remitente de correo asociado al canal de correo electrónico activo. |
| **Destinatario** | La dirección del cliente que recibirá este mensaje. | La dirección de correo que eliges del perfil del cliente en el menú de destino. |
| **Dirección de respuesta** | La dirección que utiliza la aplicación de correo del cliente cuando elige Responder. | Hellotext la proporciona automáticamente para asociar la respuesta con la conversación. |

Por ejemplo, tu remitente puede ser `support@acme.com` y tu cliente puede recibir el mensaje en `alex@example.com`. La dirección de respuesta puede ser distinta de `support@acme.com`; así recibe Hellotext la respuesta para la conversación.

El menú de destino muestra las direcciones de correo del cliente. No es una lista de los remitentes de tu negocio. Cuando eliges una dirección, Hellotext usa el remitente activo de la conversación de correo existente, si está disponible, o un canal de correo electrónico disponible para un destino nuevo.

Si tu negocio tiene varios remitentes activos, verifica cuál se utiliza antes de depender de una dirección de origen específica. El menú de destino del Inbox no ofrece actualmente un selector separado de remitentes de correo.

Para cambiar el nombre o la dirección de un remitente, usa su acción **Editar** en **Ajustes > Integraciones**. Cambiar su dominio requiere una nueva verificación. Consulta [Configura el envío de correos]({% link _integrations/set-up-email-sending.md %}) antes de realizar ese cambio.

## Envía un correo desde el Inbox

1. Abre la conversación del cliente en el **Inbox**.
2. Revisa el perfil del cliente y confirma que la dirección de correo sea correcta. Agrega o corrige la dirección en el perfil si es necesario.
3. Abre el menú de destino junto al editor de mensajes.
4. Busca el grupo **Correo electrónico**.
5. Selecciona la dirección del cliente a la que quieres enviar. Si el perfil tiene más de una, elige la que debe recibir este mensaje.
6. Escribe tu mensaje. Usa párrafos claros, agrega los links necesarios y adjunta archivos compatibles cuando haga falta.
7. Comprueba que Correo electrónico esté seleccionado antes de enviar, especialmente si antes estabas respondiendo por otro canal.
8. Envía el mensaje y revisa su información de envío o entrega en la conversación.

Seleccionar una dirección de correo envía el mensaje a ese destino. No envía copias a todas las direcciones del perfil. El menú de destino de correo electrónico no ofrece campos CC ni CCO.

Si Correo electrónico es el único destino disponible del cliente, Hellotext puede abrir el editor con ese canal seleccionado cuando hay un remitente activo. Revisa siempre el destino si el cliente también tiene números de teléfono u otros canales conectados.

Si falta el grupo Correo electrónico, revisa la dirección del perfil y la activación del remitente antes de intentar enviar. Un dominio pendiente de verificación no ofrece un canal de envío activo.

Sigue leyendo: [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}).

## Qué recibe el cliente

Hellotext presenta el mensaje como un correo con el nombre del negocio, el cuerpo del mensaje y un pie que muestra el nombre y la dirección del remitente. También incluye una versión de texto sin formato para las aplicaciones de correo que la utilizan.

El asunto actual del correo usa el nombre del negocio. El editor del Inbox no ofrece un campo de asunto separado para cada mensaje. El nombre del remitente proviene de su integración; no cambia automáticamente al nombre de la persona del equipo que hizo clic en enviar.

El cuerpo usa el texto y los saltos de párrafo de tu mensaje. No dependas de que los estilos copiados, el HTML personalizado o los controles interactivos de otro canal se vean exactamente igual en el correo. Los archivos se entregan como adjuntos y la aplicación de correo del cliente controla cómo se previsualizan o descargan.

El diseño se adapta a pantallas más pequeñas, pero distintas aplicaciones de correo pueden mostrar el mismo mensaje de manera diferente. Revisa un mensaje recibido real para evaluar la apariencia, los saltos de línea y los adjuntos.

### Links y personalización

Usa la herramienta de links del editor cuando necesites un link con seguimiento y comprueba su destino antes de enviar. Usa etiquetas de personalización solo cuando el perfil del cliente tenga los valores necesarios para producir un mensaje completo.

Revisa el texto final con datos realistas de clientes. Un nombre faltante, una dirección desactualizada o un link que lleva al producto equivocado pueden hacer que un correo entregado correctamente no resulte útil.

Sigue leyendo: [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}) y [Etiquetas de personalización]({% link _audience/personalization-tags.md %}).

## Longitud del texto y archivos adjuntos

El correo electrónico permite textos más largos que una respuesta breve de chat, pero el editor sigue aplicando límites:

| Elemento | Límite o comportamiento |
| --- | --- |
| **Texto del mensaje** | Hasta 100.000 caracteres en el editor de correo electrónico. |
| **Una imagen cargada** | Hasta 25 MB por archivo. |
| **Un documento cargado** | Hasta 25 MB por archivo. |
| **Un archivo de audio o video cargado** | Hasta 25 MB por archivo. |
| **Varios adjuntos** | Cada archivo debe ser aceptado al cargarlo. El correo completo también debe respetar los límites de tamaño de mensaje de los servicios de envío y recepción. |

Que la carga de un archivo se acepte no garantiza que el servicio de correo de cada destinatario acepte el mensaje completo. Varios archivos grandes pueden hacer que el correo sea demasiado pesado, aunque cada archivo esté permitido por separado. Usa archivos más pequeños o comparte un link de descarga adecuado cuando no sea necesario incluir el archivo completo en el mensaje.

Los tipos de archivo compatibles incluyen:

- **Imágenes:** JPEG, PNG, GIF, WebP, AVIF, HEIC, HEIF, BMP, TIFF y SVG.
- **Documentos:** PDF, Word, Excel, PowerPoint, archivos OpenDocument, RTF, texto sin formato y CSV.
- **Audio:** archivos compatibles AAC, audio MP4, MP3, AMR, Ogg, Opus, WAV, FLAC y audio WebM.
- **Video:** archivos compatibles MP4, MPEG, 3GP, QuickTime, WebM y AVI.
- **Otros archivos:** archivos compatibles ZIP, Gzip, EPUB, JSON, XML, HTML, de calendario y de contactos.

Elige un tipo de archivo compatible y mantén cada archivo dentro del límite de tamaño. Si se rechaza un archivo, usa una exportación compatible o comparte un link adecuado. Cambiar solo la extensión del nombre no convierte el archivo.

Usa el control de adjuntos del editor, espera a que termine la carga y confirma que los archivos correctos estén adjuntos antes de enviar. Revisa sus nombres y contenidos para enviar la versión correcta al cliente correcto.

## Cómo llegan las respuestas del cliente al Inbox

Después de recibir un correo enviado desde Hellotext, el cliente debe:

1. Abrir el mensaje en su aplicación de correo habitual.
2. Elegir **Responder**.
3. Mantener la dirección de respuesta que proporciona la aplicación de correo.
4. Responder desde la misma dirección que recibió el mensaje.

Hellotext asocia una respuesta compatible con el correo saliente original, el perfil del cliente y la conversación. Tu equipo puede leerla y responder desde el Inbox.

Una respuesta puede incluir texto y adjuntos compatibles. El Inbox muestra el contenido y los archivos con su presentación habitual de mensajes. No reproduce el diseño HTML completo del correo del cliente como una vista de su casilla.

### Respuestas desde otra dirección

Para asociar una respuesta se espera la dirección del destinatario original. Si el cliente responde desde otra cuenta, o reenvía el correo a otra persona que luego responde, es posible que no se cree un mensaje asociado en el Inbox.

Cuando pruebes las respuestas, usa la misma dirección que recibió el correo y no cambies la dirección de respuesta proporcionada. El asunto del correo por sí solo no alcanza para asociar cualquier mensaje con la conversación.

### Correos nuevos enviados a la casilla existente de tu negocio

Verificar un dominio de envío no traslada una casilla existente a Hellotext. Un correo nuevo escrito directamente a `support@acme.com` sigue la configuración de recepción que ya tenga esa dirección.

Enviar desde esa dirección en Hellotext y recibir respuestas mediante la dirección de respuesta proporcionada son funciones distintas de importar el historial de una casilla o recibir todos los correos nuevos enviados al dominio. Si necesitas una configuración más amplia de recepción, consúltala con el [soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Responsables de la conversación y ventanas de respuesta

Las conversaciones de correo usan el flujo de trabajo compartido del Inbox. El equipo puede asignar el trabajo, agregar notas internas, cerrar una conversación y gestionar las respuestas posteriores con el historial del cliente disponible.

El correo electrónico no tiene una ventana de respuesta de 24 horas. El canal no deja de estar disponible simplemente porque el cliente no haya escrito recientemente. El remitente debe seguir activo, y el cliente, la conversación, la suscripción y las demás condiciones de envío deben permitir el mensaje que quieres enviar.

Cerrar o posponer una conversación del Inbox es una acción del flujo de trabajo del equipo. Es independiente de la capacidad de envío del canal de correo electrónico. Una nueva respuesta compatible del cliente puede devolver la conversación a la atención del equipo.

Sigue leyendo: [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %}) y [Asigna conversaciones]({% link _team/assigning-conversations.md %}).

## Estado de suscripción y solicitudes de baja

La dirección de correo de un cliente es un destino, no una prueba de que quiera recibir mensajes de marketing. Revisa la información de suscripción del perfil y el propósito del contacto antes de enviar.

Un correo habitual enviado manualmente desde el Inbox no incluye automáticamente un link para cancelar la suscripción en su pie. Si el cliente pide al equipo dejar de recibir mensajes de marketing, registra la solicitud con los controles de suscripción del cliente y sigue el proceso de consentimiento del negocio.

En un correo que incluye un link **Cancelar suscripción**, el cliente abre una página de confirmación y presiona **Cancelar suscripción** para enviar la solicitud. Luego, la página muestra **Solicitud recibida** mientras Hellotext procesa la actualización de preferencias. Abrir el link por sí solo no envía la solicitud de baja.

<div class="note">
  Una baja por correo actualiza el estado de suscripción del cliente para ese negocio de Hellotext en todos los canales. No se limita a una dirección de correo ni solamente al canal de correo electrónico.
</div>

Cancelar la suscripción no elimina el perfil del cliente ni su historial de conversaciones. No cambies a otro canal para evitar la preferencia registrada.

Si Hellotext recibe una queja de spam o abuso por un correo enviado, registra la baja del cliente y conserva el estado de entrega existente del mensaje. Un correo rebotado o rechazado se trata como un fallo de entrega; no equivale a una solicitud de baja.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Entiende la información de envío, entrega y lectura

La conversación puede mostrar varios tipos de información del mensaje a medida que llegan las actualizaciones:

| Información | Qué indica |
| --- | --- |
| **Enviando** | Hellotext está procesando el mensaje saliente. |
| **Enviado** | El mensaje se pasó al servicio de envío. Esto por sí solo no confirma la entrega al destinatario. |
| **Entregado** | El servicio de correo del destinatario aceptó el mensaje. No garantiza que aparezca en la bandeja de entrada principal. |
| **Leído** | Se recibió una notificación de apertura del correo. No demuestra que el cliente haya leído o entendido el mensaje. |
| **Fallo al enviar** | No se pudo completar el envío o se informó un rechazo o rebote. |
| **Recibido** | Se registró una respuesta compatible del cliente en la conversación. |

La información de entrega y apertura puede llegar por separado. Que no haya una hora de lectura no demuestra que el cliente no haya abierto el correo. Una respuesta del cliente u otra acción explícita son señales más claras de interacción.

Revisa la información del mensaje y cualquier motivo de fallo disponible antes de volver a enviarlo. Algunos fallos solo proporcionan un error general, por lo que no debes esperar un diagnóstico detallado de la casilla para cada correo que no se entrega.

Sigue leyendo: [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Soluciona problemas de una conversación por correo

### Correo electrónico no aparece en el menú de destino

Comprueba que el perfil del cliente tenga una dirección de correo y que el negocio tenga un remitente verificado y activo. Si el remitente se agregó recientemente o se cambió su dominio, sigue sus instrucciones DNS y espera a que termine la verificación.

Si Correo electrónico es el único destino del perfil y no hay un remitente de correo activo, la conversación no puede ofrecer un editor de correo utilizable. Revisa la configuración del remitente en lugar de agregar repetidamente la misma dirección del cliente.

### El mensaje usó un remitente o un asunto inesperados

El menú de destino elige el destinatario. El remitente proviene del canal de correo electrónico y el asunto actual proviene del nombre del negocio.

Revisa el nombre y la dirección del remitente en **Ajustes > Integraciones**. Si tienes varios remitentes, comprueba qué canal usó la conversación. Contacta al soporte si necesitas ayuda para identificar el remitente antes de enviar más mensajes.

### El cliente no encuentra un correo enviado

Confirma la dirección exacta del destinatario y revisa si el mensaje tiene información de entrega o un fallo. Pide al cliente que revise la carpeta de spam o correo no deseado, además de su bandeja de entrada habitual.

Si el correo todavía se está enviando, espera a que termine el procesamiento. Si falló, revisa el motivo disponible, corrige el destino o el contenido cuando corresponda y comprueba el tamaño total de los adjuntos antes de volver a intentarlo.

### La respuesta del cliente no aparece

Confirma que el cliente haya respondido a un correo enviado desde Hellotext, que haya usado la dirección de respuesta proporcionada y que haya respondido desde la dirección del destinatario original. Revisa que el canal de envío siga activo y que el cliente o la conversación no se hayan bloqueado o eliminado.

Las respuestas entrantes también deben superar las comprobaciones de recepción. Si una respuesta sigue sin aparecer, contacta al soporte con el mensaje original, la dirección del destinatario, la hora aproximada de la respuesta y si incluía adjuntos. No necesitas volver a crear el remitente solo para investigar una respuesta faltante.

### Un adjunto falla o se ve diferente

Revisa el tipo y el tamaño de archivo aceptados, confirma que la carga haya terminado y prueba una exportación compatible más pequeña cuando sea necesario. La apariencia del archivo en la aplicación de correo del cliente puede diferir de su vista previa en Hellotext.

Para un documento o archivo multimedia grande, considera compartir un link de descarga adecuado. Mantén el acceso al archivo enlazado apropiado para el cliente al que se dirige.

## Checklist para la primera conversación por correo

Antes de que tu equipo dependa del correo electrónico, confirma que:

1. El remitente elegido esté verificado y activo en el negocio correcto.
2. La dirección de un cliente de prueba esté guardada correctamente en su perfil.
3. Seleccionar esa dirección envíe a través de Correo electrónico.
4. El mensaje recibido muestre el remitente, el nombre del negocio, el texto y los adjuntos esperados.
5. Una respuesta desde la misma dirección del destinatario aparezca en la conversación correcta del Inbox.
6. La persona o el equipo adecuados se hagan responsables de la respuesta.
7. Tu equipo entienda la selección del remitente, la información de entrega y el alcance de las solicitudes de baja.

## Guías relacionadas

- [Configura el envío de correos]({% link _integrations/set-up-email-sending.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
