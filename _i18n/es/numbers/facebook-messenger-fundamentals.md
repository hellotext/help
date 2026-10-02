Conecta Facebook Messenger cuando los clientes usan tu página de Facebook para consultar sobre productos, compras o soporte. Hellotext puede llevar las conversaciones elegibles de la página al Inbox para que tu equipo, las rutas y las misiones compatibles respondan con contexto compartido.

Messenger en Hellotext está asociado a una página de Facebook. Es independiente de las conversaciones personales de Messenger y de la integración de Instagram.

Para configurar el canal, sigue [Conecta Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %}). Esta guía explica qué ocurre después de conectarlo.

## Para qué sirve mejor Facebook Messenger

Usa Messenger para:

- Consultas sobre productos y soporte enviadas a tu página de Facebook.
- Respuestas individuales desde el Inbox durante una conversación elegible.
- Respuestas rápidas, botones e interacciones postback compatibles.
- Rutas que envían mensajes, hacen preguntas, crean ramas o asignan una conversación activa.
- Misiones que incluyen compatibilidad explícita con Messenger.
- Mantener el historial de conversaciones de la página disponible para el equipo en Hellotext.

Seguir una página no hace que un cliente quede disponible automáticamente en Messenger. El cliente primero debe crear una interacción elegible con la página para que Hellotext pueda responder mediante esa identidad asociada a la página.

## Conoce el alcance actual de la automatización

Messenger no tiene actualmente la misma cobertura de producto que WhatsApp o Instagram DM:

- No es una opción de envío en el creador de campañas.
- No está disponible actualmente en **Canales de entrada** para un agente de IA personalizado.
- Las rutas y las misiones pueden usar Messenger solamente cuando ese flujo específico sea compatible.

Confirma la compatibilidad de la misión o ruta exacta, sus controles, tu plan y tus permisos antes de depender de ella. Tener una identidad de Messenger en el perfil no garantiza que un flujo pueda admitir al cliente, generar una respuesta o enviarla.

## Cómo empiezan las conversaciones de Messenger

Un cliente inicia una conversación elegible enviando un mensaje a la página de Facebook conectada o usando una interacción compatible de Messenger. Después, Hellotext:

1. Recibe la identidad de Messenger asociada a la página y el contenido compatible del mensaje.
2. Encuentra o crea el perfil del cliente correspondiente.
3. Agrega esa identidad de Messenger al perfil del cliente.
4. Abre o actualiza la conversación privada en el Inbox.
5. Registra la conversación para la gestión que corresponda. La recepción, la asignación a un responsable y la respuesta son etapas distintas; la presencia en el Inbox no garantiza atención inmediata.

La identidad está asociada a la página de Facebook conectada. No es un identificador general de Facebook que pueda reutilizarse con otra página.

Los mensajes enviados directamente como la página conectada también pueden sincronizarse cuando Meta proporciona la actividad compatible. Estos mensajes salientes y las respuestas postback tienen su propio historial y referencias; no deben contarse como un nuevo mensaje ordinario del cliente. La sincronización no garantiza que todos los mensajes históricos aparezcan ni que el destinatario haya leído el contenido.

## Entiende la ventana de mensajería

Meta exige que el destinatario haya escrito a la página durante las últimas **24 horas** para la ventana estándar, salvo una autorización específica admitida fuera de esa ventana. Consulta los requisitos de la [API de Messenger de Meta](https://www.postman.com/meta/messenger-platform-api/documentation/iyp204x/messenger-platform-api?entity=request-22794852-e8ea7834-a144-4efb-9802-94c9e3148acc). Una excepción de Meta no implica que Hellotext ofrezca ese flujo.

Para responder, revisa la última entrada elegible del cliente a esa página. Un mensaje saliente, el estado abierto del Inbox o un editor habilitado no reinician por sí mismos la ventana de Meta. Hellotext puede mantener su ventana local abierta después de actividad saliente; Meta conserva la decisión final de aceptación. Cerrar, asignar o cambiar una regla de respuesta tampoco extiende las 24 horas.

Hellotext no ofrece actualmente un flujo de campañas o plantillas utilitarias aprobadas para reiniciar una conversación cerrada de Messenger. Cuando la ventana estándar ya no está disponible, espera a que el cliente vuelva a escribir o continúa por otro canal solo cuando ese cliente sea elegible allí.

No uses otro canal para evitar las reglas de consentimiento o una conversación cerrada de Messenger. Cada destino debe cumplir sus propias reglas de disponibilidad y suscripción.

## Mensajes e interacciones compatibles con Hellotext

Hellotext puede procesar actividad compatible de Messenger, como:

- Mensajes de texto compatibles. Respeta la longitud admitida por el editor y por Meta; un borrador aceptado por Hellotext no garantiza aceptación del proveedor.
- Imágenes, GIF, audios, videos y documentos PDF compatibles, según el formato y tamaño admitidos para la operación concreta.
- Mensajes de voz y stickers entrantes compatibles. La recepción de un formato no garantiza que pueda reenviarse desde todos los editores.
- Respuestas a mensajes anteriores.
- Respuestas rápidas e interacciones de botones postback.
- Botones y tarjetas de productos creadas por misiones o flujos de mensajes compatibles.
- Actividad de entrega, lectura, edición y reacciones cuando Meta la proporciona.

El texto del mensaje se envía como texto plano; el formato enriquecido del editor común no garantiza negrita o cursiva en Messenger. Los botones, respuestas rápidas y tarjetas dependen del flujo que los crea, los límites de Meta y los datos disponibles. Una tarjeta no prueba stock, elegibilidad de compra, pago ni entrega.

Cuando la herramienta de enlace esté disponible en una conversación elegible, usa una URL estática verificada. **Agregar enlace corto** o Enter crea el enlace antes del guardado final del mensaje; **Cancelar** solo descarta la URL pendiente. Crear un enlace no envía el mensaje ni demuestra un clic o una compra.

La figura muestra el formulario compartido del editor **Mensaje**, abierto desde SMS con `https://shop.example.test/returns` ficticio sin agregar. Es el mismo control de enlace que usa el compositor compatible de Messenger; no muestra una conversación, una página conectada ni un mensaje enviado por Messenger.

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

Los comentarios públicos de Facebook, las publicaciones de la página y las conversaciones enviadas a un perfil personal de Facebook no son conversaciones normales de Messenger para la página conectada en Hellotext. Valida el punto de entrada exacto que planeas ofrecer a los clientes en un entorno autorizado.

## Gestiona conversaciones de Messenger en el Inbox

Las conversaciones de Messenger usan el mismo modelo de responsables del Inbox que los demás canales compatibles. Tu equipo puede:

- Responder desde una conversación elegible de Messenger.
- Asignar o reasignar la conversación a una persona o equipo.
- Agregar contexto interno sin enviarlo al cliente.
- Aplicar reglas de respuesta para Messenger cuando el plan admite reglas específicas por canal.
- Cerrar la conversación cuando no se necesita otra acción.
- Continuar el trabajo cuando llega un nuevo mensaje elegible del cliente.

La asignación a un equipo depende de sus miembros asignables y su capacidad; puede dejar trabajo en espera. Elegir un destino o cerrar la conversación no equivale a una respuesta humana. El cierre no cancela universalmente las colas ni todos los procesos de IA.

En **Tiempo de respuesta**, una regla por tecnología permite elegir **Messenger** cuando el plan y los permisos lo admiten. El menú ficticio siguiente muestra cinco opciones y resalta **WhatsApp**; Messenger está disponible como opción, sin seleccionarlo ni guardar una regla.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Messenger como opción en el menú de tecnologías de reglas de respuesta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 463px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/technology-es-mobile.png 2x" width="742" height="464" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/technology-es.png" srcset="/images/team/understanding-response-times/technology-es.png 2x" width="890" height="464" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Messenger como opción en el menú de tecnologías de reglas de respuesta" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Messenger como opción en el menú de tecnologías de reglas de respuesta.</figcaption>
</figure>

La regla nueva siguiente no tiene tecnología seleccionada. Los dos **60** grises son placeholders, no minutos guardados. **Primera respuesta a nuevas conversaciones** y **Respuestas posteriores** son objetivos distintos, sujetos a la política y al calendario de atención. Guardar una regla no garantiza la respuesta del equipo ni amplía la ventana de Meta.

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

El contenido disponible en WhatsApp, Instagram o Webchat puede tener otra presentación en Messenger. Valida el formato específico en un entorno de prueba autorizado; una vista previa no prueba aceptación o entrega.

Sigue leyendo: [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %}), [Asigna conversaciones]({% link _team/assigning-conversations.md %}) y [Tiempos y reglas de respuesta]({% link _team/understanding-response-times.md %}).

## Usa rutas y misiones compatibles

Las rutas pueden usar Messenger cuando el cliente, la página, el canal y el paso concreto sean elegibles. Define qué debe ocurrir si la ventana deja de estar disponible, falta un destino utilizable o Meta rechaza el mensaje; la selección de una ruta no garantiza el envío.

**Asignación** permite abrir, cerrar o asignar una conversación y agregar o eliminar etiquetas. El orden de las acciones importa y estas acciones no generan por sí mismas una respuesta. La figura es un formulario nuevo de ruta independiente, sin guardar, conectar pasos ni ejecutar una conversación de Messenger.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cinco acciones de Asignación en un formulario de ruta nuevo sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-es.png" srcset="/images/team/ai-handoff-to-inbox/assignment-es.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Cinco acciones de Asignación en un formulario de ruta nuevo sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Cinco acciones de Asignación en un formulario de ruta nuevo sin guardar.</figcaption>
</figure>

Algunas misiones pueden considerar Messenger cuando el cliente ya tiene una identidad disponible asociada a la página y esa misión incluye compatibilidad con Messenger. La disponibilidad del canal y los controles propios de esa misión condicionan la preparación; Meta todavía puede rechazar el envío. No hay una garantía común de permiso, horario, costo mínimo o entrega para todas las misiones.

Los agentes de IA personalizados no muestran actualmente Messenger en su selector de canales de entrada. No prometas atención con IA para una conversación de Messenger salvo que la misión o la ruta exacta que configuraste sea compatible y lo hayas verificado de punta a punta.

Sigue leyendo: [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %}) y [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Perfiles del cliente y consentimiento

Una conversación entrante de Messenger puede agregar una identidad de Messenger asociada a la página al perfil del cliente. Esa identidad es específica de la página de Facebook conectada y no debería tratarse como número de teléfono, suscripción de WhatsApp o permiso para enviar marketing por otro canal.

Si el mismo cliente existe bajo otro perfil, revisa los datos antes de combinar los perfiles. Conserva la conversación, identificadores, propiedades e historial de compras correctos.

Los campos del perfil no sustituyen la identidad asociada a la página ni el permiso para un uso concreto. **Camila Torres** es un perfil ficticio **Sin confirmar**, con correo de ejemplo y sin teléfono. Esta figura independiente muestra esos campos; no muestra identidad de Messenger, conexión, consentimiento ni una conversación recibida. La vista estrecha es un foco del perfil de escritorio.

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

Respeta las solicitudes de baja y bloqueo. Que un cliente escriba a la página no otorga permiso ilimitado para futuros mensajes salientes.

Sigue leyendo: [Perfiles de clientes]({% link _audience/customer-profiles.md %}) y [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Precios y uso

Los mensajes de Facebook Messenger se incluyen en el cálculo de mensajes que no son SMS de Hellotext. El importe variable se convierte en el cargo de Hellotext solo cuando es mayor que el mínimo del plan, la tarifa por performance y el importe de SMS del período de facturación.

Revisa [Política de uso justo de mensajes]({% link _billing/fair-use-message-policy.md %}) para consultar la tarifa y el cálculo canónico, y confirma las condiciones vigentes en [precios de Hellotext](https://www.hellotext.com/precios). El importe variable no se suma a los otros tres cuando alguno de ellos es mayor; impuestos o un acuerdo personalizado se revisan por separado.

## Soluciona un mensaje de Messenger faltante o fallido

Si un mensaje entrante no aparece:

- Confirma que la página de Facebook correcta esté conectada en Hellotext.
- Revisa una interacción privada existente y sus referencias antes de crear otra. Si hace falta una prueba nueva, usa un entorno de prueba autorizado y un destinatario que tenga permiso y elegibilidad para esa prueba.
- Revisa que la interacción sea un mensaje de Messenger y no un comentario público, publicación de la página, mensaje a un perfil personal o DM de Instagram.
- Confirma que la cuenta de Facebook y Hellotext todavía tengan los permisos requeridos de la página.
- Revisa si el perfil del cliente o la conversación están bloqueados.

Si una respuesta no se envía:

- Confirma que el cliente haya escrito a la página dentro de la ventana estándar de mensajería.
- Revisa que la integración y el canal de Messenger estén activos.
- Revisa el motivo exacto del error antes de reintentar.
- Confirma que el texto, tipo de adjunto y tamaño del adjunto sean compatibles con Messenger.
- Evita reintentos repetidos cuando Meta haya rechazado la página, el destino o estado de la conversación.

Distingue borrador, mensaje creado, aceptación de Meta, estado de entrega y lectura. Algunos estados de entrega de Hellotext se actualizan con el acuse de la API; no prueban por sí solos recepción o lectura por la persona. Si el resultado de una operación es incierto, reconcilia el mensaje y sus referencias antes de repetirla para evitar duplicados.

Consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) para usar el checklist compartido de entrega.

## Checklist para el primer lanzamiento de Messenger

Antes de depender de Facebook Messenger, confirma que:

1. La página de Facebook correcta esté conectada al negocio de Hellotext correcto.
2. Una interacción existente o una prueba autorizada cree o actualice el perfil correcto, sin confundir perfiles de páginas distintas.
3. La conversación aparezca en el Inbox con la identidad de Messenger correcta.
4. La conversación llegue a la persona, al equipo, a la ruta o a la misión compatible que corresponda.
5. El formato y los límites del texto, adjuntos, respuestas, botones y tarjetas previstos se hayan validado para el flujo exacto; los formularios de esta guía no son resultados de esas pruebas.
6. La asignación, la espera por capacidad y la respuesta se verifiquen por separado.
7. Tu equipo distinga la ventana de Meta, los objetivos de respuesta y los permisos de la página, y conozca cómo reconciliar un resultado incierto antes de reintentar.

## Guías relacionadas

- [Conecta Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Fundamentos de Instagram DM]({% link _numbers/instagram-dm-fundamentals.md %})
- [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
