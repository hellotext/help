Una plantilla guarda contenido reutilizable para mensajes en Hellotext. Créala una vez mediante la API de plantillas, conserva su ID de Hellotext y usa ese ID cuando tu backend envíe un mensaje individual mediante la API de mensajes.

Crear una plantilla no envía un mensaje, no crea una campaña ni habilita un playbook. La entrega sigue dependiendo del canal elegido, el perfil del cliente, el consentimiento, la disponibilidad del canal y, para WhatsApp, la aprobación de Meta y la ventana de atención.

Usa la [referencia de la API de plantillas](https://www.hellotext.com/api#templates) para consultar el contrato completo. Esta guía explica el flujo de implementación recomendado.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API guardado únicamente en tu backend.
- Un negocio activo en Hellotext con los canales que piensas utilizar.
- Una cuenta de WhatsApp Business conectada si la plantilla apunta a WhatsApp.
- Un nombre estable y único para la plantilla.
- Una decisión clara entre las tecnologías `sms`, `whatsapp` o `any`.
- Una categoría `marketing` o `utility` que coincida con el propósito real de un mensaje de WhatsApp.
- El ID del perfil del cliente en Hellotext y, cuando sea necesario, el destino específico para el envío.
- Las definiciones y los valores de todas las propiedades del cliente utilizadas para personalizar.

Crea las propiedades personalizadas del cliente antes de utilizar sus nombres como etiquetas. Consulta [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %}).

## 1. Elige la tecnología de la plantilla

El valor de `technology` determina dónde puede usarse la plantilla y qué componentes acepta.

### SMS

Una plantilla `sms` admite únicamente el cuerpo del mensaje. No envíes header, footer ni botones en una plantilla exclusiva para SMS.

La longitud y codificación del SMS determinan cuántos segmentos facturables utiliza el mensaje final. Mantén breve el mensaje renderizado y pruébalo con datos reales de clientes. Consulta [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %}).

### WhatsApp

Una plantilla `whatsapp` puede incluir:

- Un cuerpo obligatorio.
- Un header opcional de texto, archivo o dirección.
- Un footer opcional.
- Botones opcionales de respuesta rápida, URL, teléfono o copia.

Las plantillas de WhatsApp se envían a Meta y al principio devuelven un estado pendiente. No dependas de la plantilla para un envío en producción hasta que su estado sea aprobado.

### Cualquier tecnología compatible

Usa `any` cuando el mismo contenido reutilizable deba quedar disponible para canales conectados compatibles. Si el negocio tiene WhatsApp conectado, Hellotext también envía la versión de WhatsApp a Meta. Cuando la plantilla se envía por SMS, se utiliza solamente su cuerpo.

Usa una plantilla específica para un canal cuando el texto o los componentes solo tengan sentido en ese canal.

## 2. Crea una plantilla para SMS

Crea una plantilla exclusiva para SMS con nombre y cuerpo:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/templates \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Pedido listo SMS",
    "technology": "sms",
    "body": "Hola {name}, tu pedido está listo. Revísalo aquí: {shortlink:order}"
  }'
```

Guarda el `id` devuelto para la plantilla. Las plantillas exclusivas para SMS se representan como aprobadas porque no requieren revisión de Meta.

El ejemplo utiliza un link corto dinámico. Tu backend debe proporcionar la URL de destino de `order` cada vez que envía esta plantilla.

## 3. Crea una plantilla para WhatsApp

Para WhatsApp, establece explícitamente la categoría e incluye únicamente los componentes que necesita el mensaje:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/templates \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Pedido listo WhatsApp",
    "technology": "whatsapp",
    "category": "utility",
    "header": {
      "type": "text",
      "text": "Tu pedido está listo"
    },
    "body": "Hola {name}, tu pedido está listo. Revisa los detalles aquí: {shortlink:order}.",
    "footer": "Responde si necesitas ayuda",
    "buttons": [
      {
        "type": "quick_reply",
        "text": "Necesito ayuda"
      }
    ]
  }'
```

Usa `utility` para una actualización transaccional esperada y `marketing` para una promoción, oferta o reactivación. Elige el propósito real en lugar de decidir la categoría según el precio. Meta puede rechazar o reclasificar contenido que no coincida con su categoría.

Algunas reglas importantes para los componentes son:

- El cuerpo de WhatsApp admite hasta el límite documentado por la API y no puede comenzar ni terminar con un parámetro aislado.
- Los headers de texto están limitados a 60 caracteres.
- Un header con archivo requiere una `attachment_url` accesible públicamente; Hellotext descarga y guarda el archivo.
- Una plantilla admite hasta 10 botones en total.
- El texto de cada botón está limitado a 25 caracteres.
- Una plantilla puede contener como máximo dos botones de URL, uno de teléfono y uno de copia.

Consulta [Crear una plantilla](https://www.hellotext.com/api#create_a_template) y la [referencia de componentes](https://www.hellotext.com/api#header_a_template) para conocer los límites actuales de campos y archivos.

## 4. Personaliza el cuerpo de forma segura

Los cuerpos de las plantillas admiten etiquetas de propiedades del cliente entre llaves. Algunos ejemplos frecuentes son:

- `{name}`
- `{full_name}`
- `{last_name}`
- `{email}`
- `{phone}`
- `{birthday}`
- Una propiedad personalizada del cliente como `{membership_level}`

Las etiquetas se resuelven a partir del perfil del cliente utilizado para el envío. Antes de lanzar, prueba perfiles con valores presentes, faltantes y especialmente largos para que el mensaje renderizado siga siendo natural.

WhatsApp no acepta un cuerpo que comience o termine con un parámetro aislado. Por ejemplo:

- Válido: `Hola {name}, tu pedido está listo.`
- Inválido: `{name}, tu pedido está listo.`

Consulta [Cuerpo de plantillas y etiquetas de propiedades](https://www.hellotext.com/api#body_a_template).

## 5. Usa links cortos estáticos y dinámicos

Usa un link corto estático cuando todos los clientes deban llegar al mismo destino:

```text
Mira la colección: {shortlink:https://shop.example.com/collections/new}
```

Usa un link corto dinámico con nombre cuando tu backend proporcione una URL diferente en cada envío:

```text
Revisa tu pedido: {shortlink:order}
```

Cada link corto dinámico con nombre en la plantilla requiere un valor dentro de `template.shortlinks` al enviar el mensaje. Hellotext acorta la URL proporcionada y asocia la actividad de clicks con el contexto del mensaje.

## 6. Espera la aprobación de WhatsApp

Recupera la plantilla y revisa su `state`:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/templates/TEMPLATE_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Interpreta los estados principales de esta forma:

- `pending`: Meta todavía está revisando la plantilla de WhatsApp.
- `approved`: la plantilla puede utilizarse para envíos compatibles por WhatsApp.
- `rejected`: revisa el contenido o la categoría antes de depender de ella.

Las plantillas exclusivas para SMS no pasan por la aprobación de Meta. Una plantilla `any` puede seguir pendiente cuando incluye una versión para WhatsApp.

Una respuesta exitosa de `POST /v1/templates` solo confirma que Hellotext creó la plantilla e inició el flujo de sincronización correspondiente. No confirma que WhatsApp la haya aprobado.

## 7. Envía una plantilla aprobada

Envía la plantilla mediante la API de mensajes. Especifica la tecnología cuando el canal sea importante:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/messages \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID",
    "technology": "whatsapp",
    "template": {
      "id": "TEMPLATE_ID",
      "shortlinks": {
        "order": "https://shop.example.com/account/orders/1001"
      }
    }
  }'
```

Cuando envías `template`, Hellotext utiliza el cuerpo de la plantilla e ignora un `body` separado en el mensaje. Puedes enviar el ID de la plantilla como string cuando no tenga links cortos dinámicos.

Una solicitud válida responde con:

```json
{
  "status": "received"
}
```

Esto significa que el mensaje fue aceptado para su procesamiento. No confirma la entrega por parte de WhatsApp o del operador móvil. Recupera el mensaje o revisa por separado la conversación y su estado de entrega.

En WhatsApp, un mensaje libre solo puede enviarse mientras la ventana de atención del cliente está abierta. Se requiere una plantilla aprobada de WhatsApp para iniciar una conversación o enviar fuera de esa ventana.

Consulta [Mensajes con plantillas](https://www.hellotext.com/api#templates_a_message) y [Enviar un mensaje](https://www.hellotext.com/api#create_a_message).

## 8. Actualiza o retira una plantilla de forma segura

Usa `PATCH /v1/templates/:id` para modificar contenido compatible, como el cuerpo, header, footer, botones o tecnología de destino.

Para plantillas de WhatsApp:

- Los cambios de contenido pueden requerir otra revisión de Meta.
- No asumas que el contenido modificado está activo mientras su estado siga pendiente.
- No uses una actualización para renombrar una plantilla de WhatsApp; crea una plantilla nueva cuando deba cambiar su identidad reutilizable.
- Cambiar la tecnología de destino puede hacer que la plantilla deje de estar disponible en el canal anterior.

Usa `DELETE /v1/templates/:id` únicamente cuando la plantilla estándar reutilizable ya no deba estar disponible. No elimines una plantilla solamente para cambiar su texto y verifica que ninguna campaña, ruta, playbook o proceso del backend siga dependiendo de su ID.

Consulta [Actualizar una plantilla](https://www.hellotext.com/api#update_a_template) y [Eliminar una plantilla](https://www.hellotext.com/api#delete_a_template).

## 9. Soluciona errores frecuentes

Revisa estas causas antes de reintentar:

- **`401`:** el token de la API falta, es inválido o fue revocado.
- **`403`:** el negocio no puede realizar la operación solicitada de la API.
- **`422` en `technology`:** WhatsApp no está conectado o el valor no es `sms`, `whatsapp` o `any`.
- **`422` en componentes:** una plantilla exclusiva para SMS contiene header, footer o botones, o algún componente supera su límite.
- **`422` en `body`:** el cuerpo está vacío, es demasiado largo o contiene un parámetro aislado para WhatsApp.
- **`422` en botones:** falta la URL, teléfono, valor para copiar o texto correspondiente, o se superó la cantidad permitida.
- **Falla la solicitud del mensaje:** la plantilla no pertenece al negocio, falta un link corto dinámico, no se puede contactar al perfil del cliente o el canal elegido no está disponible.
- **El mensaje de WhatsApp no se envía:** la plantilla o su último cambio todavía está pendiente, fue rechazado, está pausado o no está disponible en Meta.

No reintentes sin cambios un error de validación. Corrige primero el parámetro indicado. Usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}) para revisar autenticación, logs, reintentos y diagnósticos completos.

## Guías relacionadas

- [Resumen para desarrolladores y API]({% link _developers/developers-overview.md %})
- [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
- [Soluciona plantillas de WhatsApp]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %})
