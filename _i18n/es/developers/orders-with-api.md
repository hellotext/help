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

Si todavía no sincronizaste los productos, comienza con [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %}).

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

Cada artículo requiere el identificador de un producto o variante. La API acepta su ID de Hellotext, referencia o SKU. Cuando omites el precio del artículo, Hellotext usa el precio actual del producto; incluye el precio cuando el pedido deba conservar el monto cobrado en el checkout.

Hellotext calcula el total del pedido a partir de sus artículos cuando un flujo de tracking compatible no envía el total. Guarda el `id` devuelto para el pedido en tu sistema como `hellotext_order_id`.

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

Usa `tracked_at` cuando el evento haya ocurrido antes de enviar la request. Debe representar la fecha del evento en el sistema de origen, no la fecha del reintento.

Una request válida responde con:

```json
{
  "status": "received"
}
```

Esto significa que el evento fue aceptado para su procesamiento. Puede demorar un poco en aparecer en el perfil del cliente y en los reportes.

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

No envíes todos los estados al crear el pedido. No deduzcas el envío o la entrega solamente por el tiempo transcurrido. Cada evento debe provenir de una transición que tu sistema pueda verificar.

Consulta [Registrar eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver las acciones y parámetros compatibles actualmente.

## 4. Corrige los datos del pedido por separado de su ciclo

Actualizar el objeto de un pedido modifica sus atributos almacenados; no crea un evento del ciclo.

Usa `PATCH /v1/attribution/orders/:id` para corregir campos como modalidad de entrega, método de pago, canal de venta, metadata o propiedades personalizadas. Usa los endpoints de artículos del pedido cuando necesites corregir productos, cantidades o precios cobrados.

Envía un evento nuevo únicamente cuando haya ocurrido un cambio real del ciclo. Por ejemplo, corregir el método de pago no justifica volver a enviar `order.confirmed`.

Consulta [Actualizar un pedido](https://www.hellotext.com/api#update_an_order) y la [referencia de artículos de pedidos](https://www.hellotext.com/api#order_items).

## 5. Importa pedidos históricos sin hacerlos parecer recientes

Los pedidos históricos ayudan a Hellotext a entender actividad previa de clientes y productos. Para cada pedido importado:

1. Crea el pedido con su referencia, origen, productos, cantidades y precios cobrados originales.
2. Registra únicamente el estado del ciclo que tus datos históricos puedan verificar.
3. Establece `tracked_at` con la fecha original del evento.
4. Conserva el monto y la moneda originales.

No uses la fecha de importación como `tracked_at`. De lo contrario, compras antiguas pueden parecer comportamiento actual y afectar segmentos, decisiones de playbooks y reportes.

## 6. Evita pedidos y eventos duplicados

La API no expone un parámetro general de idempotencia. Tu integración debe conservar su propio estado de entrega.

- Mantén `source` y `reference` estables durante toda la vida del pedido.
- Guarda el ID de Hellotext devuelto por la primera creación exitosa.
- Asigna un ID interno estable a cada transición del ciclo en el sistema de origen.
- Marca ese evento de origen como entregado únicamente después de que Hellotext responda con `status: received`.
- No envíes el mismo evento de pedido desde Hellotext.js y desde tu backend.
- Si vence el tiempo de una request de creación, reconcilia el pedido antes de enviar otro `POST`; la request original podría haberse completado.

Hellotext evita guardar repetidamente la misma acción del ciclo para un pedido, pero tu integración igualmente debe evitar envíos duplicados y conservar un registro confiable del origen.

## 7. Verifica un pedido de principio a fin

Antes de importar todo el historial de pedidos:

1. Crea un perfil de cliente de prueba fácil de reconocer.
2. Crea o recupera sus productos y variantes.
3. Crea un pedido y guarda el ID devuelto.
4. Envía un evento real del pedido.
5. Confirma que el evento aparezca en el perfil correcto del cliente.
6. Confirma productos, cantidades, monto, moneda y fecha original.
7. Envía un estado posterior y verifica que se reutilice el mismo pedido.

Si la request falla o el evento no aparece, usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
