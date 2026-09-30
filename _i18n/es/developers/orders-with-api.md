Un pedido en Hellotext tiene dos partes complementarias:

- El **objeto del pedido** guarda la representación comercial: referencia, origen, productos, cantidades, precios, modalidad de entrega y otros datos del pedido.
- Un **evento del pedido** conecta ese pedido con un perfil del cliente en un momento real de su ciclo, como creación, confirmación, envío, entrega o cancelación.

Crear solamente el objeto del pedido no registra una compra para un cliente. Crea o encuentra el pedido, conserva su ID de Hellotext y luego envía el evento del ciclo con ese pedido y el perfil correcto del cliente.

Usa la [referencia de la API](https://www.hellotext.com/api#orders) para consultar el contrato completo. Esta guía explica el flujo de integración recomendado.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API guardado únicamente en tu backend.
- El ID en Hellotext del perfil del cliente asociado con el pedido.
- Identificadores estables de productos o variantes ya sincronizados con Hellotext.
- Una `reference` estable para el pedido en tu sistema.
- Un mismo `source`, como `custom_store`, para todos los pedidos de la integración.
- Las fechas originales de los eventos, los montos y los códigos de moneda ISO 4217.

El token, el perfil, los productos y el pedido deben pertenecer al mismo negocio, con una suscripción activa para crear o actualizar objetos y registrar eventos. `PROFILE_ID`, `PRODUCT_ID` y `ORDER_ID` son marcadores: reemplázalos por los IDs reales obtenidos en ese negocio. Un ID público de negocio no sustituye al token privado.

Si todavía no sincronizaste los productos, comienza con [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %}).

Para preparar la autorización, abre **Ajustes → Autorizaciones → Crear un token nuevo**. Verifica el negocio antes de crearlo y guarda el secreto sólo en tu backend. La figura muestra el nombre de un borrador, sin crear ni revelar el token.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre ficticio de token de autorización para una tienda propia, sin guardar ni mostrar un secreto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-es-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-es.png" srcset="/images/developers/custom-store-integration/token-spacing/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Nombre ficticio de token de autorización para una tienda propia, sin guardar ni mostrar un secreto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Prepara la autorización desde el negocio correcto; este borrador no crea ni expone un token. El secreto pertenece sólo al backend.</figcaption>
</figure>

## 1. Crea el objeto del pedido

Crea el pedido después de que tu backend lo haya aceptado. Incluye la representación final de los artículos conocida en ese momento:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/orders \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Pedido #1001",
    "reference": "ORDER-1001",
    "source": "custom_store",
    "delivery": "deliver",
    "payment_method": "Visa",
    "sales_channel": "Website",
    "items": [
      {
        "product": "PRODUCT_ID",
        "quantity": 2,
        "price": {
          "amount": 44.95,
          "currency": "USD"
        }
      }
    ],
    "metadata": {
      "warehouse": "main"
    }
  }'
```

Para `custom_store`, incluye `delivery`: `deliver` para entrega o `collect` para recogida. Usa cantidades enteras positivas y precios unitarios con moneda explícita; en el ejemplo, 2 × USD 44.95 = USD 89.90. Agrupa un mismo producto en una sola línea con su cantidad: repetirlo en varias líneas no garantiza artículos separados.

Cada artículo requiere el identificador de un producto o variante. La API acepta su ID de Hellotext, referencia o SKU. Cuando omites el precio del artículo, Hellotext usa el precio actual del producto; incluye el precio cuando el pedido deba conservar el monto cobrado en el checkout.

Este `POST /orders` calcula el total a partir de los artículos; no incluye un parámetro `total` en su contrato. La creación correcta devuelve el objeto del pedido y su `id`; una validación fallida devuelve HTTP 422 con errores. Guarda ese ID público como `hellotext_order_id` y consulta `GET /v1/attribution/orders/:id` para comprobar la referencia, el origen, los artículos y `total`. La respuesta del objeto no es la respuesta `received` de un evento.

Conserva importes y monedas de la transacción real. No sumes cifras de monedas distintas como si fueran una sola; verifica también el importe convertido cuando corresponda. `reference` es el identificador de tu sistema, `source` su origen y `id` el identificador del pedido en Hellotext. Los IDs de producto y de artículo identifican otros recursos.

Las figuras siguientes muestran los datos de un pedido ficticio sin eventos registrados. En el editor, «ID de la orden» contiene la referencia `ORDER-1001`; no es el `id` público que debes conservar de la respuesta de la API.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de un pedido ficticio ORDER-1001 con origen custom_store, total USD 89.90 y entrega Entregar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Editor real de un pedido ficticio ORDER-1001 con origen custom_store, total USD 89.90 y entrega Entregar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Vista real de un pedido ficticio sin eventos. «ID de la orden» muestra aquí la referencia ORDER-1001; conserva por separado el id público devuelto por la API.</figcaption>
</figure>

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Artículo de un pedido ficticio: Agenda semanal, cantidad 2 y precio unitario USD 44.95.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/items-es-mobile.png 2x" width="714" height="572" />
        <img src="/images/developers/orders-with-api/items-es.png" srcset="/images/developers/orders-with-api/items-es.png 2x" style="width: auto; margin: 0 auto;" width="942" height="572" loading="lazy" decoding="async" alt="Artículo de un pedido ficticio: Agenda semanal, cantidad 2 y precio unitario USD 44.95." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La línea conserva producto, cantidad y precio unitario: 2 × USD 44.95 = USD 89.90. Esta vista de datos no demuestra que se haya registrado una compra o un evento.</figcaption>
</figure>

Consulta [Crear un pedido](https://www.hellotext.com/api#create_an_order) para ver todos los campos compatibles.

## 2. Registra el primer evento real del ciclo

Después de crear el pedido, conéctalo con el perfil del cliente usando el primer estado que tu backend pueda confirmar:

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
    "currency": "USD",
    "tracked_at": 1786104000
  }'
```

Envía `object` con el ID del pedido conservado, y `profile` con el ID del cliente correcto. No uses el nombre del pedido ni el ID de un producto en su lugar. También existe el contexto `session`: debe pertenecer al mismo negocio; si envías perfil y sesión juntos, la sesión debe estar previamente asociada a ese perfil. Una sesión anónima no sustituye una asociación comprobada con un cliente ni concede consentimiento de mensajería.

Usa `tracked_at` cuando el evento haya ocurrido antes de enviar la request. Admite segundos Unix o una fecha ISO 8601 con zona horaria; no milisegundos. Debe representar la fecha del evento en el sistema de origen, no la fecha del reintento. En el ejemplo, `amount` es un importe decimal en USD, no centavos.

Una request válida responde con:

```json
{
  "status": "received"
}
```

Esto significa que el evento fue recibido, no que ya se procesó, apareció en un reporte o disparó una misión. La respuesta no devuelve un nuevo ID del pedido ni un ID del evento. Comprueba después la actividad del perfil y los datos del pedido; si hay HTTP 422, corrige los errores de validación antes de reintentar.

## 3. Envía cada estado posterior cuando ocurra

Reutiliza el mismo ID del pedido y perfil del cliente para cada transición confirmada:

- `order.confirmed` cuando el negocio confirma el pedido.
- `order.shipped` cuando el pedido sale para su entrega.
- `order.delivered` cuando se confirma la entrega.
- `order.cancelled` cuando el pedido se cancela.

Por ejemplo:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "order.shipped",
    "profile": "PROFILE_ID",
    "object": "ORDER_ID",
    "tracked_at": 1786190400
  }'
```

Si omites el importe en un evento posterior, el procesamiento puede heredar el monto del pedido. Comprueba el valor registrado; no sumes los importes de todos los estados como si fueran compras diferentes.

No envíes todos los estados al crear el pedido. No deduzcas el envío o la entrega solamente por el tiempo transcurrido. Cada evento debe provenir de una transición que tu sistema pueda verificar.

Consulta [Registrar eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver las acciones y parámetros compatibles actualmente.

## 4. Corrige los datos del pedido por separado de su ciclo

Actualizar el objeto de un pedido modifica sus atributos almacenados; no crea un evento del ciclo.

Usa `PATCH /v1/attribution/orders/:id` para corregir campos como modalidad de entrega, método de pago, canal de venta, metadata o propiedades personalizadas. Usa los endpoints de artículos del pedido cuando necesites corregir productos, cantidades o precios cobrados.

Conserva los IDs de artículo devueltos en `items` para usar los endpoints de artículos; no los confundas con el ID de producto. Después de cada corrección, vuelve a consultar el pedido y sus artículos y compara cantidades, precios unitarios, monedas y total con tu sistema. No presupongas que un `PATCH` del pedido modifica sus artículos ni que cualquier cambio de línea deja el total final que esperas.

Envía un evento nuevo únicamente cuando haya ocurrido un cambio real del ciclo. Por ejemplo, corregir el método de pago no justifica volver a enviar `order.confirmed`.

Consulta [Actualizar un pedido](https://www.hellotext.com/api#update_an_order) y la [referencia de artículos de pedidos](https://www.hellotext.com/api#order_items).

## 5. Importa pedidos históricos sin hacerlos parecer recientes

Los pedidos históricos ayudan a Hellotext a entender actividad previa de clientes y productos. Para cada pedido importado:

1. Crea el pedido con su referencia, origen, productos, cantidades y precios cobrados originales.
2. Registra únicamente el estado del ciclo que tus datos históricos puedan verificar.
3. Establece `tracked_at` con la fecha original del evento.
4. Conserva el monto y la moneda originales.

No uses la fecha de importación como `tracked_at`. De lo contrario, compras antiguas pueden parecer comportamiento actual y afectar segmentos, decisiones de misiones y reportes.

## 6. Evita pedidos y eventos duplicados

La API no expone un parámetro general de idempotencia. Tu integración debe conservar un registro propio de solicitudes y respuestas.

- Mantén `source` y `reference` estables durante toda la vida del pedido.
- Guarda el ID de Hellotext devuelto por la primera creación exitosa.
- Asigna un ID interno estable a cada transición del ciclo en el sistema de origen.
- Marca la solicitud como recibida por Hellotext únicamente después de `status: received`; registra por separado la verificación posterior del evento. Esto no significa que un mensaje o pedido se haya entregado.
- No envíes el mismo evento de pedido desde Hellotext.js y desde tu backend.
- Si vence el tiempo de una request de creación, reconcilia el pedido antes de enviar otro `POST`; la request original podría haberse completado.

En el procesamiento con un perfil identificado, Hellotext evita otro evento preestablecido para la misma combinación de pedido y acción mientras conserve el evento anterior. Por ejemplo, repetir `order.shipped` sobre ese mismo pedido no crea otro evento conservado de envío. No uses esta regla para corregir el importe, la fecha o el perfil del primer evento, ni la extrapoles a sesiones anónimas o eventos eliminados.

Si una respuesta se pierde o vence el tiempo, el resultado es incierto. Recupera el pedido por su ID guardado o reconcilia el listado paginado de pedidos con `source` y `reference` en tu sistema antes de crear otro; no asumas un filtro no documentado en el listado. Preferir el ID público evita ambigüedades entre referencias de distintos orígenes.

Esta regla no es idempotencia general de la API. Otros tipos de eventos todavía pueden duplicarse y una acción diferente del ciclo para el mismo pedido sigue siendo otro evento. Tu integración debe evitar envíos duplicados y conservar un registro confiable del origen.

## 7. Verifica un pedido de principio a fin

Antes de importar todo el historial, verifica un caso autorizado en un negocio de prueba aislado, con datos ficticios, contactos no enviables y misiones que no envíen mensajes.

Antes de importar todo el historial de pedidos:

1. Crea un perfil de cliente de prueba fácil de reconocer.
2. Crea o recupera sus productos y variantes.
3. Crea un pedido y guarda el ID devuelto.
4. Envía un evento real del pedido.
5. Confirma que el evento aparezca en el perfil correcto del cliente.
6. Consulta el pedido por API y abre **Ajustes → Objetos → Órdenes → Editar** para contrastar referencia, origen, productos, cantidades y monto. Comprueba la moneda y fecha original del evento en la actividad del perfil.
7. Envía un estado posterior y verifica que se reutilice el mismo pedido.

Si la request falla o el evento no aparece, usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
