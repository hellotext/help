El seguimiento de eventos convierte la actividad de tus clientes en señales que Hellotext puede usar en perfiles de clientes, segmentos, atribución, misiones, rutas e Inbox.

Las señales pueden venir de una integración, Hellotext.js, tu backend, una tienda física, formularios, conversaciones o acciones internas de Hellotext. No necesitas registrar manualmente todas las señales ni implementar todos los eventos disponibles.

Para entender el concepto general del producto, comienza con [Qué son las señales]({% link _journeys/what-are-signals.md %}).

## Señales, acciones, eventos y objetos

Estos términos describen partes diferentes del mismo flujo:

- Una **señal** es información que Hellotext puede interpretar para tomar decisiones.
- Una **acción** define qué ocurrió, por ejemplo `product.viewed` u `order.delivered`.
- Un **evento** es una ocurrencia de esa acción para un cliente o sesión en un momento determinado.
- Un **objeto** aporta el contexto relacionado, como el producto, carrito, pedido, cupón o formulario.

Por ejemplo, este cuerpo para la API de tracking indica que un perfil del cliente vio un producto concreto. Sustituye los placeholders por IDs públicos del mismo negocio; el nombre de la acción describe la actividad, pero no identifica al perfil ni al producto:

```json
{
  "action": "product.viewed",
  "profile": "PROFILE_ID",
  "object": "PRODUCT_ID",
  "tracked_at": "2026-08-07T12:30:00Z"
}
```

La acción por sí sola no siempre es suficiente. `product.viewed` necesita el producto visto y las acciones de pedidos necesitan el pedido correspondiente. Crear un producto o pedido mediante la API no sustituye el registro de la actividad del cliente. Conserva el ID público obtenido al crear o consultar el objeto; no uses su referencia externa, SKU o etiqueta como si fueran ese ID.

La mayoría de las acciones incorporadas siguen el formato `objeto.verbo`. `subscribed` y `unsubscribed` son excepciones vigentes y no deben renombrarse agregando un prefijo.

## Acciones incorporadas para integraciones

Estas son acciones habituales, no un catálogo completo ni una garantía de que cada origen admita todas. Comprueba los parámetros y acciones compatibles con la integración, SDK o endpoint elegido en la referencia de tracking. Usa solamente las que representen actividad real de tu sistema.

### Suscripción

- `subscribed`: el cliente dio su consentimiento y quedó suscrito mediante un canal compatible.
- `unsubscribed`: el cliente retiró su consentimiento o se dio de baja.

El evento describe una suscripción; registrarlo no demuestra por sí solo consentimiento ni que el contacto sea enviable. Gestiona la suscripción y baja mediante el flujo compatible del canal. No uses `subscribed` solamente porque creaste un perfil del cliente. Consulta [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}).

### Páginas y productos

- `page.viewed`: el cliente vio una página.
- `product.viewed`: el cliente vio un producto específico.
- `product.purchased`: el cliente compró un producto fuera de un ciclo de pedido más completo.

En Hellotext.js 2.6.0, `initialize()` prepara la sesión y los componentes, pero no registra automáticamente `page.viewed`. Registra la vista explícitamente después de esperar la inicialización, una vez por vista real. El SDK incluye la URL actual. Una vista de página no identifica por sí sola el producto, por lo que `product.viewed` debe incluir explícitamente el producto correspondiente.

Si tu tienda trabaja con pedidos, prefiere las acciones del pedido en lugar de registrar también `product.purchased` para la misma compra.

### Carritos y checkout

- `cart.viewed`: el cliente vio su carrito.
- `cart.added`: se agregó un producto al carrito.
- `cart.removed`: se quitó un producto del carrito.
- `cart.abandoned`: la tienda determinó que el carrito fue abandonado.
- `checkout.started`: el cliente comenzó el checkout.

No envíes `cart.abandoned` solamente porque el cliente salió de una página. Regístralo cuando tu tienda o integración haya determinado realmente el abandono. En los datos de artículos del carrito, `quantity` representa la cantidad resultante, no cuántas unidades se añadieron o quitaron en ese cambio. Conserva el objeto del carrito y consulta el contrato de cada acción antes de enviar su contenido.

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

Hellotext también crea señales internas para mensajes, conversaciones, segmentos, enlaces cortos, cambios del perfil del cliente y decisiones de misiones. Algunas acciones, como `product.browse_abandoned`, `product.price_changed` u `order.printed_label`, pertenecen a procesos internos del producto.

No reproduzcas esas acciones manualmente ni las envíes desde tu integración salvo que aparezcan explícitamente como compatibles en la [referencia de tracking](https://www.hellotext.com/api#tracking). Duplicarlas puede activar automatizaciones o alterar reportes de forma incorrecta.

## Acciones personalizadas

Cuando ninguna acción incorporada representa lo que ocurre en tu negocio, crea una acción personalizada desde **Configuración → Acciones → Personalizado** o mediante la API.

Usa un nombre estable y descriptivo, por ejemplo:

- `appointment.completed`
- `store_visit.completed`
- `membership.renewed`

No generes un nombre nuevo por cliente, pedido o fecha. Una acción representa un tipo reutilizable de actividad y cada evento representa una ocurrencia.

La acción personalizada debe existir antes de registrar el primer evento. El catálogo muestra su título visible y nombre de tracking: en el ejemplo ficticio, **Cita reservada** usa `appointment.booked`. La fila confirma la definición, no que se haya reservado una cita.

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

Consulta [Crear una acción](https://www.hellotext.com/api#create_an_action).

Para definir el nombre, registrar ocurrencias y usar la acción en rutas o reportes, consulta [Acciones personalizadas]({% link _developers/custom-actions.md %}).

Un evento personalizado con un monto monetario positivo puede evaluarse para atribución cuando Hellotext identifica al cliente y encuentra evidencia elegible de origen y tiempo. Crear la acción no convierte automáticamente su monto en ingresos atribuidos. Consulta [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Cómo llegan los eventos a Hellotext

### Integraciones

Las integraciones de eCommerce, canales y otras plataformas pueden crear perfiles de clientes, objetos y eventos automáticamente. Revisa qué datos aporta cada integración y no vuelvas a enviar los mismos eventos desde tu código.

Consulta [Configuración e integraciones]({% link _integrations/setup-overview.md %}) y [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

### Hellotext.js

Usa Hellotext.js para la actividad que ocurre en el navegador, como vistas de páginas, vistas de productos y cambios en el carrito. La librería incluye la sesión actual para conservar el contexto anónimo. Con el SDK 2.6.0 ya cargado y tu ID público del negocio, este ejemplo espera la inicialización y registra una vista explícita; no requiere un token privado en el navegador:

```javascript
(async () => {
  await Hellotext.initialize("HELLOTEXT_BUSINESS_ID");
  const response = await Hellotext.track("page.viewed");
  if (response.failed) {
    console.error(await response.json());
  }
})().catch((error) => {
  console.error(error);
});
```

En una tienda con navegación interna, inicializa una vez y llama a `track("page.viewed")` por cada nueva vista real. No ejecutes de nuevo toda la inicialización por cada cambio ni añadas otro registro si tu integración ya genera esa misma vista. El ejemplo usa `failed` y `json()` de la respuesta del SDK. `succeeded` indica una solicitud aceptada y `received` confirma recepción, no el procesamiento completo. Conserva el error para investigarlo antes de reintentar automáticamente.

Consulta el [repositorio de Hellotext.js](https://github.com/hellotext/hellotext.js) para ver las instrucciones vigentes.

### API

Usa la API desde el backend para eventos confiables como pedidos, pagos, cancelaciones, envíos, entregas y actividad de sistemas externos. Autentica el endpoint de atribución `/v1/attribution/events` con el token privado del negocio y una suscripción compatible con la API. Los perfiles y objetos deben pertenecer a ese negocio. Si envías perfil y sesión juntos, la sesión debe estar previamente asociada con ese perfil; enviar ambos identificadores no crea esa relación.

Distingue los resultados: la API de objetos puede devolver `201` y el objeto creado; el endpoint de tracking devuelve `200` con `received` sin un ID del evento y delega el registro posterior. El endpoint usado por el SDK puede aceptar la solicitud antes de validar todos sus datos en segundo plano. La recepción no garantiza un evento visible, atribución ni ejecución de una ruta. Mantén la correspondencia de IDs obtenidos en consultas o creaciones separadas.

- Para una implementación completa, consulta [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).
- Para enviar eventos desde el backend, consulta [Seguimiento de origen externo]({% link _developers/external-tracking.md %}).
- Para asociar actividad anónima, consulta [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}).

### Registro manual

También puedes usar **Nuevo evento** dentro de un perfil del cliente para registrar una ocurrencia manual. Revisa el cliente y selecciona la acción, el objeto asociado y sus datos reales antes de guardar. El formulario manual de una acción personalizada exige un **Objeto asociado**; esta exigencia de la interfaz no implica que todos los eventos personalizados de la API necesiten objeto. En la API, si lo incluyes, debe coincidir con el tipo de objeto indicado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nuevo evento para Demo Caso 1 con Cita reservada seleccionada, objeto asociado requerido sin completar y Guardar deshabilitado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/manual-es-mobile.png 2x" width="778" height="1300" />
        <img src="/images/developers/custom-actions/manual-es.png" srcset="/images/developers/custom-actions/manual-es.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1300" loading="lazy" decoding="async" alt="Nuevo evento para Demo Caso 1 con Cita reservada seleccionada, objeto asociado requerido sin completar y Guardar deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario manual real sin guardar para un cliente ficticio no enviable. No hay objeto asociado ni evento registrado; el botón Guardar sigue deshabilitado.</figcaption>
</figure>

El ejemplo muestra **Cita reservada** para el cliente ficticio **Demo Caso 1**, sin objeto asociado y con **Guardar** deshabilitado. No se registró ningún evento. Guardar un formulario válido registra una ocurrencia y puede activar los efectos configurados para esa actividad; no configura el tracking automático de eventos futuros.

## Datos que debe conservar cada evento

Antes de implementar una acción, define:

- **Identidad:** el perfil del cliente conocido o la sesión anónima.
- **Objeto:** el producto, carrito, pedido u otro objeto relacionado.
- **Fecha:** el momento real del evento mediante `tracked_at` cuando no ocurre en tiempo real.
- **Valor:** `amount` y `currency` cuando la acción tiene un valor monetario.
- **Origen:** la integración o sistema que produjo la actividad.

Usa identificadores estables y no envíes el mismo evento desde varias fuentes. Para `tracked_at`, usa una fecha ISO 8601 con zona horaria o segundos Unix, no milisegundos; omitirlo usa la hora actual cuando Hellotext registra la actividad. Conserva el instante original en eventos retrasados.

El importe se expresa en unidades de la moneda, no en centavos. Declara `currency` junto con `amount` cuando corresponda y comprueba el importe leído: algunas acciones heredan el valor del objeto cuando el monto del evento está vacío o es cero. El monto convertido para reportes y los ingresos atribuidos son resultados distintos del valor original.

Conserva el origen y la clave de la actividad en tus propios registros y usa los campos de sesión, URL y objeto que admite el contrato elegido. No supongas que existe un parámetro universal `source` para cualquier evento. Una sesión anónima no identifica automáticamente a una persona ni acredita consentimiento.

## Verifica el tracking

Valida primero con un cliente ficticio reconocible y actividad aislada que no active envíos ni rutas operativas. No uses una venta real ni un contacto enviable para comprobar el tracking:

1. Confirma que el evento aparezca en el perfil del cliente correcto.
2. Revisa que la acción use el nombre exacto.
3. Confirma que el objeto relacionado sea el producto, carrito o pedido esperado.
4. Revisa que la fecha represente cuándo ocurrió la actividad.
5. Comprueba que la integración no haya creado el mismo evento automáticamente.
6. Revisa segmentos, misiones y reportes solamente después de validar los datos base.

Un catálogo de acciones y una respuesta HTTP correcta no prueban que la ocurrencia se haya registrado. Comprueba el registro del cliente identificado o la sesión correspondiente, respetando la configuración que determina qué actividad aparece en Inbox. Para actividad anónima, valida primero la sesión y su asociación posterior.

No hay una garantía universal de idempotencia para todas las acciones: algunas validaciones evitan ciertos duplicados y otras solicitudes pueden producir efectos antes del registro. Conserva acción, identidad, objeto, fecha, payload y resultado en tu sistema. Ante un timeout, comprueba el estado y los registros antes de reintentar; no cambies la fecha o el objeto para forzar un segundo evento.

Si los eventos no aparecen donde esperas, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Acciones personalizadas]({% link _developers/custom-actions.md %})
- [Objetos]({% link _developers/objects.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
