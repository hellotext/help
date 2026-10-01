Usa esta guía cuando un evento, actualización de perfil, cambio de segmento, disparador de misión, step de ruta o métrica de reporte no aparece donde esperabas.

Las señales pueden venir de una tienda, sitio web, herramienta de captura, canal de mensajería, API, Hellotext.js, perfil del cliente o conversación del Inbox. La forma más rápida de corregir una señal faltante es ubicar dónde se detuvo la cadena.

## Antes de empezar

Anota el síntoma exacto antes de cambiar configuración.

Recopila:

- El negocio donde ocurrió el problema.
- El perfil del cliente, email, teléfono, ID externo o usuario de prueba.
- La señal o nombre de evento esperado.
- El segmento, misión, ruta, campaña o reporte afectado.
- El canal, tienda, integración o fuente de tracking.
- La hora aproximada en que ocurrió la actividad.
- Qué esperabas ver y qué apareció en su lugar.

Empieza por una actividad existente y registra su fecha, hora y zona horaria. Separa **origen**, **solicitud recibida**, **evento guardado**, **perfil asociado**, **regla evaluada** y **resultado**. Una respuesta de red no prueba todas las etapas.

Si necesitas reproducir el recorrido, usa datos propios o un perfil interno autorizado. Primero reconcilia cualquier resultado incierto con los registros existentes: repetir tracking, una captura o un envío puede crear otra interacción. No generes tráfico adicional solo para comprobar un contador.

## 1. Revisa primero el perfil del cliente

Abre el perfil del cliente que esperabas que se actualizara.

Revisa si:

- El perfil existe.
- El email, teléfono, ID externo o identificador de integración es correcto.
- El evento o propiedad de perfil aparece en el timeline o perfil.
- El cliente tiene el estado de suscripción o consentimiento esperado.
- El perfil pertenece al mismo negocio, tienda, canal o marketplace que estás probando.
- El cliente aparece más de una vez como perfiles duplicados.

Si la actividad existe en otro perfil, compara los identificadores enviados por cada fuente antes de combinar perfiles. El ID público de Hellotext, la referencia externa de una integración y la sesión del navegador son identificadores diferentes. Una misma referencia puede pertenecer a fuentes distintas; conserva su origen al buscarla.

Hellotext.js puede registrar actividad de una sesión todavía anónima. No encontrarla en el perfil esperado no demuestra que la solicitud nunca llegó. Revisa cuándo se identificó al cliente y qué sesión acompañó al evento. Un cambio de email, teléfono o navegador tampoco prueba por sí solo que dos perfiles deban combinarse.

Camila Torres es un perfil ficticio independiente: figura **Sin confirmar**, tiene un email de ejemplo y no tiene teléfono. Estos campos permiten revisar identidad y estado; no demuestran permiso de marketing ni un destino SMS disponible. En pantallas pequeñas se muestra un foco del mismo panel de escritorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identidad y estado del perfil ficticio Camila Torres">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identidad y estado del perfil ficticio Camila Torres" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil de ejemplo independiente; no es el resultado de los eventos u objetos de esta guía.</figcaption>
</figure>

## 2. Si el perfil falta o está desactualizado

Si el perfil del cliente no existe, o faltan datos recientes del perfil, empieza por el sistema de origen.

Revisa:

- La tienda o integración está conectada al negocio correcto de Hellotext.
- Las claves de API, tokens, configuración del plugin y permisos son válidos.
- La primera sincronización terminó.
- El cliente afectado existe en el sistema de origen.
- La integración tiene permiso para sincronizar los campos esperados.
- El email, teléfono o ID externo del cliente está presente en el sistema de origen.

Si el dato viene de una captura, revisa la versión exacta del QR, link compartible, formulario, popup u opt-in de checkout que usó el cliente y busca el envío ya existente. Recepción, verificación de identidad, actualización del perfil y consentimiento pueden ocurrir en etapas distintas. Solo repite una prueba después de aclarar un resultado incierto.

Distingue también **objeto comercial** de **evento**. Encontrar un pedido o producto sincronizado no demuestra que se haya registrado una acción como `order.placed` ni que esté asociada al cliente esperado. Compara la referencia, origen, estado y fecha del sistema de origen con Hellotext.

El pedido ficticio siguiente tiene referencia **ORDER-1001**, origen **custom_store** y total **USD 89.90**. Es un borrador independiente con cero eventos; **Entregar** es una modalidad de entrega, no una confirmación de envío. El campo **ID de la orden** muestra la referencia externa, distinta del ID público usado por la API. No pertenece al ejemplo de Camila ni demuestra una compra sincronizada o atribuida.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Referencia, origen e importe de un pedido ficticio en borrador">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" width="1006" height="914" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Referencia, origen e importe de un pedido ficticio en borrador" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Pedido de ejemplo sin eventos; la existencia del objeto no prueba una señal de compra.</figcaption>
</figure>

Sigue leyendo: [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## 3. Si falta el evento

Si el perfil existe pero la actividad no está ahí, revisa la fuente del evento.

Para integraciones:

- Confirma que la integración soporte ese evento.
- Comprueba cuándo ocurrió el evento y qué período histórico o estados importa esa integración; conectar una tienda no garantiza reconstruir toda actividad anterior.
- Revisa si la fuente usa otro nombre de evento o estado.
- Revisa el estado y los errores de sincronización. Una cola o procesamiento en segundo plano no tiene un tiempo de finalización garantizado por esta guía.

Para tracking con Hellotext.js o API:

- Confirma que el script o llamada de API corre en el sitio, checkout, backend o app correcto.
- Confirma que el request se envía al negocio o ambiente correcto.
- Mantén consistentes los nombres de acciones, como `product.viewed`, `cart.abandoned` u `order.placed`.
- Incluye el identificador que Hellotext necesita para asociar el evento con el perfil del cliente.
- Incluye las propiedades requeridas de producto, carrito, orden o campos personalizados cuando la misión o el reporte dependen de ellas.
- Revisa la respuesta completa y los registros del primer intento antes de repetirlo. Un HTTP 200 con `received` puede confirmar recepción para procesamiento posterior, sin devolver un ID ni probar que el evento ya esté guardado o asociado.

En Hellotext.js, espera a que termine la inicialización asíncrona antes de usar tracking. El SDK publicado no registra `page.viewed` automáticamente: debe haber una llamada explícita por cada vista real que quieras medir, con su URL. Comprueba que la navegación de tu sitio no omita vistas ni registre dos veces la misma vista. Cargar el archivo JavaScript o tener una cookie de sesión no prueba que se haya registrado un evento.

Usa el **nombre exacto de la acción**, no su título visible. En **Configuración > Acciones > Personalizado**, este ejemplo define `appointment.booked` con el título **Cita reservada**. La definición existe con cero eventos; no muestra una cita realizada. La vista estrecha enfoca esa fila y el botón de creación, sin crear otra acción.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre exacto appointment.booked y título Cita reservada">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-es-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-es.png" srcset="/images/developers/custom-actions/catalog-es.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nombre exacto appointment.booked y título Cita reservada" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catálogo de una acción ficticia existente; su definición no registra una ocurrencia.</figcaption>
</figure>

Revisa los requisitos del recorrido que estás usando. Este borrador independiente de **Nuevo evento** para **Demo Caso 1** selecciona **Cita reservada**, pero deja **Objeto asociado** vacío y **Guardar** deshabilitado. No se guardó ni registró un evento. El formulario manual exige ese objeto para esta acción; la API y el SDK permiten una acción personalizada sin objeto. Si incluyes uno, su tipo, identificador o parámetros deben corresponder a un objeto válido del negocio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Evento manual ficticio sin objeto asociado y Guardar deshabilitado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 449px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/manual-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/manual-es.png" srcset="/images/developers/custom-actions/manual-es.png 2x" width="862" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Evento manual ficticio sin objeto asociado y Guardar deshabilitado" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador sin guardar; no prueba creación, procesamiento ni ejecución de una misión.</figcaption>
</figure>

Compara también el timestamp de la actividad. Los endpoints de tracking aceptan fecha ISO 8601 o segundos Unix; enviar milisegundos como segundos cambia la fecha esperada. Una actividad histórica puede quedar fuera de una condición o reporte actual. No cambies la fecha ni recrees el evento para hacerlo coincidir con una ventana.

No presupongas deduplicación universal. Algunos eventos de pedido conservados se deduplican por pedido y acción; eso no cubre cualquier acción personalizada, actualización o nuevo intento. Ante una respuesta incierta, busca primero por identidad, acción, objeto y hora.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## 4. Si el evento existe pero no pasa nada

Una señal puede existir sin disparar un mensaje, actualización de segmento o cambio de reporte.

Revisa la regla que debería haber usado la señal.

Para segmentos:

- El segmento usa la misma acción, propiedad, lista, tag, canal o regla de consentimiento.
- El evento es lo suficientemente reciente para cualquier regla basada en tiempo.
- El perfil del cliente es elegible para el segmento.
- Las condiciones de inclusión o exclusión, cantidad y agrupación coinciden con lo ocurrido.
- La evaluación del segmento terminó y su membresía todavía está vigente; el contador visible puede usar caché y no cambiar al mismo tiempo.

Las condiciones de una misma regla se combinan como alternativas; el perfil debe cumplir todas las reglas del segmento. Revisa especialmente las negaciones y los períodos: el paso del tiempo puede cambiar qué debe evaluarse. Una lista de miembros, un contador y un evento de entrada al segmento no son la misma prueba.

Para misiones o rutas:

- El disparador usa el mismo nombre de señal y propiedades.
- La misión o ruta está activa.
- El cliente coincide con la audiencia y condiciones del disparador.
- El cliente está suscrito o es elegible para el canal.
- Los límites de frecuencia aplicables a esa herramienta, horarios, condiciones de detención o trabajo en curso no bloquearon o demoraron el siguiente paso. Los límites de misiones proactivas no son una regla universal para campañas, rutas o respuestas reactivas.
- Los datos requeridos de producto, carrito, orden, canal o perfil están lo suficientemente completos para que la misión actúe.
- El camino de fallback, no resuelto o asignación está configurado cuando la automatización no puede continuar.

Un evento recibido y una ruta iniciada no demuestran que cada paso esté listo para enviar. Revisa la actividad de la ruta, esperas, pausas y condiciones del paso. En misiones proactivas, las condiciones pueden volver a comprobarse al enviar: una compra posterior o falta de productos vendibles puede cambiar el resultado. Recibir una conversación, asignarla a una persona o equipo y enviar una respuesta también son etapas distintas.

Para campañas:

- El cliente estaba en la audiencia efectiva al momento del envío, después de combinar inclusiones y aplicar exclusiones. Pertenecer hoy a un segmento no prueba que estuviera incluido entonces.
- El canal y remitente estaban disponibles.
- El cliente era elegible para ese tipo de mensaje.
- El mensaje no se omitió por consentimiento, límites, plantilla o reglas del canal.

Distingue una omisión anterior a crear el mensaje de un mensaje pendiente, despachado, entregado o con error. El evento de entrada no garantiza un mensaje ni su entrega. Tampoco toda actividad se proyecta en una conversación de Inbox: esa vista depende de la acción y configuración del negocio.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

Para una lista específica de misiones, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## 5. Si reportes o atribución no se ven bien

Si la actividad ocurrió pero los reportes no muestran lo esperado, identifica primero qué cuenta cada métrica. Compara el mismo negocio, rango completo de fechas, zona horaria, canal, campaña o misión, filtros y moneda. El timestamp de compra, el de envío y el de una señal posterior pueden pertenecer a días diferentes.

Este reporte histórico ficticio selecciona **Primeros 14 días**, del **19 de abril al 2 de mayo de 2026**. En escritorio muestra cuatro tarjetas completas: ingresos atribuidos, ROI promedio, conversión e ingresos por mensaje; en la vista estrecha muestra la primera tarjeta del carrusel. Es independiente de los perfiles, pedidos y borradores anteriores; sus cifras no prueban que esas señales se hayan recibido.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y cuatro métricas de un reporte ficticio de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Período y cuatro métricas de un reporte ficticio de campaña" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Reporte histórico independiente; no es el resultado de los ejemplos anteriores.</figcaption>
</figure>

En reportes de campaña, conversión compara conversiones atribuidas con mensajes entregados; ROI divide ingresos por costo de entrega facturable, e ingresos por mensaje usa mensajes entregados. No compares estos porcentajes con visitas o personas únicas. **Interacción** cuenta una vez cada mensaje entregado visto, clicado o respondido, por su día de despacho en la zona horaria del negocio. Señales posteriores pueden actualizar esa cohorte; varios clics no son varias personas ni varias interacciones únicas.

Revisa:

- Si el mensaje usó links con tracking.
- Si el cliente hizo click desde el mismo perfil que luego compró o convirtió.
- Si la compra, orden, devolución, cancelación o conversión fue sincronizada.
- Si las reglas de atribución aplican para ese canal y timing.
- Si existía otra fuente comercial y qué evidencia y timestamps usa la atribución para decidir entre ella y Hellotext; no basta con observar el orden en que llegaron dos solicitudes.
- Si la actividad de prueba está filtrada, demorada o es fácil de confundir con tráfico real.
- Si estás comparando el mismo rango de fechas, canal, campaña, misión o audiencia.

Una compra guardada puede existir sin atribución a Hellotext. Compara identidad, evidencia de clic o entrega, ventanas de sesión/entrega y hora real de compra. Los reportes y sus proyecciones pueden actualizarse en segundo plano o usar caché; recargar no garantiza una actualización inmediata. Conserva los datos originales antes de concluir que falta el evento o de reenviarlo.

Sigue leyendo:

- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})

## Síntomas comunes

| Síntoma | Dónde revisar primero |
| --- | --- |
| Falta el perfil del cliente | Tienda, integración, captura, importación o identidad de API |
| La actividad aparece en el perfil equivocado | Email, teléfono, ID externo, perfiles duplicados o identidad enviada por la fuente |
| El evento nunca aparece | Sync de integración, Hellotext.js, request de API, nombre de acción o ambiente |
| El evento aparece pero el segmento no cambia | Reglas del segmento, ventana de tiempo, nombres de propiedades o momento de actualización |
| La misión no empezó | Disparador, audiencia, elegibilidad del canal, consentimiento, condiciones de detención o estado activo |
| Las métricas del reporte se ven bajas | Links con tracking, rango de fechas, reglas de atribución, canal, audiencia o pedidos sincronizados |
| El mensaje de WhatsApp/SMS no se envió | Configuración del canal, remitente, consentimiento, plantilla, límites o estado de entrega |

## Cuando contactes a soporte

Si el problema todavía no queda claro, incluye:

- Un perfil del cliente afectado.
- El evento o señal exacta que esperabas.
- El segmento, misión, ruta, campaña o reporte afectado.
- La fecha, hora y zona horaria de la actividad y de la solicitud, si son diferentes.
- La última etapa comprobada y la primera que falta, junto con estado o código de respuesta.
- El sistema de origen, integración, request de API o camino de captura involucrado.
- Capturas o links que muestren qué esperabas y qué apareció en su lugar.
- Cambios recientes en integraciones, scripts de tracking, plantillas, reglas de audiencia o configuración de misiones.

Incluye el nombre exacto de acción, referencia e ID público cuando correspondan, y errores relevantes de la solicitud original. Revisa encabezados, cuerpos, URLs y capturas antes de compartirlos: elimina tokens, contraseñas, códigos de verificación y datos reales de pago. Un ejemplo concreto permite separar configuración, identidad, tracking, elegibilidad, medición y atribución.

## Guías relacionadas

- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
