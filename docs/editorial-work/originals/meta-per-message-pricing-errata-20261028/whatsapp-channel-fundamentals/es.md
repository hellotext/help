Usa WhatsApp cuando tus clientes esperan un canal conversacional y quieres que Hellotext soporte respuestas, misiones, rutas, campañas, agentes de IA y comercio en un mismo lugar.

Esta guía explica cómo pensar WhatsApp después de conectar la cuenta. Para los pasos de conexión, empieza con [Conecta WhatsApp]({% link _integrations/connect-whatsapp.md %}).

## Para qué sirve mejor WhatsApp

WhatsApp funciona bien cuando el cliente puede responder, hacer una pregunta adicional o necesitar ayuda antes de comprar.

Usa WhatsApp para:

- Conversaciones de Inbox con clientes.
- Agentes de IA que responden preguntas o recomiendan productos, como [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}).
- Soporte de estado de pedido con [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando hay datos de orden y tracking disponibles.
- Misiones que recuperan carritos, ayudan a elegir, responden consultas post-compra o reaccionan a señales del cliente.
- Rutas que hacen preguntas, ramifican, asignan conversaciones o recopilan contexto.
- Campañas dirigidas a audiencias elegibles.
- Descubrimiento de productos cuando el catálogo está disponible para WhatsApp, y continuación al checkout cuando la integración de comercio admite ese flujo.

Usa SMS cuando principalmente necesitas alcance amplio y un mensaje de texto simple. Muchos negocios usan ambos canales. Sigue leyendo: [Fundamentos del canal SMS]({% link _numbers/sms-channel-fundamentals.md %}).

## Prepara el canal antes de lanzar

Antes de depender de WhatsApp con clientes, confirma que:

- Tu cuenta de WhatsApp Business y número de teléfono están conectados en Hellotext.
- La facturación, los requisitos de verificación y las restricciones de la cuenta y del número de Meta permiten el uso previsto.
- El número de teléfono que quieres usar está disponible en Hellotext.
- Tienes permiso para WhatsApp, el destino y el tipo de mensaje previsto. Conservas cómo y cuándo se obtuvo: una compra, un teléfono guardado o el estado **Suscrito** no prueban por sí solos ese permiso.
- Las respuestas están dirigidas al equipo que las va a manejar en el Inbox.
- Validaste los flujos con datos y destinatarios de prueba autorizados en un entorno aislado, antes de lanzar. No uses una campaña real ni contactos importados como prueba improvisada.
- Los productos necesarios son elegibles, están sincronizados y disponibles en el catálogo correcto si el flujo requiere comercio por WhatsApp; conectar una cuenta no demuestra que todos sus productos estén publicados.

Sigue leyendo: [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %}).

## Entiende mensajes entrantes y salientes

WhatsApp se comporta distinto según quién inició la conversación.

Cuando un cliente escribe al canal conectado y habilitado, Hellotext puede recibir la conversación en el Inbox. Según la configuración y elegibilidad, también puede atenderla una misión, una ruta o un agente de IA. La ventana de atención de WhatsApp dura **24 horas desde el último mensaje del cliente**. Otro mensaje del cliente la reinicia; un envío del negocio o cerrar la conversación en Hellotext no la reinician.

Fuera de esa ventana, usa una plantilla de WhatsApp aprobada y permitida para el propósito del mensaje. Los envíos iniciados por el negocio, incluidos campañas y misiones proactivas, deben seguir las reglas de plantillas y consentimiento. Tener una conversación reciente o un destino alcanzable no sustituye el permiso para futuras promociones. Consulta la [política vigente de WhatsApp Business](https://business.whatsapp.com/policy).

Piensa la experiencia de WhatsApp alrededor de ambos modos:

- **Entrante:** el cliente pregunta, Hellotext responde o dirige la conversación.
- **Saliente:** Hellotext envía un mensaje basado en plantilla a una audiencia o perfil del cliente elegible.

## Plantillas y categorías de mensajes

Las plantillas de WhatsApp ayudan a Meta a revisar y clasificar mensajes iniciados por el negocio. Úsalas cuando Hellotext necesita iniciar una conversación de WhatsApp o enviar fuera de la ventana de atención.

Las tres categorías de plantillas son:

- **Marketing:** ofertas, sugerencias de productos, recordatorios de carrito abandonado, lanzamientos y promociones.
- **Utilidad:** actualizaciones de orden, cuenta, entrega u otras notificaciones transaccionales solicitadas por el cliente.
- **Autenticación:** códigos de un solo uso y verificación de identidad.

**Servicio** describe respuestas dentro de la ventana de atención; no es una cuarta categoría de plantilla. El propósito y contenido final determinan la clasificación, incluso si el nombre local dice «actualización de pedido».

Elige la categoría, idioma y contenido que correspondan al uso real. Comprueba la **versión activa aprobada para la cuenta de WhatsApp que envía**. Un borrador guardado o un cambio pendiente no prueban que ese contenido ya esté aprobado; una versión anterior puede seguir activa mientras se revisa el cambio. Meta puede rechazar, pausar o restringir una plantilla, por lo que la aprobación tampoco garantiza entrega.

En **Configuración > Plantillas**, el editor **Mensaje** permite preparar el cuerpo y revisar el formato. La figura muestra «Consulta» en negrita e «instrucciones» en cursiva: es un borrador ficticio sin guardar, abierto en el editor común desde SMS. Sirve para reconocer el área de contenido; no muestra una plantilla de WhatsApp aprobada, su categoría ni una entrega. Las herramientas disponibles dependen del canal y del flujo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor Mensaje con texto ficticio de devolución y formato, sin guardar; no muestra aprobación de WhatsApp.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/format-es-mobile.png 2x" width="652" height="528" />
        <img src="/images/numbers/message-editor-basics/format-es.png" srcset="/images/numbers/message-editor-basics/format-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="528" loading="lazy" decoding="async" alt="Editor Mensaje con texto ficticio de devolución y formato, sin guardar; no muestra aprobación de WhatsApp." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; fuente aprobada reutilizada. No demuestra aprobación, conexión o entrega por WhatsApp.</figcaption>
</figure>

Sigue leyendo: [Conceptos básicos del editor de mensajes]({% link _numbers/message-editor-basics.md %}).

Para precios y detalles actuales de categorías, revisa las [tarifas de WhatsApp Business Platform de Meta](https://business.whatsapp.com/products/platform-pricing#rates). Meta cobra por mensajes entregados según categoría y mercado; sus respuestas de servicio dentro de la ventana no tienen cargo de Meta. Eso no implica que el uso o la factura de Hellotext sean gratuitos. No presupongas una tarifa fija ni confundas aceptación con entrega.

## Cómo Hellotext usa WhatsApp

### Inbox

Las respuestas de WhatsApp pueden aparecer en el Inbox para que el equipo responda, asigne, cierre o derive conversaciones. Define quién atiende, su capacidad y los horarios. La recepción no garantiza que una persona concreta ya se haya hecho cargo. Si la IA o una misión no puede resolver una conversación, ofrece una derivación clara al responsable. Cerrar una conversación es un estado de atención de Hellotext y no abre otra ventana de Meta.

Sigue leyendo: [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

### Misiones y rutas

Las misiones y rutas pueden usar WhatsApp para conversaciones automatizadas, recomendaciones de productos, recuperación de carrito, soporte, seguimiento post-compra y flujos con ramas.

Antes de lanzar, valida en el entorno autorizado el disparador real, el contexto recibido, la versión activa, cada rama, los horarios y límites propios del flujo. Confirma qué ocurre al responder, derivar o pausar. Las herramientas de Inbox no son idénticas a las de una ruta: el formulario de mensaje de un Playbook, por ejemplo, no ofrece ubicación. Un preview o un borrador no demuestra que el flujo esté activo ni que haya llegado una respuesta.

### Campañas

Las campañas pueden enviar mensajes dirigidos de WhatsApp a audiencias elegibles. Revisa el canal final, exclusiones, permiso, versión activa, zona horaria, horario y posibles solapamientos antes de confirmar. No extrapoles el límite o ventana de una misión a todas las campañas. La opción WhatsApp y SMS no convierte cada fallo en un reenvío: el respaldo requiere un flujo compatible, un destino válido y permiso para SMS.

Sigue leyendo: [Resumen de campañas]({% link _campaigns/campaigns-overview.md %}).

### Herramientas de captura

Las herramientas de captura pueden ayudar a que los clientes se suscriban a WhatsApp. Explica el canal, propósito y mensajes esperados. En **Códigos QR > Elige el tipo**, comprueba la opción **WhatsApp**: la figura real tiene SMS seleccionado y WhatsApp deshabilitado en el negocio ficticio. No representa un canal WhatsApp conectado ni una suscripción completada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Elige el tipo de código QR: SMS seleccionado y WhatsApp deshabilitado en el negocio ficticio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 678px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/type-es-mobile.png 2x" width="740" height="1500" />
        <img src="/images/captures/qr-codes/type-es.png" srcset="/images/captures/qr-codes/type-es.png 2x" style="width: auto; margin: 0 auto;" width="1320" height="1310" loading="lazy" decoding="async" alt="Elige el tipo de código QR: SMS seleccionado y WhatsApp deshabilitado en el negocio ficticio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; fuente aprobada reutilizada. No demuestra aprobación, conexión o entrega por WhatsApp.</figcaption>
</figure>

Escanear un QR o abrir un enlace puede preparar un mensaje en el dispositivo; no equivale a enviarlo. Hellotext registra la suscripción de esas capturas al procesar el mensaje entrante correspondiente. El seguimiento depende de la configuración asignada; no presupongas una bienvenida automática. Sigue leyendo: [Códigos QR]({% link _captures/qr-codes.md %}).

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

### Comercio

Un catálogo compatible puede permitir descubrir productos y recibir recomendaciones. Verifica cada producto y variante: identidad, origen, referencia, precio y moneda, imagen, URL, elegibilidad y resultado de sincronización/publicación. Una **Referencia** o un **SKU** de Hellotext no son por sí solos el identificador del catálogo de Meta; un precio guardado tampoco demuestra stock disponible.

La figura de **Configuración > Objetos > Productos** muestra la identidad ficticia de **Agenda semanal**, referencia **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER** y origen **custom_store**. El mismo nombre propio se conserva en ambos idiomas. Es un producto draft independiente, sin foto, URL, variantes adicionales ni eventos; no es una importación de WhatsApp ni un catálogo listo para vender.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editar producto ficticio Agenda semanal con referencia, SKU y origen custom_store; no es un catálogo publicado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-es-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-es.png" srcset="/images/developers/products-and-inventory-with-api/identity-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Editar producto ficticio Agenda semanal con referencia, SKU y origen custom_store; no es un catálogo publicado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; fuente aprobada reutilizada. No demuestra aprobación, conexión o entrega por WhatsApp.</figcaption>
</figure>

Agregar productos a un carrito o recibir una solicitud por WhatsApp no confirma compra, pago ni entrega. La continuación al checkout depende de una integración compatible y de que genere una URL válida; no está disponible para cualquier catálogo sólo por conectarlo. Contrasta el pedido y sus señales con la tienda antes de considerar una venta. Sigue leyendo: [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %}).

## Mantén WhatsApp saludable

La calidad de WhatsApp depende de enviar mensajes que los clientes esperan y quieren recibir.

Antes y después de lanzar:

- Envía solo a perfiles del cliente con consentimiento para WhatsApp.
- Mantén una frecuencia razonable.
- Haz que el propósito del mensaje sea claro.
- Evita enviar el mismo recordatorio demasiadas veces.
- Revisa respuestas, quejas, bloqueos, bajas y envíos con error. Respeta las bajas recibidas también por otras vías; un texto de baja en un borrador no procesa una solicitud del cliente.
- Revisa la calidad del número y límites de envío en Meta.
- Dirige conversaciones confusas, enojadas o de alto riesgo al Inbox.

Si la calidad baja o los clientes se sorprenden por los mensajes, pausa y ajusta la audiencia, plantilla, horario o reglas del flujo. Diferencia solicitud aceptada, mensaje procesado, enrutado, entregado y visto. En la API actual, HTTP 200 con **received** no incluye un ID ni garantiza creación o entrega; el estado **error** es distinto de un evento entrante. Ante un resultado incierto, reconcilia la solicitud y los estados antes de reintentar para evitar duplicados.

Si necesitas soporte, comparte negocio, flujo, período y zona horaria, plantilla/versión e identificadores de solicitud o mensaje disponibles. No incluyas tokens, contraseñas ni datos privados innecesarios.

## Checklist para tu primer lanzamiento por WhatsApp

Antes de tu primer lanzamiento por WhatsApp, confirma que:

1. WhatsApp está conectado en Hellotext.
2. La facturación, verificación y plantillas de Meta están listas.
3. El permiso, destino y tipo de mensaje de cada destinatario están comprobados.
4. Las respuestas llegan a los responsables correctos en el Inbox.
5. Los flujos se validaron con datos y destinatarios autorizados aislados, sin mezclar pruebas con ventas reales.
6. Los caminos de derivación, límites, horarios, respaldo permitido, pausa y manejo de resultados inciertos están claros.

Después de un lanzamiento autorizado, revisa estados, respuestas y reportes del flujo real. La atribución necesita señales de compra registradas y la ventana aplicable; una solicitud de carrito, un clic o una respuesta no son automáticamente una venta atribuida. Conserva período, zona horaria, población y denominador al comparar resultados, y verifica los pendientes antes de repetir envíos.

Sigue leyendo: [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %}).

## Guías relacionadas

- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Fundamentos del canal SMS]({% link _numbers/sms-channel-fundamentals.md %})
- [Conecta WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
