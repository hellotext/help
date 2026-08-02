Usa esta guía cuando los clientes llevan alrededor de 12 meses sin actividad o no se reactivaron después de intentos anteriores, y quieres que Hellotext haga un último intento cuidadoso antes de dejar de insistir automáticamente.

Último Intento es un playbook de recuperación final. Ayuda a Hellotext a identificar perfiles del cliente que no compraron, visitaron, hicieron click, respondieron o tuvieron otra interacción relevante durante un período largo, enviar un mensaje final cuando todavía existe una oportunidad saludable, y luego suprimir futuros intentos automáticos de recuperación si el cliente no vuelve.

No es una ruta, una campaña puntual ni una limpieza manual de la base. Vive al final de la familia de reactivación: después de [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), que cubre inactividad reciente alrededor de 30 días, y [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}), que apunta a clientes alrededor de 3 meses sin actividad.

La disponibilidad puede variar según cuenta y estado de despliegue. Si la tarjeta aparece como a pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Último Intento

Último Intento ayuda a cerrar el ciclo de recuperación sin seguir presionando a clientes que ya llevan mucho tiempo inactivos.

Puede:

- Detectar clientes alrededor de 12 meses inactivos o que no se reactivaron después de intentos anteriores.
- Usar historial del cliente, contexto de producto, datos de catálogo, elegibilidad de canal y reglas de oferta antes de enviar un mensaje.
- Generar un último mensaje personalizado con una razón clara para volver, como un producto relevante, una colección, una novedad o una oferta aprobada.
- Permitir que tu equipo dé feedback en Playground para que Hellotext aprenda qué tono y estilo encajan con el negocio.
- Seguir reglas de oferta existentes del ecommerce, usar descuentos con IA hasta un porcentaje máximo aprobado o enviar sin descuentos.
- Buscar el canal más eficiente en costo entre los disponibles, como WhatsApp, SMS u otros, y enviar solo cuando detecta internamente una oportunidad con ROI saludable.
- Suprimir automáticamente futuros intentos de recuperación para ese perfil si el cliente no compra, responde o vuelve a mostrar una señal relevante.
- Omitir clientes cuando no hay consentimiento, el perfil no puede ser alcanzado, otro playbook encaja mejor o no existe una razón suficientemente relevante para escribir.

La configuración exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas y estado de despliegue.

## Cuándo usarlo

Usa Último Intento cuando el cliente ya pasó las ventanas normales de reactivación y no quieres seguir enviando mensajes de recuperación indefinidamente.

Encaja bien cuando:

- El cliente lleva alrededor de 12 meses sin actividad relevante.
- El cliente no volvió después de Reactivación Suave, Reactivación de Inactivos u otros momentos de recuperación.
- El negocio tiene una razón fuerte y respetuosa para hacer un último intento.
- Quieres que Hellotext reduzca presión automáticamente si ese intento no funciona.
- Hay suficiente historial, producto, oferta o contexto para que el mensaje no se sienta genérico.

No uses Último Intento para clientes que recién empiezan a enfriarse. Para una baja reciente, usa [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}). Para clientes que llevan alrededor de 3 meses sin actividad, usa [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}).

Para momentos específicos de producto, usa el playbook más específico: [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) para timing de recompra de consumibles, [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) para productos relacionados después de compra y [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) para carrito o checkout abandonado.

## Qué necesita antes del lanzamiento

Antes de habilitar Último Intento, confirma la configuración de la que depende.

Revisa que:

- Tu tienda o fuente de datos envíe historial de compras y actividad del cliente a Hellotext.
- Los perfiles del cliente tengan identificadores confiables, consentimiento de canal y comportamiento histórico.
- Las señales de compra, navegación, clicks, respuestas, bajas, opt-out y reactivación reciente estén disponibles.
- Hellotext pueda distinguir clientes recientemente inactivos, clientes inactivos alrededor de 3 meses y clientes alrededor de 12 meses sin actividad o sin reactivarse.
- Nombres, imágenes, precios, stock y links de producto estén actualizados si el mensaje puede incluir recomendaciones.
- La audiencia que quieres alcanzar sea identificable y elegible para el canal seleccionado.
- Si se permiten descuentos, las reglas de oferta del ecommerce y cualquier porcentaje máximo de descuento con IA estén aprobados antes del lanzamiento.
- Tarjetas de producto, links de producto o mensajes enriquecidos funcionen en los canales que quieres usar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, bajas, respuestas, oportunidades omitidas y perfiles que quedaron suprimidos para futuros intentos de recuperación.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Último Intento**.

Las tarjetas disponibles pueden variar, pero la configuración propuesta se concentra en:

- **Canales de salida:** dónde Hellotext puede enviar o continuar el mensaje final.
- **Audiencia:** qué audiencia o segmento puede recibir el playbook.
- **Productos:** qué productos, colecciones, categorías o grupos puede usar el mensaje.
- **Estrategia de descuento:** si el playbook sigue las reglas de oferta del ecommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono o feedback en Playground:** cómo deberían aprender los ejemplos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Último Intento depende de encontrar un canal alcanzable y costo-eficiente para un cliente que ya lleva mucho tiempo inactivo. Hellotext puede elegir internamente el canal más eficiente en costo, como WhatsApp, SMS u otros según disponibilidad, y evitar envíos cuando no detecta una oportunidad con ROI saludable.

La supresión posterior al intento es parte del comportamiento del playbook. No significa dar de baja al cliente del canal ni cambiar su consentimiento; significa que Hellotext deja de insistir con futuros intentos automáticos de recuperación para ese perfil si el último intento no genera una señal relevante.

Si necesitas un agente conversacional a medida con instrucciones, conocimiento y reglas de derivación propias, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}). Si necesitas una secuencia totalmente controlada de pasos, usa una ruta personalizada.

## Cómo elige Hellotext el momento

Último Intento debería partir de una señal real de inactividad prolongada, no de un envío estático amplio.

Hellotext puede usar señales como:

- Alrededor de 12 meses desde la última compra, visita, click, respuesta u otra interacción relevante.
- Si el cliente no se reactivó después de otros intentos o momentos de recuperación.
- Historial de compras, categorías de producto, valor del cliente e interacción histórica.
- Productos comprados, navegados, clickeados o recomendados antes.
- Si otro playbook ya es dueño del momento actual, como recuperación de carrito, recompra, venta cruzada, soporte, Reactivación Suave o Reactivación de Inactivos.
- Disponibilidad de producto, precio, stock, links y reglas de descuento.
- Elegibilidad de canal, consentimiento e historial reciente de comunicación.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de inactividad está conectada a un perfil del cliente alcanzable.
- Si el mensaje tiene un producto, oferta o razón relevante para escribir.
- Si el cliente compró, respondió, se dio de baja o quitó su consentimiento recientemente.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si existe una oportunidad interna de mantener un ROI saludable para ese envío.
- Si otro playbook activo encaja mejor.
- Si reglas de canal, plantillas, horarios silenciosos o elegibilidad permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente empieza a enfriarse y lleva alrededor de 30 días sin actividad relevante | [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) |
| El cliente lleva alrededor de 3 meses sin actividad relevante | [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) |
| El cliente lleva alrededor de 12 meses sin actividad o sin reactivarse | Último Intento |
| El cliente podría necesitar reponer un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |
| El cliente compró recientemente y podría querer un producto relacionado | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente abandonó carrito o checkout | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| Quieres enviar un mensaje planificado y puntual a una audiencia seleccionada | [Campañas]({% link _campaigns/campaigns-overview.md %}) |

Último Intento puede convivir con otros playbooks cuando cada uno maneja un momento distinto. No debería competir con una señal más específica, y debería dejar de intentar recuperar a un cliente que ya volvió, respondió, quitó consentimiento o entró en otro flujo activo.

## Revisa mensajes en el Playground

Último Intento puede generar ejemplos personalizados usando historial del cliente, contexto de producto, audiencia, canal, tono y reglas de oferta. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext aprenda estilo, wording, selección de productos y nivel de urgencia que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje comunica una razón clara y respetuosa para volver.
- Si el producto, colección u oferta es relevante para el historial del cliente.
- Si el tono se siente final pero no agresivo, desesperado o repetitivo.
- Si los descuentos siguen la estrategia aprobada.
- Si el texto evita asumir por qué el cliente se fue.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Mientras más realistas sean los ejemplos, más fácil es entrenar al sistema sobre cómo se ve un buen último intento para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Elige un perfil con historial de compra o interacción y alrededor de 12 meses sin actividad.
- Confirma que el perfil tenga actividad histórica visible en Hellotext.
- Confirma que la audiencia incluya el perfil de prueba.
- Confirma que los productos o colecciones usados por el playbook tengan imágenes, precios, stock, variantes y links correctos.
- Genera o simula ejemplos de mensaje en el Playground.
- Marca ejemplos que te gustan y ejemplos que no te gustan.
- Prueba un cliente que se reactivó recientemente y no debería recibir Último Intento.
- Prueba un cliente más cercano a 30 días de inactividad, que debería pertenecer a Reactivación Suave.
- Prueba un cliente más cercano a 3 meses de inactividad, que debería pertenecer a Reactivación de Inactivos.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, descuentos y atribución.
- Confirma que, si el intento no genera una señal relevante, el perfil queda fuera de futuros intentos automáticos de recuperación.

Si el tracking es personalizado, confirma que eventos de compra, eventos de interés de producto, clicks, respuestas, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Último Intento esté habilitado no significa que cada cliente antiguo reciba un mensaje.

El playbook puede esperar, omitir, detenerse, suprimir o dejar actuar a otro playbook cuando:

- La actividad del cliente falta, llega tarde o no está conectada a un perfil del cliente usable.
- El cliente todavía pertenece a Reactivación Suave o Reactivación de Inactivos.
- El cliente compró, hizo click, respondió o entró en otro playbook activo recientemente.
- El cliente ya recibió un último intento y quedó suprimido para futuros intentos de recuperación.
- No se encuentra un producto, colección, oferta o ángulo de mensaje relevante.
- Los productos no están disponibles, no tienen stock, no tienen precio, no tienen imagen o no tienen un link usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Hellotext no detecta una oportunidad con ROI saludable para escribir en ese momento.
- Reglas de canal, plantillas, horarios silenciosos o elegibilidad impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué clientes crearon momentos elegibles de Último Intento.
- Qué mensajes se enviaron, omitieron, demoraron, recibieron clicks, recibieron respuestas o generaron compras.
- Qué perfiles quedaron suprimidos para futuros intentos automáticos de recuperación.
- Si la selección de productos se sintió relevante para el historial del cliente.
- Si links, imágenes, precios, variantes y stock fueron correctos.
- Compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos mejoraron recuperación o solo redujeron margen.
- Si Último Intento se superpone con Reactivación Suave, Reactivación de Inactivos, Impulsor de Recompra, Impulsor de Ventas Cruzadas, Recuperador de Carritos con IA, playbooks de soporte o campañas.

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
- [Playbook Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %})
- [Playbook Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Playbook Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
