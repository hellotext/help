Usa esta guía para registrar en Hellotext eventos confiables que ocurren fuera del navegador, por ejemplo en tu backend, POS, CRM, ERP, marketplace, operador logístico, jobs o webhooks.

El tracking externo complementa Hellotext.js. Usa Hellotext.js para la navegación y la actividad del carrito que ocurre en la tienda. Usa la API desde el backend para pedidos, pagos, cancelaciones, envíos, entregas y otras acciones que el servidor pueda verificar. Define una sola fuente para cada ocurrencia: si una integración existente ya registra un pedido, no vuelvas a enviarlo desde un webhook y Hellotext.js. Registra solamente acciones que ya ocurrieron y que tu sistema pueda verificar.

Si estás conectando una tienda propia desde cero, comienza con [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}) para implementar perfiles de clientes, catálogo, pedidos, Hellotext.js e identidad en el orden recomendado.

## Antes de comenzar

Prepara:

- Un token privado de autorización de la API del negocio correcto, guardado únicamente en el backend, y una suscripción que permita usar la API.
- El nombre de la acción que quieres registrar, como `product.viewed`, `order.placed` o una acción personalizada existente.
- El ID del perfil del cliente en Hellotext o el ID de una sesión de Hellotext.
- El ID del objeto relacionado, como un producto o pedido, o los datos necesarios para crearlo.
- Identificadores estables del sistema de origen para evitar objetos duplicados.

Todos los ejemplos envían un `POST` a:

```text
https://api.hellotext.com/v1/attribution/events
```

En el negocio que quieres integrar, abre **Ajustes**, selecciona **Administrar tokens de autorización** y luego **Crear token nuevo**. El ejemplo muestra únicamente un nombre ficticio sin guardar: no contiene una credencial ni confirma que se haya creado un token.

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

El token privado se envía mediante el encabezado `Authorization`. El ID público del negocio usado por Hellotext.js y el nombre del token no sustituyen su valor secreto. Consulta [Autenticación en la API](https://www.hellotext.com/api#authentication) para crear y usar el token correctamente.

Los ejemplos usan IDs y un token de entorno como marcadores de posición. Sustitúyelos por recursos del mismo negocio y datos que tu sistema pueda confirmar.

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

Conserva el ID que devuelve Hellotext cuando creas el perfil del cliente y su correspondencia con el cliente de tu sistema. Resuelve esa identidad desde tu backend; no confíes en un ID arbitrario enviado por el navegador. Registrar actividad no equivale a suscribir al cliente ni concede permiso para enviarle mensajes. Si todavía no existe, consulta [Crear un perfil del cliente](https://www.hellotext.com/api#create_a_profile).

### Cuando solo conoces la sesión

Después de cargar el SDK **2.6.0**, espera a que termine su inicialización antes de leer la sesión real del visitante. El ID del negocio en este ejemplo es público:

```javascript
async function initializeTracking() {
  await Hellotext.initialize("YOUR_BUSINESS_ID")
  const sessionId = Hellotext.session
  // Envía sessionId a tu backend en este punto.
}

initializeTracking()
```

Envía ese ID a tu backend dentro del contexto del visitante correcto y usa `session` al registrar el evento. No inventes una sesión ni reutilices la de otro visitante; comprueba que el SDK exponga un ID antes de construir la solicitud:

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

Si envías `profile` y `session` juntos, usa una sesión ya asociada al mismo perfil y negocio. Para una sesión todavía no identificada, completa primero su asociación mediante el flujo de sesiones documentado, después de verificar la identidad del cliente; no uses una solicitud de tracking como sustituto de esa asociación. No intentes reasignar una sesión que pertenezca a otro cliente.

La inicialización no registra `page.viewed` automáticamente en el SDK 2.6.0. Para registrar la navegación, sigue el ejemplo explícito de Hellotext.js en la guía de tienda propia enlazada arriba y evita duplicar la primera vista. Conservar la sesión puede aportar contexto de atribución, pero no garantiza que un evento atribuya ingresos.

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

Mantén `reference` y `source` estables. Guarda su correspondencia con el ID del objeto en Hellotext únicamente cuando una solicitud separada de creación o consulta del recurso devuelva ese ID; la respuesta de tracking `{"status":"received"}` no devuelve el ID del objeto creado o encontrado. Cambiarlos entre requests puede crear objetos separados para el mismo producto, carrito o pedido. Usa una sola alternativa, `object` o `object_parameters`, para expresar qué recurso quieres asociar.

La creación de objetos y la aceptación del evento son operaciones distintas. Algunos datos del objeto se validan o guardan durante la solicitud: si falla el evento, comprueba si el recurso ya existe antes de volver a crearlo. Encontrar o crear un producto tampoco actualiza necesariamente un catálogo ya existente; usa el endpoint de actualización cuando cambien sus datos.

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

El importe del ejemplo es **89,90 USD**, en unidades principales de la moneda, no 8.990 centavos. Debe coincidir con el pedido real. Si el cambio ocurrió antes, añade `tracked_at` con su fecha original, como se explica más abajo.

Reutiliza el mismo `ORDER_ID` para registrar únicamente los cambios que tu sistema pueda confirmar:

- `order.confirmed` cuando el negocio confirma el pedido.
- `order.shipped` cuando el pedido sale para su entrega.
- `order.delivered` cuando se confirma la entrega.
- `order.cancelled` cuando el pedido se cancela.

No registres todos los estados al crear el pedido. Cada evento debe enviarse cuando ese cambio ocurra realmente. No reemplaces el ID de pedido por su código visible ni asumas que registrar `order.placed` confirma un pago o atribuye una venta. Consulta [Crear un pedido](https://www.hellotext.com/api#create_an_order) para ver todos los campos disponibles.

## 4. Registra acciones personalizadas

Hellotext incluye acciones para productos, carritos, pedidos, formularios, cupones y otros objetos comunes. Cuando ninguna representa la actividad de tu negocio, crea primero una acción personalizada y luego usa su nombre en `action`:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "appointment.booked",
    "profile": "PROFILE_ID",
    "tracked_at": "2026-08-07T12:30:00Z"
  }'
```

En **Ajustes > Acciones > Personalizado**, la definición ficticia «Cita reservada» tiene el nombre de seguimiento `appointment.booked`. Usa ese nombre exacto en `action`, no el título visible ni el ID de la definición. La captura muestra una definición sin eventos; el JSON anterior ilustra una ocurrencia y no confirma que haya sido enviada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Acción ficticia Cita reservada con nombre de seguimiento appointment.booked en la pestaña Personalizado de Acciones, junto a Crear nueva acción.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 894px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/catalog-es-mobile.png 2x" width="764" height="346" />
        <img src="/images/developers/custom-actions/catalog-es.png" srcset="/images/developers/custom-actions/catalog-es.png 2x" style="width: auto; margin: 0 auto;" width="1752" height="838" loading="lazy" decoding="async" alt="Acción ficticia Cita reservada con nombre de seguimiento appointment.booked en la pestaña Personalizado de Acciones, junto a Crear nueva acción." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catálogo real de acciones con una definición ficticia sin eventos; el foco móvil muestra su fila y Crear nueva acción.</figcaption>
</figure>

Una acción personalizada puede registrarse sin un objeto relacionado. Si envías un objeto, indica también `object_type` con el tipo compatible de ese mismo negocio y su ID o los parámetros requeridos. Crear una definición no registra actividad; revisa sus opciones de objetivo y pasiva en [Acciones personalizadas]({% link _developers/custom-actions.md %}) antes de usarla.

Consulta [Crear una acción](https://www.hellotext.com/api#create_an_action) antes de registrar el primer evento personalizado.

## 5. Conserva la fecha y los valores monetarios

Si el evento ocurrió antes de enviar la request, incluye `tracked_at` con una fecha ISO 8601 que indique la zona horaria o un timestamp Unix **en segundos**, no milisegundos. Por ejemplo, `2026-08-07T12:30:00Z` indica UTC. Si lo omites, se usa la hora de procesamiento del evento; un job demorado puede hacer que difiera de la hora en que ocurrió.

Usa la fecha original para importaciones históricas, jobs demorados y webhooks reintentados. Esto conserva la cronología de la actividad, pero no convierte un evento histórico en elegible para una misión o atribución: esos resultados dependen de sus propias reglas y ventanas.

Cuando el evento tenga un valor monetario, envía `amount` y `currency` juntos:

```json
{
  "amount": 89.90,
  "currency": "USD"
}
```

Si incluyes `currency`, `amount` es obligatorio. Envía siempre ambos cuando declares un importe: usa unidades principales, el código ISO 4217 de la moneda original y no conviertas manualmente el valor a la moneda de reportes. Si omites los valores, algunas acciones pueden heredarlos del objeto; verifica el recurso antes de asumir un importe cero.

## 6. Interpreta la respuesta y maneja errores

Una request válida responde con HTTP `200`:

```json
{
  "status": "received"
}
```

Esto confirma que la solicitud pasó las validaciones iniciales y fue recibida para procesamiento. No confirma que el evento ya esté guardado, aparezca en actividad, haya activado una automatización o atribuido una venta. Comprueba el resultado del perfil u objeto correspondiente antes de marcar tu proceso como completado. Revisa siempre el código HTTP y el cuerpo de la respuesta:

- `401` indica que el token falta, es inválido o fue revocado.
- `403` puede indicar que la suscripción no permite la operación.
- `404` puede indicar que la acción no existe para ese negocio; usa su nombre exacto.
- `422` indica que faltan parámetros o que el perfil del cliente, la sesión, el objeto o sus datos no son válidos.

Corrige las credenciales, permisos o datos antes de repetir un error permanente. Registra el código, los campos de `errors` y el identificador de origen en tus logs, pero nunca guardes el token ni datos personales completos del cliente. Conserva por separado los estados «recibido» y «resultado verificado».

## 7. Evita eventos duplicados

La mayoría de las requests de tracking aceptadas pueden crear un evento nuevo, aunque reutilices el mismo objeto. Encontrar el mismo objeto por `reference` y `source` no elimina eventos repetidos.

Las acciones preestablecidas del ciclo de un pedido tienen una protección específica en el procesamiento de eventos identificados: si el mismo pedido ya tiene un evento conservado de esa acción, no se agrega otro, por ejemplo otro `order.shipped`. No generalices esa protección a eventos anónimos ni a otras acciones. No es una clave de idempotencia de la solicitud; debes evitar envíos repetidos desde tu integración.

- Guarda en tu sistema qué evento de origen ya fue aceptado por Hellotext.
- No reintentes respuestas `200`.
- Si hay un timeout, una desconexión o un error del servidor después de enviar, el resultado puede ser incierto: comprueba si la operación se recibió o procesó antes de repetirla. No hagas reintentos ciegos.
- Para fallos temporales que puedas reintentar con seguridad, usa espera progresiva y conserva el identificador del evento de origen en tu propia cola. Ese identificador no crea una garantía de idempotencia en Hellotext.
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
