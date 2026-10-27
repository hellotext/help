Usa una campaña cuando quieres enviar un mensaje planificado y puntual a una audiencia seleccionada. Tú eliges los canales, la audiencia, el mensaje y el momento de envío; Hellotext determina qué perfiles de cliente elegibles pueden contactarse realmente por esos canales.

Este SMS ilustrativo de la tienda ficticia Luma presenta una nueva colección y una acción clara para el cliente.

{% include editorial/es/custom-e5d0ebc899b77888.html %}

## Antes de empezar

Asegúrate de tener:

- Un remitente SMS aprobado, un número de WhatsApp listo o, para una campaña de solo correo, acceso al canal y un remitente de correo verificado y activo.
- Perfiles de cliente con consentimiento para el canal que usarás.
- Un objetivo y llamado a la acción claros.
- Las listas, segmentos, links con tracking, cupones o contenido multimedia que necesites.
- Un método de pago o saldo cuando lo requieran tu cuenta y los canales.

Sigue leyendo: [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}).

## 1. Inicia la campaña y elige cómo se enviará

1. Abre **Campañas**.
2. Selecciona **Nueva Campaña**.
3. Elige una de las opciones de envío disponibles:

- **WhatsApp y SMS:** intenta primero por WhatsApp y usa SMS cuando WhatsApp no está disponible para un cliente elegible.
- **Solo WhatsApp:** envía únicamente por WhatsApp.
- **Solo SMS:** envía únicamente por SMS.
- **Solo correo:** envía únicamente por correo electrónico; requiere acceso al canal y un remitente verificado y activo.

El creador muestra estas opciones, pero elegir una no habilita por sí solo el envío: el negocio necesita acceso y un remitente listo para el canal elegido. El **Target estimado** se actualiza para mostrar cuántos perfiles de cliente podrían contactarse con la opción elegida.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-channels" aria-label="Elige los canales de la campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 700px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-channels-es-mobile.png 4x" width="1592" height="3512" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-channels-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-channels-es-desktop.png 4x" width="2728" height="3232" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Opciones de envío de una campaña, con Solo SMS seleccionado y las opciones de WhatsApp deshabilitadas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selector real con datos ficticios. Solo SMS está seleccionado y las opciones de WhatsApp conservan su estado deshabilitado.</figcaption>
</figure>

Selecciona **Siguiente** para continuar. Dale a la campaña un nombre interno claro en el encabezado para que el equipo pueda reconocerla después en las vistas de Borradores, Programadas, Enviadas y reportes.

## 2. Elige quién la recibirá

El paso de audiencia empieza con **Todas las Audiencias**. Puedes mantenerlo cuando todos los perfiles de cliente elegibles deberían considerarse o reemplazarlo por una selección más específica.

Puedes incluir o excluir:

- Listas.
- Segmentos.
- Audiencias de campañas programadas o enviadas anteriormente.

Usa **Seleccionar audiencia** para buscar y agregar grupos. Para incluir grupos concretos, primero quita **Todas las Audiencias** con su botón de quitar. Si mantienes **Todas las Audiencias**, los grupos que agregues se excluyen de esa audiencia.

Con una selección específica, selecciona el nombre de un grupo agregado para alternar entre incluirlo y excluirlo. Los grupos excluidos muestran **Excluir** junto al nombre.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-audience" aria-label="Incluye y excluye audiencias">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 1002px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-audience-es-mobile.png 4x" width="1592" height="4360" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-audience-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-audience-es-desktop.png 4x" width="3936" height="2940" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Selector de audiencia abierto con Club incluido, QA excluido y un alcance estimado de dos suscriptores elegibles." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selector real con datos ficticios. Club está incluido y QA excluido; el menú de audiencias está abierto y el alcance muestra dos suscriptores.</figcaption>
</figure>

Hellotext elimina duplicados entre grupos superpuestos y actualiza el target estimado automáticamente. El conteo considera los canales seleccionados, el estado de suscripción, la contactabilidad, las inclusiones y las exclusiones, por lo que puede ser menor que el tamaño total de las listas o segmentos elegidos. Espera a que termine de actualizarse después de cambiar la selección.

Usa el control de ajustes junto al **Alcance estimado** cuando quieras limitar la campaña a una cantidad máxima de clientes elegibles de la audiencia seleccionada. Este límite no vuelve contactable a un perfil que no sea elegible.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-audience-limit" aria-label="Limita la cantidad de destinatarios">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 627px); width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-audience-limit-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-audience-limit-es-desktop.png 4x" width="2436" height="1564" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Opciones de límite de audiencia: enviar a todos o limitar a dos clientes, con los botones Limitar y Cancelar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Control de límite de audiencia con un máximo de dos clientes.</figcaption>
</figure>

El conteo de este paso muestra la audiencia elegible antes de aplicar el límite. Elige un máximo que no supere esa cantidad y revisa el total limitado en la confirmación.

Sigue leyendo: [Listas vs. segmentos]({% link _audience/lists-and-segments.md %}).

## 3. Redacta el mensaje

Escribe un mensaje enfocado con una próxima acción clara. El editor muestra una vista previa del canal mientras redactas.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-composer" aria-label="Redacta el mensaje de la campaña">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 700px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-composer-es-mobile.png 4x" width="1592" height="1856" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-composer-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-composer-es-desktop.png 4x" width="2728" height="1600" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Editor SMS de una campaña ficticia con la etiqueta name, un link con tracking, BAJA para salir y las herramientas de composición." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador real con datos ficticios: etiqueta de nombre, link con tracking y salida BAJA para salir. En móvil, Vista previa abre la vista del canal.</figcaption>
</figure>

Las herramientas disponibles dependen de la opción de envío. Una campaña puede incluir:

- Texto con el formato soportado por el canal elegido.
- Un link con tracking.
- Etiquetas de personalización basadas en propiedades del perfil de cliente.
- Un cupón.
- Un canal o remitente de envío.
- Contenido de WhatsApp como archivo adjunto, ubicación, pie de página o botones cuando sean compatibles.

Cuando WhatsApp forma parte de la campaña, el mensaje también se prepara como plantilla de WhatsApp. El contenido nuevo o modificado puede necesitar aprobación de Meta antes de entregarse.

Sigue leyendo: [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}).

## Agrega links con tracking

Usa la herramienta de links del editor en lugar de pegar una URL larga. Hellotext crea un link corto `hello.link`, registra clics elegibles y conecta la visita con actividad rastreada posterior.

En **Crear un enlace corto**, pega la URL de destino y selecciona **Agregar enlace corto**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-tracked-link-tool" aria-label="Agrega un link con tracking">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 534px); width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-tracked-link-tool-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-tracked-link-tool-es-desktop.png 4x" width="2064" height="1192" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Herramienta Crear un enlace corto, con el campo de URL y los botones Agregar enlace corto y Cancelar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario de URL para crear un enlace corto con tracking.</figcaption>
</figure>

Un clic rastreado puede aportar evidencia activa para la atribución de la campaña, pero no es la única evidencia que evalúa Hellotext.

Sigue leyendo: [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}).

## Agrega etiquetas de personalización

Las etiquetas insertan propiedades del perfil de cliente en el mensaje entregado. Usa un valor alternativo cuando la propiedad pueda faltar, por ejemplo `{name|cliente}`.

Abre **Etiquetas** con el botón de llaves y selecciona la propiedad que quieres insertar, como `name`.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-personalization-tool" aria-label="Elige una etiqueta de personalización">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 534px); width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-personalization-tool-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-personalization-tool-es-desktop.png 4x" width="2064" height="1376" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Menú Etiquetas del editor con propiedades como name, full_name, email y una propiedad personalizada ficticia." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Menú de etiquetas con propiedades estándar y una propiedad personalizada ficticia.</figcaption>
</figure>

Revisa cuidadosamente la vista previa al usar etiquetas. El valor alternativo debería producir una frase natural para perfiles que no tengan ese dato.

Sigue leyendo: [Etiquetas de personalización]({% link _audience/personalization-tags.md %}).

## Agrega un cupón

Usa la herramienta de cupones para hacer referencia a un cupón disponible en Hellotext. Esto mantiene el cupón conectado con la campaña y sus resultados en lugar de tratar un código escrito manualmente como texto común.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-coupon-picker" aria-label="Elige un cupón disponible">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 434px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-coupon-picker-es-mobile.png 4x" width="1656" height="1020" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-coupon-picker-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-coupon-picker-es-desktop.png 4x" width="1664" height="1032" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Herramienta Cupones con el cupón ficticio GUIA-QR-10 disponible y Ninguno seleccionado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selector real de cupones con datos ficticios. GUIA-QR-10 está disponible y todavía no se ha seleccionado.</figcaption>
</figure>

Confirma que las reglas, vencimiento y productos elegibles del cupón correspondan a la audiencia antes de enviar.

## 4. Revisa la vista previa y envía una prueba

Usa la vista previa para comprobar el mensaje en cada canal seleccionado. Revisa:

- La primera línea y el llamado a la acción.
- La personalización y los valores alternativos.
- El destino de los links con tracking.
- El texto y la validez del cupón.
- Los archivos, botones, pie de página o ubicación de WhatsApp.
- La longitud del SMS y la estimación de partes que muestra el editor.

Envía una prueba al destino que corresponda antes de continuar: un número que controles para SMS o WhatsApp, o una dirección propia para una campaña de solo correo. Una prueba por SMS puede entregarse directamente. Una prueba de WhatsApp con contenido nuevo puede quedar programada hasta que Meta apruebe la plantilla.

Para una prueba SMS, en **Enviar mensaje a este número**, elige el país e ingresa un número que controles.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-test-destination" aria-label="Elige el destino de una prueba SMS">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 450px); width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-test-destination-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-test-destination-es-desktop.png 4x" width="1728" height="1092" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Formulario Enviar mensaje a este número, con selector de país, campo de teléfono vacío y envío deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario de prueba SMS con el campo de teléfono vacío y el botón de envío deshabilitado.</figcaption>
</figure>

La prueba permite revisar el mensaje en el número o la dirección elegidos. No demuestra que todos los perfiles de la audiencia final sean elegibles.

## 5. Elige cuándo se enviará

Elige una de estas opciones:

- **Enviar ahora:** inicia inmediatamente el proceso de aprobación y entrega.
- **Enviar más tarde:** selecciona una fecha y hora futuras.

Hellotext aplica las ventanas de comunicación requeridas para el país de destino y los ajustes de horas nocturnas del negocio. Si el momento elegido no está permitido, la interfaz puede solicitar otro horario o mover la entrega a la siguiente ventana permitida.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-delivery-date" aria-label="Elige la fecha y hora de envío">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 723px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-delivery-date-es-mobile.png 4x" width="1592" height="3168" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-delivery-date-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-delivery-date-es-desktop.png 4x" width="2820" height="2520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Enviar más tarde seleccionado para el 2 de noviembre de 2026 a las 12:00; calendario abierto en escritorio y campos de fecha y hora en móvil." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fecha y hora ficticias de un borrador: 2 de noviembre de 2026 a las 12:00. El calendario está abierto en escritorio y cerrado en móvil.</figcaption>
</figure>

Usa **Guardar y Cerrar** en cualquier paso cuando quieras conservar la campaña como borrador y terminarla más adelante.

## 6. Revisa y confirma

Antes de seleccionar **Enviar**, verifica:

- La cantidad estimada de clientes segmentados.
- Las audiencias incluidas y excluidas.
- Los canales y el remitente de entrega.
- La vista previa del mensaje para cada canal.
- Los links con tracking, etiquetas, cupón y contenido de WhatsApp.
- La fecha y hora de entrega.
- La persona o el equipo que atenderá las respuestas.
- El costo estimado de Meta cuando aplique WhatsApp.

En **Configurar respuestas**, abre el botón de ajustes y usa **Asignar respuestas a** para elegir una persona o un equipo. Si mantienes **Sin asignación específica**, las respuestas siguen las reglas habituales de tu Inbox. Los equipos sin miembros no se pueden seleccionar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-reply-settings" aria-label="Asigna las respuestas a una persona o equipo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 864px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-reply-settings-es-mobile.png 4x" width="1592" height="3052" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-reply-settings-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-reply-settings-es-desktop.png 4x" width="3384" height="2892" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Configurar respuestas con Asignar respuestas a abierto, personas ficticias y los equipos Atención demo y Ventas demo; Sin asignación específica sigue activo." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Configuración real con personas y equipos ficticios. El menú de equipos está abierto y se conserva Sin asignación específica.</figcaption>
</figure>

Esta asignación se considera cuando el cliente responde dentro de las 24 horas siguientes a su mensaje de campaña más reciente y la conversación se reabre o todavía no tiene responsable. No reemplaza al responsable de una conversación abierta. Si no puede aplicarse, se usan las reglas habituales del Inbox.

Espera a que termine de actualizarse la cantidad de clientes segmentados: la confirmación aplica el límite de destinatarios que guardaste.

La pantalla de confirmación es la última oportunidad de detectar una audiencia o mensaje incorrectos antes de que la campaña entre en aprobación y entrega.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-campaign-figure="campaign-confirmation" aria-label="Revisa la campaña antes de enviarla">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 700px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/campaigns/creating-a-campaign/campaign-confirmation-es-mobile.png 4x" width="1592" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/campaigns/creating-a-campaign/campaign-confirmation-es-desktop.png" srcset="/images/campaigns/creating-a-campaign/campaign-confirmation-es-desktop.png 4x" width="2728" height="3744" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Confirmación de un borrador con dos clientes segmentados, Club incluido, QA excluido, Solo SMS, fecha 2 de noviembre a las 12:00 y respuestas sin asignación específica." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Revisión previa al envío de una campaña ficticia: dos clientes elegibles y la fecha elegida.</figcaption>
</figure>

## Entiende la revisión de campañas

Las campañas con por lo menos 100 destinatarios o un límite configurado de 100 o más pueden requerir revisión editorial. El límite puede activar esa revisión aunque haya menos destinatarios elegibles. Las plantillas de WhatsApp ya aprobadas pueden permitir omitirla. Una campaña de WhatsApp también puede esperar a Meta cuando su plantilla todavía no fue aprobada.

Mientras la revisión está pendiente, la campaña aparece como **En revisión** o **WhatsApp en revisión**. Una vez aprobada, sigue el horario de entrega elegido. Si el equipo de revisión o Meta rechazan el contenido, abre la campaña, revisa el feedback, realiza los cambios solicitados y vuelve a enviarla.

El tiempo de aprobación puede variar, especialmente cuando Meta debe revisar contenido nuevo de WhatsApp. Deja tiempo suficiente antes de una promoción o evento programado.

## Después de enviar

Usa las pestañas de Campañas para seguir su estado:

- **Borradores:** guardadas pero no enviadas a revisión.
- **Programadas:** enviadas a revisión, aprobadas para una hora futura o preparándose para enviar.
- **Enviadas:** la entrega comenzó y los resultados están disponibles.
- **Archivadas:** campañas terminadas que quitaste de la lista activa de Enviadas.

Las respuestas de clientes continúan hacia el Inbox por el canal correspondiente. Los reportes de campaña se generan automáticamente después de la entrega para que puedas revisar mensajes entregados, interacción, conversión, ROI e ingresos atribuidos.

Sigue leyendo: [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Checklist antes de enviar

Antes del envío final, confirma que:

- El objetivo necesita una campaña puntual en lugar de una misión o una ruta.
- La audiencia es específica y tiene consentimiento para el canal.
- Las exclusiones quitan perfiles internos, de prueba, inválidos o inapropiados.
- El remitente y el comportamiento de fallback son correctos.
- El mensaje tiene una próxima acción clara.
- Los links, etiquetas, cupones, archivos y botones funcionan en una prueba.
- El horario deja margen para revisión editorial o de Meta.
- Alguien supervisará respuestas, problemas de entrega y resultados después del lanzamiento.

## Guías relacionadas

- [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
- [Buenas prácticas para campañas]({% link _campaigns/campaign-best-practices.md %})
- [Tamaños de imagen para emails]({% link _campaigns/email-image-sizes.md %})
- [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %})
