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

Elige un nombre de origen consistente, como `custom_store`, y reutilízalo para productos, carritos, pedidos e identidad en el navegador. No cambies este valor entre requests.

## 1. Crea un token de autorización para la API

1. En Hellotext, abre **Configuración → Tokens de autorización**.
2. Selecciona **Crear nuevo token** y asígnale un nombre que identifique la integración.
3. Copia el token cuando Hellotext lo muestre. No podrás volver a verlo.
4. Guárdalo en el gestor de secretos o entorno de tu backend como `HELLOTEXT_API_TOKEN`.

Prueba el token desde tu servidor:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/profiles \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Una respuesta exitosa confirma que el token pertenece al negocio esperado. Una respuesta `401` normalmente indica que el token falta, es inválido o fue revocado.

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

Guarda el `id` devuelto para la propiedad. Usarás ese ID cuando asignes un valor a un perfil del cliente. Elige el `kind` correcto antes de importar valores, porque determina cómo Hellotext valida, muestra y segmenta la propiedad.

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
    "email[primary]": "ana@example.com",
    "phone[mobile]": "+59899000001",
    "property_by_id[PROPERTY_ID]": "customer-4821"
  }'
```

La respuesta incluye el `id` del perfil del cliente en Hellotext. Guárdalo junto al registro del cliente en tu sistema y úsalo para actualizaciones y eventos posteriores desde el servidor.

Hellotext puede encontrar un perfil del cliente existente por teléfono o email cuando lo creas o actualizas. Aun así, tu integración debería conservar el ID devuelto por Hellotext y actualizar el perfil del cliente existente en lugar de crear uno nuevo en cada sincronización.

No marques perfiles de clientes importados como suscritos salvo que tengas consentimiento válido para el canal correspondiente. La creación del perfil del cliente, la identidad y el permiso para enviar mensajes son conceptos separados. Consulta [Crear un perfil del cliente en la API](https://www.hellotext.com/api#create_a_profile) para ver todos los campos disponibles y [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}) para entender cómo manejar el consentimiento.

## 4. Sincroniza el catálogo de productos

Crea los productos y variantes que Hellotext necesita para recomendaciones, actividad de productos, carritos, pedidos y playbooks:

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

Guarda el `id` devuelto para el producto. Usa ese ID al registrar vistas del producto y al agregarlo a carritos o pedidos.

Mantén estables los valores de `source`, `reference` y SKU. Actualiza el producto existente cuando cambien su nombre, precio, imagen, URL, categorías, etiquetas, variantes u otros datos compatibles. No crees un producto nuevo en Hellotext durante cada sincronización del catálogo.

Consulta [Crear un producto en la API](https://www.hellotext.com/api#create_a_product) para ver todos los datos compatibles del producto y sus variantes.

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
    "total": {
      "amount": 89.90,
      "currency": "USD"
    },
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

Luego registra el evento del pedido en el perfil del cliente. `tracked_at` es la fecha original del evento expresada como timestamp Unix:

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

Conserva las fechas originales durante la importación histórica. De lo contrario, compras antiguas pueden parecer actividad actual y distorsionar segmentos, elegibilidad de playbooks y reportes.

Consulta [Crear un pedido](https://www.hellotext.com/api#create_an_order) y [registrar eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver todas las opciones disponibles.

## 6. Instala Hellotext.js en la tienda

Instala el paquete con npm:

```bash
npm install @hellotext/hellotext
```

Impórtalo e inicialízalo una sola vez cuando arranca la tienda:

```javascript
import Hellotext from '@hellotext/hellotext'

Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
```

El `HELLOTEXT_BUSINESS_ID` es el identificador público que aparece en la configuración del negocio de Hellotext. No es el token privado de autorización de la API.

Para un sitio sin bundler de JavaScript, usa el script compilado:

```html
<script src="https://unpkg.com/@hellotext/hellotext"></script>
<script>
  Hellotext.initialize('HELLOTEXT_BUSINESS_ID')
</script>
```

Usa el [repositorio de Hellotext.js](https://github.com/hellotext/hellotext.js) para consultar instrucciones vigentes del paquete, frameworks, Formularios y Webchat.

## 7. Registra actividad del navegador

Hellotext.js crea la sesión del visitante y registra automáticamente `page.viewed` con la URL actual. No necesitas enviar ese evento manualmente.

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

Reutiliza la misma referencia del carrito para actividad posterior de `cart.added` y `cart.removed`. Registra `cart.abandoned` únicamente cuando tu tienda haya determinado que el carrito fue abandonado.

Hellotext.js también puede registrar un pedido cuando la página de confirmación sea el único punto de integración disponible. Debes incluir explícitamente el pedido y sus productos:

```javascript
await Hellotext.track('order.placed', {
  amount: 89.90,
  currency: 'USD',
  object_parameters: {
    reference: 'ORDER-1001',
    source: 'custom_store',
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

Consulta [Seguimiento de eventos]({% link _developers/tracking-events.md %}) para la vista automática de páginas y [eventos de productos](https://www.hellotext.com/api#track_product_events), [eventos de carritos](https://www.hellotext.com/api#track_cart_events) y [eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver las acciones y parámetros compatibles.

## 8. Conecta la actividad anónima con el cliente

Hellotext.js comienza con una sesión anónima del visitante. Cuando inicia sesión, se registra o completa el checkout, conecta esa sesión con el perfil del cliente en Hellotext.

El método recomendado es server-to-server:

1. Lee `Hellotext.session` en el navegador.
2. Envía el ID de la sesión a tu backend junto con el cliente autenticado.
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

Esto incorpora la actividad anónima anterior al perfil del cliente conocido.

Para una tienda propia, no uses `identify()` con un valor de `source` inventado. Ese método se reserva para fuentes compatibles con Hellotext.js cuando no existe una alternativa server-to-server. Si una integración compatible usa `identify()`, debe llamar a `Hellotext.forget()` cuando el cliente cierre sesión.

Consulta [Adjuntar una sesión en la API](https://www.hellotext.com/api#attach_session) para ver todos los parámetros y [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}) para conocer el proceso completo, la alternativa con `identify()` y el cierre de sesión.

## 9. Registra eventos confiables desde el backend

Usa `POST /v1/attribution/events` para actividad que ocurre fuera del navegador o que debe ser confiable, incluyendo:

- Creación y confirmación de pedidos.
- Eventos de pago o compra.
- Cancelación, envío y entrega.
- Actividad de tiendas físicas o marketplaces.
- Eventos creados por jobs, webhooks o sistemas internos.

Envía el ID del perfil del cliente en Hellotext cuando conozcas al cliente o el ID de la sesión cuando solo tengas esa sesión. Incluye `tracked_at` cuando el evento haya ocurrido antes de enviar la request.

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

Reutiliza el mismo `ORDER_ID` para `order.confirmed`, `order.shipped`, `order.delivered` o `order.cancelled` a medida que el pedido cambia de estado. Envía únicamente los eventos que tu backend pueda verificar.

Consulta [Seguimiento en la API](https://www.hellotext.com/api#tracking), [eventos de pedidos](https://www.hellotext.com/api#track_order_events) y [Seguimiento de origen externo]({% link _developers/external-tracking.md %}) para ver todos los parámetros y más ejemplos desde el servidor.

## 10. Verifica la integración completa

Antes de habilitar playbooks o campañas, prueba un cliente reconocible de principio a fin:

1. Crea o actualiza el perfil del cliente y confirma su teléfono, email y propiedades personalizadas.
2. Confirma que los IDs de productos y variantes correspondan con el catálogo de la tienda.
3. Abre la tienda y verifica que Hellotext.js cree una sesión.
4. Registra una vista de producto y una actualización del carrito.
5. Identifica al cliente o adjunta la sesión desde el backend.
6. Crea un pedido de prueba y registra su evento real desde el servidor.
7. Confirma que los eventos aparezcan en el perfil del cliente correcto y usen las fechas esperadas.
8. Revisa la actividad de playbooks y reportes únicamente cuando los perfiles de clientes, productos, carritos y pedidos sean correctos.

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
- El cierre de sesión llama a `Hellotext.forget()` cuando se usa identificación en el navegador.
- El estado de suscripción se establece únicamente a partir de evidencia válida de consentimiento.

## Guías relacionadas

- [Resumen de desarrolladores y API]({% link _developers/developers-overview.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
