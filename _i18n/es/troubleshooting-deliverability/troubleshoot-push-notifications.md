Usa esta guía cuando un cliente no puede suscribirse a las notificaciones push de tu tienda, una notificación no llega o su apariencia cambia entre navegadores.

Para las alertas que recibe tu equipo sobre conversaciones en Hellotext, consulta [Notificaciones del navegador para Inbox]({% link _team/inbox-browser-notifications.md %}).

## Antes de empezar

Empieza con un dispositivo y un navegador de prueba. Anota la URL de la tienda, las versiones del navegador y del sistema operativo, y la hora del problema. Si llegó una notificación, toma una captura antes de cerrarla.

Con un canal activo configurado para el origen de la tienda, puedes recoger y gestionar suscripciones en cualquier plan. **Enviar** notificaciones requiere **Pro o Enterprise**, además de cumplir las condiciones y límites de envío. Crear un canal personalizado o configurar Smart Alert en la interfaz también depende del plan y tus permisos.

Shopify y VTEX proporcionan los componentes mediante sus integraciones: comprueba que la instalación actual esté aplicada en la tienda publicada. Si usas esas integraciones, no necesitas publicar un archivo service worker ni inicializar Hellotext.js manualmente. Consulta el proceso completo en [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %}).

## 1. Una notificación no llega

Revisa estos pasos en orden:

1. **Abre la tienda publicada en el dispositivo de prueba.** Usa el mismo perfil del navegador y la misma dirección de la tienda donde te suscribiste. Suscribirte en un navegador o dispositivo no suscribe tus otros navegadores o dispositivos.
2. **Confirma que completaste la suscripción a las notificaciones de la tienda.** Que el navegador permita notificaciones es solo una parte del proceso: la tienda también debe terminar de suscribir ese navegador a Hellotext. Si el proceso mostró un error o nunca confirmó que terminó, pide que se revisen el registro en Hellotext y el estado local antes de repetirlo.
3. **Revisa el permiso de notificaciones del sitio.** Si antes las bloqueaste, cambia ese permiso en el navegador antes de volver a suscribirte desde la tienda. La tienda no puede anular un permiso bloqueado.
4. **Revisa la configuración de notificaciones del dispositivo.** Permite las notificaciones del navegador o de la aplicación web instalada. Revisa los modos de concentración, No molestar y el centro de notificaciones: una notificación puede haber llegado sin mostrar un aviso en pantalla.
5. **Revisa los cambios recientes del navegador.** Si borraste los datos del sitio, eliminaste la aplicación web instalada o cambiaste de perfil del navegador, abre la tienda y vuelve a completar la suscripción. Usa una ventana normal del navegador para la prueba.
6. **Confirma la prueba de entrega.** Pide a [Soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) que revise la suscripción y coordine una prueba controlada a ese navegador. Anota la hora y si aparece en el centro de notificaciones.

Distingue tres comprobaciones: **permiso del navegador**, **suscripción de ese navegador registrada en Hellotext** y **recepción del aviso en el dispositivo**. Una invitación visible, un clic en Activar alertas, un permiso concedido o la desaparición de la invitación no confirma los tres pasos. La información de entrega de Hellotext indica que el servicio Push aceptó la solicitud; no demuestra que el sistema haya mostrado una notificación ni que el cliente la haya leído.

Si usas **Smart Alert** y no aparece la invitación, revisa que la misión esté guardada y habilitada y que la sección de esa página esté habilitada y solicitada por la instalación. En una integración personalizada, el SDK no detecta automáticamente si la página es una colección o un producto. La invitación tampoco se muestra con permiso denegado o una suscripción local existente. **Ahora no** aplaza la invitación siete días tras el primer rechazo y treinta tras los siguientes; si no puede guardar el historial, el aplazamiento dura sólo en la página actual. No borres datos ni solicites permisos repetidamente para evitar la decisión del visitante.

Esta vista previa real de la plantilla de **colección** es una demostración independiente, sin guardar ni activar. Muestra **Activar alertas** y **Ahora no** completos; no es un permiso del navegador, una suscripción registrada ni una notificación entregada, y no demuestra seguimiento automático de stock.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Vista previa real de Smart Alert para colección con Activar alertas y Ahora no completos.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 514px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/setup-push-notifications/alert-es-mobile.png 2x" width="732" height="692" />
        <img src="/images/integrations/setup-push-notifications/alert-es.png" srcset="/images/integrations/setup-push-notifications/alert-es.png 2x" style="width: auto; margin: 0 auto;" width="992" height="520" loading="lazy" decoding="async" alt="Vista previa real de Smart Alert para colección con Activar alertas y Ahora no completos." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Plantilla sin guardar ni activar; ninguna solicitud de permiso, suscripción o envío realizado.</figcaption>
</figure>

Si la suscripción dio una respuesta incierta, pide que se comprueben el registro del servidor y el estado local antes de repetir operaciones. Una suscripción local puede existir aunque falle su registro en Hellotext. Una suscripción caducada o rechazada por el servicio Push deja de ser un destino utilizable; cambiar el permiso por sí solo no repara ese registro.

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

Compara el **origen** configurado del canal con el de la tienda publicada: protocolo, dominio y puerto. El editor del tema, una vista previa u otro subdominio pueden tener permisos y suscripciones diferentes. La **URL del worker** es otro dato: incluye la ruta del archivo JavaScript en ese mismo origen y debe tener el alcance adecuado para la página.

El formulario siguiente muestra **https://shop.example.test**, un origen ficticio escrito sin guardar en Conecta tu tienda a Push. Su ayuda separa el origen de una página concreta. No se creó un canal ni se publicó ni se registró un worker para esta demostración; no recrees un canal existente para investigar un fallo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo real URL de la tienda con origen ficticio HTTPS y ayuda completa de formato.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 550px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/setup-push-notifications/origin-es-mobile.png 2x" width="764" height="332" />
        <img src="/images/integrations/setup-push-notifications/origin-es.png" srcset="/images/integrations/setup-push-notifications/origin-es.png 2x" style="width: auto; margin: 0 auto;" width="1064" height="292" loading="lazy" decoding="async" alt="Campo real URL de la tienda con origen ficticio HTTPS y ayuda completa de formato." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador sin guardar; Continuar crearía el canal, no una suscripción o entrega.</figcaption>
</figure>

Esperar la inicialización de Hellotext.js no garantiza que el worker haya terminado de activarse: su preparación continúa en segundo plano y la suscripción debe esperar su resultado. Si ya hay un worker, integra los manejadores compatibles; no reemplaces a ciegas una suscripción perteneciente a otra aplicación. Un aviso de worker no disponible, instalación fallida o suscripción de otra aplicación identifica pasos diferentes. Comparte el texto exacto y sigue la guía para desarrolladores.

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

Confirma también si se trata de una sola entrega mostrada dos veces o de dos envíos distintos. El worker actual de la integración reconoce los mensajes de Hellotext y detiene los manejadores posteriores para esa entrega; un manejador que ya se ejecutó antes puede haber mostrado otro aviso. Tu desarrollador debe revisar el orden y la compatibilidad de los manejadores. El título por sí solo no identifica una entrega.

No elimines otros servicios de la tienda ni sobrescribas el worker de la plataforma para investigar duplicados.

## 5. Al hacer clic se abre la página equivocada

Anota el destino esperado y la URL que se abrió. Comprueba si ocurre lo mismo al hacer clic en la notificación y, cuando estén disponibles, en sus botones de acción.

Para una implementación personalizada, pide a tu desarrollador que revise el destino de la notificación y el código que procesa el clic. Para una tienda integrada, envía el ejemplo a Soporte. Mostrar un botón de acción personalizado no le asigna automáticamente un destino distinto. El destino debe estar asociado a esa acción; el clic general utiliza el destino principal. El worker vigente puede volver a enfocar una ventana que ya tenga esa URL abierta o abrir otra. Si falta un destino utilizable, puede abrir el inicio del sitio. Revisa también los redireccionamientos del link y conserva ambos destinos para investigar, sin deducir el resultado de un botón visible.

## Cuándo contactar a Soporte

Incluye:

- Tu negocio de Hellotext y la URL de la tienda publicada.
- Si usas Shopify, VTEX o una instalación personalizada.
- El navegador, sistema operativo y dispositivo de la prueba.
- La hora aproximada y la zona horaria.
- Si la suscripción terminó y si llegó alguna notificación.
- El aviso exacto, una captura o el destino inesperado.
- Cualquier actualización reciente de la integración, cambio de dominio o borrado de datos del navegador.

Comparte el ID público del negocio, el paso que falló y las diferencias entre permiso, registro y recepción. Oculta tokens privados, endpoints y claves de suscripción en capturas o registros; no son necesarios para el resumen inicial.

Consulta [Contacta a Soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) para ver las opciones de contacto.

## Guías relacionadas

- [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %})
- [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Notificaciones del navegador para Inbox]({% link _team/inbox-browser-notifications.md %})
