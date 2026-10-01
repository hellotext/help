Usa este checklist cuando algo no se ve bien y necesitas decidir dónde investigar primero.

Antes de cambiar configuración, anota el síntoma exacto, el negocio afectado, el perfil del cliente o audiencia, el canal y la hora aproximada en que ocurrió el problema.

Añade la URL o referencia del registro, la zona horaria y la última etapa que pudiste confirmar. Distingue entre datos ausentes, una acción que no empezó, un mensaje creado sin entrega y una respuesta sin asignar: cada caso necesita evidencia distinta.

Si una carga falló después de enviar, importar, guardar o ejecutar una integración, confirma primero el resultado original. La falta de aviso no demuestra que la operación haya fallado. Si sigue incierto, consulta a soporte antes de repetirla.

## 1. Confirma la configuración y los datos de origen

Si faltan perfiles de clientes, productos, pedidos o configuración de canales, o si la información parece desactualizada, empieza por la configuración.

Revisa si la tienda o integración está conectada, si los datos recientes se están sincronizando y si el perfil del cliente afectado tiene los datos esperados.

Compara el mismo negocio, identidad o referencia y origen. Que exista un pedido o producto no demuestra que se haya recibido su evento; que el perfil tenga email o teléfono tampoco demuestra verificación ni permiso para enviar por ese destino.

La figura muestra un perfil ficticio independiente: **Camila Torres**, **Sin confirmar**, con email de ejemplo y sin teléfono. Úsala para localizar campos y estado, no como prueba de integración o consentimiento. La vista estrecha es un foco de la misma pantalla de escritorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campos y estado Sin confirmar de un perfil ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campos y estado Sin confirmar de un perfil ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil independiente; no demuestra verificación, sincronización ni consentimiento.</figcaption>
</figure>

Sigue leyendo:

- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})

## 2. Revisa el canal y el remitente

Si un mensaje no se envió o no llegó, identifica primero el canal.

Revisa el remitente, el consentimiento para ese canal, el acceso de la cuenta, saldo o límites del plan y cualquier límite temporal de SMS que pueda aplicar a negocios nuevos.

Separa la disponibilidad del canal, la posibilidad de contactar ese destino y su permiso vigente. Un estado general de suscripción no sustituye la revisión por canal, destino y tipo de comunicación. En WhatsApp, un borrador o editor común no demuestra una versión activa aprobada; consulta la guía específica de plantillas.

Si hay un mensaje, conserva su estado y error exactos. **Pendiente**, **despachado**, **enrutado**, **entregado** y **error** son etapas distintas; un acuse de solicitud o el estado enrutado no confirma entrega. Si el mensaje no existe, investiga también una omisión previa a su creación. Los límites diarios de SMS y los límites mensuales de mensajes tienen bases diferentes; evita asumir que saldo disponible elimina ambos.

Este ejemplo independiente del importador conserva **No** en la opción de actualizar clientes como suscritos. La importación no se inició y el archivo está **No seleccionado**. Muestra dónde revisar una decisión de consentimiento, no un permiso nuevo, una baja ni un cambio en perfiles existentes. No inicies una importación para comprobar un envío.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Opción No de suscripción en una importación ficticia sin iniciar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1050.5px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-es-20260928-crop.png 2x" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png 2x" width="2065" height="705" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Opción No de suscripción en una importación ficticia sin iniciar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Archivo No seleccionado; no se ejecutó la importación ni cambió el consentimiento.</figcaption>
</figure>

Sigue leyendo:

- [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Soluciona problemas con plantillas de WhatsApp]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Límites de envío SMS para negocios nuevos]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %})
- [Conecta WhatsApp]({% link _integrations/connect-whatsapp.md %})

## 3. Revisa audiencia y configuración del mensaje

Si una campaña llegó a menos personas de lo esperado, revisa la audiencia seleccionada, reglas de segmento, elegibilidad por canal, timing y contenido del mensaje.

Para automatizaciones, confirma qué misión o ruta debería haber corrido y si el cliente coincidía con las condiciones del disparador.

Compara el tamaño de la audiencia con la etapa correcta: las listas y segmentos seleccionados pueden superponerse, las exclusiones quitan perfiles y la elegibilidad por canal puede reducir los destinatarios. Un conteo o previsualización no demuestra cuántos mensajes se crearon o entregaron. Revisa las condiciones y el período del segmento; los conteos pueden estar cacheados.

En una automatización, un evento recibido no garantiza ejecución ni envío. Comprueba activación, disparador y filtros, admisión cuando corresponda, pasos, horarios y condiciones que se vuelven a evaluar antes de enviar. Conserva la evidencia existente de cada etapa; no actives la misión ni generes un evento o mensaje para fabricar una prueba.

El editor **Mensaje**, abierto desde SMS, muestra un borrador ficticio **Seguimiento de devolución**, con **{name}** sin resolver, una URL de ejemplo y el texto **BAJA**. No se guardó ni envió; no muestra destinatarios efectivos, partes SMS finales o aprobación de WhatsApp. Revisa las propiedades disponibles y el contexto de tu propio mensaje antes de interpretar la personalización.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Borrador ficticio Mensaje con personalización sin resolver">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 642px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-es-mobile.png 2x" width="668" height="760" />
        <img class="ht-editorial-visual__image" src="/images/developers/send-messages-with-api/editor-es.png" srcset="/images/developers/send-messages-with-api/editor-es.png 2x" width="1248" height="708" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Borrador ficticio Mensaje con personalización sin resolver" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador independiente sin guardar; no demuestra elegibilidad, aprobación ni entrega.</figcaption>
</figure>

Sigue leyendo:

- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})

## 4. Revisa links, tracking y atribución

Si clicks, eventos, conversiones o ingresos atribuidos no se ven bien, revisa si el mensaje usó links con tracking, si los eventos están llegando a Hellotext y si aplican las reglas de atribución.

Recuerda que otro click comercial, una acción comercial humana, cancelaciones o devoluciones pueden cambiar la atribución.

Compara el mismo período, zona horaria, población y unidad. Un clic no es necesariamente una persona única; las tasas de campaña tienen denominadores propios. Las señales de interacción pueden actualizar posteriormente la cohorte de mensajes entregados por día de despacho. No compares esa cohorte con todos los eventos ocurridos durante el mismo rango.

Si usas el SDK, cargar el archivo no confirma inicialización: espera su inicialización asíncrona y revisa que cada vista real registre explícitamente **page.viewed**. Si la API respondió HTTP **200** con **received**, conserva el acuse y verifica después el registro y procesamiento; no lo tomes como prueba de evento visible, atribución o entrega. Reconcilia una respuesta incierta antes de reintentar.

La figura es un reporte histórico ficticio independiente con **Primeros 14 días**, del **19 de abril al 2 de mayo de 2026**, anclados a la campaña. Escritorio muestra cuatro tarjetas completas: ingresos atribuidos en USD, ROI como múltiplo, conversión como porcentaje e ingresos por mensaje en USD; la vista estrecha muestra la primera tarjeta del carrusel. No representa datos actuales ni el resultado de resolver este problema.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y cuatro métricas de una campaña histórica ficticia">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Período y cuatro métricas de una campaña histórica ficticia" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Período histórico independiente; la vista estrecha muestra la primera tarjeta.</figcaption>
</figure>

Sigue leyendo:

- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})

## 5. Revisa ownership del inbox y flujo de respuesta

Si las respuestas no las está gestionando la persona esperada, revisa asignación de conversaciones, roles del equipo, ownership y configuración de tiempos de respuesta.

Distingue recepción del mensaje, dueño de la conversación, destino de equipo, disponibilidad o capacidad de las personas y respuesta efectiva. Una espera por capacidad no es lo mismo que la ausencia de miembros asignables. Tampoco estar abierto, cerrado o sin leer demuestra quién debe responder ni que se haya cumplido un objetivo.

La figura muestra una política ficticia existente con objetivos predeterminados de **5 minutos** para la primera respuesta y la respuesta continua, sin cambios. El encabezado y ambos campos están completos; el pie de guardado se omite. Es independiente de los otros ejemplos: no muestra una conversación asignada, una cola ni un cumplimiento real.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Objetivos predeterminados de respuesta de una política ficticia existente">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-es-mobile.png 2x" width="824" height="844" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-es.png" srcset="/images/team/understanding-response-times/default-es.png 2x" width="972" height="820" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Objetivos predeterminados de respuesta de una política ficticia existente" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Objetivos de cinco minutos sin cambios; no muestran asignación ni cumplimiento.</figcaption>
</figure>

Los objetivos usan el calendario y zona horaria del negocio; no son la ventana del canal ni una garantía de entrega. Una respuesta humana y un acuse del proveedor son acciones diferentes. Revisa permisos y configuración existentes sin cambiar roles, horarios o dueños como prueba.

Sigue leyendo:

- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Asignando conversaciones]({% link _team/assigning-conversations.md %})
- [Entendiendo tiempos de respuesta]({% link _team/understanding-response-times.md %})

## Cuando contactes a soporte

Si una página no carga, conserva la URL, el momento del error y la última acción antes de recargar. Sigue [Soluciona páginas que no cargan]({% link _troubleshooting-deliverability/troubleshoot-pages-that-do-not-load.md %}).

Incluye el nombre del negocio, el perfil del cliente afectado, el canal, el link a la campaña, misión, conversación o reporte, la hora aproximada, qué esperabas, qué ocurrió y cualquier captura o cambio reciente de configuración. Revisa [Contacta a soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) antes de enviar información sensible.

Incluye el texto exacto del aviso, la fecha y hora con zona horaria, las comprobaciones realizadas y el último resultado confirmado. Separa observaciones de suposiciones. Comparte capturas y registros por el canal acordado con soporte, revisando datos de clientes y contenido de mensajes; excluye tokens, contraseñas y códigos de verificación.
