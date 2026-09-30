Usa la API de mensajes cuando tu backend necesite enviar un mensaje a un perfil del cliente, por ejemplo una confirmación, un seguimiento de soporte o una notificación transaccional.

Para enviar un mensaje puntual a una audiencia, crea una campaña. Para mensajes autónomos basados en señales y comportamiento del cliente, usa una misión. Enviar mediante la API no evita el consentimiento, la disponibilidad del canal, las ventanas de mensajería, los límites de la cuenta ni las reglas del proveedor.

Usa la [referencia para enviar un mensaje](https://www.hellotext.com/api#create_a_message) para consultar el contrato completo del endpoint. Esta guía explica cómo tomar las principales decisiones de implementación y verificar el resultado.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API guardado únicamente en tu backend.
- Un negocio con suscripción activa que incluya acceso a la API y las integraciones de canales que piensas utilizar.
- Un ID válido del perfil del cliente o, para un envío telefónico, un número de destino.
- Un cuerpo de mensaje libre o una plantilla compatible existente.
- Consentimiento y contactabilidad válidos para el propósito y el canal del mensaje.
- URLs accesibles públicamente para los archivos adjuntos.

Crea un token en **Configuración → Autorizaciones** y envíalo como bearer token:

```text
Authorization: Bearer YOUR_TOKEN
```

El token autoriza operaciones del negocio al que pertenece; no es el ID público del negocio ni del perfil. Nunca expongas este token en Hellotext.js, código del navegador, una aplicación móvil ni un repositorio público.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre ficticio de token de autorización, sin guardar ni mostrar un secreto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558.0px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-es-mobile.png 2x" width="748" height="480" />
        <img src="/images/developers/custom-store-integration/token-es.png" srcset="/images/developers/custom-store-integration/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="524" loading="lazy" decoding="async" alt="Nombre ficticio de token de autorización, sin guardar ni mostrar un secreto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador real en un negocio ficticio: no crea ni muestra un token. Conserva el secreto sólo en tu backend.</figcaption>
</figure>

## 1. Elige un mensaje libre o una plantilla

### Mensaje libre

Envía `body` sin `template` cuando el canal seleccionado permita que el negocio escriba el mensaje directamente.

Esto es apropiado para SMS y para canales conversacionales compatibles mientras las reglas de su proveedor permitan una respuesta libre. En el flujo de WhatsApp de este endpoint, usa contenido libre mientras la ventana de atención esté abierta. La ventana de 24 horas comienza o se renueva cuando el cliente escribe al negocio.

### Mensaje con plantilla

Envía `template` cuando necesites contenido reutilizable, personalización con propiedades del cliente o links cortos dinámicos. Para iniciar una conversación por WhatsApp o enviar fuera de la ventana de atención mediante este endpoint, utiliza una plantilla de WhatsApp aprobada.

Cuando envías `template`, Hellotext utiliza el contenido de la plantilla e ignora un `body` separado. No crees una plantilla nueva para cada envío; crea y aprueba primero plantillas reutilizables.

Consulta [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %}) para conocer la creación, la aprobación de Meta, las etiquetas de propiedades y los links cortos dinámicos.

En **Configuración → Plantillas**, el modo **Mensaje** permite preparar contenido reutilizable. Este ejemplo de SMS es un borrador sin guardar; no representa una plantilla aprobada de WhatsApp. Las opciones de vista previa del editor tampoco determinan las tecnologías admitidas por este endpoint.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de Mensaje con un borrador ficticio de seguimiento de devolución, etiqueta name y URL completa.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/send-messages-with-api/editor-es-mobile.png 2x" width="668" height="760" />
        <img src="/images/developers/send-messages-with-api/editor-es.png" srcset="/images/developers/send-messages-with-api/editor-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Editor real de Mensaje con un borrador ficticio de seguimiento de devolución, etiqueta name y URL completa." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador sin guardar en Configuración → Plantillas, modo Mensaje con vista SMS. No se envió ni se aprobó para WhatsApp. El contenido incluye una instrucción y una URL utilizable.</figcaption>
</figure>

## 2. Selecciona la tecnología y el canal

Establece siempre `technology` explícitamente. No dependas de una selección automática ni de un cambio a otra tecnología si el primer envío falla. El endpoint actual de mensajes admite:

- `sms`
- `whatsapp`
- `instagram`
- `mercadolibre`

La integración correspondiente debe estar activa en el negocio. El perfil del cliente también debe ser contactable mediante la tecnología elegida.

`technology` y `origin` resuelven problemas diferentes:

- **`technology`:** selecciona la tecnología de mensajería.
- **`origin`:** selecciona opcionalmente un canal o remitente configurado específico dentro de esa tecnología.

Omite `origin` cuando Hellotext pueda elegir un canal configurado compatible. Inclúyelo cuando el negocio tenga varios remitentes o cuentas conectadas y tu integración deba utilizar uno específico. Usa el identificador del canal, por ejemplo su número telefónico, no su ID público de objeto. El origen debe pertenecer al negocio, coincidir con `technology` y estar disponible para enviar. La aceptación de la solicitud no confirma por sí sola estas condiciones.

## 3. Identifica el perfil del cliente y el destino

Prefiere `profile` cuando tu sistema ya conozca el **ID público del perfil** en Hellotext. Comprueba previamente que exista en el mismo negocio. Un ID interno de tu sistema, una referencia externa o un perfil de otro negocio no lo reemplaza; la solicitud puede ser aceptada antes de que el procesamiento detecte un ID inválido.

Hellotext resuelve una identidad del perfil para enviar. Comprueba que esa identidad sea contactable por la tecnología y el origen elegidos, especialmente si el perfil tiene identidades de varios canales.

Para envíos telefónicos, puedes usar `destination` sin `profile`. Envía el número en formato internacional E.164, por ejemplo `+14155552671`. Durante el procesamiento asíncrono, Hellotext busca un perfil del cliente con ese teléfono y crea uno si no existe.

Cuando un perfil del cliente tenga más de un teléfono y necesites uno en particular, envía tanto `profile` como `destination`. El destino debe coincidir con un teléfono que ya pertenezca a ese perfil; usa el mismo formato E.164 guardado. No uses esta combinación para agregar otro teléfono. Para Instagram o Mercado Libre, usa un perfil del cliente contactable y deja que Hellotext resuelva la identidad específica del canal.

Encontrar o crear un perfil del cliente no lo suscribe a comunicaciones de marketing. La identidad, la verificación y el consentimiento permanecen separados.

## 4. Envía un mensaje libre

Este ejemplo envía una respuesta por WhatsApp a un perfil del cliente conocido. Úsalo únicamente mientras ese cliente tenga una ventana de atención abierta:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/messages \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "technology": "whatsapp",
    "profile": "PROFILE_ID",
    "body": "Gracias por contactarnos. Revisa las instrucciones de tu devolución: https://shop.example.com/returns/1001"
  }'
```

Hellotext elige un origen de WhatsApp activo cuando omites `origin`. Para usar un remitente de WhatsApp configurado específico, agrega el identificador de su canal:

```json
{
  "technology": "whatsapp",
  "origin": "+14155552671",
  "profile": "PROFILE_ID",
  "body": "Gracias por contactarnos. Revisa las instrucciones de tu devolución: https://shop.example.com/returns/1001"
}
```

Para una implementación específica de SMS, incluida la longitud, codificación, links, costo y límites para negocios nuevos, consulta [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %}).

## 5. Envía un mensaje con plantilla

Este ejemplo envía una plantilla aprobada de WhatsApp y proporciona el destino de su link corto dinámico con nombre:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/messages \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "technology": "whatsapp",
    "profile": "PROFILE_ID",
    "template": {
      "id": "TEMPLATE_ID",
      "shortlinks": {
        "order": "https://shop.example.com/account/orders/1001"
      }
    }
  }'
```

Puedes enviar `template` como string con el ID de la plantilla cuando no tenga links cortos dinámicos. Cuando los tenga, usa la forma de objeto y proporciona cada nombre requerido dentro de `template.shortlinks`.

La plantilla debe existir en el mismo negocio y admitir la tecnología elegida. Comprueba su ID y los nombres de los links antes de hacer el POST. El ejemplo requiere una plantilla cuyo contenido incluya el link dinámico `order`; el nombre de la plantilla no sustituye su ID.

Para WhatsApp, confirma además una versión aprobada activa para la cuenta y el idioma del envío. La aprobación local de una plantilla de SMS no equivale a aprobación de Meta. Una edición pendiente puede conservar una versión aprobada anterior: el contenido enviado será el de la versión activa, no necesariamente el de la edición pendiente. Una plantilla nueva que siga pendiente de Meta aún no permite ese envío.

## 6. Agrega archivos adjuntos cuando el canal los admita

Envía las URLs de los archivos en el array `attachments` de nivel superior:

```json
{
  "technology": "whatsapp",
  "profile": "PROFILE_ID",
  "body": "Aquí está el documento que solicitaste.",
  "attachments": [
    "https://files.example.com/return-instructions.pdf"
  ]
}
```

Cada URL debe ser accesible públicamente para que Hellotext pueda descargar y guardar el archivo. No uses rutas locales ni URLs que requieran tu sesión del navegador. La descarga y la validación del proveedor ocurren después de la aceptación; un `received` no confirma que el archivo sea utilizable. Los formatos admitidos y los límites de tamaño cambian según el canal. SMS no admite archivos adjuntos e ignora este parámetro.

Revisa los [requisitos actuales para archivos adjuntos](https://www.hellotext.com/api#create_a_message_attachments) antes de enviar archivos en producción.

## 7. Interpreta la respuesta de aceptación

Una solicitud que supera la validación inicial responde con HTTP `200`:

```json
{
  "status": "received"
}
```

Esto significa que Hellotext aceptó la solicitud y la encoló para procesarla de manera asíncrona. No significa que el proveedor haya aceptado el mensaje ni que lo haya entregado al cliente. Esta respuesta no contiene un ID de mensaje y no garantiza que ya exista el objeto saliente: la resolución del perfil, canal, plantilla y archivos todavía puede fallar.

Los estados de mensajes salientes incluyen:

- `pending`: el mensaje existe y espera ser procesado.
- `dispatched`: el mensaje pasó al flujo de envío; todavía no es una confirmación de entrega.
- `routed`: el mensaje se enrutó al proveedor externo; todavía no confirma la entrega.
- `delivered`: el proveedor confirmó la entrega.
- `error`: el procesamiento o la entrega encontró una falla. La referencia pública también describe este resultado como `failed`; contempla ambos valores en tu integración. No esperes únicamente `failed` para detectar un error.

El estado `received` en un objeto de mensaje describe un mensaje entrante enviado por el cliente al negocio. Es diferente de la confirmación `{ "status": "received" }` de la API.

Usa [Listar todos los mensajes](https://www.hellotext.com/api#list_all_messages) con un límite acotado, por ejemplo `limit=25`, y recorre sus páginas con los cursores documentados y `has_more`. No asumas que la primera página contiene lo más reciente. Compara en tu integración perfil, tecnología, origen, destino, cuerpo renderizado y hora: el listado actual no ofrece filtros de perfil, fecha o plantilla, ni expone el ID de plantilla en cada mensaje.

Cuando encuentres el ID público del mensaje en el listado, usa [Recuperar un mensaje](https://www.hellotext.com/api#retrieve_a_message) para revisar su estado y marcas de tiempo. Los timestamps son segundos Unix y los campos de una etapa pueden ser `null` en otro estado; no son un historial completo de todas las transiciones. También puedes revisar la conversación del cliente en el Inbox. Si varios envíos iguales coinciden, esa comparación puede ser ambigua: no supone una correlación garantizada con un POST concreto.

## 8. Reintenta sin crear duplicados

El endpoint no acepta una clave de idempotencia. Tu integración debe evitar envíos duplicados.

- No reintentes una respuesta `422` sin corregir el parámetro inválido.
- Si la conexión falla antes de recibir una respuesta, trata el resultado como incierto en lugar de volver a enviar inmediatamente el mismo mensaje.
- Registra el negocio, perfil del cliente, tecnología, plantilla o huella del cuerpo, hora de la solicitud y respuesta.
- Recorre el listado acotado y revisa la conversación en el Inbox antes de reintentar una solicitud incierta. La ausencia inmediata de un mensaje no demuestra que la cola no lo vaya a procesar después.
- Reintenta una falla del proveedor solamente después de corregir la condición indicada o esperar a que finalice.

Incluso después de aceptar la solicitud, el procesamiento asíncrono puede detenerse por límites de la cuenta, un canal no disponible, un origen inválido, una ventana de conversación de WhatsApp o Instagram cerrada, el estado de la plantilla o una falla del proveedor.

## 9. Soluciona problemas frecuentes

- **`401 Unauthorized`:** el token falta, es inválido o fue revocado. Si es válido pero pertenece a otro negocio, las operaciones se resolverán dentro de ese otro negocio: verifica siempre el alcance del token.
- **`403 Forbidden` al crear:** confirma que la suscripción de ese negocio tenga acceso activo a la API.
- **`422` en `technology`:** el valor no es compatible o la integración correspondiente no está activa.
- **`422` en `destination`:** el teléfono falta o es inválido cuando no se proporciona un perfil del cliente.
- **`422` en `body`:** no se proporcionó un cuerpo utilizable ni una plantilla válida.
- **La solicitud fue aceptada pero no aparece un mensaje saliente:** revisa el ID del perfil del cliente, el origen, los límites de la cuenta y la disponibilidad del canal.
- **El mensaje de WhatsApp falla:** confirma que la ventana de atención esté abierta para contenido libre o utiliza una plantilla aprobada activa.
- **El mensaje de Instagram falla:** confirma que el cliente haya iniciado la conversación, que la ventana estándar de mensajería siga abierta y que la cuenta conectada de Instagram esté activa.
- **La solicitud con plantilla falla:** confirma que la plantilla pertenezca al negocio y proporciona todos los links cortos dinámicos requeridos.
- **El mensaje llega a `error` o `failed`:** revisa la conversación y la causa del proveedor antes de decidir si corresponde otro intento.

Consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) para diagnosticar el canal y la entrega. Usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}) para problemas de autenticación, logs y reintentos.

## Checklist antes de producción

Antes de habilitar la integración en producción:

1. Envía a un perfil del cliente o número controlado por tu equipo.
2. Confirma que la solicitud responda con `status: received`.
3. Verifica que el mensaje aparezca en la conversación esperada del Inbox.
4. Confirma la tecnología, origen, destino y contenido renderizado esperados.
5. Revisa el resultado posterior; contempla `delivered` y fallas `error`/`failed`, sin confundir aceptación con entrega. Si el canal no confirma la entrega, investiga el estado pendiente o enrutado en lugar de asumir éxito.
6. Prueba un error de validación corregido y una respuesta incierta sin producir duplicados.
7. Confirma las reglas de consentimiento y ventanas del canal para cada caso de producción.

## Guías relacionadas

- [Resumen para desarrolladores y API]({% link _developers/developers-overview.md %})
- [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %})
- [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %})
- [¿A quién puedes escribirle?]({% link _audience/consent-and-subscriber-status.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Fundamentos de Instagram DM]({% link _numbers/instagram-dm-fundamentals.md %})
- [Referencia de la API de Hellotext](https://www.hellotext.com/api)
