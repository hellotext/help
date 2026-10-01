Usa esta sección cuando algo en Hellotext no se ve bien y necesitas definir dónde revisar primero.

Anota qué esperabas, qué observaste, el negocio, el registro o URL y la fecha y hora con zona horaria. Busca la última etapa confirmada: datos recibidos, acción iniciada, mensaje creado, entrega, asignación o respuesta. Las figuras de esta guía son ejemplos ficticios independientes; no representan un incidente ni su recuperación.

La solución de problemas normalmente empieza en uno de estos lugares:

- Configuración e integraciones.
- Canales y entrega de mensajes.
- Tracking, reportes y atribución.
- Operación del inbox y flujos del equipo.
- Capturas y experiencias del sitio.
- Acceso y carga de páginas.

Si no estás seguro de dónde pertenece el problema, empieza por el [checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %}).

## Configuración e integraciones

Si faltan perfiles de clientes, productos, pedidos o configuración de canales, o si la información parece desactualizada, empieza revisando el camino de integración y configuración.

Confirma primero el negocio seleccionado y la identidad o referencia del registro, junto con su origen. Un producto o pedido existente no demuestra que su evento se haya registrado; un perfil con email o teléfono tampoco demuestra verificación ni permiso de contacto.

En **Configuración > General**, este ejemplo ficticio muestra el nombre **Enterprise** y el ID público **4ONLdN32**. El nombre no demuestra el plan contratado, una conexión ni un cambio de negocio; la figura ayuda a localizar el contexto que debes anotar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre e ID público de un negocio ficticio en General">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nombre e ID público de un negocio ficticio en General" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo independiente de identidad; no demuestra plan, integración o recuperación.</figcaption>
</figure>

Sigue leyendo: [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %}).

## Envío de mensajes y entregabilidad

Si un mensaje no se entrega, primero revisa el canal usado, la configuración del remitente, consentimiento, saldo o acceso del plan, y cualquier límite temporal de envío.

Distingue una omisión antes de crear el mensaje de un mensaje existente pendiente, despachado, enrutado, entregado o en error. Conserva el estado y aviso exactos. La disponibilidad del canal, el permiso para ese destino y tipo de comunicación, y la entrega son comprobaciones distintas. Saldo disponible no elimina necesariamente límites diarios o mensuales; el respaldo por otro canal depende del flujo y de su elegibilidad.

Empieza aquí: [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

Para límites específicos de SMS en negocios prepago nuevos, sigue leyendo: [Límites de envío SMS para negocios nuevos]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

Si el problema es una plantilla de WhatsApp en revisión, rechazada, marcada o pausada, usa [Soluciona problemas con plantillas de WhatsApp]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %}).

Para contexto de configuración de canales, sigue leyendo: [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %}).

Si una notificación push no llega, aparece dos veces o no muestra una imagen o sus botones, sigue [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}).

Para Push, compara el origen del sitio, el permiso del navegador, la suscripción local y su registro en el servidor por separado. El campo de origen ayuda a identificar protocolo, dominio y puerto; la ruta de una página no es el origen.

La figura muestra **https://shop.example.test** en el formulario real como ejemplo ficticio sin guardar. No se pulsó **Continuar**: no muestra un canal creado, un permiso, una suscripción, una instalación de worker ni una notificación entregada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Origen ficticio sin guardar en el formulario de configuración Push">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 550px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/setup-push-notifications/origin-es-mobile.png 2x" width="764" height="332" />
        <img class="ht-editorial-visual__image" src="/images/integrations/setup-push-notifications/origin-es.png" srcset="/images/integrations/setup-push-notifications/origin-es.png 2x" width="1064" height="292" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Origen ficticio sin guardar en el formulario de configuración Push" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Campo de origen independiente; sin guardar ni crear canal, suscripción o resultado.</figcaption>
</figure>

## Campañas

Si el resultado de una campaña parece menor a lo esperado, revisa audiencia, canal, contenido del mensaje, links, timing y métricas del reporte antes de comparar resultados.

Compara el mismo período, zona horaria, población y unidad. La audiencia seleccionada puede incluir listas o segmentos superpuestos y exclusiones; su tamaño no es el número de mensajes creados o entregados. Las tasas del reporte tienen denominadores propios y las señales posteriores pueden actualizar la cohorte de mensajes entregados por día de despacho.

Este reporte histórico ficticio independiente conserva **Primeros 14 días**, del **19 de abril al 2 de mayo de 2026**, anclados a la campaña. Escritorio muestra cuatro tarjetas completas: ingresos atribuidos **USD 1.9K**, ROI **5.4** como múltiplo, conversión **6.3%** e ingresos por mensaje **USD 0.36**. La vista estrecha muestra la primera tarjeta del carrusel. No son los últimos catorce días actuales ni el resultado de resolver un problema.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y cuatro métricas de un reporte histórico ficticio de campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Período y cuatro métricas de un reporte histórico ficticio de campaña" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Período anclado a la campaña; la vista estrecha muestra la primera tarjeta.</figcaption>
</figure>

Sigue leyendo: [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Tracking y atribución

Si conversiones, eventos o ingresos atribuidos no coinciden con lo esperado, revisa si el tracking está instalado, si se están enviando eventos, si los links tienen tracking y si aplican las reglas de atribución.

Separa la definición de una acción de cada ocurrencia registrada. Compara nombre de tracking, identidad o sesión, referencia, origen y tiempo del evento. Cargar el SDK no confirma inicialización: su inicialización es asíncrona y cada vista real necesita registrar **page.viewed** explícitamente. Un acuse HTTP **200** con **received** no demuestra procesamiento, atribución ni entrega.

En **Configuración > Acciones > Personalizado**, el catálogo muestra la definición ficticia **appointment.booked / Cita reservada**, con cero eventos. Las vistas completa y estrecha ayudan a reconocer la definición; no muestran una cita ocurrida ni una señal recibida. La atribución requiere además revisar la cronología y reglas de las fuentes involucradas.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Definición ficticia appointment.booked en el catálogo de acciones personalizadas">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-es-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-es.png" srcset="/images/developers/custom-actions/catalog-es.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Definición ficticia appointment.booked en el catálogo de acciones personalizadas" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Definición independiente con cero ocurrencias; no prueba registro ni atribución.</figcaption>
</figure>

Sigue leyendo: [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %}).

Si falta una señal, evento, actualización de perfil, segmento, disparador de misión o métrica de reporte, empieza con [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

Si el problema es específico de una misión, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Inbox y flujos del equipo

Si las conversaciones no las está gestionando la persona correcta, o si la performance de respuesta parece incorrecta, revisa asignación, roles, ownership y configuración de tiempos de respuesta.

Distingue recepción, dueño de la conversación, destino de equipo, disponibilidad o capacidad y respuesta efectiva. Esperar capacidad no es lo mismo que no tener personas asignables. El rol, la pertenencia al equipo y la capacidad son ajustes diferentes; el acceso depende de la herramienta y del plan.

Esta figura independiente muestra el selector existente para **Lucía Méndez**, una integrante ficticia con **Agente** seleccionado, sin cambios. El encabezado y las tres opciones están completos; se omite todo el pie de guardado. No es tu rol, una invitación ni un resultado de asignación. **Siguiente** guarda el rol y no se pulsó.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Opciones de rol de una integrante ficticia con Agente seleccionado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 631px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-team-roles/roles-es-mobile.png 2x" width="828" height="1190" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-team-roles/roles-es.png" srcset="/images/team/understanding-team-roles/roles-es.png 2x" width="1226" height="1054" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Opciones de rol de una integrante ficticia con Agente seleccionado" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Integrante existente sin cambios; no muestra invitación, asignación o acceso denegado.</figcaption>
</figure>

Los objetivos de respuesta usan el calendario y zona horaria del negocio. Una respuesta humana y un acuse del proveedor no son equivalentes; cerrar o posponer tampoco demuestra una respuesta. Conserva la evidencia de la conversación y la configuración vigente antes de atribuir la espera a un rol.

Sigue leyendo: [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %}).

## Capturas y experiencias del sitio

Si un popup, formulario, Webchat, código QR, link u opt-in de checkout no aparece o no registra al cliente, identifica primero si el problema está en la disponibilidad, instalación, interacción, verificación, perfil del cliente o acción posterior.

El catálogo **Captura** ayuda a elegir la herramienta que debes revisar. Guardar un borrador, publicarlo, hacerlo visible o habilitarlo, instalarlo y recibir una interacción son etapas diferentes. El opt-in de checkout depende de la integración de comercio y no aparece como herramienta de este catálogo.

La figura reutiliza un ejemplo ficticio independiente de **Popup** y **Formulario** en escritorio. La vista estrecha es un foco del mismo catálogo desktop en **Formulario**, no una interfaz móvil nueva. Ver la tarjeta no demuestra publicación, instalación, envío, verificación ni consentimiento; un perfil recibido tampoco confirma la acción posterior.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Popup y Formulario en el catálogo Captura de ejemplo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-es.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/es/catalog-desktop-row.png" srcset="/images/captures/forms/es/catalog-desktop-row.png 2x" width="1632" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Popup y Formulario en el catálogo Captura de ejemplo" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Vista estrecha enfocada en Formulario desktop; no prueba publicación ni instalación.</figcaption>
</figure>

Empieza aquí: [Soluciona una captura que no aparece o no registra clientes]({% link _troubleshooting-deliverability/troubleshoot-a-capture.md %}).

## Acceso y carga de páginas

Si una página queda vacía, no termina de cargar o muestra el mismo error, conserva la URL y el momento del problema antes de recargar.

Añade el negocio, el texto exacto del aviso y el último paso confirmado. Si ocurrió después de guardar, importar o enviar, reconcilia el resultado original antes de repetir: la falta de respuesta visible no demuestra que la operación haya fallado. Que el documento cargue tampoco confirma que todos sus paneles o recursos hayan terminado. Revisa capturas y registros para excluir contraseñas, tokens y códigos antes de compartirlos con soporte.

Empieza aquí: [Soluciona páginas que no cargan]({% link _troubleshooting-deliverability/troubleshoot-pages-that-do-not-load.md %}).

Si el problema continúa, consulta [Contacta a soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).
