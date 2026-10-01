Usa este checklist después de conectar una tienda, sitio web, canal de mensajería, herramienta de captura o fuente de tracking personalizado.

El objetivo es confirmar que Hellotext puede ver el perfil de cliente correcto, recibir las señales correctas y usarlas de forma segura antes de lanzar misiones, rutas, campañas o reportes que dependen de esos datos.

Elige el negocio correcto y registra su ID público, la fuente, el canal y la zona horaria. Las figuras siguientes muestran estados ficticios independientes para reconocer los controles; no documentan una prueba completa, una suscripción o un envío realizados.

## Haz una prueba completa

Empieza con una validación autorizada y aislada: una cuenta de prueba, destinos controlados por tu equipo y permiso para ese canal y tipo de mensaje. Revisa primero registros existentes. No uses clientes reales ni registres compras o eventos para hacer coincidir un reporte.

1. Identifica un perfil reconocible en el negocio correcto; conserva su ID público y el identificador que envía cada fuente.
2. Si necesitas comprobar una captura, revisa su configuración y recorrido instalado. Realiza una suscripción sólo en el entorno autorizado y comprueba el destino, aviso y estado resultantes; abrir un preview no suscribe.
3. Realiza únicamente la actividad prevista por la validación: vista, carrito, pedido, formulario, respuesta o evento personalizado. Marca los datos de prueba y evita repetir la misma ocurrencia desde navegador y servidor.
4. Abre ese perfil en **Audiencia** y revisa propiedades, actividad y conversación. Compara acción, objeto, referencia, origen, importe y hora con el registro de la fuente.
5. Comprueba por separado el consentimiento, la disponibilidad del canal y las condiciones del flujo. Un perfil existente o alcanzable no autoriza un envío.
6. Sólo si el envío está habilitado y la prueba está autorizada, envía al destino aislado. Verifica contenido y destinatario antes de confirmar; un borrador o una solicitud aceptada no confirma entrega.
7. En esa prueba autorizada, revisa el enlace final y su tracking, y la respuesta en la conversación correcta. Abrir una URL también puede registrar actividad; no uses enlaces de clientes reales para diagnosticar.
8. Revisa cada evidencia y detén la validación si falta algo. Una respuesta `received` puede preceder al procesamiento y no demuestra que exista el evento, el mensaje o su atribución.

Si esta prueba pequeña no se ve bien, corrige la configuración antes de activar una misión o campaña amplia. Conserva fecha, hora, respuesta y registros existentes para reconciliar el paso que falló; no repitas automáticamente escrituras o envíos con resultado incierto.

## Perfiles de cliente

Abre el perfil en **Audiencia** y revisa identidad, propiedades y actividad por separado.

Busca:

- Nombre, teléfono, email o el identificador que envía tu integración, incluidos su origen y formato.
- Estado de suscripción y evidencia de permiso para el canal, destino y tipo de mensaje; no son equivalentes.
- Propiedades que usan segmentos, personalización o misiones, con el nombre y tipo que espera la regla.
- Pertenencia actual a listas o segmentos y exclusiones de la audiencia.
- Posibles duplicados, verificando que sean la misma persona antes de considerar una combinación.

**Camila Torres** es un perfil ficticio con email `@example.test`, dirección, negocio y cumpleaños, pero sin teléfono y con **Sin confirmar**. Esos campos no prueban permiso ni que pueda recibir mensajes. La variante pequeña es un recorte enfocado del mismo panel de escritorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Perfil ficticio de Camila Torres, Sin confirmar, con email de ejemplo, dirección, negocio y cumpleaños; sin teléfono.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 473px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 420px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" style="width: auto; margin: 0 auto;" width="910" height="1330" loading="lazy" decoding="async" alt="Perfil ficticio de Camila Torres, Sin confirmar, con email de ejemplo, dirección, negocio y cumpleaños; sin teléfono." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil ficticio de Camila Torres, Sin confirmar, con email de ejemplo, dirección, negocio y cumpleaños; sin teléfono.</figcaption>
</figure>

Si un cliente aparece más de una vez, compara los identificadores enviados por cada fuente y sus historiales antes de modificarlo. Un nombre parecido no demuestra identidad compartida. En tracking personalizado, una sesión del navegador y un perfil son identificadores distintos; comprueba que la asociación corresponda a la persona y negocio correctos.

## Datos de comercio

Para integraciones de comercio, confirma que estén presentes los datos que necesita tu primera misión y que coincidan con la tienda o sistema de origen.

Revisa:

- Órdenes recientes, estado de órdenes, estado de envíos, números y URLs de tracking si las misiones de soporte dependen de ellos. El operador logístico o transportista es opcional y puede aportar detalle de entrega. Para seguimiento de órdenes, mira [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}).
- Actividad de carrito o checkout si planeas recuperar carritos abandonados; un objeto de carrito no demuestra que ocurrió abandono.
- Nombres, imágenes, precios, variantes y disponibilidad que admite tu importador. El precio no es stock y no todas las fuentes exponen los mismos campos. Para descubrimiento de producto, mira [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}).
- Moneda, importes decimales, totales, cupones, devoluciones y estado de envío si afectan reportes o seguimiento.
- Referencia externa y origen de cada pedido o producto, especialmente si vendes por varios canales; no sustituyas su ID público por el nombre o SKU.

En **Ajustes > Objetos**, revisa el pedido existente. Este borrador ficticio muestra referencia **ORDER-1001**, origen **custom_store** y total **USD 89.90**. El campo **ID de la orden** del editor contiene la referencia, no el ID público de la API; **Entregar** indica la modalidad, no un envío realizado. El pedido no tiene eventos y no prueba una compra, sincronización o entrega.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Datos del pedido ficticio ORDER-1001, custom_store, USD 89.90 y Entregar; borrador sin eventos.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Datos del pedido ficticio ORDER-1001, custom_store, USD 89.90 y Entregar; borrador sin eventos." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Datos del pedido ficticio ORDER-1001, custom_store, USD 89.90 y Entregar; borrador sin eventos.</figcaption>
</figure>

No necesitas todos los campos posibles antes de lanzar; sí los que usa la primera misión, ruta, segmento o reporte. Revisa el estado leído después de una importación o corrección y distingue el objeto comercial del evento que describe lo ocurrido al cliente.

Para hacer una revisión completa de los productos, usa [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %}).

## Eventos y señales

Confirma que la actividad crea la ocurrencia esperada, no sólo que existe una definición de acción o un objeto.

Para cada señal importante, revisa:

- El nombre de tracking exacto y la compatibilidad con su origen: por ejemplo `product.viewed`, `cart.abandoned`, `order.placed` o una acción personalizada definida en ese negocio.
- El perfil correcto y, si usas sesión, su asociación e identidad antes de registrar la actividad.
- La hora original y la zona horaria de visualización. En API, `tracked_at` admite ISO 8601 o Unix en **segundos**; omitirlo puede registrar la hora de procesamiento en lugar de la de una actividad histórica.
- El objeto, referencia, importe, moneda y propiedades que realmente usa el disparador. Un importe heredado del objeto puede afectar la medición; no inventes un valor para completar la pantalla.
- La antigüedad y las condiciones concretas del disparador, audiencia o reporte; la presencia del evento no garantiza que active todos los flujos.

El formulario real **Nuevo evento** muestra al cliente ficticio **Demo Caso 1** y la acción **Cita reservada**, cuyo nombre de tracking es `appointment.booked`. El objeto asociado está vacío y **Guardar** está deshabilitado; no se registró un evento. El formulario manual actual puede requerir objeto para una acción personalizada aunque API/SDK permitan omitirlo. No guardes otro evento sólo para demostrar que llegó el original.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nuevo evento sin guardar para Demo Caso 1, Cita reservada, objeto asociado vacío y Guardar deshabilitado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449.0px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/manual-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/manual-es.png" srcset="/images/developers/custom-actions/manual-es.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1300" loading="lazy" decoding="async" alt="Nuevo evento sin guardar para Demo Caso 1, Cita reservada, objeto asociado vacío y Guardar deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Nuevo evento sin guardar para Demo Caso 1, Cita reservada, objeto asociado vacío y Guardar deshabilitado.</figcaption>
</figure>

Si usas Hellotext.js, espera su inicialización asíncrona y registra `page.viewed` explícitamente por vista real; la versión publicada 2.6.0 no lo registra automáticamente al inicializar. Evita duplicarlo en una SPA o entre fuentes. Mantén consistentes los nombres de acciones y comprueba el registro final después del acuse; `received` no incluye por sí solo un ID de evento ni garantiza sus efectos.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## Canales y consentimiento

Una señal puede estar disponible aunque Hellotext no deba enviar un mensaje.

Antes de lanzar, confirma:

- El canal está conectado al negocio correcto y el remitente, cuenta de WhatsApp o código corto está disponible.
- Existe permiso para ese canal, destino y tipo de mensaje, además del estado de suscripción. **Sin confirmar**, **Suscrito**, un número o email y la elegibilidad técnica no sustituyen ese permiso.
- El contenido, plantilla y reglas de conversación encajan con el canal. En WhatsApp, comprueba la versión activa aprobada y la cuenta que la envía; un borrador o la aprobación de una versión anterior no demuestra que la última edición esté lista.
- Zona horaria, horarios silenciosos, frecuencia y solapamiento de campañas, rutas y misiones están revisados según cada flujo; no asumas un único límite global.
- El cliente dispone de una baja real y las respuestas llegan al Inbox o a la persona responsable, con capacidad de atención.

Esto es especialmente importante cuando una misión elige el siguiente paso automáticamente. Aplica también la [política vigente de WhatsApp](https://whatsappbusiness.com/policy/) cuando corresponda.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Capturas y seguimiento

Si el lanzamiento depende de una captura, distingue la configuración o preview del recorrido activo e instalado que verá el cliente.

Revisa:

- El QR, link, formulario, popup u opt-in de checkout abre en el sitio y canal correctos; el borrador debe estar publicado e instalado donde corresponda.
- El aviso identifica el negocio, canal y propósito reales y el destino introducido coincide con el resultado esperado. No asumas que cualquier captura suscribe a todos los canales.
- Fuente, etiquetas, campos y cupón quedan registrados como requiere el flujo; una etiqueta de origen no es por sí sola permiso ni atribución.
- La bienvenida, ruta o misión asignadas son las correctas y están listas; guardar una captura no garantiza envío o respuesta.
- El resultado de una validación autorizada aparece en el perfil y conversación correctos, sin mezclar datos ficticios con ventas reales.

El siguiente preview de **Editorial Demo** muestra teléfono, **Suscribirme** y un aviso de SMS. Sigue siendo un borrador sin respuestas, cupón ni ruta asignados; no se pulsó Suscribirme y no prueba instalación o consentimiento. Se usa la misma fuente completa en escritorio y móvil.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Preview real del formulario ficticio Editorial Demo, teléfono, Suscribirme y aviso de SMS; borrador sin respuestas.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 490px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/preview.png" srcset="/images/captures/forms/ui-refresh/es/preview.png 2x" style="width: auto; margin: 0 auto;" width="944" height="780" loading="lazy" decoding="async" alt="Preview real del formulario ficticio Editorial Demo, teléfono, Suscribirme y aviso de SMS; borrador sin respuestas." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Preview real del formulario ficticio Editorial Demo, teléfono, Suscribirme y aviso de SMS; borrador sin respuestas.</figcaption>
</figure>

## Reportes y atribución

Antes de enviar de forma amplia, define período, zona horaria, unidad y población de cada métrica.

Revisa:

- Los enlaces tienen tracking cuando lo esperas y conservan el destino y contexto correctos.
- Los clics y respuestas pertenecen al mensaje y perfil correctos. Los clics totales y los mensajes con al menos un clic no equivalen a personas únicas.
- Las compras posteriores cumplen las reglas, cronología y ventanas de atribución del origen; un pedido guardado o una compra posterior al envío no garantiza crédito.
- La actividad de prueba está identificada y separada de resultados reales; no crees registros para llenar tarjetas.

En el reporte de campaña, revisa el selector de período antes de comparar métricas. Esta demostración conserva **Primeros 14 días**, del **19 de abril al 2 de mayo de 2026**, con ingresos atribuidos USD 1.9K, ROI 5.4×, conversión 6.3% e ingresos/mensaje USD 0.36. Son valores ficticios históricos, no el resultado de configurar esta integración. Escritorio muestra las cuatro tarjetas completas; móvil muestra la primera tarjeta del carrusel.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reporte ficticio Primeros 14 días, cuatro tarjetas en escritorio y primera tarjeta del carrusel móvil; 19 de abril al 2 de mayo de 2026.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 1258.0px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" style="width: auto; margin: 0 auto;" width="2480" height="610" loading="lazy" decoding="async" alt="Reporte ficticio Primeros 14 días, cuatro tarjetas en escritorio y primera tarjeta del carrusel móvil; 19 de abril al 2 de mayo de 2026." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Reporte ficticio Primeros 14 días, cuatro tarjetas en escritorio y primera tarjeta del carrusel móvil; 19 de abril al 2 de mayo de 2026.</figcaption>
</figure>

La conversión de campaña divide compras atribuidas por mensajes entregados; ingresos/mensaje usa ese denominador y ROI compara ingresos atribuidos con costo de entrega. **Interacción** agrupa mensajes entregados vistos, clicados o respondidos por día de despacho en la zona horaria del negocio; señales posteriores pueden actualizar esa cohorte. El período del reporte no amplía la ventana de atribución. Si dos vistas difieren, compara los mismos registros y criterios antes de concluir que falta actividad.

Sigue leyendo: [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %}).

## Antes de lanzar una misión

Revisa la misión, ruta o campaña específica que estás por publicar.

Confirma:

- La señal disparadora existe con la identidad y contexto que espera la regla.
- La audiencia, unión de listas o segmentos y exclusiones incluyen las personas previstas, con permiso y destino adecuados.
- El canal está listo y los límites, horarios y condiciones de entrada permiten el paso previsto.
- Mensaje, prompt, oferta, productos, variables y enlaces finales están correctos.
- Condiciones de detención, pausas, derivación y responsable de la conversación están definidos.
- Reportes, período y métricas de éxito tienen criterios verificables.

Sólo después de esa revisión, inicia un alcance pequeño autorizado y observa antes de ampliar. Si pausas, comprueba qué pasos detiene el flujo y qué mensajes siguen pendientes; la pausa no retira mensajes ya entregados al proveedor.

## Si falta algo

Las causas comunes incluyen:

- Tienda, marketplace, cuenta de Meta Business o negocio de Hellotext incorrectos.
- Token de otro negocio, credenciales vencidas, permisos, suscripción o configuración incompletos. El ID público del negocio y un token privado de API cumplen funciones distintas; no pongas el token en código del navegador.
- Dominio, checkout o script instalados en el lugar incorrecto, o inicialización y asociación de sesión incompletas.
- Primera sincronización o procesamiento todavía pendientes; no existe un plazo único para todas las fuentes.
- Identificadores de cliente distintos o una sesión asociada a otra persona.
- Acción, propiedad, objeto o fecha que no coinciden con la regla.
- Falta de permiso, destino, disponibilidad del canal o versión activa de la plantilla.

Localiza el primer paso sin evidencia y corrige su causa. Antes de repetir una escritura, una suscripción, un evento o un envío con resultado incierto, comprueba los registros existentes y la respuesta; no asumas deduplicación general. No reconectes ni importes todo otra vez como primera medida.

Si necesitas diagnosticar dónde se detuvo la señal después de lanzar, sigue leyendo: [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}). Para soporte, conserva ID público del negocio y registros, origen, hora/zona horaria, paso, estado y respuesta exacta, ocultando tokens, cookies, contraseñas y datos innecesarios del cliente.

## Guías relacionadas

- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
