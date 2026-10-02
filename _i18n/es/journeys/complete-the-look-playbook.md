Usa esta guía cuando una orden confirmada elegible contiene productos y quieres que Hellotext sugiera ítems que completan el look, kit, rutina o set a partir de esa compra.

Completa el Look es una misión de conversión asistida por IA. Usa contexto de producto, reglas de audiencia, comportamiento del cliente, relaciones de catálogo, elegibilidad de canal y reglas de oferta para generar sugerencias personalizadas de productos que combinan.

No es una ruta y no es un chat genérico de recomendación de productos. Parte de los productos de una orden confirmada vinculada al cliente y luego evalúa productos que combinan. Una vista o selección aislada de producto no inicia esta misión.

La disponibilidad puede variar según cuenta y estado de despliegue. Si la tarjeta aparece como bajo pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Completa el Look

Completa el Look puede sugerir complementos a partir de una compra confirmada elegible.

Puede:

- Sugerir productos que combinan con los ítems de la orden confirmada que origina la oportunidad.
- Aplicarse solo a productos, colecciones, categorías o grupos de producto seleccionados.
- Usar contexto de cliente, producto, catálogo, precio, stock y canal antes de enviar un mensaje.
- Generar ejemplos de mensajes que se adaptan por cliente.
- Permitir que tu equipo dé feedback en Playground para que Hellotext aprenda qué encaja con el negocio.
- Seguir reglas de oferta existentes del eCommerce, usar descuentos con IA hasta un porcentaje máximo aprobado o enviar sin descuentos.
- Evitar recomendar productos no disponibles, irrelevantes, ya comprados o fuera del alcance de productos seleccionado.

La configuración exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas y estado de despliegue.

## Cuándo usarla

Usa Completa el Look cuando una orden confirmada del cliente aporta productos principales y otros ítems pueden complementarlos.

Encaja bien cuando:

- Un comprador tiene una orden confirmada elegible y otro ítem complementa sus productos.
- Tu catálogo tiene relaciones claras entre productos, colecciones que combinan, accesorios compatibles o grupos de producto aprobados por el negocio.
- Tu equipo quiere que Hellotext sugiera productos que combinan sin crear una campaña manual para cada producto.
- La recomendación debería explicar cómo el complemento combina con los productos de esa compra.
- Tu catálogo tiene imágenes, precios, stock, variantes y links de producto confiables.

Funciona especialmente bien para indumentaria, calzado, accesorios, rutinas de belleza, sets de hogar, accesorios de electrónica, conjuntos de productos compatibles y cualquier catálogo donde el siguiente producto depende del producto principal.

No la uses como recomendador conversacional. Si el cliente pregunta qué comprar, compara opciones, pregunta por talles o necesita guía de producto por chat, usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}).

Para otras oportunidades de productos relacionados después de una compra elegible, evalúa [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}). Para seguimiento de navegación cuando no hay un momento claro de producto que combina, usa [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Completa el Look, confirma la configuración de la que depende.

Revisa que:

- Tu catálogo de productos o integración de eCommerce esté conectada.
- Nombres, imágenes, precios, variantes, stock y links de producto estén actualizados.
- Los productos que quieres incluir tengan complementos claros, productos que combinan, accesorios compatibles o ítems relacionados.
- Identificadores de producto y variante sean estables entre catálogo, vista de producto, carrito, recomendación y compra.
- La audiencia que quieres alcanzar esté suscrita, identificable y sea elegible para el canal seleccionado.
- La señal de orden confirmada esté vinculada al cliente y conserve productos válidos con cantidades positivas. Las señales adicionales de compra, carrito e interés pueden aportar contexto, pero no reemplazan esa orden de origen.
- Si se permiten descuentos, las reglas de oferta del eCommerce y cualquier porcentaje máximo de descuento con IA estén aprobados antes del lanzamiento.
- Tarjetas de producto, links de producto o mensajes enriquecidos funcionen en los canales que quieres usar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, agregados al carrito, compras, ingresos atribuidos y oportunidades omitidas.

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Completa el Look**.

Las tarjetas disponibles pueden variar, pero la configuración propuesta se concentra en:

- **Canales de salida:** dónde Hellotext puede enviar sugerencias de productos que combinan.
- **Audiencia:** qué audiencia o segmento puede recibir la misión.
- **Productos:** qué productos, colecciones, categorías o grupos puede usar la misión.
- **Estrategia de descuento:** si la misión sigue las reglas de oferta del eCommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono o feedback en Playground:** cómo deberían aprender los ejemplos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar la misión. Completa el Look depende de si el comprador puede ser alcanzado cuando la sugerencia de producto que combina todavía es relevante.

Esta misión normalmente no debería requerir configuración manual de prompt, intenciones o pasos de ruta. Si necesitas un agente conversacional a medida con intenciones y conocimiento propios, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

## Cómo se eligen las recomendaciones

Las recomendaciones de Completa el Look deberían partir de un producto principal real.

Hellotext puede usar señales como:

- Los productos y cantidades válidos de la orden confirmada que origina la oportunidad.
- Productos que combinan con el producto principal por estilo, caso de uso, colección, compatibilidad o rutina.
- Grupos de producto definidos por el negocio, relaciones de catálogo o lógica de recomendación.
- Disponibilidad, stock, precio, imágenes, links de producto y calidad de variantes.
- Historial del cliente, interacción previa, compras y productos ya mostrados cuando ese contexto está disponible.

Antes de enviar, Hellotext también puede considerar:

- Si la orden de origen sigue siendo válida, no está cancelada ni tiene un reembolso recibido registrado, y está vinculada al cliente.
- Si el producto que combina está disponible y dentro del alcance de productos configurado.
- Si el cliente compró el producto sugerido después de la propuesta. No asumas que todos los sustitutos cercanos quedan excluidos.
- Si otra misión puede encargarse mejor del mismo momento.
- Si consentimiento, timing, frecuencia y reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con misiones cercanas

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| Una orden confirmada elegible aporta productos que pueden complementarse | Completa el Look |
| El comprador vio un producto, pero no hay un ángulo claro de producto que combina | [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) |
| El comprador agregó productos al carrito o checkout y se fue | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| El comprador necesita una recomendación por conversación | [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) |
| El cliente ya compró y podría querer un complemento más adelante | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente podría necesitar reponer un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |

Completa el Look puede convivir con Recuperación de Navegación y Recuperador de Carritos con IA cuando el momento de producto está claro. Completa el Look usa los productos de una orden confirmada elegible como punto de partida; recuperación de carrito maneja carrito o checkout abandonado; Recuperación de Navegación maneja intención de navegación más temprana.

## Revisa mensajes en el Playground

Completa el Look puede generar ejemplos personalizados usando contexto de producto, audiencia, catálogo, cliente, canal, tono y oferta. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext aprenda estilo, wording, lógica de producto y nivel de detalle que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el producto sugerido realmente combina con el producto principal.
- Si el mensaje explica la combinación sin sonar forzado.
- Si imágenes, precios, links, variantes y descuentos son correctos.
- Si la recomendación evita productos que el cliente ya compró.
- Si el mensaje crea impulso útil sin inventar urgencia.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Cuanto más realistas sean los ejemplos, mejor puede el sistema adaptar los mensajes a tu tienda.

## Cómo probarla

Prueba con un camino pequeño y realista antes de habilitarla ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Identifica una orden confirmada elegible ya existente, vinculada al perfil de prueba, con un producto que debería tener un complemento claro.
- Confirma que el producto y los ítems que combinan existan en el catálogo con imágenes, precios, stock, variantes y links correctos.
- Confirma que el producto esté dentro del alcance de productos configurado.
- Confirma que la audiencia incluya el perfil de prueba.
- Genera o simula ejemplos de mensaje en el Playground.
- Marca ejemplos que te gustan y ejemplos que no te gustan.
- Prueba un producto que no debería generar una sugerencia de producto que combina.
- Prueba un cliente que ya compró el producto sugerido.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, links para agregar al carrito, descuentos y atribución.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma que identificadores de producto, identificadores de variante, precios, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que la misión Completa el Look esté habilitada no significa que cada orden confirmada produzca una sugerencia. Una vista o selección de producto por sí sola no satisface el requisito de origen.

La misión puede esperar, omitir, detenerse o dejar actuar a otra misión cuando:

- La señal de orden confirmada falta, llega tarde, no conserva productos válidos o no está vinculada a un cliente usable.
- El producto principal está fuera del alcance de productos configurado.
- No se encuentra un producto que combine de forma relevante.
- El producto sugerido no está disponible, no tiene stock, no tiene precio, no tiene imagen o no tiene un link usable.
- La orden de origen fue cancelada, tiene un reembolso recibido registrado o el cliente compró el producto sugerido después de la propuesta.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Reglas de frecuencia, timing o canal impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otra misión activa encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué órdenes confirmadas y productos de origen crearon oportunidades elegibles para Completa el Look.
- Qué productos que combinan fueron sugeridos, omitidos, recibieron clicks, se agregaron al carrito o se compraron.
- Si las sugerencias se sintieron relevantes por producto, colección, estilo, talle o caso de uso.
- Si links, imágenes, precios, variantes y stock fueron correctos.
- Clicks, agregados al carrito, compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos mejoraron conversión o solo redujeron margen.
- Si Completa el Look se superpone con Recuperación de Navegación, Recuperador de Carritos con IA, Recomendador Inteligente, Impulsor de Ventas Cruzadas o campañas.

Ajusta una cosa por vez: alcance de productos, audiencia, reglas de recomendación, tono, feedback en Playground, estrategia de descuento, canal o camino de derivación.

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
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Misión Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Misión Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
