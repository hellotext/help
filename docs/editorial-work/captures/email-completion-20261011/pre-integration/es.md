Usa Correo electrónico cuando tus clientes necesiten un mensaje que puedan recibir y responder desde su aplicación de correo habitual. Tu equipo envía desde una dirección del dominio de tu negocio y gestiona las respuestas compatibles en el Inbox de Hellotext, junto a las demás conversaciones del cliente.

Esta guía explica el uso diario del canal de correo electrónico después de agregar un remitente. Para conocer el formulario del remitente, los registros DNS y la verificación del dominio, sigue [Configura el envío de correos]({% link _integrations/set-up-email-sending.md %}).

<div class="note">
  Correo electrónico está disponible en Pro y Enterprise. El dominio de un remitente guardado debe terminar de verificarse antes de que su canal esté disponible para enviar.
</div>

## Para qué sirve mejor el correo electrónico

Usa Correo electrónico para:

- Conversaciones individuales con clientes desde el Inbox.
- Respuestas detalladas que necesitan párrafos y un registro escrito.
- Soporte y seguimiento de pedidos con clientes que prefieren el correo.
- Compartir imágenes e información, con links a documentos cuando haga falta.
- Continuar una conversación después de que el cliente responda a un correo enviado desde Hellotext.

El correo electrónico no requiere que el cliente instale una aplicación de mensajería ni que tenga un número de teléfono en su perfil. Sí necesitas la dirección correcta y permiso para contactar al cliente con el propósito del mensaje.

## Antes de enviar desde el Inbox

Antes de enviar un correo individual desde el Inbox, confirma que:

- Estás trabajando en el negocio correcto de Hellotext.
- El negocio tiene Correo electrónico habilitado y al menos un remitente de correo verificado y activo.
- El perfil del cliente contiene la dirección de correo que quieres usar.
- Tienes acceso a la conversación de ese cliente en el Inbox.
- El cliente y la conversación están disponibles para el contacto que quieres realizar.
- Alguien de tu equipo es responsable de gestionar las respuestas.

La integración del remitente y la dirección de correo del cliente cumplen funciones distintas. Agregar un remitente no agrega direcciones de correo a los perfiles de clientes. Agregar la dirección de un cliente no verifica tu dominio de envío ni establece el consentimiento de ese cliente.

Sigue leyendo: [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %}) y [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Dónde puedes usar correo electrónico

El menú de destino del Inbox puede mostrar **Email** antes de que el envío esté listo. Para enviar necesitas una dirección en el perfil del cliente, acceso al canal y un remitente activo; ver la opción no confirma esos requisitos.

El creador de campañas muestra Correo electrónico como opción de entrega, pero seleccionarla por sí sola no habilita el envío. Para enviar una campaña por correo, el negocio necesita acceso al canal según su suscripción y un remitente verificado y activo. Conectar un remitente no cambia automáticamente los canales de una campaña existente.

Las rutas pueden enviar correos desde pasos de Mensaje o Pregunta configurados con un diseño de correo, y las misiones proactivas compatibles pueden seleccionar este canal. Cada envío depende de las reglas del flujo, de un destinatario apto y del acceso y remitente del negocio. Usa el Inbox para conversaciones individuales por correo y para gestionar las respuestas compatibles.

## Entiende el remitente, el destinatario y la dirección de respuesta

Una conversación por correo utiliza tres direcciones o identidades:

| Dato | Qué significa | De dónde proviene |
| --- | --- | --- |
| **Remitente** | El nombre y la dirección de correo del negocio que aparecen como remitente del mensaje. | El remitente de correo asociado al canal de correo electrónico activo. |
| **Destinatario** | La dirección del cliente que recibirá este mensaje. | La dirección de correo que eliges del perfil del cliente en el menú de destino. |
| **Dirección de respuesta** | La dirección que utiliza la aplicación de correo del cliente cuando elige Responder. | Hellotext la proporciona automáticamente para asociar la respuesta con la conversación. |

Por ejemplo, tu remitente puede ser `support@example.com` y tu cliente puede recibir el mensaje en `alex@example.com`. La dirección de respuesta puede ser distinta de `support@example.com`; así recibe Hellotext la respuesta para la conversación.

El menú de destino muestra las direcciones de correo del cliente. No es una lista de los remitentes de tu negocio. Cuando eliges una dirección, Hellotext usa el remitente activo de la conversación de correo existente, si está disponible, o un canal de correo electrónico disponible para un destino nuevo.

Si tu negocio tiene varios remitentes activos, verifica cuál se utiliza antes de depender de una dirección de origen específica. El menú de destino del Inbox no ofrece actualmente un selector separado de remitentes de correo.

Para cambiar el nombre o la dirección de un remitente, usa su acción **Editar** en **Ajustes > Integraciones**. Cambiar su dominio requiere una nueva verificación. Consulta [Configura el envío de correos]({% link _integrations/set-up-email-sending.md %}) antes de realizar ese cambio.

## Envía un correo desde el Inbox

1. Abre la conversación del cliente en el **Inbox**.
2. Revisa el perfil del cliente y confirma que la dirección de correo sea correcta. Agrega o corrige la dirección en el perfil si es necesario.
3. Abre el menú de destino junto al editor de mensajes.
4. Busca la opción **Email**.
5. Selecciona la dirección del cliente a la que quieres enviar. Si el perfil tiene más de una, elige la que debe recibir este mensaje.
6. Escribe el **Asunto** y prepara el cuerpo en el editor de correo. Organiza el contenido en bloques de texto y agrega imágenes o acciones cuando ayuden al cliente.
7. Abre **Vista previa** para revisar el diseño en escritorio y móvil. Comprueba el destinatario, el asunto, el texto y los links antes de enviar, especialmente si antes estabas respondiendo por otro canal.
8. Envía el mensaje y revisa su información de envío o entrega en la conversación.

Al enviar, se usa únicamente la dirección seleccionada. No se envían copias a todas las direcciones del perfil. El menú de destino de correo electrónico no ofrece campos CC ni CCO.

Si Correo electrónico es el único destino disponible del cliente, Hellotext puede abrir el editor con ese canal seleccionado cuando hay un remitente activo. Revisa siempre el destino si el cliente también tiene números de teléfono u otros canales conectados.

Si no puedes enviar por Email, revisa la dirección del perfil, el acceso de tu plan y la activación del remitente. Un dominio pendiente de verificación no ofrece un canal de envío activo, aunque el menú permita explorar la opción Email.

Sigue leyendo: [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}).

## Qué recibe el cliente

Hellotext prepara el correo a partir del diseño que editaste. La apariencia elegida aporta la marca y el pie del mensaje; el nombre y la dirección del remitente provienen del canal de correo. También se incluye una versión de texto sin formato para las aplicaciones de correo que la utilizan.

Usa **Asunto** para escribir el título del correo. Es independiente del cuerpo y del nombre del remitente; este último no cambia automáticamente al nombre de la persona del equipo que hizo clic en enviar.

El cuerpo conserva los bloques del diseño, como texto, imágenes y botones. Las imágenes que agregas al diseño aparecen dentro del correo; no se ofrecen automáticamente como archivos adjuntos descargables. No dependas de que los estilos copiados o los controles de otro canal se vean exactamente igual.

Usa **Vista previa** para revisar el borrador sin enviarlo y alterna entre escritorio y móvil. Distintas aplicaciones de correo pueden mostrar el mismo diseño de manera diferente; una prueba recibida te permite comprobar la apariencia final, los saltos de línea y los links.

El pie de la vista previa puede mostrar **Cancelar suscripción**. En un correo manual del Inbox ese enlace no se agrega automáticamente al envío.

### Links y personalización

Usa la herramienta de links del editor cuando necesites un link con seguimiento y comprueba su destino antes de enviar. Usa etiquetas de personalización solo cuando el perfil del cliente tenga los valores necesarios para producir un mensaje completo.

Revisa el texto final con datos realistas de clientes. Un nombre faltante, una dirección desactualizada o un link que lleva al producto equivocado pueden hacer que un correo entregado correctamente no resulte útil.

Sigue leyendo: [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}) y [Etiquetas de personalización]({% link _audience/personalization-tags.md %}).

## Longitud del texto y archivos adjuntos

El editor de correo organiza el contenido en bloques. Usa sus controles de imagen; la lista de archivos de otros canales no describe lo que puedes agregar a este diseño.

| Elemento | Límite o comportamiento |
| --- | --- |
| **Asunto** | Hasta 998 caracteres. |
| **Texto con formato** | Se valida por bloque; el formato también ocupa espacio. Simplifica o divide un bloque si el editor rechaza su longitud. |
| **Bloques principales** | Hasta 30 en el diseño. |
| **Una imagen cargada** | PNG, JPEG, GIF o WebP de hasta 5 MB. Se incorpora al cuerpo del correo. |
| **Documentos, audio o video** | Comparte un link adecuado; el editor de correo actual no ofrece la carga general de estos archivos como adjuntos. |

El límite del texto con formato no equivale a un número fijo de caracteres para todo el correo. También se valida el tamaño conjunto del diseño. Mantén el mensaje breve y divide la información en bloques útiles, sin repetir contenido.

Espera a que termine la carga de cada imagen y revisa su contenido en **Vista previa**. Que una imagen se acepte no garantiza que todos los servicios de correo acepten el mensaje completo. Usa imágenes más pequeñas cuando sea posible.

Para compartir un documento o un archivo grande, agrega un link de descarga y comprueba que el cliente tenga acceso. Cambiar solo la extensión de un archivo no lo convierte a un formato compatible.

## Cómo llegan las respuestas del cliente al Inbox

Después de recibir un correo enviado desde Hellotext, el cliente debe:

1. Abrir el mensaje en su aplicación de correo habitual.
2. Elegir **Responder**.
3. Mantener la dirección de respuesta que proporciona la aplicación de correo.
4. Responder desde la misma dirección que recibió el mensaje.

Hellotext asocia una respuesta compatible con el correo saliente original, el perfil del cliente y la conversación. Tu equipo puede leerla y responder desde el Inbox.

Una respuesta puede incluir texto y adjuntos compatibles. El Inbox conserva elementos compatibles del correo recibido, como imágenes, tablas y listas, y puede agrupar el texto citado de mensajes anteriores. Algunos estilos o elementos del correo original pueden mostrarse de otra forma.

### Respuestas desde otra dirección

Para asociar una respuesta se espera la dirección del destinatario original. Si el cliente responde desde otra cuenta, o reenvía el correo a otra persona que luego responde, es posible que no se cree un mensaje asociado en el Inbox.

Cuando pruebes las respuestas, usa la misma dirección que recibió el correo y no cambies la dirección de respuesta proporcionada. El asunto del correo por sí solo no alcanza para asociar cualquier mensaje con la conversación.

### Correos nuevos enviados a la casilla existente de tu negocio

Verificar un dominio de envío no traslada una casilla existente a Hellotext. Un correo nuevo escrito directamente a `support@example.com` sigue la configuración de recepción que ya tenga esa dirección.

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

El menú de destino elige el destinatario. El remitente proviene del canal de correo electrónico; el asunto se escribe en **Asunto**. Revisa ese campo antes de enviar, también cuando respondes a un correo anterior.

Revisa el nombre y la dirección del remitente en **Ajustes > Integraciones**. Si tienes varios remitentes, comprueba qué canal usó la conversación. Contacta al soporte si necesitas ayuda para identificar el remitente antes de enviar más mensajes.

### El cliente no encuentra un correo enviado

Confirma la dirección exacta del destinatario y revisa si el mensaje tiene información de entrega o un fallo. Pide al cliente que revise la carpeta de spam o correo no deseado, además de su bandeja de entrada habitual.

Si el correo todavía se está enviando, espera a que termine el procesamiento. Si falló, revisa el motivo disponible, corrige el destino o el contenido cuando corresponda y reduce las imágenes o simplifica el diseño si el tamaño impide el envío.

### La respuesta del cliente no aparece

Confirma que el cliente haya respondido a un correo enviado desde Hellotext, que haya usado la dirección de respuesta proporcionada y que haya respondido desde la dirección del destinatario original. Revisa que el canal de envío siga activo y que el cliente o la conversación no se hayan bloqueado o eliminado.

Las respuestas entrantes también deben superar las comprobaciones de recepción. Si una respuesta sigue sin aparecer, contacta al soporte con el mensaje original, la dirección del destinatario, la hora aproximada de la respuesta y si incluía adjuntos. No necesitas volver a crear el remitente solo para investigar una respuesta faltante.

### Un adjunto falla o se ve diferente

En el editor de correo, agrega las imágenes mediante sus bloques de imagen. Comprueba que sean PNG, JPEG, GIF o WebP de hasta 5 MB y espera a que termine la carga. Una imagen del diseño se muestra dentro del correo; su apariencia puede variar entre aplicaciones.

Para un documento o archivo multimedia grande, considera compartir un link de descarga adecuado. Mantén el acceso al archivo enlazado apropiado para el cliente al que se dirige.

## Checklist para la primera conversación por correo

Antes de que tu equipo dependa de las conversaciones por correo en el Inbox, confirma que:

1. El remitente elegido esté verificado y activo en el negocio correcto.
2. La dirección de un cliente de prueba esté guardada correctamente en su perfil.
3. El destino seleccionado sea Email y muestre la dirección correcta.
4. El mensaje de prueba recibido muestre el remitente, el asunto, el diseño, las imágenes y los links esperados.
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
