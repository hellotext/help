Usa esta guía cuando los clientes pidieron que les avises por un producto no disponible y quieres que Hellotext les notifique automáticamente cuando ese producto o variante vuelve a estar disponible.

Vuelta a Stock es un playbook autónomo de conversión. Cruza señales de inventario con los perfiles del cliente que mostraron interés, verifica que la oportunidad siga vigente y envía una alerta relevante a esas personas sin que tu equipo tenga que revisar listas, cruzar stock o crear campañas manuales.

Su valor está en simplificar la operación: Hellotext comunica la reposición de manera automática e inteligente, justo a los clientes que esperaban ese producto, con el contexto necesario para volver a comprar.

No es una ruta ni una campaña amplia de reposición. Es un playbook preconstruido con su propia configuración.

## Qué hace Vuelta a Stock

Vuelta a Stock ayuda a convertir demanda que quedó bloqueada por inventario.

Puede:

- Empezar cuando Hellotext recibe una señal de vuelta a stock o disponibilidad para un producto o variante.
- Usar una señal de lista de espera, aviso de reposición, interés en producto o captura cuando ese dato está disponible.
- Enviar una notificación con contexto de producto y link de producto cuando el cliente puede ser alcanzado.
- Revisar si el producto o variante sigue disponible antes de que salga el mensaje.
- Detenerse cuando el producto vuelve a no estar disponible, el cliente ya compró, el cliente no puede ser alcanzado o no hace falta más seguimiento.
- Permitir que tu equipo revise y edite la configuración del playbook antes de habilitarlo.

La configuración exacta puede variar según cuenta, tienda conectada y estado de despliegue. Revisa el playbook generado antes de habilitarlo en lugar de asumir que todos los negocios tienen las mismas opciones.

## Cuándo usarlo

Usa Vuelta a Stock cuando el cliente quería un producto específico pero el inventario bloqueó la compra.

Encaja bien cuando:

- Los clientes se suman a una lista de espera o piden aviso cuando un producto vuelve.
- Un talle, color, variante o SKU específico no estaba disponible y vuelve a estar vendible.
- Tu tienda o fuente de datos puede enviar actualizaciones confiables de stock por producto o variante.
- Links, imágenes, precios y disponibilidad de producto están lo suficientemente actualizados para enviar rápido.
- Quieres una alerta directa de reposición, no un mensaje amplio de merchandising.

Usa una campaña cuando quieres anunciar una reposición una sola vez a una audiencia seleccionada, incluso si esos clientes no pidieron aviso por ese producto.

Usa [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) cuando el cliente vio un producto disponible pero no compró. Usa [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando el cliente agregó el producto al carrito o checkout. Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente necesita ayuda para elegir alternativas o productos relacionados.

## Qué necesita antes del lanzamiento

Antes de habilitar el playbook, confirma las señales de inventario y cliente de las que depende.

Revisa que:

- Tu tienda, ERP, catálogo o fuente de inventario envíe cambios de stock o disponibilidad a Hellotext.
- Identificadores de producto y variante coincidan con la señal de interés, lista de espera o aviso de reposición.
- Los estados sin stock y vuelta a stock sean confiables al nivel sobre el que vas a escribir.
- Nombres, imágenes, precios, stock y links de producto estén actualizados.
- Los perfiles del cliente que pidieron aviso estén suscritos, identificables y alcanzables.
- El disparador del playbook coincida con la señal de stock o disponibilidad que envía tu integración.
- El canal esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Señales de compra u orden estén disponibles si el playbook debería evitar escribir a clientes que ya compraron.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de habilitar el playbook, usa los reportes automáticos para revisar entradas, envíos, omisiones, clicks, compras, ingresos atribuidos y fallas.

## Cómo configurarlo

Ve a **Playbooks**, haz click en **Explorar playbooks** y elige **Vuelta a Stock**.

Revisa la configuración generada del playbook antes de habilitarlo.

Presta especial atención a:

- **Disparador:** la señal de stock, disponibilidad o aviso de reposición que inicia el playbook.
- **Alcance de producto o variante:** qué productos, SKUs, variantes, categorías o colecciones deberían ser elegibles.
- **Condición de disponibilidad:** cómo el playbook confirma que el producto sigue vendible antes de enviar.
- **Mensaje:** nombre del producto, imagen, link de producto, canal y remitente.
- **Comportamiento de salida:** qué pasa cuando el producto vuelve a no estar disponible, el cliente ya compró o el cliente ya no coincide.
- **Reglas adicionales:** esperas, seguimientos, asignaciones, etiquetas o condiciones disponibles en tu cuenta.

No esperes configuración de prompt o intenciones acá. Eso pertenece a agentes de IA o agentes personalizados, no a este playbook de vuelta a stock.

## Cómo funciona con playbooks cercanos

Usa la señal del cliente para decidir quién debería ser dueño del momento.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente pidió aviso por un producto no disponible | Vuelta a Stock |
| El cliente vio un producto disponible pero no agregó al carrito | [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) |
| El cliente agregó productos al carrito o checkout y se fue | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| El cliente necesita ayuda para elegir un producto o alternativa | [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) |
| El negocio quiere anunciar una reposición una vez a una audiencia seleccionada | Campaña o broadcast |

Vuelta a Stock puede convivir con recuperación de navegación y recuperación de carrito cuando la propiedad está clara. Vuelta a Stock maneja el momento de producto no disponible; navegación y carrito manejan productos disponibles que el cliente no compró.

## Cómo probarlo

Prueba con un caso pequeño y realista antes de habilitarlo ampliamente.

Usa un perfil del cliente de prueba que tenga consentimiento de canal, luego:

- Crea o identifica un producto o variante que no esté disponible.
- Crea una señal de lista de espera, aviso de reposición, captura o interés en producto para ese perfil de prueba.
- Confirma que la señal de interés aparezca en el perfil del cliente correcto.
- Envía o simula la actualización de stock o disponibilidad que vuelve vendible el producto.
- Confirma que el disparador del playbook coincida con esa actualización.
- Confirma que el mensaje use el producto, variante, imagen, precio y link correctos.
- Confirma que el playbook no envíe si el producto vuelve a quedar sin stock.
- Confirma que el playbook no envíe si el cliente de prueba ya compró, cuando esa condición forma parte de la configuración.
- Envía una respuesta y confirma que llegue al Inbox si tu equipo debería manejar respuestas.
- Revisa ejemplos enviados, omitidos, fallidos, clickeados y convertidos después del lanzamiento.

Si el tracking es personalizado, confirma que identificadores de producto, identificadores de variante, estado de stock, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Habilitar el playbook no garantiza que cada reposición produzca un mensaje.

El playbook puede no enviar cuando:

- La señal de stock o disponibilidad no llegó.
- Falta la señal de interés en producto, lista de espera o aviso de reposición.
- Los identificadores de producto o variante no coinciden entre la actualización de stock y la señal del cliente.
- El producto sigue no disponible, está oculto, archivado, no tiene precio o no tiene un link usable.
- El cliente ya compró el producto y el playbook está configurado para detenerse después de la compra.
- El perfil no puede ser alcanzado en el canal elegido.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- El canal, remitente, plantilla de WhatsApp o formato del mensaje no está listo.
- Horarios silenciosos, límites de frecuencia u otra regla de envío demoran o bloquean el mensaje.
- Otro playbook o campaña ya está manejando el mismo momento del cliente.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué productos o variantes crearon entradas de vuelta a stock.
- Cuántos perfiles del cliente entraron en el playbook.
- Cuántos mensajes se enviaron, omitieron, fallaron, recibieron clicks o convirtieron.
- Si los productos seguían disponibles cuando los clientes hicieron click.
- Si links, imágenes, precios y variantes fueron correctos.
- Respuestas, bajas y preguntas de soporte.
- Compras, ingresos atribuidos y oportunidades omitidas.
- Si el playbook se superpone con campañas, Recuperación de Navegación, recuperación de carrito o Recomendador Inteligente.

Ajusta una cosa por vez: disparador, alcance de productos, mensaje, espera, canal o condición de salida.

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
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Resumen de campañas y broadcasts]({% link _campaigns/campaigns-overview.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
