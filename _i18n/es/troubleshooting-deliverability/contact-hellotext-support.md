Para una solicitud nueva, usa la [página de contacto en español](https://www.hellotext.com/contacto), que publica [info@hellotext.com](mailto:info@hellotext.com) y un enlace de WhatsApp. Si usas el formulario para un problema, elige **Necesito ayuda**; la opción inicial es **Quiero una demo**. Si prefieres inglés, usa [hellotext.com/contact](https://www.hellotext.com/contact/). Si ya tienes un hilo con [support@hellotext.com](mailto:support@hellotext.com), responde en ese mismo hilo para conservar el contexto.

Un reporte concreto permite identificar antes el negocio, objeto y momento afectados. No es necesario diagnosticar la causa técnica antes de pedir ayuda.

Las figuras de esta guía son ejemplos ficticios independientes para localizar información. No muestran una solicitud enviada, un incidente real ni su resolución.

## Antes de contactar

Cuando sea posible:

1. Anota la etapa exacta y el último resultado confirmado. Si necesitas reproducirlo, empieza por un paso de lectura que no cambie datos ni envíe mensajes.
2. Revisa la guía relacionada en esta sección.
3. Confirma si afecta a una sola persona, perfil del cliente, mensaje o página, o si es general.
4. Conserva los cambios recientes que puedan estar relacionados.
5. Evita repetir acciones que podrían enviar mensajes, crear campañas, cobrar, importar o modificar datos más de una vez.

Si mensajes incorrectos continúan enviándose, usa el control de detención o desactivación que corresponda al flujo, cuando esté disponible y tengas permiso; consulta su guía y anota el momento del cambio. No todos los flujos ofrecen una pausa manual. Detener un flujo no revierte mensajes ya entregados ni confirma que todo trabajo pendiente o aceptado por un proveedor se haya cancelado. Si no puedes detenerlo con seguridad, incluye esa situación en la solicitud.

Si una acción de guardar, importar o enviar quedó sin respuesta clara, comprueba su resultado original antes de repetirla. No ejecutes otra prueba de envío para reunir evidencia de soporte.

## Información básica que debes incluir

Incluye:

- nombre del negocio en Hellotext;
- URL exacta de la página afectada;
- fecha y hora aproximadas con zona horaria;
- qué esperabas que ocurriera;
- qué ocurrió en su lugar;
- alcance del problema;
- pasos breves para reproducirlo;
- captura de pantalla o grabación breve; y
- cambios recientes de configuración, integración, permisos o código.

Añade el **ID público del negocio**, si puedes consultarlo, y el link o identificador del registro afectado. No necesitas cambiar el negocio ni sus ajustes para obtener contexto.

En **Configuración > General**, este ejemplo muestra **Enterprise** y **4ONLdN32**. Enterprise es el nombre ficticio del negocio; no demuestra el plan contratado, una conexión o un cambio de negocio. La figura ayuda a localizar el nombre y el ID público.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre e ID público de un negocio ficticio en General">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nombre e ID público de un negocio ficticio en General" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Contexto de negocio independiente; no prueba plan, integración o resolución.</figcaption>
</figure>

Mantén la conversación en el mismo hilo de email o solicitud cuando agregues evidencia sobre el mismo problema. Abre otra solicitud cuando se trate de un problema diferente.

## Información según el problema

| Problema | Información útil |
| --- | --- |
| **Mensaje o canal** | Canal, remitente, ID o link del mensaje, perfil del cliente, estado y motivo de entrega. |
| **Campaña** | Link de la campaña, audiencia, programación y etapa donde se detuvo. |
| **Misión o ruta** | Link, versión o configuración relevante, señal esperada y perfil del cliente usado para probar. |
| **Inbox** | Link de la conversación, equipo o persona esperada, estado y momento de la asignación. |
| **Integración** | Plataforma, tienda o cuenta conectada, objeto faltante, identificador en el sistema de origen y última sincronización conocida. |
| **Captura** | Tipo y nombre, URL o ubicación, dispositivo, navegador y etapa donde dejó de funcionar. |
| **Reporte o atribución** | Reporte, período, zona horaria, filtros, pedido o conversión y resultado esperado. |
| **API o Hellotext.js** | Endpoint o evento, hora, ID de solicitud si está disponible, código y cuerpo de respuesta sin secretos, y fragmento mínimo del problema. |
| **Facturación** | Mes, factura, plan o concepto afectado. Usa identificadores, no datos completos de pago. |

Puedes ocultar parte del teléfono o email cuando el identificador completo no sea necesario para encontrar el caso.

Separa la identidad del objeto, su referencia en el sistema de origen y la señal esperada. En **Configuración > Objetos > Órdenes**, el ejemplo ficticio **Pedido #1001** muestra origen **custom_store**, referencia **ORDER-1001**, estado **draft** y total **USD 89.90**, con cero eventos. **ID de la orden** contiene la referencia; no lo confundas con el ID público de Hellotext. **Entregar** es la modalidad del pedido, no prueba de entrega. Anota la referencia, origen y link del objeto cuando sean relevantes; su existencia no confirma sincronización ni un evento procesado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Referencia y origen de un pedido ficticio en borrador">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img class="ht-editorial-visual__image" src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" width="1006" height="914" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Referencia y origen de un pedido ficticio en borrador" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Pedido independiente sin eventos; Entregar indica modalidad, no entrega.</figcaption>
</figure>

Para un reporte, incluye período exacto, zona horaria, filtros, unidad y denominador de la métrica que comparas. No compares la audiencia seleccionada con mensajes entregados ni clics con personas únicas sin comprobar sus bases.

Este reporte histórico ficticio independiente conserva **Primeros 14 días**, del **19 de abril al 2 de mayo de 2026**, anclados a la campaña. Escritorio muestra ingresos atribuidos **USD 1.9K**, ROI **5.4** como múltiplo, conversión **6.3%** e ingresos por mensaje **USD 0.36**; la vista estrecha muestra la primera tarjeta del carrusel. No son los últimos catorce días actuales ni el resultado de resolver un incidente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y métricas de un reporte histórico ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Período y métricas de un reporte histórico ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Período anclado a campaña; la vista estrecha muestra la primera tarjeta.</figcaption>
</figure>

Para API o Hellotext.js, conserva el endpoint o nombre del evento, hora, respuesta y último estado confirmado, sin ejecutar otra operación. Un HTTP **200** con **received** no garantiza procesamiento ni devuelve necesariamente el ID del evento o mensaje. Inicializar el SDK es asíncrono; cada vista real requiere registrar **page.viewed** explícitamente. Describe por separado lo enviado, lo reconocido y lo que finalmente apareció en Hellotext.

## Información que no debes enviar

No compartas:

- contraseñas;
- tokens de API o secretos de aplicaciones;
- códigos de verificación;
- cookies o encabezados de autorización;
- números completos de tarjetas o cuentas bancarias; ni
- exportaciones completas de clientes cuando basta con uno o dos ejemplos.

Si soporte necesita un archivo sensible, confirma primero qué información hace falta y cómo enviarla de forma segura.

Comparte el mínimo necesario para encontrar el caso. Un link o ID de perfil puede evitar copiar todas sus propiedades. Revisa capturas, grabaciones y archivos de diagnóstico antes de adjuntarlos; incluso un HAR sanitizado puede conservar URLs, cuerpos o datos sensibles. Confirma con soporte el canal seguro antes de enviar un archivo sensible.

La figura muestra a **Camila Torres**, un perfil ficticio **Sin confirmar**, con email de ejemplo y sin teléfono. La vista estrecha es un foco desktop, no una nueva interfaz móvil. Sirve para reconocer identidad, estado y propiedades; no indica que debas enviar todos esos campos ni demuestra verificación, consentimiento o entrega.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identidad y propiedades de un perfil ficticio sin confirmar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identidad y propiedades de un perfil ficticio sin confirmar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil ficticio independiente; comparte sólo el contexto necesario.</figcaption>
</figure>

## Cómo indicar el impacto

Describe el impacto observable sin intentar asignar una severidad técnica.

Por ejemplo:

- cuántos negocios, personas del equipo o clientes están afectados;
- si el problema bloquea una operación o tiene una alternativa temporal;
- si impide recibir o enviar mensajes;
- si puede producir mensajes, cambios o cargos duplicados; y
- desde cuándo ocurre.

Reporta inmediatamente cualquier sospecha de acceso no autorizado, exposición de datos o uso indebido de credenciales. No incluyas los secretos potencialmente expuestos en el mensaje.

## Qué esperar después

Soporte puede pedirte un ejemplo adicional, confirmar permisos para revisar un objeto o solicitar que reproduzcas el problema con evidencia técnica. Responde en el mismo hilo para conservar el contexto.

La página de contacto pública no define un tiempo universal de respuesta. Si tu plan o acuerdo incluye un compromiso específico de soporte, ese compromiso es la referencia aplicable. Evita usar los SLA configurados para las conversaciones de tu Inbox como si fueran el tiempo de respuesta del soporte de Hellotext: son métricas distintas.

En **Configuración > Tiempo de respuesta**, esta política ficticia existente muestra **cinco minutos** para la respuesta inicial y **cinco minutos** para las siguientes. El encabezado y los campos están completos; se omite todo el pie de guardado y no se cambió ni guardó nada. Estos objetivos corresponden a las conversaciones de tu negocio en Inbox y su calendario, no al tiempo de respuesta de soporte de Hellotext.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Objetivos de respuesta de Inbox de un negocio ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-es-mobile.png 2x" width="824" height="844" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-es.png" srcset="/images/team/understanding-response-times/default-es.png 2x" width="972" height="820" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Objetivos de respuesta de Inbox de un negocio ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Política existente de Inbox; no establece un compromiso de soporte.</figcaption>
</figure>

Conserva el hilo y confirma qué evidencia adicional se necesita. Una respuesta de soporte, el acceso autorizado a un registro y la resolución del problema son etapas diferentes; no hay una recuperación garantizada por enviar la solicitud.

## Guías relacionadas

- [Resumen de solución de problemas y entregabilidad]({% link _troubleshooting-deliverability/troubleshooting-overview.md %})
- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Soluciona páginas que no cargan]({% link _troubleshooting-deliverability/troubleshoot-pages-that-do-not-load.md %})
- [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
