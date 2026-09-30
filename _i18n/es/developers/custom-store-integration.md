Usa esta guía cuando tu tienda no tenga una integración nativa con Hellotext y tu equipo necesite conectarla mediante la API y Hellotext.js.

La implementación tiene dos partes:

- **Tu backend** usa un token de autorización privado para crear y actualizar perfiles de clientes, propiedades, productos, pedidos y eventos confiables desde el servidor.
- **Tu tienda** usa el Business ID público con Hellotext.js para crear sesiones de visitantes y registrar actividad del navegador, como vistas de páginas, vistas de productos y cambios en el carrito.

> **Mantén las credenciales separadas:** el token de autorización de la API pertenece únicamente al servidor. Nunca lo incluyas en el código del navegador. El Business ID que usa Hellotext.js es el identificador público destinado a la tienda.

Esta guía presenta el orden de implementación recomendado. Usa la [referencia de la API]({% link _developers/api.md %}) para consultar el contrato completo de requests y respuestas de cada endpoint.

## Antes de comenzar

Prepara:

- Acceso como Propietario o Administrador al negocio de Hellotext.
- Acceso al backend y al código de la tienda.
- Identificadores estables de clientes, productos, carritos y pedidos en tu sistema.
- La moneda, estructura de productos y estados de pedidos que usa la tienda.
- Un registro claro del consentimiento. Crear un perfil del cliente no demuestra que haya aceptado recibir mensajes.

Elige un nombre de origen consistente, como `custom_store`, y reutilízalo para productos, carritos y pedidos. Ese origen describe tus registros; no habilita por sí solo una fuente compatible con `identify()`.

Conserva un mapeo en tu backend:

| Registro de tu tienda | Valor que debes conservar en Hellotext |
| --- | --- |
| Cliente `customer-4821` | `PROFILE_ID` devuelto al crear o sincronizar el perfil |
| Campo «ID del cliente» | `PROPERTY_ID` de su definición reutilizable |
| Producto o variante `product-100` | `PRODUCT_ID` del producto o variante exactos |
| Carrito `CART-9001` y pedido `ORDER-1001` | IDs distintos para cada objeto, junto a `source` y `reference` |
| Sesión del navegador | `Hellotext.session` real, asociada al cliente autenticado |

Los valores en mayúsculas de los ejemplos son marcadores que debes sustituir. Los nombres, dominios e importes son ficticios; los ejemplos no representan requests ejecutadas.

## 1. Crea un token de autorización para la API

1. En Hellotext, abre **Configuración → Tokens de autorización**.
2. Selecciona **Crear token nuevo**. En **Nombre del token**, usa un nombre reconocible, como «Tienda propia · desarrollo».
3. Al continuar y crear el token, cópialo cuando Hellotext lo muestre. No podrás volver a verlo.
4. Guárdalo en el gestor de secretos o entorno de tu backend como `HELLOTEXT_API_TOKEN`.

La figura muestra únicamente el nombre de un borrador sin guardar. Todavía no se ha creado ni mostrado un token.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Crear un token nuevo con Nombre del token Tienda propia · desarrollo, en un borrador sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-es-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-es.png" srcset="/images/developers/custom-store-integration/token-spacing/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Crear un token nuevo con Nombre del token Tienda propia · desarrollo, en un borrador sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real del formulario de autorización, con un nombre ficticio sin guardar. No se creó ni expuso ningún token privado.</figcaption>
</figure>

Antes de crearlo, verifica que estás en el negocio correcto. Guarda juntos en la configuración del backend su Business ID público y el secreto privado, usando variables diferentes. Para comprobar la autenticación desde el servidor:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/profiles \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Una respuesta exitosa confirma que la request se autenticó; por sí sola no demuestra que sea el negocio esperado. Contrasta el negocio donde creaste el token y un perfil conocido. Una respuesta `401` normalmente indica que el token falta, es inválido o fue revocado. Las operaciones de creación, actualización y tracking también necesitan una suscripción activa compatible.

Consulta [Autenticación en la API de Hellotext](https://www.hellotext.com/api#authentication) para ver el formato del encabezado y las respuestas posibles.

## 2. Crea las definiciones de propiedades necesarias

Hellotext ya incluye nombre y apellido como datos estándar del perfil del cliente, además de propiedades para teléfono, email, dirección, empresa, género y cumpleaños. Usa esos campos incorporados en lugar de volver a crearlos como propiedades personalizadas.

Crea las propiedades adicionales que necesite el perfil del cliente para representar datos propios de tu negocio, como un identificador de fidelidad, tienda preferida, nivel del cliente, talle o tipo de cuenta.

Crea cada propiedad reutilizable una sola vez:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/properties \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "ID del cliente",
    "kind": "text",
    "unique": true
  }'
```

Guarda el `id` devuelto para la propiedad. Usarás ese ID cuando asignes un valor a un perfil del cliente. La definición describe el campo; `customer-4821` será el valor de ese campo en un perfil. `unique: true` restringe valores duplicados, pero no convierte esta propiedad en un mecanismo automático de búsqueda o actualización de clientes. Elige el `kind` correcto antes de importar valores, porque determina cómo Hellotext valida, muestra y segmenta la propiedad.

Consulta [Crear una propiedad en la API](https://www.hellotext.com/api#create_a_property) para ver todos los tipos, parámetros y opciones disponibles. Para conocer más sobre propiedades globales y específicas de un perfil del cliente, consulta [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %}).

## 3. Crea o sincroniza perfiles de clientes

Crea un perfil del cliente con los identificadores y atributos que ya conoces:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/profiles \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "first_name": "Ana",
    "last_name": "Silva",
    "email[primary]": "ana@example.test",
    "property_by_id[PROPERTY_ID]": "customer-4821"
  }'
```

La respuesta incluye el `id` del perfil del cliente en Hellotext. Guárdalo junto al registro del cliente en tu sistema y usa `PATCH /v1/profiles/PROFILE_ID` para actualizarlo. No presupongas que todos los atributos ya se procesaron cuando recibes el ID: confirma sus valores con `GET /v1/profiles/PROFILE_ID` antes de depender de ellos en segmentos o misiones.

Hellotext puede encontrar un perfil del cliente existente por teléfono o email cuando lo creas o actualizas. Aun así, tu integración debería conservar el ID devuelto por Hellotext y actualizar el perfil del cliente existente en lugar de crear uno nuevo en cada sincronización.

No marques perfiles de clientes importados como suscritos salvo que tengas consentimiento válido para el canal correspondiente. La creación del perfil del cliente, la identidad y el permiso para enviar mensajes son conceptos separados. Consulta [Crear un perfil del cliente en la API](https://www.hellotext.com/api#create_a_profile) para ver todos los campos disponibles y [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}) para entender cómo manejar el consentimiento.

## 4. Sincroniza el catálogo de productos

Crea los productos y variantes que Hellotext necesita para recomendaciones, actividad de productos, carritos, pedidos y misiones:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/products \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Championes Everyday",
    "reference": "product-100",
    "sku": "SKU-100",
    "source": "custom_store",
    "url": "https://shop.example.com/products/everyday-sneakers",
    "image_url": "https://shop.example.com/images/everyday-sneakers.jpg",
    "price": {
      "amount": 89.90,
      "currency": "USD"
    },
    "categories": ["Calzado"],
    "tags": ["Uso diario"]
  }'
```

Guarda el `id` devuelto para el producto. Usa ese ID al registrar vistas del producto y al agregarlo a carritos o pedidos. Si la tienda vende una variante, conserva el ID de esa variante; no lo sustituyas por el del producto padre.

Mantén estables los valores de `source`, `reference` y SKU. Actualiza el producto existente cuando cambien su nombre, precio, imagen, URL, categorías, etiquetas, variantes u otros datos compatibles. No crees un producto nuevo en Hellotext durante cada sincronización del catálogo. Usa `PATCH /v1/attribution/products/PRODUCT_ID` para el registro ya mapeado; una referencia estable ayuda a localizarlo, pero no garantiza que cualquier POST se convierta en una actualización.

Consulta [Crear un producto en la API](https://www.hellotext.com/api#create_a_product) para ver todos los datos compatibles del producto y sus variantes.

El endpoint público de productos no expone actualmente la cantidad de stock ni la disponibilidad en tiempo real. No agregues valores de inventario dentro de `metadata` esperando que los usen las misiones que dependen del stock. Lee [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %}) antes de habilitar un flujo que dependa del inventario.

## 5. Importa pedidos históricos

Los pedidos históricos le dan contexto de compra a Hellotext antes de que llegue el primer evento en vivo. Cada pedido importado necesita:

- Una referencia y un origen estables.
- El perfil correcto del cliente.
- Productos y cantidades.
- Monto total y moneda.
- La fecha original del evento.

Primero crea el pedido y conserva el `id` devuelto:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/orders \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "reference": "ORDER-1001",
    "source": "custom_store",
    "delivery": "deliver",
    "items": [
      {
        "product": "PRODUCT_ID",
        "quantity": 1,
        "price": {
          "amount": 89.90,
          "currency": "USD"
        }
      }
    ]
  }'
```

En este ejemplo, una unidad a USD 89,90 produce un total de USD 89,90 calculado desde los artículos. El endpoint de creación calcula ese total a partir de precios y cantidades; no dependas de enviar un `total` independiente en esta request. El `amount` del evento siguiente es el importe monetario asociado al hito, no la cantidad de artículos. Usa una moneda ISO 4217 explícita.

Luego registra el evento del pedido en el perfil del cliente. `tracked_at` es la fecha original del evento expresada como timestamp Unix en **segundos**, no milisegundos:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "order.confirmed",
    "profile": "PROFILE_ID",
    "object": "ORDER_ID",
    "amount": 89.90,
    "currency": "USD",
    "tracked_at": 1751328000
  }'
```

Usa el evento que refleje lo que realmente ocurrió, como `order.placed`, `order.confirmed`, `order.cancelled`, `order.shipped` u `order.delivered`. No inventes estados del ciclo del pedido que tu tienda no pueda verificar.

Crear el objeto pedido no registra por sí solo un hito de compra. Una respuesta de tracking con `status: "received"` confirma recepción, no que el evento ya aparezca en el historial ni que una venta se haya atribuido. Comprueba el procesamiento después de importar. El pedido histórico de este ejemplo y el pedido en vivo del paso 9 son alternativas de implementación; no vuelvas a registrar una ocurrencia ya importada.

Conserva las fechas originales durante la importación histórica. De lo contrario, compras antiguas pueden parecer actividad actual y distorsionar segmentos, elegibilidad de misiones y reportes.

Consulta [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %}), [Crear un pedido](https://www.hellotext.com/api#create_an_order) y [registrar eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver todas las opciones disponibles.

## 6. Instala Hellotext.js en la tienda

Instala el paquete con npm:

```bash
npm install --save-exact @hellotext/hellotext@2.6.0
```

Impórtalo e inicialízalo una sola vez cuando arranca la tienda:

```javascript
import Hellotext from '@hellotext/hellotext'

await Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
```

El `HELLOTEXT_BUSINESS_ID` es el identificador público que aparece como **ID del negocio** en **Configuración**. Usa el de tu negocio; el de la figura pertenece únicamente a la demostración local. No es el token privado de autorización de la API.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Configuración del negocio ficticio Enterprise con ID del negocio 4ONLdN32 y Editar negocio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Configuración del negocio ficticio Enterprise con ID del negocio 4ONLdN32 y Editar negocio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real de una base local aislada. El ID público pertenece solo al negocio ficticio; no es un token privado ni un ejemplo de precio Enterprise.</figcaption>
</figure>

Los ejemplos fijan la versión 2.6.0. `--save-exact` conserva esa versión exacta en `package.json`; guarda también `package-lock.json` y usa `npm ci` en el despliegue para instalar las dependencias bloqueadas. `initialize()` devuelve una Promise: espera su resolución antes de continuar el flujo de configuración. Los fragmentos con `await` se ejecutan en un módulo JavaScript o dentro de una función `async`; en una tienda con navegación interna, inicializa una vez y registra la actividad de cada nueva vista.

Para un sitio sin bundler de JavaScript, usa el script compilado:

```html
<script src="https://unpkg.com/@hellotext/hellotext@2.6.0/dist/hellotext.js"></script>
<script>
  Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
    .then(() => Hellotext.track('page.viewed'))
    .then(response => {
      if (response.failed) console.error(response.data)
    })
    .catch(error => console.error(error))
</script>
```

Usa el [repositorio de Hellotext.js](https://github.com/hellotext/hellotext.js) para consultar instrucciones vigentes del paquete, frameworks, Formularios y Webchat.

## 7. Registra actividad del navegador

Hellotext.js crea o restaura la sesión del visitante y agrega automáticamente la información de la página a las requests de tracking. En la versión de este ejemplo, inicializar la biblioteca no registra por sí solo `page.viewed`: llama al evento una vez por carga o navegación de página, después de inicializar.

```javascript
const pageResponse = await Hellotext.track('page.viewed')

if (pageResponse.failed) {
  console.error(pageResponse.data)
}
```

Si usaste el script sin bundler del paso anterior, ese fragmento ya registra la primera vista; no la envíes de nuevo. En una SPA, registra las siguientes vistas cuando finalice cada navegación. La URL actual se incluye sin que tengas que pasarla manualmente.

La vista de página no identifica por sí sola qué producto está viendo el cliente. En cada página de producto, incluye explícitamente el producto correspondiente. Si ya sincronizaste el catálogo, usa el ID que devolvió Hellotext:

Registra la vista de un producto conocido:

```javascript
await Hellotext.track('product.viewed', {
  object: 'PRODUCT_ID',
})
```

Si todavía no tienes el ID de Hellotext disponible en la tienda, puedes enviar los datos necesarios para crear o encontrar el producto. Mantén estables `reference` y `source` para no generar duplicados:

```javascript
await Hellotext.track('product.viewed', {
  object_parameters: {
    name: 'Championes Everyday',
    reference: 'product-100',
    source: 'custom_store',
    url: window.location.href,
    image_url: 'https://shop.example.com/images/everyday-sneakers.jpg',
    price: {
      amount: 89.90,
      currency: 'USD',
    },
  },
})
```

Registra un producto agregado al carrito usando una referencia estable para el carrito:

```javascript
const response = await Hellotext.track('cart.added', {
  object_parameters: {
    reference: 'CART-9001',
    source: 'custom_store',
    items: [
      {
        product: 'PRODUCT_ID',
        quantity: 1,
      },
    ],
  },
})

if (response.failed) {
  console.error(response.data)
}
```

Reutiliza la misma referencia y origen para el mismo carrito. En `cart.added`, `quantity` expresa la cantidad resultante de ese producto en el carrito; no es un incremento. Si pasa de una a dos unidades, envía `quantity: 2`.

La respuesta `received` no devuelve el ID del carrito. Consulta `GET /v1/attribution/carts`, recorre las páginas del listado hasta localizar tu referencia/origen y conserva su `id`. `cart.abandoned` necesita ese carrito existente en `object`; no basta con reenviar `object_parameters`. Regístralo únicamente cuando tu tienda haya determinado el abandono. Para retiradas, usa `cart.removed` con los productos que realmente se quitaron y revisa el estado resultante.

Hellotext.js también puede registrar un pedido cuando la página de confirmación sea el único punto de integración disponible. Debes incluir explícitamente el pedido y sus productos:

```javascript
await Hellotext.track('order.placed', {
  amount: 89.90,
  currency: 'USD',
  object_parameters: {
    reference: 'ORDER-1001',
    source: 'custom_store',
    delivery: 'deliver',
    items: [
      {
        product: 'PRODUCT_ID',
        quantity: 1,
      },
    ],
  },
})
```

Los eventos del navegador son apropiados para navegación y actividad del carrito. Siempre que sea posible, registra desde el backend los hitos confiables de compra y entrega para que un cliente no pueda simular pedidos llamando código del navegador. No envíes el mismo evento de pedido desde el navegador y el backend.

La versión 2.6.0 requiere la llamada explícita a `page.viewed` mostrada arriba, aunque [Seguimiento de eventos]({% link _developers/tracking-events.md %}) conserva una descripción de registro automático. Usa los pasos 6 y 7 de esta guía para implementar las vistas de páginas. Consulta los [eventos de productos](https://www.hellotext.com/api#track_product_events), [eventos de carritos](https://www.hellotext.com/api#track_cart_events) y [eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver las acciones y parámetros compatibles.

## 8. Conecta la actividad anónima con el cliente

Hellotext.js comienza con una sesión anónima del visitante. Cuando inicia sesión, se registra o completa el checkout, conecta esa sesión con el perfil del cliente en Hellotext.

El método recomendado es server-to-server:

1. Lee `Hellotext.session` después de inicializar. Espera a que una request de tracking haya registrado esa sesión en Hellotext.
2. Envía el ID real de esa sesión a tu backend. El backend debe resolver el perfil desde el cliente autenticado, sin confiar en un `PROFILE_ID` elegido por el navegador.
3. Adjunta la sesión al ID almacenado del perfil del cliente en Hellotext usando el token privado de la API.

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID"
  }'
```

La asignación de la sesión permite incorporar su actividad anónima al perfil; la promoción de eventos y actualización de carritos se procesan después. Comprueba el historial del perfil tras completar ese procesamiento. Si la sesión todavía no existe, no inventes otro ID para superar el error: registra primero la sesión real y vuelve a verificarla.

Para una tienda propia, no uses `identify()` con un valor de `source` inventado. Ese método se reserva para fuentes compatibles con Hellotext.js cuando no existe una alternativa server-to-server. Si una integración compatible usa `identify()`, debe llamar a `Hellotext.forget()` cuando el cliente cierre sesión. Ese método limpia la identidad del navegador, pero conserva `hello_session`; no desasocia una sesión adjunta en el servidor. Incluye el cambio de cuenta y el uso de un dispositivo compartido en tus pruebas, para no transferir actividad de otra persona al perfil actual.

Consulta [Adjuntar una sesión en la API](https://www.hellotext.com/api#attach_session) para ver todos los parámetros y [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}) para conocer el proceso completo, la alternativa con `identify()` y el cierre de sesión.

## 9. Registra eventos confiables desde el backend

Usa `POST /v1/attribution/events` para actividad que ocurre fuera del navegador o que debe ser confiable, incluyendo:

- Creación y confirmación de pedidos.
- Eventos de pago o compra.
- Cancelación, envío y entrega.
- Actividad de tiendas físicas o marketplaces.
- Eventos creados por jobs, webhooks o sistemas internos.

Envía el ID del perfil del cliente en Hellotext cuando conozcas al cliente o el ID de la sesión cuando solo tengas esa sesión. Incluye `tracked_at` en segundos cuando el evento haya ocurrido antes de enviar la request. Cuando la compra proviene de una visita o campaña, conserva también la sesión real que originó la operación y pásala como `session` si corresponde al mismo cliente. Un `PROFILE_ID` identifica al cliente, pero no prueba por sí solo la procedencia de una campaña.

Por ejemplo, registra `order.placed` cuando tu backend confirme que el pedido fue creado:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "order.placed",
    "profile": "PROFILE_ID",
    "object": "ORDER_ID",
    "amount": 89.90,
    "currency": "USD"
  }'
```

Reutiliza el mismo `ORDER_ID` para `order.confirmed`, `order.shipped`, `order.delivered` o `order.cancelled` a medida que el pedido cambia de estado. Envía únicamente los eventos que tu backend pueda verificar. Mantén un registro de los hitos enviados por pedido y decide una única fuente para cada ocurrencia. Ante un timeout o una respuesta incierta, comprueba el historial antes de reintentar: repetir la misma referencia no garantiza que un evento sea idempotente.

Consulta [Seguimiento en la API](https://www.hellotext.com/api#tracking), [eventos de pedidos](https://www.hellotext.com/api#track_order_events) y [Seguimiento de origen externo]({% link _developers/external-tracking.md %}) para ver todos los parámetros y más ejemplos desde el servidor.

## 10. Verifica la integración completa

Antes de habilitar misiones o campañas, prueba un cliente reconocible de principio a fin:

1. Crea o actualiza el perfil del cliente y confirma su teléfono, email y propiedades personalizadas.
2. Confirma que los IDs de productos y variantes correspondan con el catálogo de la tienda.
3. Abre la tienda y verifica que Hellotext.js cree una sesión.
4. Registra una vista de producto y una actualización del carrito.
5. Identifica al cliente o adjunta la sesión desde el backend.
6. Crea un pedido de prueba y registra su evento real desde el servidor.
7. Confirma los valores procesados del perfil y que los eventos aparezcan en el historial correcto, con objeto, importe, moneda y fecha esperados. `received` no basta como verificación.
8. Revisa la actividad de misiones y reportes únicamente cuando los perfiles de clientes, productos, carritos y pedidos sean correctos.

Haz esta prueba con datos ficticios aislados, contactos no enviables y misiones deshabilitadas. No necesita campañas, mensajes ni entregas de prueba. Verifica también reintentos y cambio de cuenta antes de activar flujos reales.

Si faltan datos, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Checklist antes de publicar

- El token privado existe únicamente en los secretos del backend.
- Hellotext.js usa el Business ID público.
- Los mapeos de clientes, productos, carritos y pedidos usan IDs estables.
- Las actualizaciones de productos no crean registros duplicados en el catálogo.
- Los pedidos históricos conservan sus fechas y monedas originales.
- El seguimiento del navegador cubre navegación y actividad del carrito.
- El seguimiento desde el servidor cubre pedidos y eventos confiables de entrega.
- Las sesiones anónimas se adjuntan cuando se conoce al cliente.
- Las vistas de páginas se registran una vez por navegación, sin duplicar el primer evento.
- El cierre de sesión limpia la identidad; `forget()` no se trata como una desasociación de la sesión en el servidor.
- Los eventos recibidos se verifican después de su procesamiento y los reintentos no duplican hitos.
- El estado de suscripción se establece únicamente a partir de evidencia válida de consentimiento.

## Guías relacionadas

- [Resumen de desarrolladores y API]({% link _developers/developers-overview.md %})
- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Crea y registra cupones con la API]({% link _developers/coupons-with-api.md %})
- [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
