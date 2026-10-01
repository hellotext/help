Usa este checklist cuando estás configurando Hellotext por primera vez o preparando un negocio nuevo para salir en vivo.

El objetivo es confirmar que tu cuenta, señales, canales, capturas y primera misión, ruta o envío estén listos antes de que los clientes empiecen a recibir mensajes.

Si eres nuevo en el producto, empieza por [Qué es Hellotext]({% link _getting-started/what-is-hellotext.md %}).

Si estás eligiendo entre misiones, campañas y flujos del Inbox, lee [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %}).

## 1. Crea y revisa tu negocio

Crea tu negocio, elige el país principal donde opera y selecciona el plan que se ajuste a tu etapa.

Antes de continuar, confirma el nombre del negocio, su identificador en la URL, país, idioma, zona horaria, configuración de facturación y acceso del equipo. Revisa el plan y las condiciones vigentes para las funciones y canales que vas a usar; un nombre de negocio no confirma el plan contratado.

En **Configuración**, comprueba el **ID del negocio** para reconocer qué negocio estás preparando, especialmente si tu cuenta tiene acceso a varios. Es un identificador público, distinto del usuario de acceso y de un token privado de API. En la imagen, **Enterprise** es el nombre ficticio del negocio de ejemplo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identifica el negocio seleccionado en Configuración">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Negocio ficticio Enterprise con ID del negocio 4ONLdN32 y control Editar negocio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Enterprise es el nombre del negocio de ejemplo; esta tarjeta no confirma su plan ni su facturación.</figcaption>
</figure>

Sigue leyendo: [Configura tu negocio]({% link _getting-started/setting-up-your-business.md %}).

## 2. Conecta tu plataforma de comercio

Conecta la plataforma donde viven tus datos de clientes, pedidos y productos. Esto ayuda a Hellotext a crear perfiles de cliente, leer señales de comercio, entender la actividad de compra y atribuir resultados.

Empieza por la integración que corresponda a tu tienda:

- [Conecta Wix]({% link _integrations/connect-wix.md %})
- [Conecta WooCommerce]({% link _integrations/connect-woo.md %})
- [Conecta VTEX]({% link _integrations/connect-vtex.md %})
- [Conecta Mercado Libre]({% link _integrations/connect-mercado-libre.md %})

Si usas funciones de comercio en WhatsApp, revisa también [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %}).

Antes de lanzar algo basado en estos datos, [verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

Comprueba una muestra conocida del sistema de origen: perfil correcto, referencia y origen del pedido, artículos, cantidades, importes, moneda y fecha. Confirma qué datos y eventos sincroniza tu integración y cuándo los procesa. Un producto o pedido guardado no demuestra que se haya registrado una compra, asociado al perfil correcto o calculado una venta atribuida.

Este editor ayuda a reconocer los datos: **ID de la orden** muestra la referencia `ORDER-1001`; **Origen** muestra `custom_store` y **Cantidad total** es el importe monetario de 89,90 USD. **Tipo de entrega: Entregar** describe la modalidad, sin confirmar un envío o una entrega. El ejemplo es un pedido ficticio existente, sin eventos, y no demuestra una tienda conectada ni una sincronización completada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reconoce la referencia, el origen y el importe de un pedido">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" width="1006" height="914" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Editor real de un pedido ficticio con referencia ORDER-1001, importe 89,90 USD, origen custom_store y tipo de entrega Entregar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Datos de un pedido ficticio existente, sin guardar cambios ni registrar eventos. ID de la orden identifica la referencia; Tipo de entrega no es una confirmación de entrega.</figcaption>
</figure>

Para validar señales de compra o carrito, utiliza únicamente operaciones autorizadas de un entorno de prueba aislado y soportado por la integración. Revisa sus efectos sobre cobros, stock, notificaciones y automatizaciones; crear un contacto interno no aísla una compra en producción. Conserva referencias y fechas originales para reconciliar lo recibido.

## 3. Conecta tus canales de mensajería

Conecta el canal que vas a usar primero. Para la mayoría de los equipos, esto empieza con WhatsApp o SMS.

Si vas a usar WhatsApp, conecta la cuenta de WhatsApp antes de crear capturas de WhatsApp o enviar campañas por WhatsApp.

Sigue leyendo: [Conecta WhatsApp]({% link _integrations/connect-whatsapp.md %}).

Para SMS, revisa las opciones de remitente y destinos disponibles, límites de tu negocio y mecanismo de baja antes de planificar un envío. Para WhatsApp, comprueba la identidad del remitente y la versión activa aprobada de la plantilla que realmente se enviará; guardar un borrador no confirma su aprobación.

Confirma permiso para el canal, destino y tipo de comunicación previstos, y respeta las bajas. Una cuenta conectada, un teléfono disponible o un perfil marcado como suscrito no demuestran por sí solos ese permiso. Consulta la [política vigente de WhatsApp](https://whatsappbusiness.com/policy/) para sus reglas de inicio de conversación y respuesta.

Comprueba también cómo se atenderán las respuestas. Los canales usados para conversaciones no están necesariamente disponibles para campañas; verifica las opciones que ofrece tu negocio para el envío elegido.

Sigue leyendo: [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %}).

## 4. Agrega al menos una herramienta de captura

Antes de lanzar campañas, misiones o rutas, asegúrate de que los clientes tengan una forma clara de suscribirse.

Empieza con la captura que mejor coincida con el lugar donde tus clientes tienen más probabilidad de sumarse:

- Códigos QR para tiendas, packaging, material impreso o eventos.
- Links compartibles para redes sociales, anuncios, email y landing pages.
- Formularios para recopilar datos de clientes en tu sitio web.
- Opt-in en checkout cuando los clientes ya están comprando.

Sigue leyendo: [Resumen de herramientas de captura]({% link _captures/capture-overview.md %}).

Revisa qué dato solicita la captura, qué canal nombra el aviso y qué recibirá la persona al suscribirse. En este formulario de ejemplo, **Teléfono**, **Suscribirme** y el aviso de SMS son coherentes entre sí; no debes reutilizar ese aviso para prometer otro canal sin revisar su configuración y el permiso correspondiente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Revisa el teléfono y el consentimiento de un formulario">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 490px; width: fit-content; margin: 0 auto;">
      <div>
        <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/preview.png" srcset="/images/captures/forms/ui-refresh/es/preview.png 2x" width="944" height="780" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Vista previa de un formulario ficticio de Editorial Demo con título centrado, campo Teléfono, botón Suscribirme y aviso de consentimiento para SMS." />
      </div>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario ficticio guardado como borrador, sin envíos del formulario, cupón ni ruta. La vista previa no confirma instalación, suscripción ni envío.</figcaption>
</figure>

Antes de distribuir un QR o link, o instalar un formulario, revisa el destino y su estado real, además de cualquier cupón o ruta asociada. La vista previa de un borrador no demuestra que esté instalado o activo. Recoger un dato, crear un perfil y comprobar permiso para marketing son pasos distintos; verifica el estado y la comunicación prevista antes de añadir a esa persona a un envío.

## 5. Prepara tu primera audiencia

Crea o revisa la audiencia a la que vas a contactar primero.

Usa listas cuando necesites controlar explícitamente la pertenencia a un grupo de perfiles de cliente. Usa segmentos cuando quieras que Hellotext actualice la audiencia según reglas de datos o comportamiento. Revisa la membresía vigente antes de enviar, incluida la disponibilidad de los datos que usa cada regla.

Comprueba inclusiones y exclusiones en el envío elegido: los grupos incluidos se combinan, un perfil repetido cuenta una vez y una exclusión seleccionada lo retira aunque también pertenezca a un grupo incluido. La cantidad de perfiles o destinatarios alcanzables no demuestra consentimiento. Revisa permiso por canal y destino, bajas y exclusiones; **No confirmado** no confirma una suscripción.

Sigue leyendo:

- [Diferencias entre Listas y Segmentos]({% link _audience/lists-and-segments.md %})
- [Llega mejor a tu audiencia con Segmentos]({% link _audience/segments.md %})

## 6. Lanza una primera misión, ruta o campaña enfocada

Elige un primer objetivo antes de ampliar: recuperar carritos abandonados, hacer seguimiento post-compra, responder preguntas frecuentes con [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}), guiar cambios o devoluciones con [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}), guiar solicitudes de cancelación con [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}), captar suscriptores o enviar un anuncio puntual.

Usa una misión preconstruida cuando ya existe una que cubre tu objetivo. Usa una ruta cuando necesitas un flujo paso a paso predecible. Usa una campaña cuando necesitas un envío puntual a una audiencia seleccionada.

Define el disparador, la audiencia, el canal, el mensaje, los horarios y quién responderá antes de habilitar el flujo o confirmar el envío. Las misiones y rutas pueden actuar sobre todos los perfiles que cumplan sus condiciones; una etiqueta «prueba» o un nombre interno no aísla sus efectos.

Antes de ampliar, realiza una verificación autorizada en un entorno aislado o con destinos internos controlados y con el permiso necesario, según el canal. Revisa el mensaje final con variables reales y sus valores de respaldo, links, tono, horarios, mecanismo de baja y derivación. Escribir BAJA o STOP en el cuerpo no configura por sí solo una baja. Confirma recepción y atención de la respuesta; un estado de preparación o aceptación no prueba entrega.

Mantén acotado el primer lanzamiento, con responsable y criterios de pausa. Revisa otros flujos, esperas y envíos programados que puedan actuar sobre la misma audiencia; una pausa no retira mensajes ya entregados a un proveedor ni garantiza cancelar todo lo pendiente.

Sigue leyendo:

- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %})
- [Primeros logros recomendados]({% link _getting-started/first-wins-starter-pack.md %})
- [Caminos de implementación]({% link _getting-started/implementation-paths.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Crear una Campaña]({% link _campaigns/creating-a-campaign.md %})
- [Mejores prácticas para el primer lanzamiento]({% link _getting-started/tips-and-best-practices.md %})

## 7. Invita a quienes van a responder

Cuando los clientes ya pueden responder, asegúrate de que las personas correctas tengan acceso a la bandeja.

Invita miembros del equipo, revisa sus roles y confirma que aceptaron el acceso al negocio correcto antes del lanzamiento. Acuerda quién atenderá las conversaciones, en qué horario y qué ocurrirá si el equipo está ocupado o sin cobertura.

En las misiones que ofrecen **Derivación**, revisa el interruptor y el equipo de destino, como **Atención demo** en este borrador ficticio de Recolector de Propiedades. Esa selección no confirma una misión habilitada, disponibilidad de un miembro ni asignación efectiva de una conversación.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reconoce el control de derivación y su equipo de destino">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Borrador real de Recolector de Propiedades con Derivación habilitada en el editor y equipo ficticio Atención demo seleccionado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Control de un borrador sin guardar. Seleccionar un equipo no demuestra una misión activa ni una conversación asignada a un miembro disponible.</figcaption>
</figure>

Comprueba la recepción y propiedad de una conversación mediante una prueba autorizada del canal previsto, y quién puede pausar o corregir el flujo si hace falta. Si el canal no admite respuestas, ofrece otra vía de contacto y un responsable para atenderla.

Sigue leyendo:

- [Diferencias entre roles de equipo]({% link _team/understanding-team-roles.md %})
- [Asignando conversaciones]({% link _team/assigning-conversations.md %})

## 8. Revisa los primeros resultados

Después de tu primer lanzamiento, revisa qué pasó antes de cambiar demasiadas cosas al mismo tiempo.

Mira crecimiento de audiencia, respuestas, clics, actividad de misiones, reportes de campaña y ventas atribuidas. Define un período y zona horaria comunes para la revisión; distingue perfiles nuevos de permisos confirmados, mensajes preparados de entregados y clics totales de únicos por mensaje.

Compara cada resultado con la población y el período que usa su reporte. Un clic no demuestra una compra y un pedido guardado no demuestra atribución. Revisa referencias, eventos originales y ventanas de atribución antes de comparar ventas con tu tienda; los reportes pueden actualizarse después de recibir los datos.

Anota el objetivo inicial, resultado, bajas o errores y el próximo cambio. Ajusta una causa concreta cada vez, conservando una referencia del período anterior. Si hay destinatarios incorrectos, duplicados o un mecanismo de baja que no funciona, revisa el alcance y la pausa antes de ampliar.

Sigue leyendo:

- [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Reportes de Campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})

## Opcional antes de salir en vivo

Configura un [dominio personalizado para enlaces cortos]({% link _integrations/custom-domain-for-short-links.md %}) si quieres usar links con tu marca desde el inicio. Confirma que tu plan lo permite, que el dominio está verificado y que los destinos funcionan antes de distribuirlos; escribir el dominio no verifica su DNS.

Revisa [los límites de envío SMS para negocios nuevos]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}) si tus primeros envíos van a usar SMS.
