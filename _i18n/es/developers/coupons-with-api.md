Un objeto de cupón permite que Hellotext haga referencia a un código, su descripción y el destino donde el cliente puede canjearlo. Un evento de cupón registra que un cliente realmente canjeó ese código.

Crear un cupón en Hellotext no crea el descuento en tu plataforma de eCommerce ni controla su elegibilidad, vencimiento, límite de uso o reglas de uso único. Primero crea y valida la promoción en el sistema que controla el checkout.

Usa la [referencia de la API de cupones](https://www.hellotext.com/api#coupons) para consultar el contrato completo.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API.
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

Crea el cupón correspondiente:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/coupons \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "code": "WELCOME10",
    "description": "Obtén 10% de descuento en tu primera compra",
    "destination_url": "https://shop.example.com/discount/WELCOME10",
    "reference": "promotion-2026-welcome"
  }'
```

El código distingue mayúsculas de minúsculas y debe ser único. Mantén la descripción dentro del límite compatible y asegúrate de que la URL de destino sea accesible públicamente.

Guarda el `id` devuelto para el cupón. Consulta [Crear un cupón](https://www.hellotext.com/api#create_a_coupon) para ver todos los campos compatibles.

## 3. Actualiza el mismo cupón cuando cambie su presentación

Usa `PATCH /v1/coupons/:id` cuando cambie la descripción o la URL de destino. Conserva el mismo ID del cupón en Hellotext mientras siga representando la misma promoción.

No conviertas un código vencido en una promoción sin relación solamente para reutilizar el registro. Crea un cupón nuevo cuando la oferta tenga otra identidad comercial, elegibilidad o código.

Como las reglas del checkout viven en el sistema de comercio, actualizar el objeto en Hellotext no modifica esas reglas.

## 4. Usa el cupón en un mensaje o playbook compatible

Una vez que el cupón existe, puedes seleccionarlo donde Hellotext ofrezca soporte para cupones, como capturas, mensajes, rutas o playbooks compatibles.

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

Usa el valor monetario asociado con el canje confirmado según tu implementación de reportes. Envía `amount` y `currency` juntos y conserva la fecha original del evento.

No envíes `coupon.redeemed` cuando el cupón se muestra, entrega, abre o copia. Esas acciones no demuestran que el checkout lo haya aceptado.

Consulta [Registrar eventos de cupones](https://www.hellotext.com/api#track_coupon_events).

## 6. Evita eventos de canje duplicados

El objeto del cupón puede reutilizarse entre muchos clientes, pero cada canje confirmado es un evento separado.

- Asigna un ID interno estable a cada canje del sistema de comercio.
- Procesa una sola vez la misma notificación del checkout.
- Márcala como enviada después de que Hellotext responda con `status: received`.
- No envíes el mismo canje desde el navegador y el backend.
- Conserva el mismo perfil del cliente e ID del cupón en los reintentos.

La plataforma de comercio sigue siendo responsable de impedir que un código se canjee más veces de lo permitido por sus reglas. Hellotext debe recibir el resultado final confirmado.

## 7. Verifica el flujo completo

Usa un cupón de prueba y un cliente fácil de reconocer:

- El código funciona en la tienda antes de agregarlo a Hellotext.
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
