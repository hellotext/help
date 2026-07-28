Usa esta guía cuando los clientes ya mostraron suficiente intención de compra y Hellotext puede sugerir un complemento, accesorio, producto compatible o siguiente producto relevante.

Impulsor de Ventas Cruzadas es un playbook activo de expansión. Ayuda a Hellotext a sugerir productos complementarios después de una compra o interés fuerte en un producto, usando historial de pedidos, contexto de catálogo, relaciones entre productos, stock, comportamiento del cliente, elegibilidad de canal y chequeos de envío.

No es una promoción amplia y no es un chat genérico de recomendación de productos. Parte de un momento específico del cliente: compró, es probable que compre o mostró interés en un producto principal, y otro producto puede encajar naturalmente como siguiente paso.

## Qué hace Impulsor de Ventas Cruzadas

Impulsor de Ventas Cruzadas ayuda a aumentar el valor del pedido o la recompra recomendando productos que tienen sentido con lo que el cliente ya compró o consideró.

Puede:

- Reaccionar después de una compra, entrega o señal fuerte de interés en producto cuando esas señales están disponibles.
- Usar el producto comprado o visto como producto principal para la recomendación.
- Sugerir SKUs relacionados, accesorios, productos complementarios, productos que suelen comprarse juntos o categorías relacionadas.
- Usar datos de catálogo, stock, links de producto, historial de pedidos y señales de recomendación para evitar sugerencias irrelevantes.
- Incluir un link para agregar al carrito, link de producto o descuento cuando esas opciones están disponibles y configuradas.
- Evitar enviar cuando el cliente ya compró el producto recomendado, el producto no está disponible, otro playbook es dueño del momento o el cliente no puede ser alcanzado.
- Continuar la conversación o derivar al Inbox cuando una respuesta necesita una persona.

La experiencia exacta puede variar según cuenta, tienda conectada, calidad del catálogo, canal, plantillas disponibles y estado de despliegue del playbook.

## Cuándo usarlo

Usa Impulsor de Ventas Cruzadas cuando hay una relación clara entre lo que el cliente ya compró o consideró y lo que podría querer después.

Encaja bien para momentos como:

- Un cliente compra una cámara y podría necesitar una memoria, funda o trípode.
- Un cliente compra zapatos y podría querer medias, productos de cuidado o un accesorio que combine.
- Un cliente compra cuidado de la piel y podría querer otro producto de la misma rutina.
- Un cliente compra una parte de un set y podría querer completar el look o kit.
- Un cliente recurrente muestra interés en una familia de productos y el historial de compras ayuda a elegir el mejor complemento.

Funciona mejor cuando Hellotext puede ver historial de pedidos, identidad de producto, metadata del catálogo, stock, links de producto y suficientes datos de relación o recomendación para que la sugerencia se sienta natural.

No lo uses para productos que no tienen complementos o siguientes pasos claros. Para descubrimiento de producto en tiempo real durante una conversación, usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}). Para productos consumibles que necesitan reponerse, usa [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}). Para una promoción puntual a una audiencia seleccionada, usa una campaña.

## Qué necesita antes del lanzamiento

Antes de habilitar Impulsor de Ventas Cruzadas, confirma la configuración de la que depende.

Revisa que:

- Tu tienda, ERP o fuente de datos envíe compras e historial de pedidos a Hellotext.
- Productos, variantes, SKUs, nombres, imágenes, precios, stock y links de producto estén actualizados.
- Las relaciones entre productos puedan inferirse o proveerse mediante catálogo, colecciones, categorías, historial de compra o lógica de recomendación.
- Los productos que quieres recomendar tengan suficiente stock y links usables.
- Tu equipo tenga claro qué colecciones, categorías o productos deberían incluirse o excluirse en la configuración del playbook.
- Si se permiten descuentos, las reglas de oferta del ecommerce y el porcentaje máximo que puede usar la IA estén aprobados antes del lanzamiento.
- El canal que puede usar el playbook esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de activar el playbook, usa los reportes automáticos para revisar envíos, clicks, agregados al carrito, compras, ingresos atribuidos y oportunidades omitidas.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Impulsor de Ventas Cruzadas**.

El playbook expone el alcance de productos y las reglas de recomendación:

- **Alcance de productos:** qué productos, colecciones, categorías o familias pueden iniciar o recibir recomendaciones de venta cruzada.
- **Reglas de recomendación:** relaciones de producto, exclusiones o reglas de merchandising que deberían guiar los productos sugeridos.

Según el despliegue de la cuenta, también puede mostrar tarjetas para:

- **Estrategia de descuento:** si el mensaje sigue las reglas de oferta del ecommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Canales:** dónde Hellotext puede enviar o continuar la conversación.
- **Tono o feedback en Playground:** cómo deberían aprender los seguimientos generados qué encaja con tu negocio.
- **Derivación o asignación:** quién debería tomar la conversación cuando una respuesta necesita una persona.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Impulsor de Ventas Cruzadas depende de si el cliente puede ser alcanzado cuando la sugerencia complementaria todavía es relevante.

Hellotext maneja automáticamente la elegibilidad del cliente, el momento del envío y los reportes. El alcance de productos y las reglas de recomendación siguen siendo controles directos para decidir qué productos participan y cómo se eligen los complementos.

## Cómo se eligen las recomendaciones

Las recomendaciones de venta cruzada deberían partir de una señal real del cliente, no de una lista genérica de productos.

Hellotext puede usar señales como:

- El producto, SKU, colección, categoría o marca que el cliente compró o vio.
- Productos que suelen comprarse junto con el producto principal.
- Relaciones de catálogo, productos compatibles, productos que suelen comprarse juntos o colecciones definidas por el negocio.
- Stock, precio, disponibilidad, links de producto y calidad de imagen.
- Historial, preferencias, engagement y compras anteriores del cliente.
- Productos ya mostrados, clickeados, ignorados o comprados cuando ese contexto está disponible.

Antes de enviar, Hellotext también puede considerar:

- Si el producto principal está conectado a un perfil del cliente usable.
- Si el producto recomendado está disponible y es relevante.
- Si el cliente ya compró la recomendación o un sustituto cercano.
- Si la recomendación entraría en conflicto con otro playbook activo.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si consentimiento, timing, frecuencia o reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente necesita ayuda para elegir un producto en una conversación | [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) |
| El cliente compró o consideró un producto y podría querer uno complementario | Impulsor de Ventas Cruzadas |
| El cliente podría estar por quedarse sin un producto consumible | [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) |
| El cliente navegó pero no agregó al carrito | [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) |
| El cliente abandonó un carrito | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| El cliente recibió un pedido y debería reseñar el producto | [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) |

Impulsor de Ventas Cruzadas puede convivir con Impulsor de Recompra cuando los momentos de producto son distintos. Venta cruzada sugiere un producto relacionado; recompra recuerda reponer el mismo producto o un reemplazo cuando podría estar por acabarse.

## Revisa mensajes en el Playground

Impulsor de Ventas Cruzadas puede generar seguimientos personalizados usando contexto de producto, pedido, catálogo, cliente y canal. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos de mensajes antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext pueda aprender el estilo, wording y nivel de detalle que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si la recomendación se siente realmente relacionada con el producto principal.
- Si el mensaje explica por qué el complemento es útil sin sonar forzado.
- Si producto, imagen, precio, link y descuento son correctos.
- Si la recomendación evita productos que el cliente ya compró.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Mientras más realistas sean los ejemplos del Playground, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Crea o importa un pedido de prueba con un producto que debería tener un complemento claro.
- Confirma que el pedido y el producto aparezcan en el perfil del cliente.
- Confirma que el catálogo tenga el producto, productos relacionados, stock, precios, imágenes y links.
- Confirma que los productos recomendados sean relevantes y estén disponibles.
- Prueba un producto que no debería generar una sugerencia de venta cruzada.
- Prueba un cliente que ya compró el complemento sugerido.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, links para agregar al carrito, descuentos y atribución.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma que eventos de compra, identificadores de producto, cantidades, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Impulsor de Ventas Cruzadas esté habilitado no significa que cada compra o vista de producto produzca una recomendación.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- Las señales de compra o interés de producto faltan, llegan tarde o no están conectadas a un perfil del cliente usable.
- El producto principal no es elegible para venta cruzada.
- No se encuentra un producto complementario relevante.
- El producto recomendado no está disponible, no tiene stock, no tiene precio o no tiene un link usable.
- El cliente ya compró el producto recomendado o un sustituto cercano.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Reglas de frecuencia, timing u horarios silenciosos impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué productos o categorías crearon momentos elegibles de venta cruzada.
- Qué recomendaciones se enviaron, omitieron, recibieron clicks, se agregaron al carrito o se compraron.
- Qué productos tienen datos de relación débiles o faltantes.
- Si los productos sugeridos están disponibles, son relevantes y no se repiten demasiado.
- Clicks, agregados al carrito, recompras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos aumentan compras complementarias o solo reducen margen.
- Si Impulsor de Ventas Cruzadas se superpone con Recomendador Inteligente, Impulsor de Recompra, recuperación de carrito o campañas.

Ajusta una cosa por vez: alcance de productos, reglas de recomendación y, cuando esas tarjetas estén presentes, estrategia de descuento, canal, tono o camino de derivación.

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
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Playbook Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
