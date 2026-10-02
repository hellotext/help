Usa esta guía cuando los clientes cumplen los criterios de riesgo de abandono y tienes una razón pertinente y respetuosa para intentar recuperarlos.

Último Intento es una misión de reactivación para la etapa de riesgo de abandono. Evalúa una señal de esa etapa, historial, productos y elegibilidad. Su nombre no garantiza un único envío final ni la exclusión global automática del cliente de futuras comunicaciones.

No es una ruta, una campaña puntual ni una limpieza manual de la base. Vive al final de la familia de reactivación: después de [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), que aborda la etapa inicial de inactividad, y [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}), que aborda la etapa de inactividad prolongada.

La disponibilidad puede variar según cuenta y estado de despliegue. Si la tarjeta aparece como a pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Último Intento

Último Intento puede evaluar una oportunidad de recuperación en la etapa de riesgo de abandono, sujeta a sus límites de elegibilidad y frecuencia.

Puede:

- Evaluar clientes con una señal válida de riesgo de abandono, posterior a la etapa de inactividad prolongada.
- Usar historial del cliente, contexto de producto, datos de catálogo, elegibilidad de canal y reglas de oferta antes de enviar un mensaje.
- Generar un mensaje personalizado de recuperación con una razón clara para volver, como un producto relevante, una colección, una novedad o una oferta aprobada.
- Permitir que tu equipo dé feedback en Playground para que Hellotext aprenda qué tono y estilo encajan con el negocio.
- Seguir reglas de oferta existentes del eCommerce, usar descuentos con IA hasta un porcentaje máximo aprobado o enviar sin descuentos.
- Evaluar las rutas de canal disponibles según acceso, permiso, preparación y reglas de envío; no garantiza el canal más barato ni un ROI determinado.
- Aplicar límites propios y compartidos de frecuencia a las poblaciones participantes. Eso no equivale a dar de baja el perfil ni a excluirlo de campañas, rutas y toda comunicación futura.
- Omitir clientes cuando no hay consentimiento, el perfil no puede ser alcanzado, otra misión encaja mejor o no existe una razón suficientemente relevante para escribir.

La configuración exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas y estado de despliegue.

## Cuándo usarla

Usa Último Intento cuando el cliente cumple los criterios de la etapa de riesgo de abandono y la propuesta de recuperación tiene sentido.

Encaja bien cuando:

- El cliente tiene una señal válida de riesgo de abandono; no basta con contar meses desde cualquier mensaje.
- El historial permite distinguir su etapa de inactividad y detectar si retomó actividad relevante.
- El negocio tiene una razón pertinente y respetuosa para intentar recuperarlo.
- Revisas la frecuencia y defines por separado las exclusiones o bajas que tu negocio necesita.
- Hay suficiente historial, producto, oferta o contexto para que el mensaje no se sienta genérico.

No uses Último Intento para clientes que recién empiezan a enfriarse. Para una baja reciente, usa [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}). Para clientes que cumplen los criterios de la etapa de inactividad prolongada, usa [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}).

Para momentos específicos de producto, usa la misión más específica: [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) para timing de recompra de consumibles, [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) para productos relacionados después de compra y [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) para carrito o checkout abandonado.

## Qué necesita antes del lanzamiento

Antes de habilitar Último Intento, confirma la configuración de la que depende.

Revisa que:

- Tu tienda o fuente de datos envíe historial de compras y actividad del cliente a Hellotext.
- Los perfiles del cliente tengan identificadores confiables, consentimiento de canal y comportamiento histórico.
- Las señales de compra, navegación, clicks, respuestas, bajas, opt-out y reactivación reciente estén disponibles.
- Hellotext conserve las señales y actividad calificante que distinguen las etapas inicial, prolongada y de riesgo de abandono. No uses cortes universales de 30 días, 3 meses o 12 meses desde cualquier interacción.
- Nombres, imágenes, precios, stock y links de producto estén actualizados si el mensaje puede incluir recomendaciones.
- La audiencia que quieres alcanzar sea identificable y elegible para el canal seleccionado.
- Si se permiten descuentos, las reglas de oferta del eCommerce y cualquier porcentaje máximo de descuento con IA estén aprobados antes del lanzamiento.
- Tarjetas de producto, links de producto o mensajes enriquecidos funcionen en los canales que quieres usar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, bajas, respuestas, oportunidades omitidas y motivos de omisión o bloqueo, distinguiendo límites de frecuencia de bajas y exclusiones explícitas.

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Último Intento**.

Las tarjetas disponibles pueden variar, pero la configuración propuesta se concentra en:

- **Canales de salida:** dónde Hellotext puede enviar o continuar el mensaje de recuperación.
- **Audiencia:** qué audiencia o segmento puede recibir la misión.
- **Productos:** qué productos, colecciones, categorías o grupos puede usar el mensaje.
- **Estrategia de descuento:** si la misión sigue las reglas de oferta del eCommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono o feedback en Playground:** cómo deberían aprender los ejemplos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar la misión. La selección automática depende de rutas elegibles, permiso, destino y preparación del canal. No garantiza el menor costo ni un ROI saludable.

La misión no confirma una supresión global automática después del intento. Una nueva actividad calificante puede invalidar la oportunidad actual; los límites de frecuencia, la elegibilidad de futuras señales y las exclusiones explícitas tienen alcances distintos. Una baja de canal o exclusión de campañas debe gestionarse y verificarse por separado.

Si necesitas un agente conversacional a medida con instrucciones, conocimiento y reglas de derivación propias, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}). Si necesitas una secuencia totalmente controlada de pasos, usa una ruta personalizada.

## Cómo elige Hellotext el momento

Último Intento debería partir de una señal real de inactividad prolongada, no de un envío estático amplio.

Hellotext puede usar señales como:

- Una señal válida de riesgo de abandono basada en el historial de actividad calificante y la transición previa de inactividad prolongada.
- Si hubo actividad calificante después de la señal de etapa; en ese caso la oportunidad puede quedar invalidada.
- Historial de compras, categorías de producto, valor del cliente e interacción histórica.
- Productos comprados, navegados, clickeados o recomendados antes.
- Si otra misión ya se encarga del momento actual, como recuperación de carrito, recompra, venta cruzada, soporte, Reactivación Suave o Reactivación de Inactivos.
- Disponibilidad de producto, precio, stock, links y reglas de descuento.
- Elegibilidad de canal, consentimiento e historial reciente de comunicación.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de inactividad está conectada a un perfil del cliente alcanzable.
- Si el mensaje tiene un producto, oferta o razón relevante para escribir.
- Si el cliente compró, respondió, se dio de baja o quitó su consentimiento recientemente.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si la oportunidad pasa las reglas de admisión, frecuencia y comprobaciones de envío aplicables.
- Si otra misión activa encaja mejor.
- Si reglas de canal, plantillas, horarios silenciosos o elegibilidad permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con misiones cercanas

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente cumple los criterios de la etapa inicial de inactividad | [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) |
| El cliente cumple los criterios de la etapa de inactividad prolongada | [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) |
| El cliente cumple los criterios de riesgo de abandono | Último Intento |
| El cliente podría necesitar reponer un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |
| El cliente compró recientemente y podría querer un producto relacionado | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente abandonó carrito o checkout | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| Quieres enviar un mensaje planificado y puntual a una audiencia seleccionada | [Campañas]({% link _campaigns/campaigns-overview.md %}) |

Último Intento puede convivir con otras misiones cuando cada una maneja un momento distinto. No debería competir con una señal más específica, y debería dejar de intentar recuperar a un cliente que ya volvió, respondió, quitó consentimiento o entró en otro flujo activo.

## Revisa mensajes en el Playground

Último Intento puede generar ejemplos personalizados usando historial del cliente, contexto de producto, audiencia, canal, tono y reglas de oferta. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext aprenda estilo, wording, selección de productos y nivel de urgencia que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje comunica una razón clara y respetuosa para volver.
- Si el producto, colección u oferta es relevante para el historial del cliente.
- Si el tono es respetuoso y evita presión, urgencia inventada o repetición.
- Si los descuentos siguen la estrategia aprobada.
- Si el texto evita asumir por qué el cliente se fue.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Cuanto más realistas sean los ejemplos, mejor puede el sistema adaptar los ejemplos de recuperación a tu tienda.

## Cómo probarla

Prueba con un camino pequeño y realista antes de habilitarla ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Identifica un perfil con historial y una señal válida de la etapa de riesgo de abandono.
- Confirma que el perfil tenga actividad histórica visible en Hellotext.
- Confirma que la audiencia incluya el perfil de prueba.
- Confirma que los productos o colecciones usados por la misión tengan imágenes, precios, stock, variantes y links correctos.
- Genera o simula ejemplos de mensaje en el Playground.
- Marca ejemplos que te gustan y ejemplos que no te gustan.
- Prueba un cliente que se reactivó recientemente y no debería recibir Último Intento.
- Revisa un perfil que cumple los criterios de la etapa inicial, correspondiente a Reactivación Suave.
- Revisa un perfil que cumple los criterios de inactividad prolongada, correspondiente a Reactivación de Inactivos.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, descuentos y atribución.
- Verifica por separado el alcance de los límites de frecuencia y de cualquier exclusión explícita. Un intento sin respuesta no demuestra supresión global futura.

Si el tracking es personalizado, confirma que eventos de compra, eventos de interés de producto, clicks, respuestas, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que la misión Último Intento esté habilitada no significa que cada cliente antiguo reciba un mensaje.

La misión puede esperar, omitir, detenerse o dejar actuar a otra misión cuando:

- La actividad del cliente falta, llega tarde o no está conectada a un perfil del cliente usable.
- El cliente todavía pertenece a Reactivación Suave o Reactivación de Inactivos.
- El cliente compró, hizo click, respondió o entró en otra misión activa recientemente.
- La señal corresponde a otra etapa, la oportunidad venció o los límites de frecuencia aplicables impiden otro envío.
- No se encuentra un producto, colección, oferta o ángulo de mensaje relevante.
- Los productos no están disponibles, no tienen stock, no tienen precio, no tienen imagen o no tienen un link usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- La oportunidad no pasa las reglas de admisión o comprobaciones de envío aplicables.
- Reglas de canal, plantillas, horarios silenciosos o elegibilidad impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otra misión activa encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué clientes crearon momentos elegibles de Último Intento.
- Qué mensajes se enviaron, omitieron, demoraron, recibieron clicks, recibieron respuestas o generaron compras.
- Qué oportunidades se bloquearon y por qué; separa frecuencia, actividad retomada, baja y exclusión explícita.
- Si la selección de productos se sintió relevante para el historial del cliente.
- Si links, imágenes, precios, variantes y stock fueron correctos.
- Compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos mejoraron recuperación o solo redujeron margen.
- Si Último Intento se superpone con Reactivación Suave, Reactivación de Inactivos, Impulsor de Recompra, Impulsor de Ventas Cruzadas, Recuperador de Carritos con IA, misiones de soporte o campañas.

Ajusta una cosa por vez: audiencia, alcance de productos, lógica de producto, tono, feedback en Playground, estrategia de descuento, canal o camino de derivación.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Misión Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %})
- [Misión Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %})
- [Misión Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Misión Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
