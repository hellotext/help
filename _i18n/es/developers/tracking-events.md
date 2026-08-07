El seguimiento de eventos convierte la actividad de tus clientes en señales que Hellotext puede usar en perfiles de clientes, segmentos, atribución, playbooks, rutas e Inbox.

Las señales pueden venir de una integración, Hellotext.js, tu backend, una tienda física, formularios, conversaciones o acciones internas de Hellotext. No necesitas registrar manualmente todas las señales ni implementar todos los eventos disponibles.

Para entender el concepto general del producto, comienza con [Qué son las señales]({% link _journeys/what-are-signals.md %}).

## Señales, acciones, eventos y objetos

Estos términos describen partes diferentes del mismo flujo:

- Una **señal** es información que Hellotext puede interpretar para tomar decisiones.
- Una **acción** define qué ocurrió, por ejemplo `product.viewed` u `order.delivered`.
- Un **evento** es una ocurrencia de esa acción para un cliente o sesión en un momento determinado.
- Un **objeto** aporta el contexto relacionado, como el producto, carrito, pedido, cupón o formulario.

Por ejemplo, este evento indica que un perfil del cliente vio un producto concreto:

```json
{
  "action": "product.viewed",
  "profile": "PROFILE_ID",
  "object": "PRODUCT_ID",
  "tracked_at": "2026-08-07T12:30:00Z"
}
```

La acción por sí sola no siempre es suficiente. `product.viewed` necesita el producto visto y las acciones de pedidos necesitan el pedido correspondiente.

La mayoría de las acciones incorporadas siguen el formato `objeto.verbo`. `subscribed` y `unsubscribed` son excepciones vigentes y no deben renombrarse agregando un prefijo.

## Acciones incorporadas para integraciones

Estas son las acciones que una integración normalmente puede registrar. Usa solamente las que representen actividad real de tu sistema.

### Suscripción

- `subscribed`: el cliente dio su consentimiento y quedó suscrito mediante un canal compatible.
- `unsubscribed`: el cliente retiró su consentimiento o se dio de baja.

No uses `subscribed` solamente porque creaste un perfil del cliente. Consulta [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}).

### Páginas y productos

- `page.viewed`: el cliente vio una página.
- `product.viewed`: el cliente vio un producto específico.
- `product.purchased`: el cliente compró un producto fuera de un ciclo de pedido más completo.

Hellotext.js registra automáticamente `page.viewed` con la URL actual. Una vista de página no identifica por sí sola el producto, por lo que `product.viewed` debe incluir explícitamente el producto correspondiente.

Si tu tienda trabaja con pedidos, prefiere las acciones del pedido en lugar de registrar también `product.purchased` para la misma compra.

### Carritos y checkout

- `cart.viewed`: el cliente vio su carrito.
- `cart.added`: se agregó un producto al carrito.
- `cart.removed`: se quitó un producto del carrito.
- `cart.abandoned`: la tienda determinó que el carrito fue abandonado.
- `checkout.started`: el cliente comenzó el checkout.

No envíes `cart.abandoned` solamente porque el cliente salió de una página. Regístralo cuando tu tienda o integración haya determinado realmente el abandono.

### Pedidos

- `order.placed`: el cliente creó el pedido.
- `order.confirmed`: el negocio confirmó el pedido.
- `order.cancelled`: el pedido fue cancelado.
- `order.shipped`: el pedido salió para su entrega.
- `order.delivered`: se confirmó la entrega.

Cada cambio debe registrarse cuando ocurra y reutilizar el mismo objeto de pedido. No envíes todos los estados juntos al crear el pedido.

### Cupones, reembolsos y formularios

- `coupon.redeemed`: el cliente canjeó un cupón.
- `refund.requested`: el cliente solicitó un reembolso.
- `refund.received`: el negocio completó el reembolso.
- `form.completed`: el cliente completó un formulario.

### Aplicaciones

- `app.installed`: el cliente instaló una aplicación.
- `app.removed`: el cliente eliminó una aplicación.
- `app.spent`: el cliente realizó un gasto asociado con una aplicación.

Los nombres correctos son `app.installed` y `app.removed`. No uses las variantes antiguas `app.install` o `app.remove`.

## Acciones generadas por Hellotext

Hellotext también crea señales internas para mensajes, conversaciones, segmentos, enlaces cortos, cambios del perfil del cliente y decisiones de playbooks. Algunas acciones, como `product.browse_abandoned`, `product.price_changed` u `order.printed_label`, pertenecen a procesos internos del producto.

No reproduzcas esas acciones manualmente ni las envíes desde tu integración salvo que aparezcan explícitamente como compatibles en la [referencia de tracking](https://www.hellotext.com/api#tracking). Duplicarlas puede activar automatizaciones o alterar reportes de forma incorrecta.

## Acciones personalizadas

Cuando ninguna acción incorporada representa lo que ocurre en tu negocio, crea una acción personalizada desde **Configuración → Acciones → Personalizado** o mediante la API.

Usa un nombre estable y descriptivo, por ejemplo:

- `appointment.completed`
- `store_visit.completed`
- `membership.renewed`

No generes un nombre nuevo por cliente, pedido o fecha. Una acción representa un tipo reutilizable de actividad y cada evento representa una ocurrencia.

La acción personalizada debe existir antes de registrar el primer evento. Consulta [Crear una acción](https://www.hellotext.com/api#create_an_action).

Un evento personalizado con un monto monetario positivo puede evaluarse para atribución cuando Hellotext identifica al cliente y encuentra evidencia elegible de origen y tiempo. Crear la acción no convierte automáticamente su monto en ingresos atribuidos. Consulta [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Cómo llegan los eventos a Hellotext

### Integraciones

Las integraciones de eCommerce, canales y otras plataformas pueden crear perfiles de clientes, objetos y eventos automáticamente. Revisa qué datos aporta cada integración y no vuelvas a enviar los mismos eventos desde tu código.

Consulta [Configuración e integraciones]({% link _integrations/setup-overview.md %}) y [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

### Hellotext.js

Usa Hellotext.js para la actividad que ocurre en el navegador, como vistas de páginas, vistas de productos y cambios en el carrito. La librería incluye la sesión actual para conservar el contexto anónimo.

Consulta el [repositorio de Hellotext.js](https://github.com/hellotext/hellotext.js) para ver las instrucciones vigentes.

### API

Usa la API desde el backend para eventos confiables como pedidos, pagos, cancelaciones, envíos, entregas y actividad de sistemas externos.

- Para una implementación completa, consulta [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).
- Para enviar eventos desde el backend, consulta [Seguimiento de origen externo]({% link _developers/external-tracking.md %}).
- Para asociar actividad anónima, consulta [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}).

### Registro manual

También puedes usar **Nuevo evento** dentro de un perfil del cliente para registrar una ocurrencia manual. Esto no configura el tracking automático de eventos futuros.

## Datos que debe conservar cada evento

Antes de implementar una acción, define:

- **Identidad:** el perfil del cliente conocido o la sesión anónima.
- **Objeto:** el producto, carrito, pedido u otro objeto relacionado.
- **Fecha:** el momento real del evento mediante `tracked_at` cuando no ocurre en tiempo real.
- **Valor:** `amount` y `currency` cuando la acción tiene un valor monetario.
- **Origen:** la integración o sistema que produjo la actividad.

Usa identificadores estables y no envíes el mismo evento desde varias fuentes.

## Verifica el tracking

Prueba primero con un cliente reconocible:

1. Confirma que el evento aparezca en el perfil del cliente correcto.
2. Revisa que la acción use el nombre exacto.
3. Confirma que el objeto relacionado sea el producto, carrito o pedido esperado.
4. Revisa que la fecha represente cuándo ocurrió la actividad.
5. Comprueba que la integración no haya creado el mismo evento automáticamente.
6. Revisa segmentos, playbooks y reportes solamente después de validar los datos base.

Si los eventos no aparecen donde esperas, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
