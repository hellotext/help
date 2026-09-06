Usa esta guía para agregar controles de suscripción a notificaciones push a tu tienda con Hellotext.js. Los ejemplos incluyen la instalación del service worker de notificaciones, la conexión de los botones y la verificación de la suscripción y su cancelación.

> **¿Usas Shopify o VTEX?** Al conectar tu tienda con Hellotext, la integración instala automáticamente el service worker de notificaciones e inicializa Hellotext.js con él. Omite los pasos 1 y 2. Comienza en el paso 3 si vas a crear tus propios botones de suscripción. Consulta [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %}) para ver las instrucciones de cada plataforma.

## Antes de empezar

Necesitas:

- Un plan **Pro o Enterprise** con Push disponible para tu negocio. Si tienes una tienda personalizada, confirma con Hellotext que Push esté habilitado antes de probarlo; publicar el worker por sí solo no completa la configuración del negocio.
- Acceso al código y al alojamiento de tu tienda, con la posibilidad de publicar un archivo JavaScript en el dominio HTTPS de la tienda.
- Hellotext.js instalado y el Business ID público de tu negocio. Si todavía no lo instalaste, sigue [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).
- Un navegador compatible con Web Push. Consulta [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) para conocer los requisitos del dispositivo y las diferencias entre navegadores.

No necesitas generar ni configurar claves VAPID, proporcionar un token privado de la API ni crear solicitudes de suscripción a la API. Hellotext.js recibe la configuración pública que necesita y administra las solicitudes de suscripción.

## 1. Publica el service worker de notificaciones

Un service worker es un archivo JavaScript que el navegador usa para recibir y mostrar notificaciones. Debe estar disponible como un archivo independiente en tu tienda, incluso si cargas Hellotext.js desde un CDN.

1. Crea un archivo llamado `hellotext-sw.js` en la raíz pública de tu tienda.
2. Copia el siguiente código en él.
3. Publícalo para que `https://store.example.com/hellotext-sw.js` devuelva el archivo. Reemplaza `store.example.com` por el dominio exacto que usan tus visitantes.

```javascript
self.addEventListener('install', event => {
  event.waitUntil(self.skipWaiting())
})

self.addEventListener('push', event => {
  if (!event.data) return

  let payload

  try {
    payload = event.data.json()
  } catch (error) {
    return
  }

  if (
    !payload ||
    payload.source !== 'hellotext' ||
    typeof payload.title !== 'string' ||
    !payload.title
  ) {
    return
  }

  event.stopImmediatePropagation()

  const options = payload.options || {}

  event.waitUntil(
    self.registration.showNotification(payload.title, {
      ...options,
      data: { ...options.data, source: 'hellotext' },
    }),
  )
})

self.addEventListener('notificationclick', event => {
  const { data } = event.notification

  if (!data || data.source !== 'hellotext') return

  event.notification.close()

  let url

  try {
    url = new URL(data.url || '/', self.location.origin)
  } catch (error) {
    return
  }

  if (url.protocol !== 'https:' && url.protocol !== 'http:') return

  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then(clients => {
      const client = clients.find(windowClient => windowClient.url === url.href)

      return client ? client.focus() : self.clients.openWindow(url.href)
    }),
  )
})
```

El worker muestra una notificación y abre su destino al hacer clic. Conserva el manejador de `install`: permite que una versión actualizada se active mientras los visitantes tienen la tienda abierta, en lugar de esperar a que cierren todas las pestañas. Consulta [cómo funciona `skipWaiting()`](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/skipWaiting) para más detalles.

### Revisa la URL publicada

Abre la URL del worker directamente en el navegador. Confirma que:

- Devuelve el JavaScript anterior con una respuesta HTTP `200`.
- Su `Content-Type` es un tipo JavaScript, como `text/javascript`.
- Usa el mismo origen que la tienda: el mismo esquema, nombre de host y puerto. Para una página en `https://www.example.com`, publica el worker en `https://www.example.com`, no en `https://example.com` ni en un dominio de CDN independiente.
- No redirige a una página de inicio de sesión ni devuelve el HTML de tu tienda como respuesta alternativa.

Publicar el archivo en la raíz pública, como en el ejemplo, le da un alcance predeterminado que cubre la tienda. Si tu framework usa un directorio `public`, revisa la URL publicada: debe ser `/hellotext-sw.js`, no `/public/hellotext-sw.js`. Estos requisitos corresponden al [registro de service workers](https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register).

### Si ya tienes un service worker

Agrega estos manejadores al worker que ya mantienes y usa la URL de ese archivo en el paso 2. Conserva su comportamiento de caché y las demás funciones existentes.

Coloca el manejador de `push` de Hellotext **antes de cualquier manejador genérico de push**, incluso antes del código que importe uno. Su llamada a `event.stopImmediatePropagation()` se aplica solo a los mensajes de Hellotext e impide que un manejador genérico posterior vuelva a mostrar la misma notificación. Incluye los manejadores de Hellotext una sola vez en el archivo final del worker.

## 2. Pasa la URL del worker al inicializar Hellotext

Busca la llamada a `Hellotext.initialize()` que ya usa tu tienda. Agrega la opción `push` a esa llamada y conserva las demás opciones. No agregues una segunda inicialización solo para Push.

La inicialización mínima es:

```javascript
await Hellotext.initialize('BUSINESS_ID', {
  push: {
    serviceWorkerUrl: '/hellotext-sw.js',
  },
})
```

Reemplaza `BUSINESS_ID` por el Business ID público de tu negocio en Hellotext y la URL del worker por la del archivo que publicaste. También puedes usar una URL absoluta si pertenece al mismo origen que la página.

Ejecuta la configuración de los botones de los próximos pasos después de que termine la inicialización y cuando los elementos ya existan en la página. Si Shopify o VTEX se encarga de la inicialización, usa la instancia de Hellotext que ya inicializó la integración.

Si tu tienda ya registra y activa el worker para la página actual, puedes omitir `serviceWorkerUrl`. En ese caso, el código de registro que ya tienes es responsable de actualizar y activar el worker.

También puedes pasar `push.channelId` si Hellotext te proporcionó un ID específico de canal Push. De lo contrario, omítelo.

## 3. Agrega un botón de suscripción

Agrega los siguientes elementos donde tus visitantes administran las notificaciones:

```html
<button id="push-subscribe" type="button" disabled>Suscribirme a las notificaciones</button>
<button id="push-unsubscribe" type="button" disabled>Cancelar la suscripción</button>
<p id="push-status" role="status"></p>
```

Después de inicializar Hellotext, conecta el botón de suscripción:

```javascript
const subscribeButton = document.querySelector('#push-subscribe')
const unsubscribeButton = document.querySelector('#push-unsubscribe')
const pushStatus = document.querySelector('#push-status')

subscribeButton.disabled = !Hellotext.push
unsubscribeButton.disabled = !Hellotext.push

subscribeButton.addEventListener('click', async () => {
  if (!Hellotext.push) return

  try {
    const response = await Hellotext.push.subscribe()

    if (response?.succeeded) {
      pushStatus.textContent = 'Te suscribiste a las notificaciones.'
    } else if (response?.failed) {
      pushStatus.textContent = 'No pudimos completar la suscripción. Inténtalo de nuevo.'
    }
  } catch (error) {
    pushStatus.textContent = 'La suscripción no se completó. Revisa los permisos de notificaciones e inténtalo de nuevo.'
  }
})
```

Llama a `Hellotext.push.subscribe()` directamente desde el manejador del clic. No esperes a que termine otra operación asíncrona antes de llamarlo; el navegador puede necesitar el clic del visitante para mostrar la solicitud de permiso. El método también funciona cuando el permiso ya está concedido y reutiliza una suscripción existente de Hellotext cuando la hay.

Muestra la confirmación de suscripción solo cuando `response.succeeded` sea verdadero. La presencia de `Hellotext.push`, el permiso concedido en el navegador o una suscripción del navegador por sí solos no confirman que el registro en Hellotext haya sido exitoso. Si el método no devuelve una respuesta, no muestres un mensaje de éxito.

Cuando `Hellotext.push` no esté disponible, mantén los controles deshabilitados u ocúltalos. Puede no estar disponible porque el navegador no lo admite, la página lo desactiva o falta la configuración necesaria.

## 4. Agrega la acción para cancelar la suscripción

Agrega este manejador junto al de suscripción. Usa los mismos elementos de botón y estado del paso 3:

```javascript
unsubscribeButton.addEventListener('click', async () => {
  if (!Hellotext.push) return

  try {
    const response = await Hellotext.push.unsubscribe()

    if (response === null || response?.succeeded) {
      pushStatus.textContent = 'La suscripción a las notificaciones está cancelada.'
    } else if (response?.failed) {
      pushStatus.textContent = 'No pudimos cancelar la suscripción. Inténtalo de nuevo.'
    }
  } catch (error) {
    pushStatus.textContent = 'No pudimos cancelar la suscripción. Inténtalo de nuevo.'
  }
})
```

Un resultado `null` significa que no había una suscripción para eliminar, por lo que puedes confirmar que ya estaba cancelada. Ante una respuesta fallida o una solicitud rechazada, deja la acción disponible para volver a intentarlo. La ausencia de una respuesta no equivale a un resultado exitoso.

La cancelación se aplica a la suscripción del navegador actual. No revoca el permiso que el navegador concedió al sitio ni elimina las suscripciones de otros navegadores o dispositivos del visitante.

## 5. Verifica el flujo completo

1. Abre tu tienda publicada en un navegador compatible.
2. Selecciona **Suscribirme a las notificaciones** y completa la solicitud del navegador si aparece.
3. Confirma que la página muestra el mensaje de éxito correspondiente a `response.succeeded`.
4. Recarga la página y confirma que la inicialización no muestra errores del worker. Las suscripciones existentes de Hellotext se recuperan automáticamente.
5. Selecciona **Cancelar la suscripción** y espera la confirmación.
6. Selecciona **Suscribirme a las notificaciones** de nuevo para verificar que el visitante puede volver a suscribirse.

Estos pasos verifican la configuración de la suscripción. Para probar también la entrega, pide a Hellotext que coordine el envío de una notificación de prueba a tu navegador. Revisa que aparezca una sola vez y que al hacer clic abra la página correcta. La compatibilidad con imágenes y botones de acción depende del navegador y del sistema operativo; consulta [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) si el resultado varía entre dispositivos.

## Desactiva Push en una página específica

Agrega `push: false` a las opciones de inicialización que ya usa esa página:

```javascript
await Hellotext.initialize('BUSINESS_ID', { push: false })
```

Conserva las demás opciones de inicialización de la página. Esto hace que `Hellotext.push` no esté disponible en ella. No cancela las suscripciones anteriores; usa `Hellotext.push.unsubscribe()` mientras Push esté habilitado para eliminar la suscripción del navegador actual.

## Guías relacionadas

- [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %})
- [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %})
- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Referencia de Push en Hellotext.js](https://github.com/hellotext/hellotext.js/blob/main/docs/push.md)
