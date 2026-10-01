Usa esta guía cuando un cliente no puede suscribirse a las notificaciones push de tu tienda, una notificación no llega o su apariencia cambia entre navegadores.

Para las alertas que recibe tu equipo sobre conversaciones en Hellotext, consulta [Notificaciones del navegador para Inbox]({% link _team/inbox-browser-notifications.md %}).

## Antes de empezar

Empieza con un dispositivo y un navegador de prueba. Anota la URL de la tienda, las versiones del navegador y del sistema operativo, y la hora del problema. Si llegó una notificación, toma una captura antes de cerrarla.

Push está disponible en **Pro y Enterprise**. Las conexiones con Shopify y VTEX instalan automáticamente los componentes necesarios. Si usas estas integraciones, no necesitas publicar un archivo service worker ni inicializar Hellotext.js manualmente. Consulta el proceso completo en [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %}).

## 1. Una notificación no llega

Revisa estos pasos en orden:

1. **Abre la tienda publicada en el dispositivo de prueba.** Usa el mismo perfil del navegador y la misma dirección de la tienda donde te suscribiste. Suscribirte en un navegador o dispositivo no suscribe tus otros navegadores o dispositivos.
2. **Confirma que completaste la suscripción a las notificaciones de la tienda.** Que el navegador permita notificaciones es solo una parte del proceso: la tienda también debe terminar de suscribir ese navegador a Hellotext. Si el proceso mostró un error o nunca confirmó que terminó, recarga la tienda y vuelve a intentarlo una vez.
3. **Revisa el permiso de notificaciones del sitio.** Si antes las bloqueaste, cambia ese permiso en el navegador antes de volver a suscribirte desde la tienda. La tienda no puede anular un permiso bloqueado.
4. **Revisa la configuración de notificaciones del dispositivo.** Permite las notificaciones del navegador o de la aplicación web instalada. Revisa los modos de concentración, No molestar y el centro de notificaciones: una notificación puede haber llegado sin mostrar un aviso en pantalla.
5. **Revisa los cambios recientes del navegador.** Si borraste los datos del sitio, eliminaste la aplicación web instalada o cambiaste de perfil del navegador, abre la tienda y vuelve a completar la suscripción. Usa una ventana normal del navegador para la prueba.
6. **Confirma la prueba de entrega.** Pide a [Soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) que revise la suscripción y coordine una prueba controlada a ese navegador. Anota la hora y si aparece en el centro de notificaciones.

En **iPhone y iPad**, Web Push requiere iOS o iPadOS 16.4 o posterior y una aplicación web agregada a la pantalla de inicio. Abre la tienda desde ese icono y completa la suscripción allí. Si se abre como una pestaña normal, pide a tu desarrollador que revise la configuración de la aplicación web. Consulta [los requisitos de WebKit](https://webkit.org/blog/13878/web-push-for-web-apps-on-ios-and-ipados/).

## 2. La configuración falla o aparece un aviso sobre el service worker

Un service worker es un pequeño script que recibe las notificaciones de tu tienda en segundo plano. Un aviso como `Push service worker is not available` significa que el navegador no pudo obtener un worker activo para Push.

### Shopify o VTEX

1. Confirma que la tienda está conectada al negocio correcto de Hellotext.
2. Confirma que la integración actual de Hellotext está instalada y habilitada en la tienda publicada.
3. Después de actualizar la integración, vuelve a abrir o recarga la tienda publicada antes de intentar suscribirte otra vez.
4. Si el aviso continúa, envía a Soporte la URL de la tienda y el texto exacto del aviso.

La integración administra el worker. No reemplaces el worker de la plataforma ni agregues otra instalación manual para resolver este aviso.

### Un sitio personalizado con Hellotext.js

Pide a tu desarrollador que siga [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}) y revise:

1. El sitio publicado usa HTTPS.
2. La URL configurada del worker sirve el archivo JavaScript desde el mismo origen que la tienda, sin una página de inicio de sesión ni una respuesta de error.
3. El worker está activo e incluye el código de Hellotext que recibe las notificaciones.
4. La página inicializa Hellotext.js con la URL correcta del worker y espera a que termine la inicialización antes de ofrecer la suscripción.

Incluye el error exacto en lugar de reinstalar repetidamente la integración o borrar los datos del navegador.

## 3. La notificación llega sin imagen o sin botones

El navegador y el sistema operativo controlan la apariencia de las notificaciones. Recibir el texto sin todos los elementos visuales no significa, por sí solo, que la entrega falló.

| Dónde haces la prueba | Qué esperar |
| --- | --- |
| Safari | No admite imágenes grandes ni botones de acción personalizados en las notificaciones. |
| Chrome y otros navegadores Chromium que usan las notificaciones nativas de macOS | Las imágenes grandes se ignoran. Las acciones pueden aparecer al pasar el cursor o en el menú **Más** de la notificación. |
| Otras combinaciones de navegador y dispositivo | La apariencia y la cantidad de acciones visibles varían. Expande la notificación y prueba el navegador y dispositivo que usan tus clientes. |

Consulta [las opciones de notificación de Safari](https://github.com/WebKit/WebKit/blob/main/Source/WebCore/Modules/notifications/NotificationOptions.idl) y [el comportamiento de Chrome en macOS](https://developer.chrome.com/blog/native-mac-os-notifications).

Si falta una imagen en un navegador que la admite, pide a tu desarrollador que confirme que su URL carga sin iniciar sesión. Asegúrate de que el título y el cuerpo sean suficientes para entender el mensaje, y comprueba que al hacer clic se abra la página esperada.

## 4. Aparecen dos notificaciones por un mismo mensaje

Una notificación con el contenido completo y otra solo con el título pueden indicar que la tienda muestra dos veces la misma entrega. Esto puede pasar cuando dos partes del código procesan el mismo mensaje.

1. Anota si ambas notificaciones llegan al mismo tiempo y tienen el mismo título.
2. Toma una captura de ambas, incluidas las diferencias de texto o botones.
3. Para Shopify o VTEX, confirma que está instalada la integración actual. Luego vuelve a abrir la tienda publicada y repite una prueba controlada.
4. Si continúa, contacta a Soporte. Para un sitio personalizado, pide a tu desarrollador que revise que cada mensaje de Hellotext se muestre una sola vez, siguiendo [la guía para desarrolladores]({% link _developers/setup-push-with-hellotext-js.md %}).

No elimines otros servicios de la tienda ni sobrescribas el worker de la plataforma para investigar duplicados.

## 5. Al hacer clic se abre la página equivocada

Anota el destino esperado y la URL que se abrió. Comprueba si ocurre lo mismo al hacer clic en la notificación y, cuando estén disponibles, en sus botones de acción.

Para una implementación personalizada, pide a tu desarrollador que revise el destino de la notificación y el código que procesa el clic. Para una tienda integrada, envía el ejemplo a Soporte. Mostrar un botón de acción personalizado no le asigna automáticamente un destino distinto.

## Cuándo contactar a Soporte

Incluye:

- Tu negocio de Hellotext y la URL de la tienda publicada.
- Si usas Shopify, VTEX o una instalación personalizada.
- El navegador, sistema operativo y dispositivo de la prueba.
- La hora aproximada y la zona horaria.
- Si la suscripción terminó y si llegó alguna notificación.
- El aviso exacto, una captura o el destino inesperado.
- Cualquier actualización reciente de la integración, cambio de dominio o borrado de datos del navegador.

Consulta [Contacta a Soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) para ver las opciones de contacto.

## Guías relacionadas

- [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %})
- [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Notificaciones del navegador para Inbox]({% link _team/inbox-browser-notifications.md %})
