Usa esta guía cuando los clientes llevan alrededor de 3 meses sin actividad y quieres que Hellotext haga un intento cuidadoso de reactivación.

Reactivación de Inactivos es un playbook de recuperación. Ayuda a Hellotext a identificar clientes que no compraron, visitaron, hicieron click, respondieron o tuvieron otra interacción relevante durante un período más largo, y luego enviar un mensaje de reactivación relevante cuando el cliente todavía es elegible para recibir mensajes.

No es una ruta, una campaña puntual ni el último intento antes de suprimir un cliente. Vive entre [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), que cubre inactividad reciente alrededor de 30 días, y [Último Intento]({% link _journeys/sunset-saver-playbook.md %}), que es para clientes alrededor de 12 meses sin actividad o sin reactivarse.

La disponibilidad puede variar según cuenta y estado de despliegue. Si la tarjeta aparece como a pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Reactivación de Inactivos

Reactivación de Inactivos ayuda a traer de vuelta clientes que quedaron quietos por más tiempo que una pausa normal de compra.

Puede:

- Detectar clientes alrededor de 3 meses inactivos, según señales de compra, navegación, clicks, respuestas u otra interacción relevante.
- Usar historial del cliente, contexto de producto, datos de catálogo, elegibilidad de canal y reglas de oferta antes de enviar un mensaje.
- Sugerir productos, colecciones u ofertas relevantes según el comportamiento anterior del cliente.
- Generar ejemplos de mensajes personalizados que se adaptan por cliente.
- Permitir que tu equipo dé feedback en Playground para que Hellotext aprenda qué encaja con el negocio.
- Seguir reglas de oferta existentes del eCommerce, usar descuentos con IA hasta un porcentaje máximo aprobado o enviar sin descuentos.
- Buscar el canal más eficiente en costo entre los disponibles, como WhatsApp, SMS u otros, y enviar solo cuando detecta internamente una oportunidad con ROI saludable.
- Omitir clientes cuando el cliente se reactivó, compró recientemente, entró en otro playbook activo, quitó consentimiento, no puede ser alcanzado o no hay suficiente contexto de producto.

La configuración exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas y estado de despliegue.

## Cuándo usarlo

Usa Reactivación de Inactivos cuando un cliente lleva más tiempo inactivo que la ventana de Reactivación Suave, pero todavía no está en un momento de último intento.

Encaja bien cuando:

- El cliente lleva alrededor de 3 meses sin actividad.
- El cliente compró, visitó, hizo click, respondió o mostró suficiente interés antes como para justificar un mensaje de recuperación.
- Reactivación Suave no aplicó, no reactivó al cliente o el cliente ya pasó ese momento de inactividad reciente.
- El negocio tiene una razón relevante para escribir, como una actualización de producto, nueva colección, recomendación u oferta aprobada.
- El objetivo es recuperar la relación sin enviar campañas genéricas repetidas.

No uses Reactivación de Inactivos para una baja reciente de 30 días. Para eso usa [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}). No lo uses como limpieza final para clientes alrededor de 12 meses inactivos; usa [Último Intento]({% link _journeys/sunset-saver-playbook.md %}).

Para momentos específicos de producto, usa el playbook más específico: [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) para timing de recompra de consumibles, [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) para productos relacionados después de compra y [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) para carrito o checkout abandonado.

## Qué necesita antes del lanzamiento

Antes de habilitar Reactivación de Inactivos, confirma la configuración de la que depende.

Revisa que:

- Tu tienda o fuente de datos envíe historial de compras y actividad del cliente a Hellotext.
- Los perfiles del cliente tengan identificadores confiables, consentimiento de canal y comportamiento histórico.
- Nombres, imágenes, precios, stock y links de producto estén actualizados.
- Los productos o colecciones que quieres usar sean apropiados para mensajes de recuperación.
- La audiencia que quieres alcanzar sea identificable y elegible para el canal seleccionado.
- Las señales de compra, navegación, clicks, respuestas, bajas, opt-out y reactivación reciente estén disponibles para que Hellotext evite envíos irrelevantes.
- Si se permiten descuentos, las reglas de oferta del eCommerce y cualquier porcentaje máximo de descuento con IA estén aprobados antes del lanzamiento.
- Tarjetas de producto, links de producto o mensajes enriquecidos funcionen en los canales que quieres usar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, bajas, respuestas y oportunidades omitidas.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Reactivación de Inactivos**.

Las tarjetas disponibles pueden variar, pero la configuración propuesta se concentra en:

- **Canales de salida:** dónde Hellotext puede enviar o continuar el mensaje de reactivación.
- **Audiencia:** qué audiencia o segmento puede recibir el playbook.
- **Productos:** qué productos, colecciones, categorías o grupos puede usar el mensaje.
- **Estrategia de descuento:** si el playbook sigue las reglas de oferta del eCommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono o feedback en Playground:** cómo deberían aprender los ejemplos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Reactivación de Inactivos depende de si el cliente todavía puede ser alcanzado en un canal donde el mensaje tenga sentido. Hellotext puede elegir internamente el canal más eficiente en costo, como WhatsApp, SMS u otros según disponibilidad, y evitar envíos cuando no detecta una oportunidad con ROI saludable.

Si necesitas un agente conversacional a medida con instrucciones, conocimiento y reglas de derivación propias, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}). Si necesitas una secuencia totalmente controlada de pasos, usa una ruta personalizada.

## Cómo elige Hellotext el momento

Reactivación de Inactivos debería partir de una señal real de inactividad, no de un envío estático amplio.

Hellotext puede usar señales como:

- Alrededor de 3 meses desde la última compra, visita, click, respuesta u otra interacción relevante.
- Historial de compras, categorías de producto, valor del cliente e interacción histórica.
- Productos comprados, navegados, clickeados o recomendados antes.
- Si el cliente ya se reactivó mediante otro playbook, campaña o respuesta.
- Si otro playbook ya es dueño del momento actual, como recuperación de carrito, recompra, venta cruzada, soporte o Reactivación Suave.
- Disponibilidad de producto, precio, stock, links y reglas de descuento.
- Elegibilidad de canal, consentimiento e historial reciente de comunicación.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de inactividad está conectada a un perfil del cliente alcanzable.
- Si el mensaje tiene un producto, oferta o razón relevante para escribir.
- Si el cliente compró, respondió, se dio de baja o quitó su consentimiento recientemente.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si existe una oportunidad interna de mantener un ROI saludable para ese envío.
- Si otro playbook activo encaja mejor.
- Si timing, frecuencia, horarios silenciosos, plantillas o reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente empieza a enfriarse y lleva alrededor de 30 días sin actividad relevante | [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) |
| El cliente lleva alrededor de 3 meses sin actividad relevante | Reactivación de Inactivos |
| El cliente lleva alrededor de 12 meses sin actividad o sin reactivarse | [Último Intento]({% link _journeys/sunset-saver-playbook.md %}) |
| El cliente podría necesitar reponer un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |
| El cliente compró recientemente y podría querer un producto relacionado | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente abandonó carrito o checkout | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| Quieres enviar un mensaje planificado y puntual a una audiencia seleccionada | [Campañas]({% link _campaigns/campaigns-overview.md %}) |

Reactivación de Inactivos puede convivir con otros playbooks cuando cada uno maneja un momento distinto. No debería competir con una señal más específica, y debería dejar de intentar recuperar a un cliente que ya volvió, respondió, quitó consentimiento o entró en otro flujo activo.

## Revisa mensajes en el Playground

Reactivación de Inactivos puede generar ejemplos personalizados usando historial del cliente, contexto de producto, audiencia, canal, tono y reglas de oferta. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext aprenda estilo, wording, selección de productos y nivel de urgencia que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje da una razón respetuosa para volver.
- Si el producto, colección u oferta es relevante para el historial del cliente.
- Si el tono se siente cálido e intencional, no desesperado o repetitivo.
- Si los descuentos siguen la estrategia aprobada.
- Si el texto evita asumir por qué el cliente se fue.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Mientras más realistas sean los ejemplos, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Elige un perfil con historial de compra o interacción y alrededor de 3 meses sin actividad.
- Confirma que el perfil tenga actividad histórica y reciente visible en Hellotext.
- Confirma que la audiencia incluya el perfil de prueba.
- Confirma que los productos o colecciones usados por el playbook tengan imágenes, precios, stock, variantes y links correctos.
- Genera o simula ejemplos de mensaje en el Playground.
- Marca ejemplos que te gustan y ejemplos que no te gustan.
- Prueba un cliente que se reactivó recientemente y no debería recibir Reactivación de Inactivos.
- Prueba un cliente más cercano a 30 días de inactividad, que debería pertenecer a Reactivación Suave.
- Prueba un cliente más cercano a 12 meses de inactividad, que debería pertenecer a [Último Intento]({% link _journeys/sunset-saver-playbook.md %}).
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, descuentos y atribución.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma que eventos de compra, eventos de interés de producto, clicks, respuestas, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Reactivación de Inactivos esté habilitado no significa que cada cliente inactivo reciba un mensaje.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- La actividad del cliente falta, llega tarde o no está conectada a un perfil del cliente usable.
- El cliente todavía está en la ventana de inactividad reciente de Reactivación Suave.
- El cliente ya está en una ventana de último intento para [Último Intento]({% link _journeys/sunset-saver-playbook.md %}).
- El cliente compró, hizo click, respondió o entró en otro playbook activo recientemente.
- No se encuentra un producto, colección, oferta o ángulo de mensaje relevante.
- Los productos no están disponibles, no tienen stock, no tienen precio, no tienen imagen o no tienen un link usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Hellotext no detecta una oportunidad con ROI saludable para escribir en ese momento.
- Timing, frecuencia, horarios silenciosos, plantillas o reglas de canal impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué clientes crearon momentos elegibles de Reactivación de Inactivos.
- Qué mensajes se enviaron, omitieron, demoraron, recibieron clicks, recibieron respuestas o generaron compras.
- Si la selección de productos se sintió relevante para el historial del cliente.
- Si links, imágenes, precios, variantes y stock fueron correctos.
- Compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos mejoraron reactivación o solo redujeron margen.
- Si Reactivación de Inactivos se superpone con Reactivación Suave, Último Intento, Impulsor de Recompra, Impulsor de Ventas Cruzadas, Recuperador de Carritos con IA, playbooks de soporte o campañas.

Ajusta una cosa por vez: audiencia, alcance de productos, lógica de producto, tono, feedback en Playground, estrategia de descuento, canal o camino de derivación.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Elige tu primer playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Playbook Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %})
- [Playbook Último Intento]({% link _journeys/sunset-saver-playbook.md %})
- [Playbook Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Playbook Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
