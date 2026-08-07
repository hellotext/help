Usa la API de Hellotext cuando tu sistema necesite activar un SMS individual, por ejemplo una confirmación, un recordatorio o una notificación transaccional. Para enviar un mismo mensaje a una audiencia, usa una campaña de Hellotext, donde puedes seleccionar destinatarios y revisar el rendimiento del envío.

## Antes de empezar

Necesitas:

- un negocio activo en Hellotext con envíos SMS habilitados;
- un token de autorización del negocio;
- un número de destino válido o el identificador de un perfil del cliente que tenga teléfono; y
- permiso para enviar el tipo de mensaje correspondiente.

El token permite actuar sobre los datos del negocio que lo creó. Guárdalo únicamente en el backend o en un administrador de secretos. No lo incluyas en Hellotext.js, en código del navegador ni en una aplicación móvil distribuida.

## 1. Crea un token de autorización

En Hellotext, abre el negocio y ve a **Ajustes → Autorizaciones**. Selecciona **Crear nuevo token**, usa un nombre que identifique la integración y guarda el valor generado.

Envía el token en cada solicitud:

```text
Authorization: Bearer TU_TOKEN
```

Cada token pertenece a un solo negocio. Usa tokens diferentes para negocios o entornos diferentes y reemplázalos si dejan de ser privados. Consulta la sección de [autenticación de la API](https://www.hellotext.com/api#authentication) para ver la referencia completa.

## 2. Elige cómo identificar al destinatario

Puedes enviar el SMS de dos maneras:

- **Con un número:** envía `destination` en formato internacional E.164, por ejemplo `+59899123456`. Hellotext busca un perfil del cliente con ese teléfono y, si no existe, crea uno automáticamente.
- **Con un perfil del cliente:** envía su identificador en `profile`. El perfil debe tener un teléfono disponible. Si tiene varios y necesitas elegir uno específico, agrega también `destination`.

Crear o encontrar el perfil del cliente durante el envío no lo suscribe automáticamente a comunicaciones promocionales. La identidad del cliente y su consentimiento son datos diferentes.

## 3. Envía el primer SMS

Realiza un `POST` a `https://api.hellotext.com/v1/messages` con:

- `technology`: usa `sms` para forzar el canal SMS;
- `body`: el contenido del mensaje; y
- `destination` o `profile`: el destinatario.

Este ejemplo envía a un número y permite que Hellotext encuentre o cree el perfil del cliente:

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

Hellotext elige automáticamente un canal SMS disponible. Solo envía `origin` cuando necesites usar un remitente específico configurado para el negocio. Revisa [Enviar un mensaje en la referencia de la API](https://www.hellotext.com/api#create_a_message) para conocer todos los parámetros.

## 4. Interpreta la respuesta

Cuando la solicitud es válida, la API responde:

```json
{
  "status": "received"
}
```

Esta respuesta confirma que Hellotext aceptó la solicitud y programó su procesamiento. No confirma que el operador móvil haya entregado el SMS.

El envío se procesa de manera asíncrona. Sus estados posteriores pueden incluir:

- `pending`: creado y pendiente de procesamiento;
- `routed`: enviado al proveedor externo;
- `delivered`: confirmado como entregado; y
- `failed`: no pudo entregarse.

Puedes revisar la conversación del perfil del cliente en Inbox o consultar [la lista de mensajes en la API](https://www.hellotext.com/api#list_all_messages). La referencia también permite recuperar un mensaje específico una vez que conoces su identificador.

## 5. Prueba el flujo completo

Antes de habilitar el envío en producción:

1. Envía un mensaje a un número de prueba controlado por tu equipo.
2. Confirma que la API responda con `status: received`.
3. Comprueba que el SMS aparezca en la conversación correcta y llegue al teléfono.
4. Revisa el estado final del mensaje.
5. Prueba un número inválido y un token inválido para verificar cómo registra errores tu integración.

No interpretes una respuesta exitosa como entrega final. Conserva el resultado de cada intento y evita volver a enviar el mismo mensaje automáticamente si una solicitud quedó en un estado incierto. El endpoint no recibe una clave de idempotencia, por lo que tu sistema debe prevenir duplicados al reintentar.

## Mensajes con links

No pegues una URL extensa directamente si quieres que Hellotext genere un link corto rastreado. Usa esta sintaxis dentro de `body`:

```text
Sigue tu pedido aquí: {shortlink:https://shop.example.com/orders/123}
```

Hellotext reemplaza la instrucción durante el procesamiento. Si el negocio usa un dominio propio para links cortos, consulta [Configurar un dominio personalizado para links cortos]({% link _integrations/custom-domain-for-short-links.md %}). Para entender cómo se conserva la sesión después del clic, revisa [Seguimiento de links en campañas, rutas y playbooks]({% link _developers/tracking-on-campaigns-and-journeys.md %}).

## Cuándo usar una plantilla

Para contenido reutilizable, personalización mediante propiedades o links dinámicos con nombres, puedes enviar el identificador de una plantilla en lugar de `body`. Cuando envías `template`, Hellotext usa el contenido de esa plantilla e ignora `body`.

Las plantillas con links dinámicos requieren que envíes sus URLs dentro de `template.shortlinks`. La [referencia para enviar mensajes](https://www.hellotext.com/api#create_a_message) contiene la estructura completa.

Consulta [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %}) para conocer la creación de plantillas, etiquetas de propiedades, links cortos dinámicos, selección de canales y aprobación de WhatsApp.

## Longitud, codificación y costo

La cantidad de caracteres de un segmento SMS depende de su codificación:

- GSM de 7 bits: hasta 160 caracteres por segmento simple;
- Latin-1: hasta 140 caracteres por segmento simple; y
- UCS-2: hasta 70 caracteres por segmento simple.

Caracteres especiales y emojis pueden cambiar la codificación. Los mensajes largos pueden dividirse en varios segmentos SMS facturables, y parte del espacio se usa para concatenarlos. Por eso no calcules el costo únicamente contando caracteres sin considerar la codificación.

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
- **Errores del servidor:** registra la respuesta y reintenta con espera progresiva. Protege el flujo contra envíos duplicados.
- **La solicitud fue aceptada, pero el mensaje falla:** revisa el estado del mensaje, el teléfono, los límites de la cuenta y la disponibilidad del canal.

La sección de [errores de la API](https://www.hellotext.com/api#errors) explica el formato de cada respuesta.

## Guías relacionadas

- [Fundamentos del canal SMS]({% link _numbers/sms-channel-fundamentals.md %})
- [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %})
- [Integrar una tienda personalizada]({% link _developers/custom-store-integration.md %})
- [Referencia de la API de Hellotext](https://www.hellotext.com/api)
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Links rastreados y dominios de links cortos]({% link _analytics-reporting-attribution/tracked-links.md %})
