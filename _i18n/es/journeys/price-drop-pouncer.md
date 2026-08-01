Usa esta guía cuando los compradores mostraron interés en un producto y quieres que Hellotext les notifique automáticamente cuando ese producto baja de precio de forma relevante para ellos.

Alerta de Baja de Precio es un playbook autónomo de conversión. Cruza cambios de precio del catálogo con interés reciente de cada cliente, verifica si cada cliente vio personalmente un precio más alto y envía una alerta enfocada cuando la oportunidad todavía tiene sentido.

Su valor está en simplificar la operación: Hellotext detecta bajas de precio relevantes, encuentra a los compradores con más probabilidad de interés y comunica el nuevo precio sin que tu equipo tenga que armar segmentos, revisar historial de producto o enviar una campaña manual.

No es una ruta ni una campaña general de descuentos. Es un playbook preconstruido con su propia configuración y reglas automáticas de elegibilidad.

## Qué hace Alerta de Baja de Precio

Alerta de Baja de Precio ayuda a recuperar demanda que quedó pausada por precio.

Puede:

- Empezar cuando Hellotext recibe una baja de precio de producto desde tu catálogo.
- Cruzar ese cambio de precio con interés reciente de vistas de producto, agregados al carrito o recomendaciones de producto.
- Comparar el precio actual con el precio que cada cliente vio más recientemente, no solo con el precio anterior del catálogo.
- Enviar una notificación con contexto de producto, precio anterior, precio nuevo, porcentaje de baja y link de producto.
- Usar contexto del cliente para ajustar tono y urgencia sin inventar datos de precio.
- Revisar si el producto sigue vendible antes de enviar.
- Evitar mensajes cuando el cliente ya compró el producto recientemente, el precio volvió a cambiar o el producto ya no puede venderse.
- Permitir que tu equipo revise configuración disponible como canal, tono y derivación o asignación.

La configuración exacta puede variar según cuenta, tienda conectada, plan y estado de despliegue. Revisa el playbook generado antes de habilitarlo en lugar de asumir que todos los negocios tienen las mismas opciones.

## Cuándo usarlo

Usa Alerta de Baja de Precio cuando los clientes mostraron interés en un producto específico y el precio luego baja lo suficiente como para que valga la pena reactivar la conversación.

Encaja bien cuando:

- Compradores vieron un producto pero no compraron.
- Compradores agregaron un producto al carrito pero no terminaron la compra.
- Hellotext recomendó un producto y el cliente tiene una señal reciente de recomendación.
- Tu catálogo envía cambios de precio confiables.
- Links, imágenes, precios, estado vendible y disponibilidad de producto están actualizados.
- Quieres una alerta automática de precio, no una campaña amplia de descuentos.

Usa una campaña cuando quieres anunciar una oferta, promoción o cambio de precio a una audiencia seleccionada, incluso si esos clientes no mostraron interés en ese producto específico.

Usa [Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}) cuando el cambio principal es disponibilidad, no precio. Usa [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) cuando el comprador vio un producto disponible pero no hubo baja de precio. Usa [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando la señal más fuerte es carrito o checkout abandonado. Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente necesita ayuda para encontrar un mejor producto o alternativa.

## Qué necesita antes del lanzamiento

Antes de habilitar el playbook, confirma las señales de catálogo, producto y cliente de las que depende.

Revisa que:

- Tu tienda, ERP, catálogo o fuente de producto envíe cambios de precio a Hellotext.
- Identificadores de producto y variante sean estables entre catálogo, vistas de producto, carrito, recomendaciones y compras.
- Los precios usen la misma moneda para poder compararse.
- Nombres, imágenes, precios actuales, estado vendible, disponibilidad y links de producto estén actualizados.
- Los perfiles del cliente estén suscritos, identificables y alcanzables.
- Señales de vista de producto, agregado al carrito y recomendación estén siendo capturadas donde correspondan.
- Señales de compra u orden estén disponibles para evitar contactar a clientes que ya compraron.
- El canal esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de habilitar el playbook, usa los reportes automáticos para revisar compradores activados, mensajes entregados, interacción, compras recuperadas, ingresos atribuidos, ingresos por segmento, ingresos por canal y tiempo promedio de recuperación.

## Cómo configurarlo

Ve a **Playbooks**, haz click en **Explorar playbooks** y elige **Alerta de Baja de Precio**.

Revisa la configuración generada del playbook antes de habilitarlo.

Presta especial atención a:

- **Canal:** dónde puede enviarse la alerta de precio.
- **Tono:** qué tan directo, juguetón, premium o sobrio debería sentirse el mensaje.
- **Asignación o derivación:** quién debería manejar respuestas si un cliente contesta.
- **Datos de producto:** si nombres, imágenes, precios, links y disponibilidad se ven correctos.
- **Conexión de catálogo:** si los cambios de precio llegan de forma confiable y rápida.
- **Vista previa del mensaje:** si el mensaje explica producto, precio anterior, precio nuevo y razón para volver a mirar sin exagerar urgencia.

La configuración se concentra en el umbral de baja, canal, tono, datos de producto y asignación o derivación. Prompts, intenciones o pasos de ruta pertenecen a otros tipos de playbook, no a este playbook de baja de precio.

## Cómo decide quién recibe una alerta de precio

Alerta de Baja de Precio no envía cada cambio de precio a todos los clientes alcanzables.

Busca una señal reciente de interés en producto y luego revisa si el precio nuevo es significativamente más bajo que el precio que ese cliente vio más recientemente.

Las fuentes actuales de interés incluyen:

| Señal del cliente | Qué significa |
| --- | --- |
| Vista de producto | El cliente vio el producto o una variante recientemente. |
| Agregado al carrito | El cliente agregó el producto o una variante al carrito recientemente. |
| Recomendación de producto | Hellotext recomendó recientemente ese producto al cliente. |

Si el mismo cliente tiene varias señales para la familia de producto, Hellotext usa la observación con precio más reciente. Esto mantiene la alerta honesta: si un cliente primero vio un producto a un precio y después lo vio a un precio más bajo, el playbook compara contra el último precio que realmente vio.

## Cómo se escribe el mensaje

El mensaje se apoya en datos exactos de baja de precio de Hellotext.

Puede incluir:

- Un gancho claro de baja de precio.
- El precio anterior que vio el cliente.
- El precio actual del producto.
- El porcentaje de baja.
- Contexto de producto y link de producto.
- Un llamado a ver el producto y su nuevo precio.

El mensaje no debería inventar stock, velocidad de venta, fechas límite, vencimientos, reservas, precios futuros ni una cantidad específica ahorrada. Tampoco debería empujar al cliente directo al checkout o decir que el producto sigue en el carrito salvo que eso esté explícitamente respaldado.

Si Hellotext tiene información confiable de stock en vivo, el mensaje puede usar ese contexto con cuidado. No debería crear falsa urgencia a partir de datos de stock faltantes o desactualizados.

## Cómo funciona con playbooks cercanos

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El producto bajó de precio para un comprador con interés reciente | Alerta de Baja de Precio |
| El producto no estaba disponible y volvió a estar vendible | [Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}) |
| El comprador vio un producto disponible pero no hubo baja de precio | [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) |
| El comprador agregó productos al carrito o checkout y se fue | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| El comprador necesita una recomendación o alternativa | [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) |
| El negocio quiere anunciar una oferta una vez a una audiencia seleccionada | Campaña |

Alerta de Baja de Precio puede convivir con navegación, recuperación de carrito, recomendaciones y alertas de vuelta a stock cuando la propiedad está clara. Alerta de Baja de Precio maneja el momento en que el nuevo precio es la razón para volver a contactar.

## Cómo probarlo

Prueba con un caso pequeño y realista antes de habilitarlo ampliamente.

Usa un perfil del cliente de prueba que tenga consentimiento de canal, luego:

- Mira, agrega al carrito o recibe una recomendación para un producto de prueba.
- Confirma que la señal de interés aparezca en el perfil del cliente correcto.
- Baja el precio del producto en el catálogo conectado.
- Confirma que el cambio de precio llegue a Hellotext con los mismos identificadores de producto o variante.
- Confirma que el producto siga vendible y tenga un link usable.
- Confirma que el mensaje use producto, precio anterior, precio nuevo, porcentaje de baja, imagen y link correctos.
- Confirma que el playbook no envíe si el producto deja de estar vendible.
- Confirma que el playbook no envíe un mensaje desactualizado si otro cambio de precio reemplaza al primero.
- Confirma que el playbook no envíe si el cliente de prueba ya compró, cuando esa condición aplica.
- Envía una respuesta y confirma que llegue al Inbox si tu equipo debería manejar respuestas.
- Revisa ejemplos activados, entregados, con interacción, recuperados, omitidos y bloqueados después del lanzamiento.

Si el tracking es personalizado, confirma que identificadores de producto, identificadores de variante, montos de precio, moneda, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Habilitar el playbook no garantiza que cada baja de precio del catálogo produzca un mensaje.

El playbook puede no enviar cuando:

- El cambio de precio no llegó.
- El precio subió, quedó igual o cambió de moneda.
- La baja de precio no fue suficientemente relevante comparada con el precio que el cliente vio más recientemente.
- El cliente no tenía interés reciente de vista de producto, agregado al carrito o recomendación.
- Los identificadores de producto o variante no coinciden entre catálogo y señales del cliente.
- El producto no está disponible, está oculto, archivado, no tiene precio o no tiene un link usable.
- Un cambio de precio más reciente reemplazó el precio citado.
- El cliente ya compró el producto recientemente.
- El perfil no puede ser alcanzado en el canal elegido.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- El canal, remitente, plantilla de WhatsApp o formato del mensaje no está listo.
- Límites de frecuencia u otra regla de envío demoran o bloquean el mensaje.
- Otro playbook o campaña ya está manejando el mismo momento del cliente.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué productos generaron activaciones de baja de precio.
- Cuántos perfiles del cliente fueron elegibles.
- Cuántos mensajes fueron entregados, omitidos, bloqueados, recibieron interacción o recuperaron compras.
- Si precio anterior, precio nuevo y porcentaje de baja fueron correctos.
- Si los productos seguían vendibles cuando los clientes hicieron click.
- Si links, imágenes, precios y variantes fueron correctos.
- Respuestas, bajas y preguntas de soporte.
- Compras, ingresos atribuidos, ingresos por segmento, ingresos por canal y oportunidades omitidas.
- Si el playbook se superpone con campañas, Recuperación de Navegación, recuperación de carrito, Vuelta a Stock o Recomendador Inteligente.

Ajusta una cosa por vez: canal, tono, asignación, datos de producto, sincronización de catálogo o alcance de playbooks relacionados.

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
- [Playbook Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %})
- [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
