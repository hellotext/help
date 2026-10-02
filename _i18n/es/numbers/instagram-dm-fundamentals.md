Conecta Instagram cuando los clientes descubren tu negocio allí y esperan continuar por mensajes directos. Hellotext puede llevar las conversaciones elegibles de Instagram al Inbox para que el equipo, las misiones, las rutas y los agentes de IA respondan con contexto compartido.

Instagram DM es principalmente un canal conversacional iniciado por el cliente. Funciona distinto a los envíos de campañas por SMS y WhatsApp: que alguien siga tu cuenta o que conozcas su nombre de usuario no permite, por sí solo, iniciar un nuevo mensaje directo.

Para configurar el canal, sigue [Conecta Instagram DM]({% link _integrations/connect-instagram-dm.md %}). Esta guía explica qué ocurre después de conectarlo.

## Para qué sirve mejor Instagram DM

Usa Instagram DM para:

- Consultas sobre productos de personas que exploran tu perfil o contenido de Instagram.
- Conversaciones de soporte que empiezan como mensaje directo.
- Respuestas compatibles a una historia de Instagram.
- Agentes de IA reactivos y misiones reactivas que responden en el canal donde escribió el cliente.
- Rutas que hacen preguntas, recopilan contexto, crean ramas o asignan una conversación activa.
- Respuestas individuales desde el Inbox durante una conversación elegible.

Instagram DM no es actualmente una opción de envío en el creador de campañas. El creador ofrece sus opciones de SMS, WhatsApp y Correo según el acceso y la configuración disponibles; Instagram se usa en conversaciones y flujos compatibles. Confirma el tipo de misión o ruta, tu plan y tus permisos antes de depender de ese flujo.

## Cómo empiezan las conversaciones de Instagram

Un cliente inicia la conversación en Instagram enviando un mensaje directo o una respuesta compatible a una historia. Después, Hellotext:

1. Recibe la identidad de Instagram y el contenido compatible del mensaje.
2. Encuentra o crea el perfil del cliente correspondiente.
3. Agrega la identidad de Instagram a ese perfil del cliente.
4. Abre o actualiza la conversación privada en el Inbox.
5. Registra la conversación para la gestión que corresponda. Recibirla, asignar un responsable y responder son etapas distintas; aparecer en el Inbox no garantiza atención inmediata.

Un seguidor no queda disponible automáticamente para mensajes directos. El cliente primero debe crear una interacción elegible en Instagram para que Hellotext pueda responder por este canal.

Los mensajes enviados directamente desde la cuenta conectada también pueden sincronizarse cuando Meta proporciona la actividad compatible. Un eco de un envío o una respuesta a un botón conserva sus propias referencias; no equivale a una nueva entrada ordinaria del cliente. La sincronización no garantiza que aparezca todo el historial ni que la persona haya leído el mensaje.

## Entiende la ventana de mensajería

Meta aplica una ventana estándar de **24 horas** después de un mensaje elegible del cliente. Cada nueva entrada elegible del cliente vuelve a abrirla. Consulta los requisitos actuales en la [colección oficial de Instagram de Meta](https://www.postman.com/meta/instagram/folder/uxudqu0/send-api) y su [documentación de la ventana estándar](https://github.com/fbsamples/messenger-platform-samples/blob/354ee221ac1d081cc6105a1515a8468cc44f6710/postman/instagram-platform-api.postman_collection.json). Una excepción autorizada por Meta no implica que Hellotext ofrezca ese flujo.

Revisa la última entrada elegible del cliente a la cuenta conectada. Un mensaje saliente, un editor habilitado o el estado abierto del Inbox no reinician por sí solos la ventana de Meta. Hellotext puede mantener su ventana local abierta después de actividad saliente; Meta conserva la decisión final de aceptación. Cerrar, asignar o cambiar una regla de respuesta tampoco extiende las 24 horas.

A diferencia de WhatsApp, Instagram no usa en Hellotext una plantilla de mensaje aprobada para reiniciar una conversación cerrada. Cuando la ventana ya no está disponible, espera a que el cliente vuelva a escribir o continúa por otro canal solo cuando ese cliente sea elegible allí.

No uses otro canal para evitar las reglas de consentimiento o una conversación cerrada en Instagram. Cada destino debe cumplir sus propias reglas de disponibilidad y suscripción.

## Mensajes e interacciones compatibles con Hellotext

Hellotext puede procesar actividad compatible de mensajes directos de Instagram, como:

- Mensajes de texto compatibles, respetando la longitud que admite el editor y el límite de Meta para la operación concreta.
- Imágenes, videos, audios y archivos admitidos para la dirección y operación concretas; recibir un formato no garantiza que pueda enviarse de la misma forma.
- Mensajes de voz, stickers y respuestas a mensajes anteriores.
- Respuestas compatibles a historias.
- Respuestas rápidas, botones y tarjetas de producto creadas por misiones o flujos de mensajes compatibles.
- Actividad de lectura y reacciones cuando Meta las proporciona.

Los comentarios públicos, menciones en historias y contenido efímero no se tratan como conversaciones normales de Instagram DM en el Inbox. Valida la interacción exacta antes de depender de ella: una respuesta a historia necesita contenido y medios accesibles, y puede omitirse si no se pueden obtener. Recibir voz, un sticker o una reacción no garantiza todas las operaciones salientes de ese formato. Las tarjetas pueden consultar productos y crear enlaces; mostrarlas no prueba stock, reserva, pago o compra.

El envío de texto a Instagram usa texto plano; el formato enriquecido del editor común no garantiza negrita o cursiva en este canal. El formulario **Crear un enlace corto** es compartido con el compositor compatible. La figura se tomó desde **Mensaje** abierto desde SMS y muestra la URL ficticia **shop.example.test/returns** sin agregarla; no es una conversación de Instagram. **Agregar enlace corto** o Enter crea el recurso antes del guardado final; **Cancelar** descarta solo la URL pendiente. Un enlace creado no demuestra envío, clic ni compra.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Formulario compartido de enlace con URL ficticia sin agregar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 464px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/link-es-mobile.png 2x" width="728" height="428" />
        <img class="ht-editorial-visual__image" src="/images/numbers/message-editor-basics/link-es.png" srcset="/images/numbers/message-editor-basics/link-es.png 2x" width="892" height="388" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Formulario compartido de enlace con URL ficticia sin agregar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario compartido de enlace con URL ficticia sin agregar.</figcaption>
</figure>

## Gestiona conversaciones de Instagram en el Inbox

Las conversaciones de Instagram usan el mismo modelo de responsables del Inbox que los demás canales de clientes compatibles. Tu equipo puede:

- Responder desde la conversación activa de Instagram.
- Asignar o reasignar la conversación a una persona o equipo.
- Agregar contexto interno sin enviarlo al cliente.
- Cerrar la conversación cuando no se necesita otra acción.
- Reabrir el trabajo cuando llega un nuevo mensaje elegible del cliente.

Recibir una conversación no confirma responsable, pertenencia a un equipo, capacidad disponible, horario ni respuesta humana. Cerrar o posponer no responde al cliente ni cancela universalmente los trabajos pendientes o la IA.

Las reglas de respuesta permiten reconocer Instagram entre las tecnologías. Este menú muestra cinco opciones con **WhatsApp** resaltado: no se eligió Instagram ni se guardó una regla.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Instagram disponible en el menú de tecnología de reglas de respuesta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 463px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/technology-es-mobile.png 2x" width="742" height="464" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/technology-es.png" srcset="/images/team/understanding-response-times/technology-es.png 2x" width="890" height="464" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Instagram disponible en el menú de tecnología de reglas de respuesta" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Instagram disponible en el menú de tecnología de reglas de respuesta.</figcaption>
</figure>

La nueva regla siguiente no tiene tecnología elegida. Los dos **60** grises son placeholders, no minutos guardados. **Primera respuesta a nuevas conversaciones** y **Respuestas posteriores** son objetivos separados, sujetos a la política de respuesta y al horario del negocio. Guardar una regla no garantiza una respuesta ni amplía la ventana de Meta.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Regla nueva con objetivos de primera respuesta y respuestas posteriores vacíos">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/channel-es-mobile.png 2x" width="824" height="1098" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/channel-es.png" srcset="/images/team/understanding-response-times/channel-es.png 2x" width="972" height="1018" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Regla nueva con objetivos de primera respuesta y respuestas posteriores vacíos" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Regla nueva con objetivos de primera respuesta y respuestas posteriores vacíos.</figcaption>
</figure>

El canal activo importa. Valida la presentación exacta en un entorno de prueba autorizado; una vista previa no demuestra aceptación ni entrega.

Sigue leyendo: [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %}) y [Asigna conversaciones]({% link _team/assigning-conversations.md %}).

## Usa misiones, rutas y agentes de IA

Las misiones reactivas y los agentes de IA compatibles pueden admitir Instagram mediante sus controles de canales de entrada. El tipo, el flujo habilitado, sus herramientas, el acceso y los datos disponibles condicionan la respuesta, la recopilación, la recomendación o la derivación; activar el canal no crea herramientas ni permiso para enviar.

La figura muestra el control compartido **Canales de entrada** en un borrador independiente del Recolector de Propiedades: **Todos los canales de entrada** está seleccionado y **Selección manual** disponible. Instagram aparece en la descripción, pero no hay una selección manual guardada, cuenta conectada, mensaje recibido ni respuesta generada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Canales de entrada automáticos y selección manual en borrador independiente">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" srcset="/images/captures/property-collector/channels-es.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Canales de entrada automáticos y selección manual en borrador independiente" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Canales de entrada automáticos y selección manual en borrador independiente.</figcaption>
</figure>

Para un agente de IA, confirma que:

- Instagram esté incluido entre sus canales de entrada.
- Su conocimiento e instrucciones cubran las preguntas que hacen los clientes allí.
- Su destino de Derivación esté configurado para los casos que no puede resolver.
- Las respuestas y los límites del flujo concreto se validen en un entorno autorizado. El Playground puede guardar simulaciones o llamar a proveedores; no prueba identidad, consentimiento ni entrega real.

Las rutas pueden usar Instagram cuando el cliente, la cuenta, el canal y el paso concreto sean elegibles. Define qué debe ocurrir si la ventana deja de estar disponible, falta un destino utilizable o Meta rechaza el mensaje; seleccionar una ruta no garantiza envío.

**Asignación** permite abrir, cerrar o asignar una conversación y agregar o eliminar etiquetas. El orden de acciones importa y esas acciones no generan por sí mismas una respuesta. La figura es un formulario nuevo de una ruta independiente, sin guardar, conectar pasos ni ejecutar una conversación de Instagram.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cinco acciones de Asignación en un formulario nuevo sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-es.png" srcset="/images/team/ai-handoff-to-inbox/assignment-es.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Cinco acciones de Asignación en un formulario nuevo sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Cinco acciones de Asignación en un formulario nuevo sin guardar.</figcaption>
</figure>

Algunas misiones autónomas proactivas pueden considerar Instagram solo cuando el cliente ya tiene una identidad de Instagram disponible y el mensaje es elegible según las reglas de Meta y Hellotext. La misión conserva sus propias reglas de admisión, disponibilidad y preparación; Meta puede rechazar el envío. No existe una garantía común de permiso, horario, menor costo o entrega para todas las misiones.

Sigue leyendo: [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}) y [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Perfiles del cliente y consentimiento

Una conversación entrante de Instagram puede agregar una identidad de Instagram a un perfil del cliente. Hellotext usa el identificador de Instagram recibido para asociarlo al perfil del negocio. Conocer un nombre de usuario no crea esa identidad ni comprueba acceso a la cuenta. El identificador y la disponibilidad del destino no son un número de teléfono, una suscripción de WhatsApp ni permiso para marketing por otro canal.

Si el mismo cliente existe bajo otro perfil, revisa los datos antes de combinar los perfiles. Conserva la conversación, identificadores, propiedades e historial de compras correctos.

Los campos del perfil tampoco sustituyen la identidad de Instagram ni el permiso para un uso concreto. **Camila Torres** es un perfil ficticio **Sin confirmar**, con correo de ejemplo y sin teléfono. Esta figura independiente no muestra identidad de Instagram, conexión, consentimiento ni conversación recibida. La vista estrecha es un foco del perfil de escritorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Perfil ficticio sin confirmar con correo de ejemplo y sin teléfono">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Perfil ficticio sin confirmar con correo de ejemplo y sin teléfono" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil ficticio sin confirmar con correo de ejemplo y sin teléfono.</figcaption>
</figure>

Respeta las solicitudes de baja y bloqueo. Que un cliente escriba por Instagram no otorga permiso ilimitado para futuros mensajes salientes.

Sigue leyendo: [Perfiles de clientes]({% link _audience/customer-profiles.md %}) y [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Precios y uso

Los mensajes directos de Instagram se incluyen en el cálculo de mensajes que no son SMS de Hellotext. El importe variable se convierte en el cargo de Hellotext solo cuando es mayor que el mínimo del plan, la tarifa por performance y el importe de SMS del período de facturación.

Revisa [Política de uso justo de mensajes]({% link _billing/fair-use-message-policy.md %}) para consultar la tarifa canónica y el cálculo, y confirma las condiciones actuales en [precios de Hellotext](https://www.hellotext.com/precios). El importe variable no se suma a los otros tres si uno de ellos es mayor; los impuestos o un acuerdo personalizado se consideran por separado.

## Soluciona un mensaje de Instagram faltante o fallido

Si un mensaje entrante no aparece:

- Confirma que la cuenta profesional correcta de Instagram esté conectada y activa.
- Revisa una interacción privada existente y sus referencias antes de crear otra. Si hace falta una prueba nueva, usa un entorno autorizado y un destinatario con permiso y elegibilidad para esa prueba.
- Revisa que la interacción sea un DM o respuesta compatible a una historia y no un comentario, mención en historia o contenido efímero.
- Confirma que Hellotext todavía tenga los permisos solicitados de Instagram.
- Revisa si el perfil del cliente o la conversación están bloqueados.

Si una respuesta no se envía:

- Confirma que la ventana de mensajería todavía sea elegible.
- Revisa que la integración y el canal de Instagram estén activos.
- Revisa el motivo exacto del error antes de reintentar.
- Confirma la compatibilidad, el tipo, el tamaño y la longitud para esa operación; no extrapoles los límites de una imagen, un audio o un editor a todos los formatos.
- Evita reintentos repetidos cuando Meta haya rechazado el destino o estado de la conversación.

Distingue borrador, mensaje creado, aceptación de Meta, estado de entrega y lectura. Algunos estados de entrega en Hellotext se actualizan con el acuse de la API; no prueban por sí solos recepción o lectura por la persona. Un texto y un adjunto pueden tener resultados separados. Si el resultado es incierto, reconcilia el mensaje y sus referencias antes de repetirlo para evitar duplicados.

Consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) para usar el checklist compartido de entrega.

## Checklist para el primer lanzamiento de Instagram

Antes de depender de Instagram DM, confirma que:

1. La cuenta profesional correcta esté conectada y activa.
2. Una interacción existente o una prueba autorizada cree o actualice el perfil correcto y conserve las referencias de la cuenta y del cliente.
3. La conversación aparezca en el Inbox con la identidad de Instagram correcta.
4. Las personas, equipos, misiones, rutas o agentes de IA reciban la conversación como esperas.
5. El formato y los límites de textos, adjuntos, historias, botones y tarjetas se hayan validado para el flujo exacto; estos formularios no son resultados de esas pruebas.
6. El destino de Derivación, la asignación, la espera por capacidad y una respuesta se verifiquen por separado.
7. Tu equipo distinga la ventana de Meta, los objetivos de respuesta y los permisos de la cuenta, y sepa reconciliar un resultado incierto antes de reintentar.

## Guías relacionadas

- [Conecta Instagram DM]({% link _integrations/connect-instagram-dm.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %})
