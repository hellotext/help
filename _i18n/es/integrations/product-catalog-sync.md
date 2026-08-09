El catálogo de productos le da a Hellotext el contexto necesario para entender qué ven, agregan al carrito, compran, consultan y podrían querer después los clientes.

Cuando el catálogo está sincronizado correctamente, Hellotext puede conectar la actividad de cada cliente con los productos correctos y usar información actualizada en conversaciones, recomendaciones y playbooks.

## Qué hace la sincronización del catálogo

La sincronización crea en Hellotext un registro consistente para cada producto y variante del sistema de origen.

Según la plataforma conectada y los datos que proporcione, un producto puede incluir:

- Una referencia estable del producto y sus variantes.
- Nombre, descripción, marca, SKU y URL del producto.
- Precio y moneda.
- Imágenes.
- Categorías, colecciones y etiquetas.
- Variantes y sus precios o imágenes individuales.
- Si el producto está disponible cuando la integración admite información de disponibilidad.

No todos los campos son obligatorios para que aparezca un producto. Los datos completos y actualizados dan más contexto a las recomendaciones y los mensajes de producto.

## Por qué importa el catálogo

Hellotext combina el catálogo con las señales de los clientes. Una vista de producto, una actualización del carrito o una orden resulta más útil cuando corresponde al mismo producto y variante que Hellotext ya conoce.

Esta conexión permite experiencias como:

- [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) y agentes de venta que buscan productos relevantes.
- [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) y [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}), que usan los productos considerados por el cliente.
- [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) y [Completa el Look]({% link _journeys/complete-the-look-playbook.md %}), que buscan relaciones útiles entre productos.
- [Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}) y [Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %}), que dependen de cambios de disponibilidad o precio.
- [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}), que combina el producto y el historial de compras para estimar el próximo momento útil.

Un catálogo conectado también ofrece mejor contexto de producto a los integrantes del equipo y los agentes de IA cuando ayudan a un cliente desde el Inbox.

## Elige la fuente de verdad

Usa como fuente de verdad el sistema donde el negocio administra sus productos.

Para Shopify, Wix, WooCommerce y VTEX, conecta la integración nativa de la tienda. Hellotext importa los datos de producto compatibles y los mantiene actualizados a medida que la plataforma informa cambios o la integración los vuelve a consultar.

Para una tienda personalizada, sincroniza los productos y sus variantes mediante la API. Los eventos del navegador y del servidor deben reutilizar esas identidades. Actualmente, la API pública de Productos no ofrece un campo dedicado de inventario en tiempo real, por lo que debes confirmar una fuente de inventario compatible antes de habilitar un playbook que dependa de la disponibilidad.

Si conectas un catálogo a WhatsApp, la tienda sigue siendo la fuente de los productos. Hellotext publica los productos sincronizados en el catálogo de Meta seleccionado. El catálogo de Meta es un destino para vender mediante WhatsApp, no reemplaza la conexión de la tienda.

No mantengas el mismo producto de forma independiente en varios sistemas sin definir claramente cuál lo controla. Las referencias, precios o disponibilidades contradictorias pueden generar duplicados o información desactualizada.

## Mantén una identidad consistente

La regla más importante del catálogo es mantener estables las referencias de productos y variantes.

Usa la misma identidad de producto o variante en:

- El catálogo sincronizado.
- Los eventos de vista de producto.
- Los productos del carrito.
- Los productos de las órdenes.
- Los eventos del servidor o las integraciones personalizadas.

El nombre, la URL, el precio o la posición dentro de una importación pueden cambiar y no deberían usarse como identificadores.

Si un evento usa una referencia diferente a la del catálogo, Hellotext puede recibir la actividad pero no relacionarla con el producto que necesita el playbook. Esto puede provocar imágenes ausentes, contexto incompleto del carrito, productos duplicados o recomendaciones que omiten ese producto.

## Qué campos deberías revisar

Empieza por los datos que afectan a todas las experiencias de producto:

- **Identidad:** referencias estables del producto y sus variantes, además del SKU cuando lo use la tienda.
- **Presentación:** nombre, URL pública del producto y al menos una imagen accesible.
- **Comercio:** precio actual y moneda.
- **Disponibilidad:** estado activo, no disponible o sin stock cuando la fuente lo admite.
- **Estructura:** producto principal y variantes que se pueden comprar.

Después, mejora la búsqueda y las recomendaciones con marca, descripción, categoría, colección, etiquetas, color, talla, material u otros atributos útiles que entregue la fuente.

Usa los datos del producto para la información compartida por toda la familia y los datos de la variante para diferencias como talla, color, SKU, precio, imagen o disponibilidad.

## Cómo llegan las actualizaciones a Hellotext

La importación inicial comienza después de conectar una tienda compatible. Los catálogos grandes pueden demorar más, por lo que conviene esperar a que termine la primera sincronización antes de evaluar recomendaciones o playbooks que dependan del inventario.

Luego, Hellotext actualiza los campos compatibles cuando la plataforma de eCommerce informa un cambio o cuando la integración realiza su propia actualización. La demora exacta puede variar según la plataforma y el tamaño del catálogo.

Corrige el precio, la imagen, la categoría, las variantes y la disponibilidad en la fuente de verdad. Después, permite que la integración los sincronice. Evita crear un segundo producto en Hellotext para resolver temporalmente un registro desactualizado.

En una tienda personalizada, la integración debe actualizar el producto existente en la API cada vez que cambien los datos compatibles del catálogo.

## Verifica el catálogo antes del lanzamiento

Prueba un producto principal con al menos una variante cuando sea posible.

1. Confirma que el nombre, precio, moneda, imagen, URL y disponibilidad coincidan con la tienda.
2. Confirma que las variantes pertenezcan al producto correcto y muestren el SKU, precio e imagen esperados.
3. Visita ese producto en la tienda y confirma que la actividad aparezca en el perfil del cliente correcto.
4. Agrega el producto al carrito y realiza una orden de prueba.
5. Confirma que la vista, el carrito y la orden correspondan al mismo producto o variante.
6. Cambia un campo compatible en la fuente, espera la sincronización y confirma que se actualice el producto existente sin crear un duplicado.
7. Prueba el playbook correspondiente o su playground solo después de confirmar que los datos del producto sean correctos.

Sigue leyendo: [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Soluciona problemas comunes del catálogo

### Falta un producto

Confirma que esté activo o publicado en la tienda conectada, que la integración continúe conectada y que haya terminado la primera importación. Revisa si se trata de una variante que debería aparecer dentro de un producto principal.

### El precio, la imagen o la disponibilidad están desactualizados

Revisa primero el valor en la fuente de verdad. Si allí es correcto, espera a que la integración procese la actualización. Vuelve a conectar o contacta a soporte solo después de confirmar que los cambios posteriores tampoco están llegando.

### Un producto aparece más de una vez

Compara la fuente, la referencia del producto, la referencia de la variante y el SKU. Una integración personalizada debe actualizar el registro existente en vez de crear un producto nuevo con cada importación o cambio de precio.

### La actividad aparece sin el producto esperado

Compara la referencia usada por el evento, carrito u orden con la del catálogo sincronizado. En un seguimiento personalizado, asegúrate de que la tienda y el servidor reutilicen el mismo ID de producto o variante de Hellotext.

### Un playbook que depende del inventario no puede usar el producto

Confirma que la fuente conectada entregue datos de disponibilidad compatibles. El nombre, el precio y los metadatos personalizados por sí solos no crean una señal de inventario en tiempo real.

Si también falta la actividad subyacente, usa [Soluciona señales o actividad ausentes]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Conecta tu catálogo con WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Integra una tienda personalizada con Hellotext]({% link _developers/custom-store-integration.md %})
- [Sincroniza productos y comprende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
