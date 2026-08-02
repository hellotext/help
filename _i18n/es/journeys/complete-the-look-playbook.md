Usa esta guía cuando los compradores están considerando uno o más productos y quieres que Hellotext sugiera ítems que completan el look, kit, rutina o set.

Completa el Look es un playbook de conversión asistido por IA. Usa contexto de producto, reglas de audiencia, comportamiento del cliente, relaciones de catálogo, elegibilidad de canal y reglas de oferta para generar sugerencias personalizadas de productos que combinan.

No es una ruta y no es un chat genérico de recomendación de productos. Parte de un producto que el comprador eligió, vio o consideró, y luego sugiere algo que combina naturalmente.

La disponibilidad puede variar según cuenta y estado de despliegue. Si la tarjeta aparece como bajo pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Completa el Look

Completa el Look ayuda a convertir interés de producto en una compra más completa.

Puede:

- Sugerir productos que combinan con lo que el comprador eligió, vio o consideró.
- Aplicarse solo a productos, colecciones, categorías o grupos de producto seleccionados.
- Usar contexto de cliente, producto, catálogo, precio, stock y canal antes de enviar un mensaje.
- Generar ejemplos de mensajes que se adaptan por cliente.
- Permitir que tu equipo dé feedback en Playground para que Hellotext aprenda qué encaja con el negocio.
- Seguir reglas de oferta existentes del eCommerce, usar descuentos con IA hasta un porcentaje máximo aprobado o enviar sin descuentos.
- Evitar recomendar productos no disponibles, irrelevantes, ya comprados o fuera del alcance de productos seleccionado.

La configuración exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas y estado de despliegue.

## Cuándo usarlo

Usa Completa el Look cuando el cliente ya tiene un producto principal y otro producto puede mejorar la elección.

Encaja bien cuando:

- Un comprador eligió o vio un producto y otro ítem completa el look, set, kit o rutina.
- Tu catálogo tiene relaciones claras entre productos, colecciones que combinan, accesorios compatibles o grupos de producto aprobados por el negocio.
- Tu equipo quiere que Hellotext sugiera productos que combinan sin crear una campaña manual para cada producto.
- La recomendación debería sentirse como "esto va con lo que elegiste", no como una oferta amplia.
- Tu catálogo tiene imágenes, precios, stock, variantes y links de producto confiables.

Funciona especialmente bien para indumentaria, calzado, accesorios, rutinas de belleza, sets de hogar, accesorios de electrónica, conjuntos de productos compatibles y cualquier catálogo donde el siguiente producto depende del producto principal.

No lo uses como recomendador conversacional. Si el cliente pregunta qué comprar, compara opciones, pregunta por talles o necesita guía de producto por chat, usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}).

Para complementos post-compra o expansión después de una compra completada, usa [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}). Para seguimiento de navegación cuando no hay un momento claro de producto que combina, usa [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Completa el Look, confirma la configuración de la que depende.

Revisa que:

- Tu catálogo de productos o integración de eCommerce esté conectada.
- Nombres, imágenes, precios, variantes, stock y links de producto estén actualizados.
- Los productos que quieres incluir tengan complementos claros, productos que combinan, accesorios compatibles o ítems relacionados.
- Identificadores de producto y variante sean estables entre catálogo, vista de producto, carrito, recomendación y compra.
- La audiencia que quieres alcanzar esté suscrita, identificable y sea elegible para el canal seleccionado.
- Señales de compra, carrito e interés de producto estén disponibles para que Hellotext evite sugerencias irrelevantes.
- Si se permiten descuentos, las reglas de oferta del eCommerce y cualquier porcentaje máximo de descuento con IA estén aprobados antes del lanzamiento.
- Tarjetas de producto, links de producto o mensajes enriquecidos funcionen en los canales que quieres usar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, agregados al carrito, compras, ingresos atribuidos y oportunidades omitidas.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Completa el Look**.

Las tarjetas disponibles pueden variar, pero la configuración propuesta se concentra en:

- **Canales de salida:** dónde Hellotext puede enviar sugerencias de productos que combinan.
- **Audiencia:** qué audiencia o segmento puede recibir el playbook.
- **Productos:** qué productos, colecciones, categorías o grupos puede usar el playbook.
- **Estrategia de descuento:** si el playbook sigue las reglas de oferta del eCommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono o feedback en Playground:** cómo deberían aprender los ejemplos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Completa el Look depende de si el comprador puede ser alcanzado cuando la sugerencia de producto que combina todavía es relevante.

Este playbook normalmente no debería requerir configuración manual de prompt, intenciones o pasos de ruta. Si necesitas un agente conversacional a medida con intenciones y conocimiento propios, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

## Cómo se eligen las recomendaciones

Las recomendaciones de Completa el Look deberían partir de un producto principal real.

Hellotext puede usar señales como:

- El producto, variante, colección, categoría o estilo que el comprador eligió o vio.
- Productos que combinan con el producto principal por estilo, caso de uso, colección, compatibilidad o rutina.
- Grupos de producto definidos por el negocio, relaciones de catálogo o lógica de recomendación.
- Disponibilidad, stock, precio, imágenes, links de producto y calidad de variantes.
- Historial del cliente, interacción previa, compras y productos ya mostrados cuando ese contexto está disponible.

Antes de enviar, Hellotext también puede considerar:

- Si el producto principal sigue siendo válido y está conectado a un perfil del cliente alcanzable.
- Si el producto que combina está disponible y dentro del alcance de productos configurado.
- Si el cliente ya compró el producto sugerido o un sustituto cercano.
- Si otro playbook es mejor dueño del mismo momento.
- Si consentimiento, timing, frecuencia y reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El comprador eligió o vio un producto y otro ítem lo completa | Completa el Look |
| El comprador vio un producto, pero no hay un ángulo claro de producto que combina | [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) |
| El comprador agregó productos al carrito o checkout y se fue | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| El comprador necesita una recomendación por conversación | [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) |
| El cliente ya compró y podría querer un complemento más adelante | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente podría necesitar reponer un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |

Completa el Look puede convivir con Recuperación de Navegación y Recuperador de Carritos con IA cuando el momento de producto está claro. Completa el Look maneja el momento "esto combina con lo que elegiste"; recuperación de carrito maneja carrito o checkout abandonado; Recuperación de Navegación maneja intención de navegación más temprana.

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

Mientras más realistas sean los ejemplos, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Elige un producto que debería tener un ítem que combine claramente.
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

Que Completa el Look esté habilitado no significa que cada vista o selección de producto produzca una sugerencia.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- Las señales de interés de producto o compra faltan, llegan tarde o no están conectadas a un perfil del cliente usable.
- El producto principal está fuera del alcance de productos configurado.
- No se encuentra un producto que combine de forma relevante.
- El producto sugerido no está disponible, no tiene stock, no tiene precio, no tiene imagen o no tiene un link usable.
- El cliente ya compró el producto sugerido o un sustituto cercano.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Reglas de frecuencia, timing o canal impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué productos crearon momentos elegibles para Completa el Look.
- Qué productos que combinan fueron sugeridos, omitidos, recibieron clicks, se agregaron al carrito o se compraron.
- Si las sugerencias se sintieron relevantes por producto, colección, estilo, talle o caso de uso.
- Si links, imágenes, precios, variantes y stock fueron correctos.
- Clicks, agregados al carrito, compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos mejoraron conversión o solo redujeron margen.
- Si Completa el Look se superpone con Recuperación de Navegación, Recuperador de Carritos con IA, Recomendador Inteligente, Impulsor de Ventas Cruzadas o campañas.

Ajusta una cosa por vez: alcance de productos, audiencia, reglas de recomendación, tono, feedback en Playground, estrategia de descuento, canal o camino de derivación.

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
- [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Playbook Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
