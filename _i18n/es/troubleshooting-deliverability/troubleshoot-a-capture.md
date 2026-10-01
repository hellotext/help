Usa esta guía cuando una misión de captura no aparece en el producto, no carga para el cliente, no registra la información enviada o no inicia la acción configurada después de la captura.

Encuentra las herramientas de captura en **Misiones > Explorar misiones**, dentro del grupo **Captura**. Popup de Sitio Web, Formulario de Sitio Web, Widget de Webchat, códigos QR, links compartibles, Impulsor de Suscriptores y Recolector de Propiedades tienen recorridos diferentes. El opt-in de checkout se configura mediante la integración de eCommerce correspondiente; no tiene una tarjeta propia en ese grupo.

## Identifica dónde se detuvo

Antes de cambiar la configuración, identifica la última etapa que puedas comprobar. Para reproducir el recorrido, usa tus propios datos o un perfil interno autorizado y registra qué enviaste y a qué hora.

| Etapa | Qué observas |
| --- | --- |
| **Disponibilidad** | La misión no aparece en **Explorar misiones**, figura como **A solicitud** o requiere otro plan. |
| **Carga** | La captura existe, pero no aparece en el sitio, checkout o canal esperado. |
| **Interacción** | La captura aparece, pero no abre, no avanza o no permite enviar. |
| **Verificación** | El envío se recibió, pero una identidad todavía debe verificarse o procesarse. |
| **Perfil del cliente** | No encuentras los datos en el perfil o identificador esperado. |
| **Acción posterior** | El perfil se actualizó, pero no llegó un cupón, no comenzó una ruta o no se envió un mensaje. |

Guarda la evidencia de cada etapa por separado. Un preview, una respuesta de red y un perfil actualizado no prueban por sí solos consentimiento ni entrega. Si el envío quedó incierto por un error de red, revisa los registros existentes antes de repetirlo: un nuevo intento puede crear otra interacción.

## Si la misión no está disponible

1. Abre **Misiones** y haz clic en **Explorar misiones**.
2. Busca el grupo **Captura**. Si usas el filtro de herramientas incluidas en tu plan, revisa también el catálogo completo.
3. Confirma la disponibilidad para tu negocio, plan y permisos.
4. Si aparece como **A solicitud** o deshabilitada, revisa el motivo indicado y consulta con tu equipo de Hellotext cuando corresponda.

Las tarjetas siguientes identifican Popup y Formulario. Son un ejemplo del catálogo, no una instalación ni una captura habilitada; en pantallas pequeñas se muestra la tarjeta del formulario.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tarjetas Popup y Formulario del catálogo de escritorio; vista estrecha de Formulario.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-es.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/es/catalog-desktop-row.png" srcset="/images/captures/forms/es/catalog-desktop-row.png 2x" width="1632" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tarjetas Popup y Formulario del catálogo de escritorio; vista estrecha de Formulario." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Tarjetas Popup y Formulario del catálogo de escritorio; vista estrecha de Formulario.</figcaption>
</figure>

Revisa el estado de la herramienta concreta: guardar un borrador no demuestra que esté publicado. Un popup debe estar publicado y visible; Webchat debe estar habilitado e instalado. Para un formulario, distingue su enlace alojado del snippet que colocaste en tu sitio.

## Si un popup o Webchat no aparece

Revisa en este orden:

1. Confirma la publicación o habilitación de la herramienta y que se hayan guardado los cambios que esperas ver.
2. Confirma que la integración compatible, el plugin o Hellotext.js cargue en la página real.
3. Si la instalación es manual, compara el código del sitio con el actual generado por Hellotext, incluidos el negocio y el identificador del widget. La inicialización del SDK es asíncrona; cargar el archivo JavaScript no demuestra que el widget esté listo.
4. Revisa el dominio, la URL exacta y el contenedor de instalación.
5. Para Popup, revisa **Ajustes > Mostrar en** y la opción de burbuja. Ese panel no ofrece un selector de demora.
6. Para Webchat, revisa la apertura al hacer clic o al cargar, la demora y los límites de primera visita y sesión.
7. Compara una ventana privada y un teléfono real para separar el estado previo del navegador de un problema de instalación.
8. Revisa si estilos, banners de consentimiento u otros elementos del sitio ocultan la captura.

Este popup ficticio permanece oculto y en borrador. **Móvil y Escritorio** y **No mostrar burbuja** muestran los controles que debes revisar; no prueban que aparezca en una tienda.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Ajustes de un popup ficticio: Móvil y Escritorio, No mostrar burbuja seleccionado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 428px; width: fit-content; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/website-popup/settings-es.png" srcset="/images/captures/website-popup/settings-es.png 2x" width="820" height="744" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Ajustes de un popup ficticio: Móvil y Escritorio, No mostrar burbuja seleccionado." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ajustes de un popup ficticio: Móvil y Escritorio, No mostrar burbuja seleccionado.</figcaption>
</figure>

El ejemplo independiente de Webchat tiene apertura automática después de cinco segundos y ambos límites seleccionados, sin guardar ni habilitar. La vista estrecha enfoca los dos límites. **Solo en la primera visita** se recuerda entre visitas; **Una vez por sesión** usa el estado de la sesión del navegador. Estos límites afectan la apertura automática, no garantizan que un clic manual falle.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Apertura de Webchat con cinco segundos y ambos límites; vista estrecha de los límites.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 546px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/behavior-mobile-es.png 2x" width="720" height="228" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/behavior-es.png" srcset="/images/captures/webchat-widget/behavior-es.png 2x" width="1056" height="774" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Apertura de Webchat con cinco segundos y ambos límites; vista estrecha de los límites." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Apertura de Webchat con cinco segundos y ambos límites; vista estrecha de los límites.</figcaption>
</figure>

Para el teaser de Impulsor de Suscriptores, **Widget de Webchat** e **Impulsor de Suscriptores** deben estar habilitados y la opción de teaser del Impulsor debe permitirlo. La sesión y el estado del cliente también importan: una invitación ya consumida o un cliente ya suscrito pueden seguir otro recorrido. El teaser configurado de Webchat y la invitación del Impulsor son controles distintos; la habilitación por sí sola no garantiza que aparezca una invitación.

## Si un formulario no carga

Primero abre el enlace alojado del mismo formulario sin enviarlo.

- Si carga allí, compara el identificador del snippet, el contenedor y los estilos o scripts de la página donde lo integraste.
- Si tampoco carga allí, revisa que el enlace y el formulario correspondan al negocio correcto y comprueba su configuración. Los campos requeridos explican errores al enviar; su presencia no demuestra un fallo de carga.

El formulario ficticio siguiente es un preview de un borrador sin envíos. Permite comparar el encabezado, campo Teléfono, botón y aviso de consentimiento SMS con lo que debería cargar. No documenta una publicación, verificación ni suscripción.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Preview de un formulario ficticio con Teléfono y consentimiento SMS, sin envío.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 490px; width: fit-content; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/preview.png" srcset="/images/captures/forms/ui-refresh/es/preview.png 2x" width="944" height="780" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Preview de un formulario ficticio con Teléfono y consentimiento SMS, sin envío." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Preview de un formulario ficticio con Teléfono y consentimiento SMS, sin envío.</figcaption>
</figure>

Para un formulario integrado, confirma que el snippet actual esté presente y que Hellotext.js se haya inicializado. En el SDK publicado, `forms:collected` indica que la colección obtuvo las definiciones; no prueba que el formulario esté montado, enviado o verificado. `form:completed` se emite tras aceptar el envío en el navegador y también puede emitirse al restaurar una finalización guardada localmente. No confirma la verificación del teléfono o email ni la actualización posterior del perfil. Revisa esas etapas en Hellotext por separado.

## Si un código QR o link no registra la suscripción

Revisa la versión final desde un teléfono y confirma el canal, número, mensaje y referencia generada. Una selección de número predeterminado en el editor no basta: comprueba el destino del QR o link que estás usando.

En este ejemplo ficticio del selector de QR, **SMS** está seleccionado y **WhatsApp** no está disponible para la cuenta. El formulario no se guardó: no muestra un canal conectado, un escaneo ni una suscripción.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selector QR ficticio con SMS seleccionado y WhatsApp deshabilitado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 678px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/qr-codes/type-es-mobile.png 2x" width="740" height="1500" />
        <img class="ht-editorial-visual__image" src="/images/captures/qr-codes/type-es.png" srcset="/images/captures/qr-codes/type-es.png 2x" width="1320" height="1310" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Selector QR ficticio con SMS seleccionado y WhatsApp deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selector QR ficticio con SMS seleccionado y WhatsApp deshabilitado.</figcaption>
</figure>

Abrir el código QR o link no completa la suscripción. El cliente debe enviar el mensaje prellenado desde SMS o WhatsApp, conservando la referencia. Hellotext debe recibir y procesar ese mensaje y reconocer la captura correspondiente. Un mensaje que pierde la referencia puede llegar como conversación sin atribuirse a esa captura.

Si el mensaje no sale del teléfono o no llega a Hellotext, revisa el canal y el número. Si llegó, compara su texto y referencia con la versión final antes de crear otro QR o repetir el envío. La suscripción registrada y el seguimiento configurado son pasos distintos.

## Si el opt-in de checkout no registra al cliente

Confirma que:

- la integración de eCommerce esté conectada y sincronizando los pedidos y perfiles que esperas;
- la opción de consentimiento esté visible en el checkout publicado;
- el cliente haya seleccionado la opción correspondiente;
- la plataforma haya guardado ese consentimiento y la integración lo haya recibido; y
- revises el estado y el canal correctos en Hellotext.

Crear un perfil a partir de una compra no demuestra permiso para marketing. La importación de perfiles, el estado de suscripción y el consentimiento para un destino concreto pueden tener reglas distintas según la integración. Compara los datos de origen con los de Hellotext; no deduzcas consentimiento SMS de una opción de email ni lo inverso.

## Si los datos no aparecen en el perfil del cliente

1. Busca primero el envío y el perfil existente con el identificador y la hora que registraste. Repite el recorrido con datos propios o internos autorizados solo después de aclarar un resultado incierto.
2. Comprueba los campos obligatorios y los errores devueltos; un botón de éxito visual no reemplaza esa comprobación.
3. Si el flujo pide verificar un teléfono o email, distingue recepción, verificación y procesamiento. Un perfil provisional o datos sin verificar pueden existir antes de terminar ese recorrido.
4. Busca por cada identificador enviado. Hellotext puede actualizar un perfil existente o combinar coincidencias después de verificar; no busques únicamente un perfil nuevo.
5. Revisa que las propiedades personalizadas todavía existan y correspondan a los campos configurados.
6. Confirma el consentimiento solicitado, el estado del perfil y el destino que estás revisando.

Camila Torres es un ejemplo independiente: figura **Sin confirmar**, tiene un email ficticio y no tiene teléfono. No es el resultado del formulario anterior; sus propiedades no demuestran suscripción ni un destino SMS disponible. En pantallas pequeñas se usa un recorte enfocado del mismo panel de escritorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Perfil ficticio Camila Torres Sin confirmar, email de ejemplo y sin teléfono; recorte enfocado en pantallas pequeñas.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Perfil ficticio Camila Torres Sin confirmar, email de ejemplo y sin teléfono; recorte enfocado en pantallas pequeñas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil ficticio Camila Torres Sin confirmar, email de ejemplo y sin teléfono; recorte enfocado en pantallas pequeñas.</figcaption>
</figure>

El navegador puede recordar un formulario completado. Una ventana privada ayuda a comparar el estado local, pero no borra los perfiles ni las interacciones que ya existen en Hellotext. En Popup, recibir los campos tampoco implica por sí solo completar una verificación o iniciar una ruta: revisa los pasos y asignaciones de esa captura.

## Si falló lo que debía pasar después

Una captura recibida, la verificación requerida, el consentimiento y una acción posterior son etapas diferentes.

- Si el perfil se actualizó pero no llegó un cupón o mensaje, revisa [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).
- Si debía comenzar una ruta, confirma que esté asignada, habilitada y que su evento y filtros incluyan esa captura. Revisa su actividad; una captura sin ruta asignada no garantiza un mensaje de bienvenida.
- Si debía abrirse una conversación de Webchat, confirma la recepción del mensaje en Inbox y revisa asignación, equipo y capacidad. Ver el widget no demuestra una conversación recibida o asignada.
- Si Impulsor de Suscriptores no intervino, revisa la misión habilitada, el canal seleccionado, la invitación previa y la respuesta del cliente. El origen Webchat o WhatsApp no garantiza por sí solo intervención de IA, un cupón ni entrega.

Primero confirma qué datos y consentimiento cambiaron y después revisa el seguimiento. Conserva la evidencia del primer intento antes de reenviar o cambiar la configuración.

## Qué incluir al pedir ayuda

Incluye:

- negocio y nombre de la captura;
- tipo e identificador de la captura;
- URL, dominio o ubicación probada;
- dispositivo y navegador;
- fecha y hora aproximadas con zona horaria;
- última etapa comprobada y primera etapa que falló;
- identificador del perfil interno usado para la prueba;
- captura de pantalla o grabación breve; y
- error visible, código de respuesta y solicitud fallida, si tienes acceso técnico.

No incluyas códigos de verificación, tokens, contraseñas ni datos reales de pago. Revisa también los encabezados y cuerpos de las solicitudes antes de compartirlos.

## Guías relacionadas

- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Popup de Sitio Web]({% link _captures/website-popup.md %})
- [Formulario de Sitio Web]({% link _captures/forms.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Misión Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %})
- [A quién puedes enviar mensajes]({% link _audience/consent-and-subscriber-status.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
