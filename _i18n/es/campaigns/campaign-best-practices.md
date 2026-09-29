Usa estas prácticas antes de enviar una campaña. Te ayudan a hacer que la audiencia, el mensaje, el canal y el horario trabajen juntos, dejando margen suficiente para pruebas y aprobación.

Para ver el proceso completo en el producto, lee [Crea una campaña]({% link _campaigns/creating-a-campaign.md %}).

## Empieza con un solo resultado

Define qué debería lograr la campaña antes de seleccionar una audiencia o redactar el mensaje. Un objetivo útil es lo suficientemente específico como para medirlo, por ejemplo:

- Anunciar un lanzamiento de producto o una reposición.
- Llevar visitas a una promoción o colección.
- Generar compras de una audiencia seleccionada.
- Comunicar una novedad con fecha o tiempo limitado.
- Invitar clientes a un evento u otro momento planificado.

Usa una campaña cuando el negocio elige el mensaje, la audiencia y el momento de entrega para un envío puntual. Usa una misión cuando Hellotext debería seguir respondiendo a señales del cliente y decidir cuándo una acción es relevante.

Dale a cada campaña un único llamado a la acción principal. Varios links o pedidos que compiten hacen más difícil interpretar tanto el mensaje como su reporte.

## Enfoca la audiencia

Empieza con la audiencia más pequeña que coincida con el objetivo. Puedes incluir o excluir listas, segmentos y audiencias de campañas programadas o enviadas anteriormente.

- Usa una **lista** para un grupo fijo de perfiles de cliente.
- Usa un **segmento** cuando sus integrantes deban actualizarse según datos o comportamiento.
- Usa **exclusiones** para quitar grupos que no deberían recibir ese mensaje en particular.

Hellotext elimina superposiciones y calcula el target estimado según los canales seleccionados, el estado de suscripción, los destinos utilizables, las inclusiones y las exclusiones. Compara el **Target estimado** con lo que esperabas antes de continuar; puede ser menor que la cantidad total de integrantes de los grupos seleccionados y no confirma por sí solo el permiso para enviar.

Usa el límite de audiencia cuando quieras enviar intencionalmente a una cantidad máxima de clientes elegibles. El límite controla el tamaño de la campaña, pero no vuelve contactable a un perfil que no sea elegible.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot ht-editorial-visual--campaign-audience-limit" aria-label="Opciones de límite de audiencia">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaign-best-practices/audience-limit-es-mobile.png" width="470" height="104" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaign-best-practices/audience-limit-es.png" width="1152" height="626" loading="lazy" decoding="async" alt="Opciones de límite de audiencia, con el control Limitar a y su campo para la cantidad de clientes." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El límite se configura desde los ajustes del target estimado; la captura muestra un borrador ficticio sin enviar.</figcaption>
</figure>

Sigue leyendo: [Diferencias entre Listas y Segmentos]({% link _audience/lists-and-segments.md %}) y [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}).

## Elige la opción de envío de forma intencional

Selecciona la opción que coincida con la audiencia y el contenido:

- **WhatsApp y SMS** intenta primero por WhatsApp y usa SMS cuando WhatsApp no está disponible para un cliente elegible.
- **Solo WhatsApp** mantiene la entrega en WhatsApp y puede soportar contenido de campaña más enriquecido.
- **Solo SMS** mantiene la campaña concisa y la entrega por SMS.
- **Solo correo** envía únicamente por correo electrónico y requiere acceso al canal y un remitente verificado y activo.

El creador muestra estas opciones, pero poder enviar depende del acceso y de tener un remitente listo para el canal elegido. En esta cuenta de demostración se puede seleccionar SMS, mientras que WhatsApp aparece deshabilitado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selección del canal de una campaña de demostración">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 711px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/campaign-best-practices/channel-choice-es-mobile.png" width="716" height="1130" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/campaign-best-practices/channel-choice-es.png" width="1350" height="1060" loading="lazy" decoding="async" alt="En Cómo se enviará, Solo SMS está seleccionado y WhatsApp y SMS aparece deshabilitado en una cuenta ficticia." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con una cuenta ficticia; la disponibilidad de los canales cambia según el negocio.</figcaption>
</figure>

Confirma el remitente, el target estimado y la vista previa de cada canal seleccionado en lugar de asumir que los mismos perfiles de cliente son elegibles en todos.

## Escribe para los canales seleccionados

Mantén el mensaje enfocado y haz evidente la próxima acción. En el editor:

- Coloca el valor principal cerca del comienzo.
- Usa la herramienta de links con tracking para los destinos que quieras medir.
- Agrega valores alternativos a las etiquetas de personalización, como `{name|cliente}`.
- Haz referencia a un cupón disponible con la herramienta de cupones en lugar de escribir el código como texto común.
- Revisa archivos, botones, pie de página, ubicación y otro contenido de WhatsApp cuando lo uses.
- Comprueba la longitud del SMS y la estimación de partes que muestra el editor.

Cuando eliges WhatsApp, el contenido nuevo o modificado puede necesitar aprobación de Meta como plantilla. Evita cambios innecesarios a último momento después de probar, porque el contenido modificado puede requerir otra revisión.

Sigue leyendo: [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}).

## Prueba lo que recibirá el cliente

Envía una prueba a un número que controles para SMS o WhatsApp, o a una dirección propia para una campaña de solo correo. Revisa cada canal seleccionado y confirma que:

- La primera línea y el llamado a la acción sean claros.
- La personalización y los valores alternativos se lean naturalmente.
- Cada link con tracking abra el destino correcto.
- Las reglas y el vencimiento del cupón sean correctos.
- Los archivos, botones, pie de página y ubicación aparezcan como esperabas.
- La estimación de partes del SMS sea aceptable.

Una prueba de WhatsApp con contenido nuevo puede esperar la aprobación de Meta. Una prueba permite revisar el mensaje en el número o la dirección elegidos; no demuestra que todos los perfiles de la audiencia final sean elegibles.

## Deja margen para la revisión y las ventanas de entrega

Las campañas pueden enviarse ahora o programarse para una fecha y hora futuras. Hellotext aplica las ventanas de comunicación del país de destino y los ajustes de horas nocturnas del negocio.

Las campañas dirigidas a por lo menos 100 clientes pueden requerir revisión editorial; una campaña cuyas plantillas de WhatsApp ya fueron aprobadas puede omitir ese paso. El contenido nuevo de WhatsApp también puede necesitar aprobación de Meta. Programa los lanzamientos importantes con margen para las revisiones que correspondan en lugar de enviarlos inmediatamente antes del horario de entrega deseado.

## Coordina campañas con misiones activas

Las campañas y las misiones pueden estar activas al mismo tiempo. Antes de una campaña importante, revisa otras campañas programadas y las misiones activas relevantes para que los clientes no reciban mensajes repetidos o contradictorios.

La campaña debería agregar un momento planificado y claro a la experiencia del cliente. No debería duplicar una misión activa que ya decide cuándo ese mismo mensaje es relevante.

## Supervisa la entrega y las respuestas

Después de enviar, usa las pestañas de Campañas para seguir la revisión, programación y entrega. Si necesitas detener temporalmente una campaña activa, páusala y reanúdala únicamente después de confirmar que la audiencia, el contenido y el horario siguen siendo apropiados.

Las respuestas de clientes llegan al Inbox por el canal correspondiente. Asegúrate de que alguien esté disponible para atender las preguntas o la intención de compra que genere la campaña.

## Aprende del reporte automático

Hellotext genera el reporte de campaña automáticamente después de la entrega. Revisa las métricas que coincidan con el objetivo original:

- Entrega y clicks rastreados.
- Conversión y compras atribuidas.
- ROI, ingresos atribuidos e ingresos por mensaje.
- Actividad de clientes y rendimiento por canal cuando esté disponible.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Embudo de entrega de un reporte de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-es-mobile.png" width="754" height="820" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/delivery-funnel-es.png" width="1560" height="880" loading="lazy" decoding="async" alt="Embudo de demostración con las etapas Enviado, Entregado, Interacción y Conversión para revisar dónde se pierde respuesta." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Se reutiliza una captura aprobada de Reportes de campaña con datos ficticios; no se envió una campaña para esta guía.</figcaption>
</figure>

No optimices una sola métrica de forma aislada. Un CTR alto con conversión baja puede significar que el mensaje generó interés, pero la oferta, el destino, la audiencia o la experiencia de compra no completaron el trabajo.

Sigue leyendo: [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Checklist final

Antes de seleccionar **Enviar**, confirma que:

- El objetivo corresponde a una campaña puntual en lugar de una misión o una ruta.
- La audiencia y las exclusiones coinciden con ese objetivo.
- Los perfiles de cliente tienen consentimiento para los canales seleccionados.
- El mensaje tiene un llamado a la acción claro.
- Los links, la personalización, los cupones y el contenido enriquecido pasan una prueba.
- El horario deja margen para revisión editorial o de Meta.
- Otras campañas programadas y las misiones activas no crearán una experiencia confusa.
- El equipo está listo para supervisar entrega, respuestas y el reporte.

## Guías relacionadas

- [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
