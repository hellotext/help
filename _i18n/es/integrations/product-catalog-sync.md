El catálogo de productos le da a Hellotext el contexto necesario para entender qué ven, agregan al carrito, compran, consultan y podrían querer después los clientes.

Cuando el catálogo está sincronizado correctamente, Hellotext puede conectar la actividad de cada cliente con los productos correctos y usar información actualizada en conversaciones, recomendaciones y misiones.

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

El nombre es necesario al crear un producto mediante la API, pero los demás campos compatibles pueden estar incompletos. No supongas que todas las integraciones importan la misma información ni que ver un producto en Hellotext demuestra que tenga imagen, URL, variantes o inventario actualizados.

## Por qué importa el catálogo

Hellotext combina el catálogo con las señales de los clientes. Una vista de producto, una actualización del carrito o una orden resulta más útil cuando corresponde al mismo producto y variante que Hellotext ya conoce.

Esta conexión permite experiencias como:

- [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) y agentes de venta que buscan productos relevantes.
- [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) y [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}), que usan los productos considerados por el cliente.
- [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) y [Completa el Look]({% link _journeys/complete-the-look-playbook.md %}), que buscan relaciones útiles entre productos.
- [Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}) y [Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %}), que dependen de cambios de disponibilidad o precio.
- [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}), que combina el producto y el historial de compras para estimar el próximo momento útil.

Un catálogo conectado también ofrece mejor contexto de producto a los integrantes del equipo y los agentes de IA cuando ayudan a un cliente desde el Inbox.

El catálogo no registra por sí solo una visita, un carrito o una compra. Esos hechos necesitan su señal real y el contexto correcto del cliente. Tener el producto tampoco garantiza que una misión se active o envíe: siguen aplicándose sus requisitos, permisos, disponibilidad y configuración.

## Elige la fuente de verdad

Usa como fuente de verdad el sistema donde el negocio administra sus productos.

Para Shopify, Wix, WooCommerce y VTEX, conecta la integración nativa de la tienda. Hellotext importa los datos de producto compatibles y los mantiene actualizados a medida que la plataforma informa cambios o la integración los vuelve a consultar.

Para una tienda personalizada, sincroniza los productos y sus variantes mediante la API. Los eventos del navegador y del servidor deben reutilizar esas identidades. Actualmente, la API pública de Productos no ofrece un campo dedicado de inventario en tiempo real, por lo que debes confirmar una fuente de inventario compatible antes de habilitar una misión que dependa de la disponibilidad.

Si conectas un catálogo a WhatsApp, la tienda sigue siendo la fuente de los productos. Hellotext prepara los productos elegibles para el catálogo de Meta seleccionado mediante procesos separados de sincronización y publicación. Un producto guardado en Hellotext no garantiza que Meta ya lo haya aceptado o que aparezca en WhatsApp. El catálogo de Meta es un destino para vender mediante WhatsApp, no reemplaza la conexión de la tienda ni confirma que se haya completado un pago.

No mantengas el mismo producto de forma independiente en varios sistemas sin definir claramente cuál lo controla. Las referencias, precios o disponibilidades contradictorias pueden generar duplicados o información desactualizada.

La disponibilidad exige una fuente compatible y comprobada. Shopify y VTEX incluyen consultas específicas; otros importadores pueden aportar datos de catálogo sin una consulta equivalente de stock. No interpretes un estado interno activo, un precio o una propiedad personalizada como prueba de unidades disponibles. Tampoco asumas que la consulta sea instantánea: puede haber caché y demoras.

## Mantén una identidad consistente

La regla más importante del catálogo es mantener estables las referencias de productos y variantes.

Usa la misma identidad de producto o variante en:

- El catálogo sincronizado.
- Los eventos de vista de producto.
- Los productos del carrito.
- Los productos de las órdenes.
- Los eventos del servidor o las integraciones personalizadas.

El nombre, la URL, el precio o la posición dentro de una importación pueden cambiar y no deberían usarse como identificadores. Mantén un mapa entre la identidad de la tienda y el ID público del producto o variante de Hellotext.

| Dato | Qué identifica |
| --- | --- |
| **ID público de Hellotext** | El registro concreto que devuelve la API; conserva el de cada producto y variante. |
| **Referencia** | El identificador que aporta la fuente de origen. |
| **Origen** | La plataforma o integración que permite interpretar esa referencia. |
| **SKU** | Un código comercial útil para comparar; puede faltar, cambiar o coincidir con otro registro. |

En **Configuración > Objetos > Productos**, abre **Editar** para revisar nombre, referencia, SKU y origen. La siguiente vista muestra el producto ficticio en borrador **Agenda semanal**, referencia **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER** y origen **custom_store**. Estos valores no son su ID público ni prueban que haya llegado desde una tienda conectada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real del producto ficticio Agenda semanal con referencia, SKU y origen.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/identity-es-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-es.png" srcset="/images/developers/products-and-inventory-with-api/identity-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Editor real del producto ficticio Agenda semanal con referencia, SKU y origen." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador existente sin eventos, reutilizado sin cambios. Referencia y SKU no son el ID público ni una señal de inventario.</figcaption>
</figure>

Si un evento usa una referencia diferente a la del catálogo, Hellotext puede recibir la solicitud pero no relacionarla con el producto que necesita la misión. Esto puede provocar imágenes ausentes, contexto incompleto del carrito, productos duplicados o recomendaciones que omiten ese producto.

No dependas de un SKU o una referencia ambiguos: algunas búsquedas también aceptan esos valores y los comparan sin distinguir mayúsculas. Reutiliza el ID público comprobado del negocio correcto y conserva el origen. No cambies solo la capitalización para intentar crear una identidad diferente.

## Qué campos deberías revisar

Empieza por los datos que afectan a todas las experiencias de producto:

- **Identidad:** referencias estables del producto y sus variantes, además del SKU cuando lo use la tienda.
- **Presentación:** nombre, URL pública del producto y al menos una imagen accesible.
- **Comercio:** precio actual y moneda.
- **Disponibilidad:** estado activo, no disponible o sin stock cuando la fuente lo admite.
- **Estructura:** producto principal y variantes que se pueden comprar.

Después, mejora la búsqueda y las recomendaciones con marca, descripción, categoría, colección, etiquetas, color, talla, material u otros atributos útiles que entregue la fuente.

Usa los datos del producto para la información compartida por toda la familia y los datos de la variante para diferencias como talla, color, SKU, precio, imagen o disponibilidad. Confirma qué campos y relaciones mantiene tu integración; una lista de variantes en una respuesta API también incluye la representación predeterminada del producto y no demuestra que existan variantes comerciales adicionales.

Para revisar el precio en el editor de Productos, abre **Cantidad** y comprueba el importe decimal y la moneda. Aquí **Cantidad** es dinero, no unidades de stock; **Cantidad convertida** corresponde al importe para la moneda de reportes del negocio. La demostración conserva **USD 44.95**, sin guardar una edición. Es un borrador sin foto, URL ni variantes adicionales, por lo que no representa un catálogo listo para lanzar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Control real de importe USD 44.95 y cantidad convertida USD 44.95 de un producto ficticio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/price-es-mobile.png 2x" width="714" height="300" />
        <img src="/images/developers/products-and-inventory-with-api/price-es.png" srcset="/images/developers/products-and-inventory-with-api/price-es.png 2x" style="width: auto; margin: 0 auto;" width="942" height="300" loading="lazy" decoding="async" alt="Control real de importe USD 44.95 y cantidad convertida USD 44.95 de un producto ficticio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Control monetario abierto sin guardar: no representa stock, un precio actualizado por la tienda ni una prueba de sincronización.</figcaption>
</figure>

## Cómo llegan las actualizaciones a Hellotext

La importación inicial comienza después de conectar una tienda compatible. Los catálogos grandes pueden demorar más, por lo que conviene esperar a que termine la primera sincronización antes de evaluar recomendaciones o misiones que dependan del inventario.

Luego, Hellotext actualiza los campos compatibles cuando la plataforma de eCommerce informa un cambio o cuando la integración realiza su propia actualización. La demora exacta puede variar según la plataforma y el tamaño del catálogo.

Corrige el precio, la imagen, la categoría, las variantes y la disponibilidad en la fuente de verdad. Después, permite que la integración los sincronice. Evita crear un segundo producto en Hellotext para resolver temporalmente un registro desactualizado.

En una tienda personalizada, la integración debe actualizar el producto existente en la API cada vez que cambien los datos compatibles del catálogo. Conserva el ID público y comprueba el resultado volviendo a leerlo, incluyendo sus variantes. En una actualización del producto, enviar una lista de variantes vacía puede retirar las variantes existentes: usa las operaciones individuales documentadas cuando corresponda.

Los cambios de catálogo pueden iniciar otros procesos, como publicación en Meta o evaluación de cambios de precio y disponibilidad. No los uses para fabricar datos de una prueba. Si una escritura pierde su respuesta, comprueba primero el registro existente antes de repetirla; no hay una garantía general de que todo reintento sea idempotente.

## Verifica el catálogo antes del lanzamiento

Usa un entorno aislado autorizado, perfiles ficticios y destinos de prueba permitidos. Define antes qué compras, eventos, recomendaciones o envíos podrían producir las acciones. No hagas compras ni actives misiones en una tienda real solo para llenar esta lista. Prueba un producto principal con al menos una variante real de ese entorno cuando sea posible.

1. Confirma que el nombre, precio, moneda, imagen, URL y disponibilidad coincidan con la tienda.
2. Confirma que las variantes pertenezcan al producto correcto y muestren el SKU, precio e imagen esperados.
3. En una sesión de prueba identificada correctamente, visita el producto y confirma el evento real en el perfil previsto, con su producto, fecha y origen. Sincronizar el catálogo o recibir una respuesta `received` no confirma por sí solo que se registró el evento.
4. Si el entorno lo permite, agrega el producto al carrito y realiza una orden de prueba autorizada, evitando cobros, entregas o comunicaciones reales no previstos. Si no hay un entorno seguro, deja esa comprobación pendiente.
5. Compara los identificadores del catálogo con los del evento, carrito y artículos del pedido; no te bases solo en el nombre. Comprueba cantidad, importe y moneda según el contrato de esa integración.
6. Cambia un campo compatible solo en la fuente de prueba, espera el procesamiento y vuelve a leer el producto existente. Conserva el ID y comprueba que no apareció un duplicado.
7. Revisa la vista previa o playground de la misión después de validar los datos. Una simulación no confirma un envío real; cualquier prueba de entrega necesita autorización y destinos aislados.

En **Configuración > Objetos > Órdenes**, abre **Editar** y revisa el artículo. La siguiente línea pertenece a un pedido ficticio en borrador de origen **custom_store**: **Agenda semanal**, cantidad **2** e importe unitario **USD 44.95**, que suman **USD 89.90**. El importe del pedido es un dato distinto del precio actual del catálogo. Esta vista no muestra los IDs ni demuestra una compra o un evento; comprueba esas relaciones en tu mapa de identidades y en la lectura del pedido.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Artículo real de un pedido ficticio: Agenda semanal, cantidad 2 e importe unitario USD 44.95.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/items-es-mobile.png 2x" width="714" height="572" />
        <img src="/images/developers/orders-with-api/items-es.png" srcset="/images/developers/orders-with-api/items-es.png 2x" style="width: auto; margin: 0 auto;" width="942" height="572" loading="lazy" decoding="async" alt="Artículo real de un pedido ficticio: Agenda semanal, cantidad 2 e importe unitario USD 44.95." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Pedido existente en borrador y sin eventos. Para custom_store, dos unidades de USD 44.95 suman USD 89.90; no es una compra o entrega real.</figcaption>
</figure>

Sigue leyendo: [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Soluciona problemas comunes del catálogo

### Falta un producto

Confirma que cumpla las condiciones de importación de la plataforma, que la integración y sus permisos sigan vigentes y que haya terminado la primera importación. Revisa la identidad de origen y si se trata de una variante dentro de un producto principal. Que falte en WhatsApp no significa que falte en Hellotext: comprueba por separado la elegibilidad y publicación del catálogo de Meta.

### El precio, la imagen o la disponibilidad están desactualizados

Revisa primero el valor en la fuente de verdad y si el conector sincroniza ese campo. Si allí es correcto, espera el procesamiento y vuelve a leer el mismo producto o variante. Conserva referencia, origen, ID público y hora del cambio para comparar. No vuelvas a conectar una integración que funciona para forzar una actualización: si los cambios posteriores tampoco llegan, pide a soporte que revise el conector y sus permisos.

### Un producto aparece más de una vez

Compara la fuente, la referencia del producto, la referencia de la variante, el SKU y los IDs públicos. Distingue el producto principal de una variante legítima y de la representación predeterminada de la respuesta API. Una integración personalizada debe actualizar el registro existente; no borres registros con historia ni repitas una creación incierta para intentar corregir el duplicado.

### La actividad aparece sin el producto esperado

Compara la referencia usada por el evento, carrito u orden con la del catálogo sincronizado. En un seguimiento personalizado, asegúrate de que la tienda y el servidor reutilicen el mismo ID de producto o variante de Hellotext.

### Una misión que depende del inventario no puede usar el producto

Confirma que la fuente conectada entregue y consulte disponibilidad compatible para el producto o variante correcto. La API pública de Productos no acepta campos de stock, cantidad vendible o estado de inventario. El nombre, precio, metadatos, estado activo predeterminado o una respuesta interna de disponibilidad sin fuente comprobada no acreditan stock real. Deja la misión que depende de inventario deshabilitada hasta confirmar esa capacidad.

Si también falta la actividad subyacente, usa [Soluciona señales o actividad ausentes]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Conecta tu catálogo con WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Integra una tienda personalizada con Hellotext]({% link _developers/custom-store-integration.md %})
- [Sincroniza productos y comprende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
