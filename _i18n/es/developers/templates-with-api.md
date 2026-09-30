Una plantilla guarda contenido reutilizable para mensajes en Hellotext. Créala una vez mediante la API de plantillas, conserva su ID de Hellotext y usa ese ID cuando tu backend envíe un mensaje individual mediante la API de mensajes.

Crear una plantilla no envía un mensaje, no crea una campaña ni habilita una misión. La entrega sigue dependiendo del canal elegido, el perfil del cliente, el consentimiento, la disponibilidad del canal y, para WhatsApp, la aprobación de Meta y la ventana de atención.

Usa la [referencia de la API de plantillas](https://www.hellotext.com/api#templates) para consultar el contrato completo. Esta guía explica el flujo de implementación recomendado.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API guardado únicamente en tu backend y una suscripción con acceso a la API. No uses el ID público del negocio como token ni lo expongas en JavaScript del navegador.
- Un negocio activo en Hellotext con los canales que piensas utilizar.
- Una cuenta de WhatsApp Business conectada si la plantilla apunta a WhatsApp.
- Un nombre estable y único dentro del negocio. Guarda por separado el `id` público de Hellotext: el nombre y el identificador de Meta no sustituyen ese ID.
- Una decisión clara entre las tecnologías `sms`, `whatsapp` o `any`.
- Una categoría `marketing` o `utility` que coincida con el propósito real de un mensaje de WhatsApp.
- El ID del perfil del cliente en Hellotext y, cuando sea necesario, el destino específico para el envío.
- Las definiciones y los valores de todas las propiedades del cliente utilizadas para personalizar.

El token determina el negocio de todas las operaciones. El perfil, la plantilla y el canal deben pertenecer a ese mismo negocio; crear una plantilla no obtiene consentimiento ni suscribe al cliente. En Configuración, abre la sección de autorizaciones de API para crear y guardar una credencial privada desde tu entorno autorizado. La figura muestra solo el nombre de un borrador, sin una credencial creada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre ficticio de token de autorización, sin guardar ni mostrar un secreto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558.0px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-es-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-es.png" srcset="/images/developers/custom-store-integration/token-spacing/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Nombre ficticio de token de autorización, sin guardar ni mostrar un secreto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador real en un negocio ficticio: no crea ni muestra un token. Conserva el secreto sólo en tu backend.</figcaption>
</figure>

Crea las propiedades personalizadas del cliente antes de utilizar sus nombres como etiquetas. Consulta [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %}).

## 1. Elige la tecnología de la plantilla

El valor de `technology` determina dónde puede usarse la plantilla y qué componentes acepta.

### SMS

Una plantilla `sms` admite únicamente el cuerpo del mensaje. No envíes header, footer ni botones en una plantilla exclusiva para SMS.

La longitud y codificación del SMS determinan cuántos segmentos facturables utiliza el mensaje final. Mantén breve el mensaje final y comprueba primero valores ficticios controlados, incluidos caracteres Unicode y URLs ya acortadas. Consulta [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %}).

### WhatsApp

Una plantilla `whatsapp` puede incluir:

- Un cuerpo obligatorio.
- Un header opcional de archivo o dirección compatible con el canal. Consulta debajo la limitación actual de los headers de texto.
- Un footer opcional.
- Botones opcionales de respuesta rápida, URL, teléfono o copia.

Las plantillas de WhatsApp se sincronizan con Meta. Una plantilla nueva necesita una versión aprobada y disponible en la cuenta conectada antes del envío; la respuesta de creación no confirma esa aprobación.

### Cualquier tecnología compatible

Usa `any` cuando el mismo contenido reutilizable deba quedar disponible para canales conectados compatibles. Si el negocio tiene WhatsApp conectado, Hellotext también envía la versión de WhatsApp a Meta. Cuando la plantilla se envía por SMS, se utiliza solamente su cuerpo.

Especifica siempre `technology` al crear y actualizar: si se omite, el flujo actual usa `any`. Este valor pertenece a la plantilla; al enviar por la API de mensajes elige `sms` o `whatsapp`, no `any`. Las plantillas de email del editor no forman parte de este flujo de mensajes.

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

Una creación válida devuelve HTTP `201` con la plantilla serializada; una validación fallida devuelve `422`. Guarda su `id` público y el contenido solicitado en tu backend. Las plantillas exclusivas para SMS se representan como aprobadas porque no requieren revisión de Meta; ese estado no confirma un envío.

El ejemplo utiliza un link corto dinámico. Tu backend debe proporcionar la URL de destino de `order` cada vez que envía esta plantilla.

El editor de Configuración → Plantillas muestra los mismos controles de nombre y cuerpo. La figura usa otro ejemplo ficticio, «Seguimiento de devolución», en un borrador de Mensaje/SMS sin guardar; no representa la respuesta de la solicitud anterior.

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

El idioma de la versión enviada a Meta proviene del idioma configurado en el negocio; este endpoint no acepta un parámetro `language`. Confirma ese idioma antes de crear la plantilla.

Hay una limitación en el adaptador actual: un header solo de texto puede guardarse y aparecer en la respuesta de Hellotext, pero no se incluye en el contenido enviado a Meta. Coloca el texto esencial en el cuerpo, como en el ejemplo, y comprueba el contenido real aprobado antes de depender de otro tipo de header.

Algunas reglas importantes para los componentes son:

- El cuerpo de WhatsApp admite hasta 1024 caracteres y no puede comenzar ni terminar con un parámetro aislado.
- La validación local de headers de texto admite hasta 60 caracteres; esto no elimina la limitación de envío descrita arriba.
- Para WhatsApp, limita el footer a 60 caracteres. La validación local de Hellotext permite hasta 160, pero eso no garantiza aceptación por Meta. Consulta los [límites de componentes de WhatsApp](https://www.twilio.com/docs/content/whatsappcard).
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

Las etiquetas se resuelven a partir del perfil del cliente utilizado para el envío. Define antes las propiedades personalizadas: un nombre desconocido no crea una propiedad ni garantiza sustitución. Antes de lanzar, comprueba perfiles ficticios con valores presentes, faltantes y especialmente largos; luego valida el cuerpo final y su consentimiento dentro de tu flujo autorizado.

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

Cada link corto dinámico con nombre en la plantilla requiere un valor no vacío dentro de `template.shortlinks` al enviar el mensaje. Hellotext acorta la URL proporcionada y asocia la actividad de clicks con el contexto del mensaje. Comprueba todas las claves antes del POST y usa un destino del cliente correcto, con su propia autorización de acceso; un link corto no agrega autenticación al sitio de destino.

En el flujo actual, actualizar por PATCH un cuerpo con un link corto estático puede fallar durante su conversión. No supongas que basta con volver a enviar ese cuerpo: verifica el caso en tu entorno controlado o crea una plantilla nueva con el contenido deseado. Los links dinámicos con nombre evitan esa conversión de URL estática.

## 6. Espera la aprobación de WhatsApp

Recupera la plantilla y revisa su `state`:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/templates/TEMPLATE_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Interpreta los estados principales de esta forma:

- `pending`: Meta todavía está revisando la plantilla de WhatsApp.
- `approved`: la API representa una versión como aprobada; confirma qué versión y cuenta están activas antes de depender del contenido.
- `rejected`: revisa el contenido o la categoría antes de depender de ella.

Las plantillas exclusivas para SMS no pasan por la aprobación de Meta. Una plantilla `any` puede seguir pendiente cuando incluye una versión para WhatsApp.

El `state` actual se obtiene de una instancia de WhatsApp asociada y no garantiza que la última edición esté aprobada, ni que todas las cuentas conectadas tengan una versión disponible. Revisa en Hellotext la versión activa y su disponibilidad en la cuenta de envío. Una edición pendiente puede convivir con una versión anterior aprobada y activa; una plantilla nueva sin versión aprobada debe esperar. No interpretes un GET del contenido local como prueba de que Meta ya usa ese contenido.

Para localizar plantillas existentes, el listado incluye plantillas reutilizables de Mensaje en Configuración, no todas las plantillas internas de campañas, rutas o email. Usa `GET /v1/templates?limit=25`, sigue `has_more` con `starting_after` igual al último ID público y compara el nombre en tu backend; no hay filtro de nombre en este endpoint.

Una respuesta exitosa de `POST /v1/templates` solo confirma que Hellotext creó la plantilla e inició el flujo de sincronización correspondiente. No confirma que WhatsApp la haya aprobado.

## 7. Envía una plantilla aprobada

Envía la plantilla mediante la API de mensajes. Especifica `sms` o `whatsapp` y verifica previamente el ID del perfil, el destino existente, el canal y el consentimiento:

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

HTTP `200` con `received` confirma la recepción de la solicitud para procesamiento; no contiene un ID de mensaje ni garantiza que el trabajo posterior lo cree o entregue. Revisa por separado la conversación y el estado del mensaje cuando exista. La API expone `dispatched` y `error`; no supongas un estado `failed` ni una correspondencia única entre esta respuesta y el listado de mensajes. Consulta la guía de mensajes para sus límites de consulta y seguimiento.

En este endpoint de Hellotext, un mensaje libre de WhatsApp necesita la ventana de atención abierta; para iniciar una conversación o enviar fuera de ella usa una versión de plantilla aprobada y disponible. Esta regla describe este flujo de Hellotext, no otras opciones de envío directo de Meta.

Consulta [Mensajes con plantillas](https://www.hellotext.com/api#templates_a_message) y [Enviar un mensaje](https://www.hellotext.com/api#create_a_message).

## 8. Actualiza o retira una plantilla de forma segura

Usa `PATCH /v1/templates/:id` para modificar contenido compatible. Recupera primero la plantilla y construye el contenido completo deseado: envía explícitamente cuerpo, tecnología, categoría y los componentes que quieres conservar, incluidos header, footer, botones y la URL del archivo si corresponde. El flujo actual no garantiza que un campo omitido se conserve: puede vaciar contenido o componentes, usar categoría `marketing` o cambiar tecnología a `any`. No trates el PATCH como una edición parcial sin revisar esos efectos.

Una actualización válida devuelve HTTP `200`, pero eso no prueba que Meta haya activado la edición. Comprueba la respuesta, vuelve a consultar la plantilla y revisa la versión activa. Ten en cuenta la limitación de links estáticos descrita arriba.

Para plantillas de WhatsApp:

- Los cambios de contenido pueden requerir otra revisión de Meta.
- No asumas que el contenido modificado está activo mientras su estado siga pendiente.
- No uses una actualización para renombrar una plantilla de WhatsApp; crea una plantilla nueva cuando deba cambiar su identidad reutilizable.
- Cambiar la tecnología de destino puede hacer que la plantilla deje de estar disponible en el canal anterior.

Usa `DELETE /v1/templates/:id` únicamente cuando la plantilla estándar reutilizable ya no deba estar disponible. No elimines una plantilla solamente para cambiar su texto y verifica que ninguna campaña, ruta, misión o proceso del backend siga dependiendo de su ID.

La eliminación aceptada devuelve HTTP `202` y retira la plantilla del catálogo disponible; no borra automáticamente su historial. Tras un timeout de creación, consulta el catálogo y busca el nombre antes de repetir POST. Tras un timeout de actualización, consulta contenido y versiones antes de otro PATCH. No hay una clave de idempotencia documentada que haga seguro repetir estas operaciones o el envío de mensajes.

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
- **El mensaje de WhatsApp no se envía:** no existe una versión aprobada porque la plantilla es nueva y sigue pendiente o fue rechazada, o la versión aprobada está pausada, deshabilitada o no está disponible en Meta. Una edición pendiente puede mantener una versión anterior activa; verifica la cuenta y la disponibilidad concreta.

Un fallo al resolver una plantilla o convertir un link no siempre llega como un `422` estructurado; guarda el estado HTTP y una respuesta sanitizada, sin el token ni datos privados. No reintentes sin cambios un error de validación. Corrige primero el parámetro indicado. Usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}) para revisar autenticación, logs, reintentos y diagnósticos completos.

## Guías relacionadas

- [Resumen para desarrolladores y API]({% link _developers/developers-overview.md %})
- [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %})
- [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
- [Soluciona plantillas de WhatsApp]({% link _troubleshooting-deliverability/troubleshoot-whatsapp-templates.md %})
