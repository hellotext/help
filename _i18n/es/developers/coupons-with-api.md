Un objeto de cupón permite que Hellotext haga referencia a un código, su descripción y el destino donde el cliente puede canjearlo. Un evento de cupón registra que un cliente realmente canjeó ese código.

Crear un cupón en Hellotext no crea el descuento en tu plataforma de eCommerce ni controla su elegibilidad, vencimiento, límite de uso o reglas de uso único. Primero crea y valida la promoción en el sistema que controla el checkout.

Usa la [referencia de la API de cupones](https://www.hellotext.com/api#coupons) para consultar el contrato completo.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API, guardado en tu backend. No lo incluyas en formularios, JavaScript público ni mensajes.
- Una suscripción activa para crear o actualizar cupones y registrar eventos.
- Un código de cupón que ya funcione en la plataforma de eCommerce.
- Una URL pública donde el cliente pueda canjearlo.
- Una descripción breve que pueda utilizarse en un mensaje.
- Una referencia externa estable cuando el sistema de origen tenga una.
- El perfil del cliente y los datos de compra necesarios para confirmar el canje.

## 1. Crea el descuento en el sistema de comercio

Antes de crear el objeto del cupón en Hellotext, confirma en el sistema que controla el checkout:

- Qué productos o clientes pueden usarlo.
- El monto o porcentaje de descuento.
- Las fechas de inicio y vencimiento.
- Si el código es de un solo uso o reutilizable.
- Si puede combinarse con otra promoción.
- La URL de destino final.

Hellotext puede entregar y registrar el contexto del cupón, pero el sistema de comercio decide si el checkout lo acepta.

## 2. Crea el objeto del cupón en Hellotext

Los ejemplos usan datos ficticios. Reemplaza `COUPON_ID` y `PROFILE_ID` por los IDs de Hellotext correspondientes y carga tu token en la variable de entorno `HELLOTEXT_API_TOKEN` de tu servidor. Crea el cupón correspondiente:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/coupons \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "code": "GUIA-QR-10",
    "description": "Obtén 10% de descuento en tu primera compra",
    "destination_url": "https://shop.example.com/discount/GUIA-QR-10",
    "reference": "promotion-2026-guide"
  }'
```

El código distingue mayúsculas de minúsculas y debe ser único dentro de tu negocio. La descripción admite hasta 140 caracteres. Usa una URL pública con `https://` o `http://` y comprueba que abra la oferta correcta.

Guarda el `id` devuelto para el cupón. Es distinto del `code` que recibe el cliente y de la `reference` que identifica la promoción en tu sistema. Para recuperar, actualizar o registrar eventos del objeto, usa el ID de Hellotext.

Comprueba el objeto guardado con [Recuperar un cupón](https://www.hellotext.com/api#retrieve_a_coupon):

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/coupons/COUPON_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Si la creación devuelve un error por código duplicado o no sabes si una request llegó a completarse, consulta [Listar cupones](https://www.hellotext.com/api#list_all_coupons) y revisa las páginas de resultados para identificar el código y la referencia existentes antes de volver a crear el objeto. Consulta [Crear un cupón](https://www.hellotext.com/api#create_a_coupon) para ver todos los campos compatibles.

## 3. Actualiza el mismo cupón cuando cambie su presentación

Usa `PATCH /v1/coupons/:id` cuando cambie la descripción o la URL de destino. Conserva el mismo ID del cupón en Hellotext mientras siga representando la misma promoción. Envía los campos que necesitas cambiar:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/coupons/COUPON_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "description": "10% de descuento en tu primera compra con GUIA-QR-10",
    "destination_url": "https://shop.example.com/discount/GUIA-QR-10"
  }'
```

Vuelve a recuperar el objeto y comprueba la nueva presentación. Consulta [Actualizar un cupón](https://www.hellotext.com/api#update_a_coupon).

No conviertas un código vencido en una promoción sin relación solamente para reutilizar el registro. Crea un cupón nuevo cuando la oferta tenga otra identidad comercial, elegibilidad o código.

Como las reglas del checkout viven en el sistema de comercio, actualizar el objeto en Hellotext no modifica esas reglas.

## 4. Usa el cupón en un mensaje o una misión compatible

Una vez que el cupón existe, puedes seleccionarlo donde Hellotext ofrezca soporte para cupones, como capturas, mensajes, rutas o misiones compatibles. En este ejemplo de demostración, un Link Compartible selecciona `GUIA-QR-10` y una ruta de bienvenida opcional en borrador.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cupón ficticio GUIA-QR-10 y ruta de bienvenida opcional seleccionados en un Link Compartible de demostración.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 692px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/captures/shareable-link/follow-up-refresh/assignment-es-mobile.png 2x" width="700" height="976" />
        <img src="/images/captures/shareable-link/follow-up-refresh/assignment-es.png" srcset="/images/captures/shareable-link/follow-up-refresh/assignment-es.png 2x" style="width: auto; margin: 0 auto;" width="1348" height="1008" loading="lazy" decoding="async" alt="Cupón ficticio GUIA-QR-10 y ruta de bienvenida opcional seleccionados en un Link Compartible de demostración." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo de selección de un cupón existente en un Link Compartible. La ruta de bienvenida es opcional; seleccionarla y elegir el cupón no crea las reglas del descuento en tu tienda.</figcaption>
</figure>

Antes del lanzamiento, prueba toda la experiencia del cliente:

1. El mensaje muestra el código y la descripción esperados.
2. El destino abre la tienda y la oferta correctas.
3. El checkout acepta el código para un cliente elegible.
4. El vencimiento y la reutilización coinciden con la configuración del sistema de comercio.

No prometas envío gratis, bundles u otro beneficio salvo que esa oferta exacta exista en el sistema de comercio.

## 5. Registra un canje confirmado

Envía `coupon.redeemed` únicamente después de que el sistema de comercio confirme que el cliente usó el cupón:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/events \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "action": "coupon.redeemed",
    "profile": "PROFILE_ID",
    "object": "COUPON_ID",
    "amount": 89.90,
    "currency": "USD",
    "tracked_at": 1786104000
  }'
```

`object` es el ID del cupón de Hellotext y `profile` es el ID del cliente que realizó el canje. `amount` representa los ingresos asociados a esa compra: en el ejemplo, USD 89.90 es el valor de la compra que registras, no el valor del descuento del 10%. Envía siempre la moneda real en formato ISO 4217 junto con el monto y conserva en `tracked_at` la fecha original del canje, como timestamp Unix en segundos.

Una respuesta `{"status":"received"}` indica que la request fue aceptada para su procesamiento; después comprueba que el evento aparezca en el perfil correcto. Si tu integración dispone de una sesión de atribución real del mismo cliente, puedes incluir su ID en `session`. No inventes una sesión ni atribuyas el canje a una campaña solamente porque se utilizó su cupón.

No envíes `coupon.redeemed` cuando el cupón se muestra, entrega, abre o copia. Esas acciones no demuestran que el checkout lo haya aceptado.

Consulta [Registrar eventos de cupones](https://www.hellotext.com/api#track_coupon_events).

## 6. Evita eventos de canje duplicados

El objeto del cupón puede reutilizarse entre muchos clientes, pero cada canje confirmado es un evento separado.

- Asigna un ID interno estable a cada canje del sistema de comercio y guarda su estado de envío en tu integración.
- Procesa una sola vez la misma notificación del checkout, incluso si llega simultáneamente a dos procesos.
- Márcala como aceptada después de que Hellotext responda con `status: received`; verifica luego su procesamiento.
- No envíes el mismo canje desde el navegador y el backend.
- Si hay un timeout, comprueba el resultado antes de reintentar: la request pudo haberse aceptado aunque no hayas recibido la respuesta.

Conservar el mismo perfil, cupón y fecha no garantiza que un reintento se deduplique. Tu integración debe impedir el envío repetido del mismo canje.

La plataforma de comercio sigue siendo responsable de impedir que un código se canjee más veces de lo permitido por sus reglas. Hellotext debe recibir el resultado final confirmado.

## 7. Verifica el flujo completo

Usa un cupón de prueba y un cliente fácil de reconocer:

- El código funciona en la tienda antes de agregarlo a Hellotext.
- Al recuperar el objeto, su ID, código, referencia y destino coinciden con la promoción.
- El cupón de Hellotext abre el destino correcto.
- Un mensaje compatible muestra la oferta esperada.
- Un checkout sin éxito no crea `coupon.redeemed`.
- Un checkout exitoso crea un solo evento de canje en el perfil correcto del cliente.
- El monto, la moneda y la fecha reflejan la transacción real.

Si falla la request del cupón o no aparece el evento de canje, usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Formularios]({% link _captures/forms.md %})
- [Popup de Sitio Web]({% link _captures/website-popup.md %})
