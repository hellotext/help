Usa esta guía para registrar en Hellotext eventos confiables que ocurren fuera del navegador, por ejemplo en tu backend, POS, CRM, ERP, marketplace, operador logístico, jobs o webhooks.

El tracking externo complementa Hellotext.js. Usa Hellotext.js para la navegación y la actividad del carrito que ocurre en la tienda. Usa la API desde el backend para pedidos, pagos, cancelaciones, envíos, entregas y otras acciones que el servidor pueda verificar.

Si estás conectando una tienda propia desde cero, comienza con [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}) para implementar perfiles de clientes, catálogo, pedidos, Hellotext.js e identidad en el orden recomendado.

## Antes de comenzar

Prepara:

- Un token privado de autorización de la API guardado únicamente en el backend.
- El nombre de la acción que quieres registrar, como `product.viewed`, `order.placed` o una acción personalizada existente.
- El ID del perfil del cliente en Hellotext o el ID de una sesión de Hellotext.
- El ID del objeto relacionado, como un producto o pedido, o los datos necesarios para crearlo.
- Identificadores estables del sistema de origen para evitar objetos duplicados.

Todos los ejemplos envían un `POST` a:

```text
https://api.hellotext.com/v1/attribution/events
```

El token se envía mediante el encabezado `Authorization`. Consulta [Autenticación en la API](https://www.hellotext.com/api#authentication) para crear y usar el token correctamente.

## 1. Elige el perfil del cliente o la sesión

Cada evento necesita un `profile` o una `session`. No uses `profile_id` ni `session_id` en el cuerpo de esta request.

### Cuando conoces al cliente

Usa `profile` con el ID del perfil del cliente en Hellotext. Por ejemplo, registra la vista de un producto que ya existe en el catálogo:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "product.viewed",
    "profile": "PROFILE_ID",
    "object": "PRODUCT_ID"
  }'
```

Conserva el ID que devuelve Hellotext cuando creas el perfil del cliente. Si todavía no existe, consulta [Crear un perfil del cliente](https://www.hellotext.com/api#create_a_profile).

### Cuando solo conoces la sesión

Hellotext.js expone la sesión actual después de inicializarse:

```javascript
const sessionId = Hellotext.session
```

Envía ese ID a tu backend y usa `session` al registrar el evento:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "product.viewed",
    "session": "HELLOTEXT_SESSION_ID",
    "object": "PRODUCT_ID"
  }'
```

Puedes enviar `profile` y `session` juntos cuando quieras asociar el contexto de esa sesión al cliente. La sesión debe estar sin asignar o pertenecer al mismo perfil del cliente. Si ya pertenece a otro perfil, Hellotext rechazará el evento.

Consulta [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}) para ver cómo conservar y adjuntar sesiones.

## 2. Asocia el objeto correcto

La mayoría de las acciones incorporadas necesitan un objeto relacionado:

- `object` identifica un objeto que ya existe en Hellotext.
- `object_parameters` contiene los datos necesarios para crear o encontrar el objeto mientras se registra el evento.

Usa `object` cuando ya sincronizaste el catálogo o el pedido y conservaste el ID devuelto por Hellotext. Usa `object_parameters` cuando el sistema de origen tenga toda la información necesaria pero todavía no dispongas del ID de Hellotext.

Este ejemplo registra una vista y crea o encuentra el producto mediante `reference` y `source`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "product.viewed",
    "profile": "PROFILE_ID",
    "object_parameters": {
      "name": "Championes Everyday",
      "reference": "product-100",
      "source": "custom_store",
      "url": "https://shop.example.com/products/everyday-sneakers",
      "price": {
        "amount": 89.90,
        "currency": "USD"
      }
    }
  }'
```

Mantén `reference` y `source` estables. Cambiarlos entre requests puede crear objetos separados para el mismo producto, carrito o pedido.

Consulta [eventos de productos](https://www.hellotext.com/api#track_product_events), [eventos de carritos](https://www.hellotext.com/api#track_cart_events) y [eventos de pedidos](https://www.hellotext.com/api#track_order_events) para ver qué objeto y parámetros requiere cada acción.

## 3. Registra el ciclo de los pedidos

Para registrar varios estados de un pedido, crea o sincroniza el pedido primero y conserva su ID de Hellotext. Después reutiliza ese ID en cada evento real del ciclo:

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

Reutiliza el mismo `ORDER_ID` para registrar únicamente los cambios que tu sistema pueda confirmar:

- `order.confirmed` cuando el negocio confirma el pedido.
- `order.shipped` cuando el pedido sale para su entrega.
- `order.delivered` cuando se confirma la entrega.
- `order.cancelled` cuando el pedido se cancela.

No registres todos los estados al crear el pedido. Cada evento debe enviarse cuando ese cambio ocurra realmente. Consulta [Crear un pedido](https://www.hellotext.com/api#create_an_order) para ver todos los campos disponibles.

## 4. Registra acciones personalizadas

Hellotext incluye acciones para productos, carritos, pedidos, formularios, cupones y otros objetos comunes. Cuando ninguna representa la actividad de tu negocio, crea primero una acción personalizada y luego usa su nombre en `action`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "appointment.completed",
    "profile": "PROFILE_ID",
    "tracked_at": "2026-08-07T12:30:00Z"
  }'
```

Una acción personalizada puede registrarse sin un objeto relacionado. Si envías un objeto personalizado, debes indicar también su tipo según el contrato de la API.

Consulta [Crear una acción](https://www.hellotext.com/api#create_an_action) antes de registrar el primer evento personalizado.

## 5. Conserva la fecha y los valores monetarios

Si el evento ocurrió antes de enviar la request, incluye `tracked_at` con una fecha ISO 8601 o un timestamp Unix. Si lo omites, Hellotext usa el momento en que recibe el evento.

Usa la fecha original para importaciones históricas, jobs demorados y webhooks reintentados. Esto evita que actividad antigua aparezca como reciente y altere segmentos, elegibilidad de playbooks o reportes.

Cuando el evento tenga un valor monetario, envía `amount` y `currency` juntos:

```json
{
  "amount": 89.90,
  "currency": "USD"
}
```

Si incluyes `currency`, `amount` es obligatorio. Usa el código ISO 4217 de la moneda y no conviertas manualmente el valor a la moneda de reportes.

## 6. Interpreta la respuesta y maneja errores

Una request válida responde con HTTP `200`:

```json
{
  "status": "received"
}
```

Esto confirma que Hellotext recibió el evento para procesarlo. Revisa siempre el código HTTP y el cuerpo de la respuesta:

- `401` indica que el token falta, es inválido o fue revocado.
- `404` puede indicar que la acción no existe para ese negocio.
- `422` indica que faltan parámetros o que el perfil del cliente, la sesión, el objeto o sus datos no son válidos.

Registra el código y el error en tus logs, pero nunca guardes el token ni datos personales completos del cliente.

## 7. Evita eventos duplicados

Cada request aceptada puede crear un evento nuevo, aunque reutilices el mismo producto o pedido. Encontrar el mismo objeto por `reference` y `source` no elimina eventos repetidos.

- Guarda en tu sistema qué evento de origen ya fue aceptado por Hellotext.
- No reintentes respuestas `200`.
- Reintenta errores temporales con espera progresiva y conserva el identificador del evento de origen en tu propia cola.
- No envíes el mismo evento desde Hellotext.js y desde el backend.
- Procesa una sola vez los webhooks repetidos del proveedor antes de llamar a Hellotext.

Consulta la [referencia completa de tracking](https://www.hellotext.com/api#tracking) para ver todas las acciones, objetos y parámetros compatibles.

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Crea y registra cupones con la API]({% link _developers/coupons-with-api.md %})
- [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
