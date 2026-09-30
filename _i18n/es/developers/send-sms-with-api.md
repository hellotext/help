Usa la API de Hellotext cuando tu sistema necesite activar un SMS individual, por ejemplo una confirmación, un recordatorio o una notificación transaccional. Para enviar un mismo mensaje a una audiencia, usa una campaña de Hellotext, donde puedes seleccionar destinatarios y revisar el rendimiento del envío.

## Antes de empezar

Necesitas:

- un negocio con una suscripción activa que permita usar la API y envíos SMS habilitados;
- un token de autorización del negocio;
- un número de destino válido o el identificador de un perfil del cliente que tenga teléfono; y
- permiso para enviar el tipo de mensaje correspondiente.

El token permite actuar sobre los datos del negocio que lo creó. Guárdalo únicamente en el backend o en un administrador de secretos. No lo incluyas en Hellotext.js, en código del navegador ni en una aplicación móvil distribuida.

## 1. Crea un token de autorización

En Hellotext, abre el negocio y ve a **Ajustes → Autorizaciones**. Selecciona **Crear nuevo token** y usa un nombre que identifique la integración. El campo mostrado a continuación sólo nombra el token; cuando completes la creación en tu negocio, guarda el secreto generado de forma segura. El ejemplo es un borrador ficticio sin guardar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo real de nombre del token con datos ficticios y separación actual del label; sin guardar ni mostrar un secreto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-es-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-es.png" srcset="/images/developers/custom-store-integration/token-spacing/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Campo real de nombre del token con datos ficticios y separación actual del label; sin guardar ni mostrar un secreto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador ficticio de nombre de token en Autorizaciones. No se creó un token; el secreto se guarda sólo en el backend.</figcaption>
</figure>

Envía el token en cada solicitud:

```text
Authorization: Bearer TU_TOKEN
```

Cada token pertenece a un solo negocio. Usa tokens diferentes para negocios o entornos diferentes y reemplázalos si dejan de ser privados. Consulta la sección de [autenticación de la API](https://www.hellotext.com/api#authentication) para ver la referencia completa.

## 2. Elige cómo identificar al destinatario

Puedes enviar el SMS de dos maneras:

- **Con un número:** envía `destination` en formato internacional E.164, por ejemplo `+59899123456`. Durante el procesamiento asíncrono, Hellotext busca un perfil del cliente con ese teléfono y, si no existe, puede crearlo. La respuesta inicial no confirma que ese paso haya terminado.
- **Con un perfil del cliente:** envía su ID público de Hellotext en `profile`, no tu referencia externa ni un ID interno de base de datos. Debe pertenecer al mismo negocio del token y tener un teléfono disponible. Para elegir entre varios teléfonos, agrega también `destination` con el número E.164 exacto ya asociado al perfil. Esa combinación no agrega un teléfono nuevo.

Crear o encontrar el perfil del cliente durante el envío no lo suscribe automáticamente a comunicaciones promocionales. La identidad del cliente y su consentimiento son datos diferentes.

## 3. Envía el primer SMS

Realiza un `POST` a `https://api.hellotext.com/v1/messages` con:

- `technology`: usa `sms` para forzar el canal SMS;
- `body`: el contenido del mensaje; y
- `destination` o `profile`: el destinatario.

Este ejemplo solicita un envío a un número y permite que Hellotext encuentre o cree el perfil del cliente durante el procesamiento. Sustituye el token y el destinatario en tu entorno autorizado:

```bash
curl -X POST "https://api.hellotext.com/v1/messages" \
  -H "Authorization: Bearer TU_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{
    "technology": "sms",
    "destination": "+59899123456",
    "body": "Tu pedido ya está listo para retirar."
  }'
```

Si ya conoces el identificador del perfil del cliente, puedes usarlo en lugar del número:

```bash
curl -X POST "https://api.hellotext.com/v1/messages" \
  -H "Authorization: Bearer TU_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{
    "technology": "sms",
    "profile": "ID_DEL_PERFIL",
    "body": "Tu pedido ya está listo para retirar."
  }'
```

Al indicar `technology: sms` y omitir `origin`, Hellotext busca una ruta SMS disponible para el destino. Su disponibilidad puede depender del país y de los canales del negocio. Si necesitas un remitente específico, `origin` debe ser el identificador del canal SMS configurado para ese negocio, por ejemplo su número; no el ID público de un objeto de canal. Un remitente o perfil inválido puede fallar después de la respuesta inicial. Los archivos adjuntos no se envían por SMS. Revisa [Enviar un mensaje en la referencia de la API](https://www.hellotext.com/api#create_a_message) para conocer todos los parámetros.

## 4. Interpreta la respuesta

Cuando la solicitud es válida, la API responde:

```json
{
  "status": "received"
}
```

La respuesta HTTP `200` confirma que Hellotext recibió la solicitud y la pasó a procesamiento asíncrono. No contiene un ID de mensaje ni confirma que ya se haya creado un mensaje, encontrado el perfil o entregado el SMS. Guarda el intento con una referencia de operación propia, destinatario, hora y contenido previsto; esa referencia no es un parámetro de idempotencia de este endpoint.

Los estados de un mensaje ya creado pueden incluir:

- `pending`: pendiente de procesamiento;
- `dispatched`: salió de la cola hacia el proceso de envío, sin confirmación de entrega;
- `routed`: encaminado al proveedor;
- `delivered`: entrega confirmada; y
- `error`: fallo en el estado que expone actualmente la API. La referencia pública también usa el nombre `failed`; contempla esa diferencia al integrar los errores.

El `received` de la respuesta al `POST` es un acuse de la solicitud. Si aparece como estado de un objeto de mensaje entrante, significa recepción de ese mensaje; no entrega de tu SMS saliente.

Puedes revisar la conversación del perfil del cliente en Inbox o consultar [la lista de mensajes en la API](https://www.hellotext.com/api#list_all_messages). Consulta páginas acotadas, por ejemplo `limit=25`, y usa los cursores `starting_after` o `ending_before` y `has_more`. El listado actual no filtra por perfil, fecha ni plantilla: compara esos datos disponibles en tu sistema y no supongas que el primer resultado sea el SMS recién solicitado. Dos intentos con destinatario y contenido iguales pueden ser ambiguos.

Una vez obtenido el ID público del mensaje mediante una consulta o la interfaz, puedes recuperar ese objeto en la API. Los campos de fecha expuestos usan segundos Unix y pueden ser `null` según el estado; no constituyen un historial completo de transiciones. Si no puedes identificar un resultado inequívoco, conserva el intento como incierto en vez de enviarlo otra vez.

## 5. Prueba el flujo completo

En un entorno de prueba autorizado, antes de habilitar el envío en producción:

1. Envía un mensaje a un número de prueba controlado por tu equipo.
2. Confirma que la API responda con `status: received`.
3. Comprueba que el SMS aparezca en la conversación correcta y llegue al teléfono.
4. Revisa el estado final del mensaje.
5. Comprueba el manejo de errores de validación y autenticación con casos controlados, sin usar destinatarios ajenos ni repetir envíos inciertos.

No interpretes una respuesta exitosa como entrega final. Conserva el resultado de cada intento y evita volver a enviar el mismo mensaje automáticamente si una solicitud quedó en un estado incierto. El endpoint no recibe una clave de idempotencia, por lo que tu sistema debe prevenir duplicados al reintentar.

## Mensajes con links

No pegues una URL extensa directamente si quieres que Hellotext genere un link corto rastreado. Usa esta sintaxis dentro de `body`:

```text
Sigue tu pedido aquí: {shortlink:https://shop.example.com/orders/123}
```

Usa una URL completa y válida. Hellotext crea el link y reemplaza la instrucción durante el procesamiento; no cuenta como entrega ni como clic. El texto final con el link corto, las propiedades resueltas y el aviso de baja puede tener una longitud diferente de la solicitud original. Si el negocio usa un dominio propio para links cortos, consulta [Configurar un dominio personalizado para links cortos]({% link _integrations/custom-domain-for-short-links.md %}). Para entender cómo se conserva la sesión después del clic, revisa [Seguimiento de links en campañas, rutas y misiones]({% link _developers/tracking-on-campaigns-and-journeys.md %}).

## Cuándo usar una plantilla

Para contenido reutilizable, personalización mediante propiedades o links dinámicos con nombres, puedes enviar el identificador de una plantilla en lugar de `body`. Cuando envías `template`, Hellotext usa el contenido de esa plantilla e ignora `body`. Para SMS se usa su cuerpo de texto; una cabecera, botones o archivos no se convierten en un SMS con esos elementos. Una aprobación de WhatsApp no confirma la entrega de un SMS. Revisa que las propiedades necesarias del destinatario estén completas.

En **Configuración → Plantillas**, el modo **Mensaje** permite preparar un cuerpo reutilizable y etiquetas de propiedades. Este borrador ficticio muestra el nombre y un SMS completo con URL y baja; no se guardó ni se envió. La vista previa no valida los parámetros de una solicitud API.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de Mensaje con un borrador de SMS completo, propiedad name, URL y baja.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/send-messages-with-api/editor-es-mobile.png 2x" width="668" height="760" />
        <img src="/images/developers/send-messages-with-api/editor-es.png" srcset="/images/developers/send-messages-with-api/editor-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Editor real de Mensaje con un borrador de SMS completo, propiedad name, URL y baja." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador ficticio sin guardar de seguimiento de devolución, modo Mensaje y vista SMS. No representa envío, aprobación ni entrega; la propiedad name se resuelve con los datos del destinatario.</figcaption>
</figure>

Las plantillas con links dinámicos requieren que envíes sus URLs dentro de `template.shortlinks`. La [referencia para enviar mensajes](https://www.hellotext.com/api#create_a_message) contiene la estructura completa.

Por ejemplo, si tu plantilla ya contiene `{shortlink:order}`, el objeto de envío puede incluir:

```json
{
  "technology": "sms",
  "profile": "ID_DEL_PERFIL",
  "template": {
    "id": "ID_DE_LA_PLANTILLA",
    "shortlinks": {
      "order": "https://shop.example.com/orders/123"
    }
  }
}
```

Sustituye ambos IDs por IDs públicos del mismo negocio y proporciona una URL válida para cada link dinámico definido. El nombre `order` debe coincidir con el de tu plantilla.

Consulta [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %}) para conocer la creación de plantillas, etiquetas de propiedades, links cortos dinámicos, selección de canales y aprobación de WhatsApp.

## Longitud, codificación y costo

La capacidad de un SMS simple depende de la codificación del texto final:

| Codificación | Capacidad de un segmento simple |
| --- | --- |
| GSM de 7 bits | Hasta 160 unidades; algunos símbolos consumen dos. |
| Latin-1 | Hasta 140 unidades de un byte. |
| UCS-2 / Unicode | Hasta 70 unidades de 16 bits; un emoji puede ocupar más de una. |

Caracteres especiales, acentos y emojis pueden cambiar la codificación seleccionada. En GSM, símbolos como `{` y `]` ocupan dos unidades por el carácter de escape. Los mensajes largos reservan espacio para concatenación y pueden dividirse en varios segmentos facturables. La ruta y el proveedor pueden aplicar límites de partición diferentes, especialmente con Unicode. Evalúa el cuerpo final después de sustituir propiedades y links; contar caracteres del JSON o de una plantilla sin resolver no basta para estimar segmentos ni costo.

El precio también depende del país de destino, el plan y los SMS incluidos. Consulta [Precios y tipos de números SMS]({% link _billing/sms-pricing-and-number-types.md %}) para estimar el envío.

## Consentimiento y límites de envío

La API no reemplaza las reglas de consentimiento. Antes de enviar:

- verifica que el cliente pueda recibir ese tipo de comunicación;
- no envíes mensajes promocionales a perfiles no suscritos o que cancelaron la suscripción;
- incluye el mecanismo de baja correspondiente cuando sea necesario; y
- respeta las leyes y horarios aplicables al país de destino.

Consulta [A quién puedes enviar mensajes]({% link _audience/consent-and-subscriber-status.md %}) para diferenciar identidad, verificación y suscripción. Los [límites SMS para negocios nuevos]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}) también aplican a mensajes iniciados mediante la API.

## Errores frecuentes

- **`401 Unauthorized`:** el token falta, no es válido o fue reemplazado.
- **`422 Request Failed`:** revisa el número, `body`, `profile`, `technology` y la disponibilidad de SMS para el negocio. Corrige la solicitud antes de reintentar.
- **`403 Forbidden`:** comprueba que la suscripción del negocio permita usar la API. Un token válido no habilita por sí solo esa función.
- **Timeout o error del servidor:** registra el intento como incierto. La solicitud puede haberse recibido aunque tu sistema no haya leído la respuesta. Revisa el resultado antes de decidir un nuevo envío; la espera progresiva por sí sola no evita duplicados. El procesamiento interno o del proveedor también puede seguir en curso.
- **La solicitud fue recibida, pero no aparece o falla el mensaje:** revisa el ID público del perfil y su teléfono existente, `origin`, el estado disponible, los límites y el canal. Algunos controles ocurren después del acuse inicial, incluso antes de crear el mensaje. No conviertas `received` en una confirmación de éxito ni presupongas que todo fallo asíncrono tendrá un objeto consultable.

La sección de [errores de la API](https://www.hellotext.com/api#errors) explica el formato de cada respuesta.

## Guías relacionadas

- [Fundamentos del canal SMS]({% link _numbers/sms-channel-fundamentals.md %})
- [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %})
- [Integrar una tienda personalizada]({% link _developers/custom-store-integration.md %})
- [Referencia de la API de Hellotext](https://www.hellotext.com/api)
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Links rastreados y dominios de links cortos]({% link _analytics-reporting-attribution/tracked-links.md %})
