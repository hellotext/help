Las notificaciones push permiten que tu tienda llegue a los visitantes suscritos mediante avisos que muestra su navegador o dispositivo. Al seleccionar una notificación, el visitante abre el destino que incluiste, como un producto o una promoción.

Push está disponible en los planes **Pro** y **Enterprise**.

> **Shopify y VTEX instalan Push automáticamente.** Conecta tu tienda mediante la integración de Hellotext y completa la instalación en el sitio. No necesitas subir un archivo de service worker ni inicializar Hellotext.js por tu cuenta. Continúa con los controles de suscripción y la verificación que se explican abajo.

## 1. Elige cómo configurar tu tienda

| Tu tienda | Qué hacer |
| --- | --- |
| **Shopify** | Completa [Conecta Shopify]({% link _integrations/connect-shopify.md %}). La integración se encarga de instalar Push. |
| **VTEX** | Completa [Conecta VTEX]({% link _integrations/connect-vtex.md %}), incluida la instalación del píxel de Hellotext. La integración se encarga de instalar Push. |
| **Una tienda personalizada u otra plataforma** | Pide a tu desarrollador que siga [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}). |

Usa el negocio de Hellotext conectado a la tienda a la que quieres que se suscriban los visitantes. Haz las pruebas en el sitio HTTPS publicado que visitan tus clientes, en lugar de una vista previa o el editor del tema.

## 2. Completa la instalación automática en Shopify o VTEX

1. Abre el negocio correcto en Hellotext.
2. Ve a **Configuración > Integraciones** y comprueba si tu tienda ya está conectada.
3. Si no está conectada, sigue la [guía de conexión de Shopify]({% link _integrations/connect-shopify.md %}) o la [guía de conexión de VTEX]({% link _integrations/connect-vtex.md %}). Completa todos los pasos de instalación en el sitio que indica la guía.
4. Si conectaste tu tienda antes de que Push estuviera disponible, asegúrate de que la app o el píxel de Hellotext instalado esté actualizado. No necesitas eliminar y volver a conectar una integración que funciona.
5. Abre la tienda publicada y recárgala después de que la integración actualizada esté disponible.

La integración proporciona el worker de notificaciones y configura Hellotext.js para usarlo. Las actualizaciones posteriores se gestionan mediante la integración y el proceso de actualización de workers del navegador.

No hay una credencial de Push adicional que debas crear o pegar en la integración. Si la actualización de la app o del píxel todavía no llegó a la tienda publicada, espera a que la plataforma termine de aplicarla antes de probar. Consulta [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) si la configuración sigue sin estar disponible.

## 3. Configura una tienda personalizada

Omite esta sección si usas la instalación automática de Shopify o VTEX.

1. Confirma con soporte de Hellotext que Push esté habilitado para el negocio que vas a conectar.
2. Comparte con tu desarrollador la [guía de configuración de Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}).
3. Pídele que publique el worker de notificaciones en tu sitio, configure la inicialización existente de Hellotext.js y agregue los controles de suscripción.
4. Haz una prueba en la tienda publicada después de que esos cambios estén disponibles.

Si tu tienda todavía no está conectada a Hellotext, empieza por [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).

## 4. Ofrece una forma de suscribirse y cancelar la suscripción

Tu sitio necesita una acción visible, como **Suscribirme a las notificaciones**, y una forma de cancelar la suscripción. Si esos controles todavía no existen, pide a tu desarrollador que los conecte siguiendo los [pasos de suscripción y cancelación]({% link _developers/setup-push-with-hellotext-js.md %}). Esto también se aplica a las tiendas con instalación automática.

El visitante selecciona la acción de suscripción y permite las notificaciones cuando el navegador lo solicita. El sitio debe confirmar el éxito solo cuando la suscripción haya terminado. Instalar la integración no suscribe a los visitantes por sí solo.

La suscripción pertenece al navegador y dispositivo donde el visitante la creó. Prueba cada navegador o dispositivo por separado: permitir notificaciones en uno no suscribe a otro.

## 5. Verifica la configuración

Usa un navegador y dispositivo en el que puedas recibir notificaciones:

1. Abre la tienda publicada y selecciona su acción de suscripción a notificaciones.
2. Permite las notificaciones si el navegador lo solicita y espera a que el sitio confirme la suscripción.
3. Anota la URL de la tienda, el navegador, el dispositivo y la hora aproximada de la prueba.
4. Contacta a soporte de Hellotext para coordinar una notificación de prueba a esa suscripción. Comparte esos datos para que el equipo pueda identificarla.
5. Confirma que aparezca la notificación y que, al seleccionarla, se abra la página esperada.
6. Usa la acción para cancelar la suscripción en el sitio y espera su confirmación. Si necesitas repetir la prueba, vuelve a suscribirte desde la misma página.

Empieza con una notificación de texto sencilla. Las imágenes y los botones pueden mostrarse de manera diferente según el navegador y el sistema operativo; que falte una imagen no significa por sí solo que haya fallado la entrega.

Si falla la suscripción o la prueba de entrega, sigue [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}).

## Guías relacionadas

- [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta VTEX]({% link _integrations/connect-vtex.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Contacta a soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %})
