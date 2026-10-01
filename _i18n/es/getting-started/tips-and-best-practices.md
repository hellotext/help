Usa estas prácticas junto con el [checklist de lanzamiento]({% link _getting-started/launch-checklist.md %}) cuando estés preparando tu primera misión, ruta o envío real.

El objetivo es aprender con un lanzamiento controlado antes de ampliar la audiencia o activar más automatización. Define una acción que el cliente pueda completar, una audiencia acotada y una persona responsable de atender las respuestas.

## Empieza con una audiencia pequeña

Prepara una audiencia de prueba separada de los clientes, con destinos propios o de compañeros que aceptaron recibirla. Usa el destino apropiado al canal: teléfono, email o navegador, por ejemplo. Confirma los permisos y el alcance antes de realizar un envío real; llamar «prueba» a una lista no aísla sus efectos.

Antes de enviar a clientes, revisa en una prueba autorizada:

- El canal, negocio y remitente son los esperados y el cliente reconocerá la marca.
- El mensaje se entiende sin contexto adicional y sus variables se resuelven correctamente, también cuando falta un dato opcional.
- Los links finales abren la página correcta y conservan los parámetros de seguimiento que corresponden.
- La instrucción de baja y su mecanismo funcionan en ese canal. Escribir BAJA o STOP no configura por sí solo la desuscripción.
- Las respuestas llegan al Inbox o a la derivación prevista y alguien puede atenderlas. Si el canal no permite responder directamente, ofrece otro contacto.

Una vista previa permite revisar contenido. Una solicitud aceptada o un mensaje en preparación no confirma entrega. Si la prueba necesita compras, eventos o activación de un flujo, usa un entorno aislado compatible y revisa sus efectos sobre cobros, stock y otros mensajes; no fabriques actividad para obtener un reporte.

Sigue leyendo: [Crea una campaña]({% link _campaigns/creating-a-campaign.md %}).

## Envía a clientes con una relación clara

Para el primer envío de marketing, elige una audiencia pequeña cuya relación con el negocio haga útil el mensaje y cuyo permiso puedas comprobar para el canal, destino y tipo de comunicación. Una compra o conversación reciente no demuestra por sí sola ese permiso.

Evita listas frías, antiguas o no verificadas. Revisa bajas, exclusiones y solapamientos con otros flujos. El conteo disponible y los estados Suscrito o No confirmado tampoco sustituyen la evidencia de consentimiento.

Al importar un archivo, responde Sí a la pregunta de consentimiento solo si todos sus registros tienen el permiso confirmado; separa los casos distintos. No deja los perfiles nuevos como No confirmado. Los perfiles existentes deduplicados conservan su estado anterior y requieren su propia revisión.

La demostración siguiente conserva No seleccionado; no se inició la importación.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Importación ficticia con No seleccionado en la pregunta de consentimiento de marketing.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1050.5px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-es-20260928-crop.png 2x" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png 2x" style="width: auto; margin: 0 auto;" width="2065" height="705" loading="lazy" decoding="async" alt="Importación ficticia con No seleccionado en la pregunta de consentimiento de marketing." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La importación de demostración muestra No y no se inició. Revisa el permiso y el estado de cada perfil antes de incluirlo en el primer envío.</figcaption>
</figure>

En WhatsApp, comprueba también las condiciones de la conversación y la versión activa aprobada de la plantilla cuando corresponda. Consulta la [política de mensajería de WhatsApp Business](https://whatsappbusiness.com/policy/) para los requisitos de permiso, plantillas y baja.

Sigue leyendo: [Listas vs. segmentos]({% link _audience/lists-and-segments.md %}).

## Mantén el mensaje simple

Escribe el primer mensaje alrededor de una sola acción. Evita mezclar demasiadas ofertas, links, preguntas o explicaciones en el mismo envío.

Los buenos primeros envíos suelen responder:

- ¿Por qué el cliente recibe esto?
- ¿Qué tiene de útil?
- ¿Qué debería hacer el cliente después?

En Configuración → Plantillas puedes revisar el cuerpo de una plantilla de Mensaje/SMS. El borrador ficticio siguiente propone una acción: consultar las instrucciones de devolución. La variable, el enlace y la baja todavía deben comprobarse en el mensaje final de una prueba autorizada; el borrador no demuestra entrega ni aprobación de WhatsApp.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Borrador Mensaje/SMS de seguimiento de devolución con variable, URL e instrucción de baja.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 642px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-es-mobile.png 2x" width="668" height="760" />
        <img class="ht-editorial-visual__image" src="/images/developers/send-messages-with-api/editor-es.png" srcset="/images/developers/send-messages-with-api/editor-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Borrador Mensaje/SMS de seguimiento de devolución con variable, URL e instrucción de baja." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador ficticio sin guardar: una acción de devolución, con personalización y enlace que deben comprobarse antes del envío.</figcaption>
</figure>

Lee el contenido final en el canal elegido. Revisa ofertas, fechas y enlaces y elimina cualquier instrucción que compita con la acción principal.

Sigue leyendo: [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}).

## Respeta horarios y frecuencia

Revisa horarios silenciosos, expectativas del canal y frecuencia antes de lanzar campañas, misiones o rutas. Confirma la zona horaria del negocio y cómo se traduce la hora programada al horario de la audiencia; no asumas una adaptación automática a cada destinatario.

Si una automatización espera varias horas antes de enviar un mensaje, revisa el horario final, incluso si cruza al día siguiente. Para misiones y rutas, comprueba trigger, demora, audiencia, canal y reglas de detención antes de activarlas.

Anota qué otras campañas y automatizaciones puede recibir la misma persona. Los límites y reglas varían según el flujo; una espera o un tope de una misión no garantiza un máximo global. Define un alcance operativo que tu equipo pueda atender y revisa el solapamiento antes de ampliar.

Sigue leyendo: [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %}).

## Nombra claramente las herramientas de captura

Usa nombres que expliquen dónde se usa cada herramienta de captura. Por ejemplo, nombra un código QR según la tienda, evento, folleto, empaque o mostrador donde los clientes lo van a escanear: «QR · Mostrador · Tienda Centro» resulta más fácil de reconocer que «QR nuevo».

Los nombres claros ayudan a localizar la herramienta y leer su reporte. No prueban por sí solos qué fuente creó cada perfil, su permiso ni la atribución de una venta: un cliente existente puede interactuar con varias capturas. Conserva el contexto de la captura y comprueba las señales registradas antes de sacar conclusiones.

Sigue leyendo: [Resumen de herramientas de captura]({% link _captures/capture-overview.md %}).

## Usa los datos del perfil del cliente con intención

Usa formularios, opt-ins de checkout e integraciones para recopilar datos útiles para una decisión concreta. Mantén nombres de campos claros y comprueba el dato recibido en el perfil. Una conexión instalada o una propiedad creada no confirma que todos los perfiles tengan un valor.

Cuando crees segmentos, usa nombres que describan la audiencia buscada y revisa sus condiciones, inclusiones y exclusiones. Evita un nombre que prometa una intención que la regla no puede comprobar.

En el editor, abre el control de llaves para consultar Etiquetas. El menú muestra campos como name, email y propiedades del negocio; Nivel de fidelidad es una propiedad ficticia del ejemplo. Selecciona la etiqueta que corresponde al dato y verifica un perfil con valor y otro sin él. Los valores opcionales pueden quedar vacíos; los datos de pedido, cupón o respuesta dependen del contexto del flujo y no están disponibles de forma universal.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selector de Etiquetas abierto en un editor de campaña con campos de perfil y Nivel de fidelidad.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 818px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/personalization-tags/selector-es-mobile.png 2x" width="1020" height="780" />
        <img class="ht-editorial-visual__image" src="/images/audience/personalization-tags/selector-es.png" srcset="/images/audience/personalization-tags/selector-es.png 2x" style="width: auto; margin: 0 auto;" width="1600" height="1360" loading="lazy" decoding="async" alt="Selector de Etiquetas abierto en un editor de campaña con campos de perfil y Nivel de fidelidad." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Control de llaves y menú de Etiquetas en un borrador ficticio sin enviar. La vista pequeña enfoca el mismo menú de escritorio; no muestra valores resueltos para un destinatario.</figcaption>
</figure>

Sigue leyendo:

- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})

## Observa las primeras respuestas

Después del primer lanzamiento, revisa respuestas, bajas, errores y mensajes sin entrega confirmada, clics, decisiones de misiones, derivaciones y ventas atribuidas. Registra el período, canal, audiencia y zona horaria antes de cambiar una sola variable y comparar el resultado.

En Reportes de campaña, elige un período desde el lanzamiento o las fechas que quieres analizar. Las tarjetas del ejemplo muestran ingresos atribuidos, ROI promedio, conversión e ingresos por mensaje; combinan importes, un múltiplo y una tasa, por lo que no se suman entre sí. En móvil, usa la navegación de tarjetas para consultar las demás.

La demostración usa Primeros 14 días, del 19 de abril al 2 de mayo de 2026, con valores ficticios. No representa resultados de tu primer lanzamiento.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selector Primeros 14 días y tarjetas de ingresos atribuidos, ROI promedio, conversión e ingresos por mensaje.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" style="width: auto; margin: 0 auto;" width="2480" height="610" loading="lazy" decoding="async" alt="Selector Primeros 14 días y tarjetas de ingresos atribuidos, ROI promedio, conversión e ingresos por mensaje." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Demostración ficticia del 19 de abril al 2 de mayo de 2026, con Primeros 14 días seleccionado. Ilustra cómo elegir el período y leer unidades; no son resultados de tu primer lanzamiento.</figcaption>
</figure>

Distingue clics totales de clics únicos por mensaje, y despacho de entrega. Interacción cuenta mensajes entregados vistos, clicados o respondidos al menos una vez, agrupados por día de despacho en la zona horaria del negocio; señales posteriores pueden actualizar esa cohorte. Las ventas atribuidas dependen del origen y las ventanas del reporte, y no demuestran que cada venta haya seguido a un clic.

Asigna las respuestas a un responsable y cierra la conversación cuando el trabajo haya terminado. El cierre cambia el estado y puede afectar capacidad, seguimientos o encuestas según la configuración; no cierres casos pendientes para mejorar el aspecto de una métrica. Si aparece un problema de audiencia, contenido o capacidad, pausa el flujo afectado y revisa también sus pasos pendientes y otros flujos. Una pausa no retira mensajes ya enviados al proveedor.

Sigue leyendo:

- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
