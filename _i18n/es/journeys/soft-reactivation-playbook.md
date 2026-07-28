Usa esta guía cuando los clientes empezaron a enfriarse y quieres que Hellotext los reactive antes de que queden totalmente inactivos. Reactivación Suave cubre inactividad reciente, normalmente alrededor de 30 días sin compra, visita, click, respuesta u otra interacción relevante.

Reactivación Suave es un playbook de retención. Ayuda a Hellotext a reconocer clientes cuyo comportamiento reciente viene bajando, y luego enviar un empujón personalizado con productos, ofertas o contexto de mensaje relevantes cuando el cliente todavía puede ser alcanzado.

No es una ruta, una campaña puntual ni un último intento de recuperación. Vive antes en el ciclo del cliente: después de que el cliente ya mostró valor, pero antes de que pase suficiente tiempo inactivo como para usar Reactivación de Inactivos, que apunta a clientes alrededor de 3 meses sin actividad. Para clientes alrededor de 12 meses sin actividad o sin reactivarse, usa Último Intento cuando esté disponible.

La disponibilidad puede variar según cuenta y estado de despliegue. Si la tarjeta aparece como a pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Reactivación Suave

Reactivación Suave ayuda a mantener clientes activos antes de que la relación se enfríe demasiado.

Puede:

- Detectar clientes cuyo comportamiento reciente de compra, navegación, clicks o respuestas viene bajando.
- Usar historial del cliente, contexto de producto, datos de catálogo, elegibilidad de canal y reglas de oferta antes de enviar un mensaje.
- Sugerir productos que podrían traer de vuelta al cliente según interés reciente o histórico.
- Generar ejemplos de mensajes personalizados que se adaptan por cliente.
- Permitir que tu equipo dé feedback en Playground para que Hellotext aprenda qué encaja con el negocio.
- Seguir reglas de oferta existentes del ecommerce, usar descuentos con IA hasta un porcentaje máximo aprobado o enviar sin descuentos.
- Omitir clientes cuando una compra reciente, otro playbook activo, falta de consentimiento, límites de canal o poco contexto de producto hacen que el envío no sea una buena idea.

La configuración exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas y estado de despliegue.

## Cuándo usarlo

Usa Reactivación Suave cuando los clientes todavía no están completamente dormidos, pero su interacción empezó a bajar.

Encaja bien cuando:

- El cliente lleva alrededor de 30 días sin actividad relevante.
- Un cliente compró antes, pero no volvió a comprar recientemente.
- Un cliente solía hacer click, navegar o responder y bajó su actividad.
- El negocio quiere un mensaje suave de regreso en lugar de una campaña fuerte de recuperación.
- Hay productos, colecciones u ofertas relevantes para ese cliente.
- El objetivo es mantener la relación antes de que el cliente sea más difícil de recuperar.

No lo uses para un momento específico de reposición de producto. Usa [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) cuando el cliente podría necesitar volver a comprar un producto consumible. Usa [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) cuando la mejor acción siguiente es un producto relacionado después de una compra. Usa Reactivación de Inactivos cuando el cliente ya lleva alrededor de 3 meses sin actividad y Último Intento cuando lleva alrededor de 12 meses sin actividad o sin reactivarse.

## Qué necesita antes del lanzamiento

Antes de habilitar Reactivación Suave, confirma la configuración de la que depende.

Revisa que:

- Tu tienda o fuente de datos envíe historial de compras y actividad del cliente a Hellotext.
- Los perfiles del cliente tengan identificadores confiables, consentimiento de canal y comportamiento reciente.
- Nombres, imágenes, precios, stock y links de producto estén actualizados.
- Los productos o colecciones que quieres promover sean elegibles para mensajes de reactivación.
- La audiencia que quieres alcanzar sea identificable y elegible para el canal seleccionado.
- Las señales de compra, navegación, clicks, respuestas y bajas estén disponibles para que Hellotext evite envíos irrelevantes.
- Si se permiten descuentos, las reglas de oferta del ecommerce y cualquier porcentaje máximo de descuento con IA estén aprobados antes del lanzamiento.
- Tarjetas de producto, links de producto o mensajes enriquecidos funcionen en los canales que quieres usar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, bajas, respuestas y oportunidades omitidas.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Reactivación Suave**.

Las tarjetas disponibles pueden variar, pero la configuración propuesta se concentra en:

- **Canales de salida:** dónde Hellotext puede enviar o continuar el mensaje de reactivación.
- **Audiencia:** qué audiencia o segmento puede recibir el playbook.
- **Productos:** qué productos, colecciones, categorías o grupos puede usar el mensaje.
- **Estrategia de descuento:** si el playbook sigue las reglas de oferta del ecommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono o feedback en Playground:** cómo deberían aprender los ejemplos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Reactivación Suave depende de si el cliente puede ser alcanzado en un momento donde el empujón todavía se siente oportuno.

Si necesitas un agente conversacional a medida con instrucciones, conocimiento y reglas de derivación propias, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}). Si necesitas una secuencia totalmente controlada de pasos, usa una ruta personalizada.

## Cómo elige Hellotext el momento

Reactivación Suave debería partir de una señal real de enfriamiento, no de un envío estático de calendario.

Hellotext puede usar señales como:

- Días desde la última compra, última visita, último click, última respuesta o última interacción relevante.
- Historial de compras y valor del cliente.
- Interés reciente en productos, categorías navegadas o productos comprados antes.
- Si otro playbook ya es dueño del momento, como recuperación de carrito, recompra, venta cruzada o soporte.
- Disponibilidad de producto, precio, stock, links y reglas de descuento.
- Elegibilidad de canal, consentimiento e historial reciente de comunicación.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de inactividad está conectada a un perfil del cliente alcanzable.
- Si el mensaje tiene un producto, oferta o razón relevante para escribir.
- Si el cliente compró, respondió, se dio de baja o quitó su consentimiento recientemente.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si otro playbook activo encaja mejor.
- Si timing, frecuencia, horarios silenciosos, plantillas o reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente empieza a enfriarse y lleva alrededor de 30 días sin actividad relevante | Reactivación Suave |
| El cliente lleva alrededor de 3 meses sin actividad relevante | Reactivación de Inactivos cuando esté disponible |
| El cliente lleva alrededor de 12 meses sin actividad o sin reactivarse | Último Intento cuando esté disponible |
| El cliente podría necesitar reponer un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |
| El cliente compró recientemente y podría querer un producto relacionado | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente abandonó carrito o checkout | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| Quieres enviar un mensaje planificado y puntual a una audiencia seleccionada | [Campañas y broadcasts]({% link _campaigns/campaigns-overview.md %}) |

Reactivación Suave puede convivir con otros playbooks cuando cada uno maneja un momento distinto. No debería competir con una señal más específica, como carrito abandonado, ventana esperada de reposición o una conversación activa de soporte.

## Revisa mensajes en el Playground

Reactivación Suave puede generar ejemplos personalizados usando historial del cliente, contexto de producto, audiencia, canal, tono y reglas de oferta. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext aprenda estilo, wording, selección de productos y nivel de urgencia que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje se siente como un check-in útil, no como presión.
- Si el producto o colección es relevante para el historial del cliente.
- Si el mensaje da una razón clara para volver.
- Si los descuentos siguen la estrategia aprobada.
- Si el texto evita urgencia exagerada o asumir por qué el cliente se fue.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Mientras más realistas sean los ejemplos, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Elige un perfil con historial de compra o interacción que haya bajado su actividad.
- Confirma que el perfil tenga actividad reciente e histórica visible en Hellotext.
- Confirma que la audiencia incluya el perfil de prueba.
- Confirma que los productos o colecciones usados por el playbook tengan imágenes, precios, stock, variantes y links correctos.
- Genera o simula ejemplos de mensaje en el Playground.
- Marca ejemplos que te gustan y ejemplos que no te gustan.
- Prueba un cliente que volvió a comprar recientemente y no debería recibir una reactivación.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, descuentos y atribución.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma que eventos de compra, eventos de interés de producto, clicks, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Reactivación Suave esté habilitado no significa que cada cliente con baja actividad reciba un mensaje.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- La actividad del cliente falta, llega tarde o no está conectada a un perfil del cliente usable.
- El cliente todavía no se enfrió lo suficiente para un mensaje de reactivación.
- El cliente compró, hizo click, respondió o entró en otro playbook activo recientemente.
- No se encuentra un producto, colección, oferta o ángulo de mensaje relevante.
- Los productos no están disponibles, no tienen stock, no tienen precio, no tienen imagen o no tienen un link usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Timing, frecuencia, horarios silenciosos, plantillas o reglas de canal impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué clientes crearon momentos elegibles de reactivación suave.
- Qué mensajes se enviaron, omitieron, demoraron, recibieron clicks, recibieron respuestas o generaron compras.
- Si la selección de productos se sintió relevante para el historial del cliente.
- Si links, imágenes, precios, variantes y stock fueron correctos.
- Compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos mejoraron reactivación o solo redujeron margen.
- Si Reactivación Suave se superpone con Impulsor de Recompra, Impulsor de Ventas Cruzadas, Recuperador de Carritos con IA, playbooks de soporte o campañas.

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
- [Playbook Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Playbook Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
