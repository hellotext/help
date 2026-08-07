Usa la API de mensajes cuando tu backend necesite enviar un mensaje a un perfil del cliente, por ejemplo una confirmación, un seguimiento de soporte o una notificación transaccional.

Para enviar un mensaje puntual a una audiencia, crea una campaña. Para mensajes autónomos basados en señales y comportamiento del cliente, usa un playbook. Enviar mediante la API no evita el consentimiento, la disponibilidad del canal, las ventanas de mensajería, los límites de la cuenta ni las reglas del proveedor.

Usa la [referencia para enviar un mensaje](https://www.hellotext.com/api#create_a_message) para consultar el contrato completo del endpoint. Esta guía explica cómo tomar las principales decisiones de implementación y verificar el resultado.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API guardado únicamente en tu backend.
- Un negocio activo en Hellotext y las integraciones de canales que piensas utilizar.
- Un ID válido del perfil del cliente o, para un envío telefónico, un número de destino.
- Un cuerpo de mensaje libre o una plantilla compatible existente.
- Consentimiento y contactabilidad válidos para el propósito y el canal del mensaje.
- URLs accesibles públicamente para los archivos adjuntos.

Crea un token en **Configuración → Autorizaciones** y envíalo como bearer token:

```text
Authorization: Bearer YOUR_TOKEN
```

Nunca expongas este token en Hellotext.js, código del navegador, una aplicación móvil ni un repositorio público.

## 1. Elige un mensaje libre o una plantilla

### Mensaje libre

Envía `body` sin `template` cuando el canal seleccionado permita que el negocio escriba el mensaje directamente.

Esto es apropiado para SMS y para canales conversacionales compatibles mientras las reglas de su proveedor permitan una respuesta libre. En WhatsApp, un mensaje libre solo puede enviarse mientras la ventana de atención esté abierta. La ventana de 24 horas comienza o se renueva cuando el cliente escribe al negocio.

### Mensaje con plantilla

Envía `template` cuando necesites contenido reutilizable, personalización con propiedades del cliente o links cortos dinámicos. Se requiere una plantilla de WhatsApp aprobada para iniciar una conversación por WhatsApp o enviar fuera de la ventana de atención.

Cuando envías `template`, Hellotext utiliza el contenido de la plantilla e ignora un `body` separado. No crees una plantilla nueva para cada envío; crea y aprueba primero plantillas reutilizables.

Consulta [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %}) para conocer la creación, la aprobación de Meta, las etiquetas de propiedades y los links cortos dinámicos.

## 2. Selecciona la tecnología y el canal

Establece `technology` explícitamente para que el enrutamiento y los requisitos del proveedor sean predecibles. El endpoint actual de mensajes admite:

- `sms`
- `whatsapp`
- `instagram`
- `mercadolibre`

La integración correspondiente debe estar activa en el negocio. El perfil del cliente también debe ser contactable mediante la tecnología elegida.

`technology` y `origin` resuelven problemas diferentes:

- **`technology`:** selecciona la tecnología de mensajería.
- **`origin`:** selecciona opcionalmente un canal o remitente configurado específico dentro de esa tecnología.

Omite `origin` cuando Hellotext pueda elegir un canal configurado compatible. Inclúyelo cuando el negocio tenga varios remitentes o cuentas conectadas y tu integración deba utilizar uno específico. El origen debe pertenecer al negocio y coincidir con `technology`.

## 3. Identifica el perfil del cliente y el destino

Prefiere `profile` cuando tu sistema ya conozca el ID del perfil del cliente en Hellotext. Hellotext usa la tecnología y el origen elegidos para resolver un destino compatible en ese perfil.

Para envíos telefónicos, puedes usar `destination` sin `profile`. Envía el número en formato internacional E.164, por ejemplo `+14155552671`. Hellotext busca un perfil del cliente con ese teléfono y crea uno si no existe.

Cuando un perfil del cliente tenga más de un teléfono y necesites uno en particular, envía tanto `profile` como `destination`. Para Instagram o Mercado Libre, usa un perfil del cliente contactable y deja que Hellotext resuelva la identidad específica del canal.

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
    "body": "Gracias por contactarnos. Tu solicitud de devolución está lista para revisar."
  }'
```

Hellotext elige un origen de WhatsApp activo cuando omites `origin`. Para usar un remitente de WhatsApp configurado específico, agrega el identificador de su canal:

```json
{
  "technology": "whatsapp",
  "origin": "+14155552671",
  "profile": "PROFILE_ID",
  "body": "Gracias por contactarnos. Tu solicitud de devolución está lista para revisar."
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

La plantilla debe pertenecer al negocio, admitir la tecnología elegida y tener una versión aprobada activa cuando se requiera la aprobación de WhatsApp. Una edición pendiente no bloquea una versión aprobada anterior, pero una plantilla nueva pendiente todavía no puede utilizarse.

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

Cada URL debe ser accesible públicamente para que Hellotext pueda descargar y guardar el archivo. Los formatos admitidos y los límites de tamaño cambian según el canal. SMS no admite archivos adjuntos e ignora este parámetro.

Revisa los [requisitos actuales para archivos adjuntos](https://www.hellotext.com/api#create_a_message_attachments) antes de enviar archivos en producción.

## 7. Interpreta la respuesta de aceptación

Una solicitud válida responde con:

```json
{
  "status": "received"
}
```

Esto significa que Hellotext aceptó la solicitud y la encoló para procesarla de manera asíncrona. No significa que el proveedor haya aceptado el mensaje ni que lo haya entregado al cliente.

Los estados de mensajes salientes incluyen:

- `pending`: el mensaje existe y espera ser procesado.
- `routed`: Hellotext lo envió al proveedor externo.
- `delivered`: el proveedor confirmó la entrega.
- `failed`: el proveedor o el flujo de entrega no pudo completar el envío.

El estado `received` en un objeto de mensaje describe un mensaje entrante enviado por el cliente al negocio. Es diferente de la confirmación `{ "status": "received" }` de la API.

Usa [Listar todos los mensajes](https://www.hellotext.com/api#list_all_messages) para encontrar mensajes recientes y luego [Recuperar un mensaje](https://www.hellotext.com/api#retrieve_a_message) para revisar su estado final y sus marcas de tiempo. También puedes revisar la conversación del cliente en el Inbox.

## 8. Reintenta sin crear duplicados

El endpoint no acepta una clave de idempotencia. Tu integración debe evitar envíos duplicados.

- No reintentes una respuesta `422` sin corregir el parámetro inválido.
- Si la conexión falla antes de recibir una respuesta, trata el resultado como incierto en lugar de volver a enviar inmediatamente el mismo mensaje.
- Registra el negocio, perfil del cliente, tecnología, plantilla o huella del cuerpo, hora de la solicitud y respuesta.
- Revisa los mensajes recientes o la conversación en el Inbox antes de reintentar una solicitud incierta.
- Reintenta una falla del proveedor solamente después de corregir la condición indicada o esperar a que finalice.

Incluso después de aceptar la solicitud, el procesamiento asíncrono puede detenerse por límites de la cuenta, un canal no disponible, un origen inválido, una ventana de atención de WhatsApp cerrada, el estado de la plantilla o una falla del proveedor.

## 9. Soluciona problemas frecuentes

- **`401 Unauthorized`:** el token falta, es inválido, fue revocado o pertenece a otro negocio.
- **`422` en `technology`:** el valor no es compatible o la integración correspondiente no está activa.
- **`422` en `destination`:** el teléfono falta o es inválido cuando no se proporciona un perfil del cliente.
- **`422` en `body`:** no se proporcionó un cuerpo utilizable ni una plantilla válida.
- **La solicitud fue aceptada pero no aparece un mensaje saliente:** revisa el ID del perfil del cliente, el origen, los límites de la cuenta y la disponibilidad del canal.
- **El mensaje de WhatsApp falla:** confirma que la ventana de atención esté abierta para contenido libre o utiliza una plantilla aprobada activa.
- **La solicitud con plantilla falla:** confirma que la plantilla pertenezca al negocio y proporciona todos los links cortos dinámicos requeridos.
- **El mensaje llega a `failed`:** revisa la conversación y la causa del proveedor antes de decidir si corresponde otro intento.

Consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) para diagnosticar el canal y la entrega. Usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}) para problemas de autenticación, logs y reintentos.

## Checklist antes de producción

Antes de habilitar la integración en producción:

1. Envía a un perfil del cliente o número controlado por tu equipo.
2. Confirma que la solicitud responda con `status: received`.
3. Verifica que el mensaje aparezca en la conversación esperada del Inbox.
4. Confirma la tecnología, origen, destino y contenido renderizado esperados.
5. Espera el estado final `delivered` o `failed`.
6. Prueba un error de validación corregido y una respuesta incierta sin producir duplicados.
7. Confirma las reglas de consentimiento y ventanas del canal para cada caso de producción.

## Guías relacionadas

- [Resumen para desarrolladores y API]({% link _developers/developers-overview.md %})
- [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %})
- [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %})
- [¿A quién puedes escribirle?]({% link _audience/consent-and-subscriber-status.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Referencia de la API de Hellotext](https://www.hellotext.com/api)
