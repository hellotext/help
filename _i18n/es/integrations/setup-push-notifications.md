Las notificaciones push permiten que tu tienda llegue a los visitantes suscritos mediante avisos que muestra su navegador o dispositivo. Al seleccionar una notificación, el visitante abre el destino que incluiste, como un producto o una promoción.

Separa **recoger suscripciones** de **enviar notificaciones**. Con un canal activo configurado para el origen de tu sitio, puedes recoger, actualizar y gestionar suscripciones en cualquier plan. El envío requiere **Pro** o **Enterprise** y está sujeto a la disponibilidad y límites de la plataforma. La creación de un canal personalizado y la configuración de Smart Alert desde la interfaz también dependen del plan y tus permisos; confirma con soporte cómo habilitarlos si no aparecen disponibles. Una instalación técnica no habilita por sí sola el envío.

> **Shopify y VTEX instalan Push mediante sus integraciones.** Conecta tu tienda con Hellotext y completa la instalación en el sitio publicado. No necesitas subir un archivo de service worker ni inicializar Hellotext.js por tu cuenta. Continúa con los controles de suscripción y la verificación que se explican abajo.

## 1. Elige cómo configurar tu tienda

| Tu tienda | Qué hacer |
| --- | --- |
| **Shopify** | Completa [Conecta Shopify]({% link _integrations/connect-shopify.md %}). La integración proporciona la configuración de Push; comprueba también su activación en el tema publicado. |
| **VTEX** | Completa [Conecta VTEX]({% link _integrations/connect-vtex.md %}), incluida la instalación del píxel de Hellotext y el dominio de la tienda. |
| **Una tienda personalizada u otra plataforma** | Pide a tu desarrollador que siga [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}). |

Usa el negocio conectado a la tienda donde los visitantes se suscribirán. En **Configuración > General**, revisa su nombre e **ID del negocio**. Esta cabecera pertenece al negocio ficticio llamado **Enterprise**, con ID público **4ONLdN32**; el nombre no indica el plan. El ID público identifica el negocio para Hellotext.js y no es un token privado de API.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cabecera real de General con negocio ficticio Enterprise e ID público 4ONLdN32.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Cabecera real de General con negocio ficticio Enterprise e ID público 4ONLdN32." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Identidad del negocio de demostración; no confirma una instalación o suscripción Push.</figcaption>
</figure>

Verifica el origen HTTPS publicado que usarán los visitantes: protocolo, dominio y puerto cuando corresponda. Una vista previa, el editor del tema u otro subdominio pueden tener un origen distinto, con otros permisos y suscripciones. Haz las comprobaciones que crean estado sólo en un entorno autorizado y con participantes de prueba permitidos.

## 2. Completa la instalación automática en Shopify o VTEX

1. Abre el negocio correcto en Hellotext.
2. Ve a **Configuración > Integraciones** y comprueba si tu tienda ya está conectada.
3. Si no está conectada, sigue la [guía de conexión de Shopify]({% link _integrations/connect-shopify.md %}) o la [guía de conexión de VTEX]({% link _integrations/connect-vtex.md %}). Completa los pasos de instalación en el sitio que indica la guía.
4. Comprueba que la app o el píxel esté actualizado. En Shopify, el menú de la integración ofrece **Habilitar notificaciones Push**, que abre la configuración de la app en el editor del tema: revisa su activación en el tema publicado. En VTEX, verifica el dominio seleccionado y el píxel instalado. No elimines y vuelvas a conectar una integración que funciona para intentar actualizarla.
5. Abre la tienda publicada y recárgala después de que la configuración actualizada esté disponible.

La integración proporciona el worker de notificaciones y configura Hellotext.js para usarlo. El navegador debe poder cargar y activar ese worker antes de suscribirse; una conexión visible en Hellotext no demuestra que esos pasos se hayan completado en el sitio.

No hay una credencial de Push adicional que debas crear o pegar en la integración. Si la actualización todavía no llegó a la tienda publicada, espera a que la plataforma termine de aplicarla antes de probar. Consulta [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}) si la configuración sigue sin estar disponible.

## 3. Configura una tienda personalizada

Omite esta sección si usas la instalación automática de Shopify o VTEX.

1. Confirma con soporte que el negocio tiene el canal y los permisos necesarios. Si ya existe una configuración para ese origen, revisa sus instrucciones antes de crear otra.
2. Para un canal nuevo permitido por tu plan y rol, abre **Configuración > Integraciones**, el catálogo de integraciones y **Notificación push**. En **Conecta tu tienda a Push**, ingresa la **URL de la tienda** con HTTPS, sin ruta, parámetros, fragmentos ni credenciales. **Continuar** guarda el canal para ese origen y abre las instrucciones; no instala el worker en tu sitio.
3. Comparte esas instrucciones y la [guía de configuración de Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}) con tu desarrollador. Debe publicar el worker en el mismo origen HTTPS, servirlo como JavaScript y comprobar su alcance. Si ya existe un worker o una suscripción de otra aplicación, debe integrar los manejadores compatibles sin reemplazar a ciegas la configuración existente.
4. Incorpora las opciones de Push en la inicialización existente de Hellotext.js, con el ID público del negocio y el canal correspondiente cuando se indique. Esperar la inicialización del SDK y comprobar la preparación del worker son pasos distintos. El archivo público no necesita un token privado de API. Agrega los controles de suscripción y cancelación, y verifica los cambios publicados antes de invitar visitantes.

El formulario siguiente muestra **https://shop.example.test**, un origen ficticio escrito sin guardar. No se creó un canal ni se publicó o registró un worker para esta demostración.

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

Si tu tienda todavía no está conectada a Hellotext, empieza por [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).

## 4. Ofrece una forma de suscribirse y cancelar la suscripción

Tu sitio necesita una invitación visible y una forma de cancelar la suscripción. Puedes configurar **Smart Alert** cuando esté habilitado para tu negocio, o pedir a tu desarrollador controles propios siguiendo los [pasos de suscripción y cancelación]({% link _developers/setup-push-with-hellotext-js.md %}). Esto también se aplica a las tiendas con instalación automática.

En Smart Alert, revisa **Apariencia** y **Personalización**, con contenido para inicio, colección y detalle de producto. Habilita las secciones que usarás y sigue las instrucciones de instalación: guardar o ver el preview no confirma que aparezca en la tienda. En una integración propia, el SDK no detecta automáticamente el tipo de página; el desarrollador debe solicitar la sección habilitada que corresponda según la [referencia actual de Push y Smart Alert](https://github.com/hellotext/hellotext.js/blob/main/docs/push.md).

Esta vista previa real de la plantilla, sin guardar ni activar, muestra la invitación de **colección**. **Activar alertas** expresa la intención de suscribirse; **Ahora no** rechaza la invitación. El preview no es una solicitud de permiso del navegador ni una notificación entregada, y no demuestra seguimiento automático de stock o de esa colección.

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

En el sitio instalado, el clic del visitante inicia la solicitud de permiso cuando corresponde y el registro de la suscripción. Respeta su decisión: si denegó el permiso, no lo solicites repetidamente. Smart Alert no aparece para una sección deshabilitada, una suscripción ya existente o un permiso denegado. **Ahora no** aplaza la invitación siete días tras el primer rechazo y treinta tras los siguientes, con historial del navegador para ese negocio y sitio; si el almacenamiento no está disponible, ese aplazamiento sólo dura en la página actual.

Confirma el éxito después de comprobar el resultado del registro en Hellotext, no sólo el clic, el permiso concedido, la desaparición de la invitación o una suscripción local. La aceptación de Smart Alert ocurre antes del resultado del permiso y del registro. Si hay un fallo de red o de preparación, el sitio debe mostrar el estado real y permitir resolverlo sin anunciar éxito.

La suscripción pertenece al navegador, dispositivo y origen donde se creó. Al cancelar, el SDK primero deshabilita el registro en Hellotext y luego retira la suscripción local; si falla la solicitud al servidor, conserva la suscripción para poder reintentar. Una cancelación confirmada no revoca el permiso del navegador, no cancela otros dispositivos y no retira avisos ya entregados. Desactivar Push en la configuración de una página tampoco da de baja una suscripción existente.

## 5. Verifica la configuración

Prepara una comprobación autorizada y aislada con un navegador y dispositivo compatibles. Acuerda el destino permitido y el alcance antes de crear una suscripción o enviar; no uses toda la audiencia para probar.

1. Comprueba el negocio, origen HTTPS, instalación publicada y worker activo. Revisa por separado si la invitación o control de suscripción se muestra donde corresponde; su presencia no demuestra permiso o registro.
2. Con la persona de prueba autorizada, usa la acción de suscripción. Comprueba el permiso del navegador y espera la confirmación del registro en Hellotext. Instalar la integración no suscribe automáticamente a los visitantes.
3. Anota URL, navegador, dispositivo, fecha, hora y zona horaria. Separa estos datos de los clientes y resultados reales.
4. Coordina con soporte una notificación de prueba limitada a esa suscripción, sólo si el envío está habilitado por el plan y autorizado. Recoger una suscripción en un plan sin envío no permite realizar esta prueba de entrega.
5. Comprueba por separado la aceptación de la solicitud, la recepción del aviso y el destino al seleccionarlo. Una solicitud aceptada no garantiza que el dispositivo lo haya mostrado; revisa también los ajustes del navegador y sistema operativo.
6. Usa la acción de cancelación del sitio y espera su confirmación. Comprueba el resultado antes de repetir una operación con respuesta incierta. Si vas a suscribirte de nuevo, hazlo con autorización en el mismo origen y navegador, respetando el permiso vigente.

Empieza con una notificación de texto sencilla. Las imágenes y los botones pueden mostrarse de manera diferente según el navegador y el sistema operativo; que falte una imagen no significa por sí solo que haya fallado la entrega.

Si falla la suscripción o la prueba de entrega, sigue [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %}). Comparte con soporte el ID público del negocio, origen, paso, aviso exacto y hora de la prueba, sin tokens privados ni endpoints o claves de suscripción.

## Guías relacionadas

- [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %})
- [Soluciona problemas con las notificaciones push]({% link _troubleshooting-deliverability/troubleshoot-push-notifications.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta VTEX]({% link _integrations/connect-vtex.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Contacta a soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %})
