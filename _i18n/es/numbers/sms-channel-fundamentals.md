Usa SMS para un mensaje de texto conciso dirigido a un número de teléfono compatible. Hellotext puede usarlo en campañas, misiones autónomas, rutas, conversaciones de Inbox, capturas compatibles y mensajes por API. La disponibilidad depende del negocio, el destino y el flujo; tener un teléfono guardado no demuestra permiso para escribirle.

SMS admite texto y URLs. Los botones, adjuntos, productos y ubicaciones de otros canales no se trasladan automáticamente; el formato en negrita o cursiva del editor se convierte en texto plano. SMS no usa la aprobación de plantillas de WhatsApp de Meta, pero conserva los requisitos del remitente, operador, cuenta, contenido y consentimiento.

Las tarifas y tipos de remitente varían por destino y acuerdo de la cuenta. Consulta [Precios de SMS y tipos de número]({% link _billing/sms-pricing-and-number-types.md %}) y los [precios vigentes](https://www.hellotext.com/pricing) para tu mercado. La cantidad de partes afecta el uso de SMS; no equivale por sí sola al total de la factura.

## Antes de usar SMS

Confirma que:

- Haya un remitente habilitado y una ruta SMS compatible con el país de destino.
- El número completo incluya el código de país y corresponda al destinatario autorizado.
- Exista permiso para ese canal, destino y tipo de mensaje; conserva cómo y cuándo se obtuvo.
- El negocio tenga acceso al flujo y no esté detenido por saldo, facturación, límites o una campaña pausada.
- El remitente admita las respuestas y bajas que prometes y que puedan atenderse en el negocio correcto.

Hellotext puede seleccionar números propios activos, códigos cortos compartidos o proveedores externos, según disponibilidad y configuración. El país del negocio por sí solo no garantiza un remitente, cobertura ni recepción de respuestas. Un remitente alfanumérico puede tener restricciones diferentes a las de un número bidireccional.

Si falta una ruta compatible o necesitas una identidad dedicada, consulta con Hellotext antes de planificar el lanzamiento. Tener WhatsApp conectado no habilita automáticamente todos los destinos por SMS.

## Cómo usa Hellotext SMS

### Campañas

Al crear una campaña compatible, puedes elegir:

- **WhatsApp y SMS:** permite los dos canales para destinos elegibles. La disponibilidad de WhatsApp, los destinos del perfil y el contenido determinan la ruta; no es una instrucción de reenviar por SMS cada error de WhatsApp.
- **Solo WhatsApp:** limita la selección a WhatsApp.
- **Solo SMS:** limita la selección a SMS.

Las opciones dependen de los canales y funciones del negocio. Un respaldo por SMS debe estar permitido por el flujo y el contenido y contar con permiso para SMS. La lista de destinatarios alcanzables y un perfil **Sin confirmar** no prueban ese permiso. Revisa audiencia, exclusiones y canal final antes de lanzar.

Sigue leyendo: [Mejores prácticas para campañas]({% link _campaigns/campaign-best-practices.md %}).

### Misiones autónomas

Una misión proactiva evalúa la oportunidad, elegibilidad, contenido y rutas disponibles. La selección puede seguir prioridades de canal o una ruta concreta ya asignada; **no garantiza elegir el canal más barato**. Puede omitir el envío si la oportunidad dejó de ser válida o no hay un destino compatible.

Habilitar SMS no hace que todas las misiones envíen un SMS. Revisa la configuración y alcance de esa misión, el permiso del destinatario y la versión de contenido activa. Una misión reactiva atiende la conversación según su canal y reglas; no presupongas un cambio automático a SMS si ese canal falla.

### Rutas

Los pasos siguen los canales y condiciones configurados. Elegir todos los canales disponibles no garantiza entregar por cada uno ni saltar una baja. Revisa el destino y contenido de cada rama, incluyendo teléfono ausente, perfil desuscrito y ruta no disponible.

Valida las ramas con datos ficticios aislados y destinos autorizados antes de activar la ruta. Las restricciones de horario, frecuencia y acceso del flujo se revisan por separado; no asumas que un único ajuste cubre todas las rutas y misiones.

### Inbox y respuestas

Una respuesta puede abrir o continuar una conversación cuando el remitente y proveedor admiten recepción y la respuesta se enruta al negocio. El equipo o una misión compatible puede atenderla según su configuración y capacidad; una respuesta no asigna por sí sola a una persona concreta.

Los códigos cortos compartidos pueden servir a varios negocios. Para una respuesta del mismo número y canal, Hellotext usa mensajes salientes previos y su actualización de estado para determinar el negocio. Esta asociación no constituye una identidad exclusiva ni garantiza que toda respuesta llegue al negocio que esperabas. Si necesitas continuidad dedicada, revisa [Códigos cortos exclusivos]({% link _numbers/exclusive-short-codes.md %}) con soporte y valida la recepción real.

### Mensajes por API

La integración debe elegir tecnología, destino y contenido compatibles; si omite el origen, Hellotext puede resolver un remitente disponible. Un origen explícito no garantiza cobertura ni entrega. Protege el token privado y separa las pruebas de las audiencias reales.

Una respuesta HTTP 200 **received** acusa la recepción de la solicitud y encola procesamiento; no devuelve el ID de un mensaje creado ni garantiza su creación o entrega. No es el estado de un SMS entrante. Reconcilia el resultado antes de repetir una solicitud cuyo resultado sea incierto.

Sigue leyendo: [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %}).

## Entiende la longitud y las partes de un SMS

Un texto puede dividirse en varias partes facturables aunque el teléfono lo muestre como un solo mensaje. Influyen los caracteres, la codificación, los valores de personalización y la URL y baja finales. Algunos símbolos usan más de una unidad; los emojis y ciertos caracteres pueden cambiar la codificación. Los mensajes concatenados reservan espacio para unir las partes.

En la figura, **Seguimiento de devolución** es un borrador ficticio sin guardar, en la versión **Mensaje**, con `{name}` sin resolver, una URL de ejemplo y **BAJA para salir**. No se creó una plantilla ni se envió contenido. El campo permite revisar texto, etiqueta y URL; esta captura no muestra un contador de partes ni una aprobación de WhatsApp.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor Mensaje con texto de devolución ficticio, etiqueta name sin resolver y URL de ejemplo; borrador sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/send-messages-with-api/editor-es-mobile.png 2x" width="668" height="760" />
        <img src="/images/developers/send-messages-with-api/editor-es.png" srcset="/images/developers/send-messages-with-api/editor-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Editor Mensaje con texto de devolución ficticio, etiqueta name sin resolver y URL de ejemplo; borrador sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; fuente aprobada reutilizada sin modificar sus píxeles. No se inició una importación ni se envió un mensaje.</figcaption>
</figure>

Cuando el editor del flujo muestre una estimación SMS, úsala como orientación. Las etiquetas sin resolver pueden marcarla como aproximada; el tamaño del nombre real, URL resuelta y baja puede cambiar el resultado. La estimación del navegador y la segmentación del proveedor no son una fórmula universal equivalente: el envío se contabiliza a partir del texto y partes codificados al procesarlo. Conserva el propósito y una acción clara; comprueba valores reales representativos mediante una validación autorizada y aislada.

Sigue leyendo: [Precios de SMS y tipos de número]({% link _billing/sms-pricing-and-number-types.md %}), [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}) y la [referencia de codificación y partes de SMS](https://www.twilio.com/docs/glossary/what-sms-character-limit). Los límites de ese proveedor no sustituyen las condiciones de tu ruta Hellotext.

## Consentimiento y bajas

Un número válido, un perfil **Suscrito**, una compra o una conversación reciente no demuestran permiso para todo canal y contenido. Los controles de disponibilidad y exclusión de Hellotext pueden filtrar destinos, pero no obtienen ni verifican por sí solos tu evidencia de permiso para SMS.

La figura muestra la pregunta de consentimiento del importador, con **No, no actualizar estos clientes como suscritos** seleccionado. Es un estado ficticio anterior al inicio de la importación; el archivo aún figuraba **No seleccionado**. Declarar consentimiento en una importación no crea la evidencia original ni garantiza cambiar el estado de un perfil existente que se deduplica. Comprueba los perfiles resultantes y su permiso por canal antes de usarlos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Pregunta de consentimiento del importador con No seleccionado; no se inició la importación.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 1050.5px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-es-20260928-crop.png 2x" width="780" height="1200" />
        <img src="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png 2x" style="width: auto; margin: 0 auto;" width="2065" height="705" loading="lazy" decoding="async" alt="Pregunta de consentimiento del importador con No seleccionado; no se inició la importación." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; fuente aprobada reutilizada sin modificar sus píxeles. No se inició una importación ni se envió un mensaje.</figcaption>
</figure>

Antes de enviar:

- Explica el negocio, propósito, canal y forma de baja; conserva la evidencia del permiso.
- Excluye perfiles y destinos desuscritos, inválidos, internos y de prueba según corresponda.
- Comprueba que la baja anunciada sea utilizable con ese remitente y que su respuesta llegue a Hellotext.
- Atiende las solicitudes de baja y respeta el estado del perfil; no cambies de canal ni reimportes para eludirlo.

Hellotext reconoce respuestas de baja como **BAJA** o **STOP** cuando el mensaje entrante llega y se procesa; puede marcar el perfil como desuscrito. Es distinto de escribir esa palabra en el borrador: el texto no configura la recepción del remitente ni demuestra que una baja se haya procesado. Coordina también las solicitudes recibidas por soporte u otros medios.

Consulta [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}) para distinguir permiso, estado del perfil y disponibilidad del destino.

## Estados de entrega y mensajes fallidos

Comprueba el estado y motivo del mensaje; la aceptación de una solicitud no es entrega. En los datos de mensajes puedes encontrar:

- **Pendiente (`pending`):** mensaje todavía sin confirmar para despacho.
- **Despachado (`dispatched`):** empezó el intento de despacho; no confirma recepción del operador ni del teléfono.
- **Enrutado (`routed`):** el proveedor aceptó el envío; puede seguir procesándolo.
- **Entregado (`delivered`):** llegó una confirmación de entrega del proveedor. No demuestra lectura, clic ni compra atribuida.
- **Error (`error`):** se registró un fallo con su motivo; la API usa `error`, aunque un timestamp se llame `failed_at`.

Un mensaje entrante puede tener estado `received`; es distinto del acuse **received** al crear por API. Los flujos pueden omitir un destinatario o detenerse antes de crear un mensaje, así que un conteo de errores tampoco explica todas las omisiones.

No repitas un envío mientras el resultado sea incierto. Revisa motivo, destino, remitente, canal final y horas de solicitud/despacho; consulta con soporte si no puedes reconciliarlo. Entre los bloqueos pueden estar un número inválido, rechazo del operador, ruta no disponible, saldo o facturación, límite y pausa del flujo.

Un negocio nuevo con prepago puede tener un límite diario temporal de SMS durante la revisión de calidad. Ese límite es distinto del máximo mensual configurado y de las restricciones de cada campaña, ruta o misión; no asumas un límite único ni que esperar unos minutos lo restablezca.

Sigue leyendo: [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) y [Límites de envío SMS para nuevos negocios]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## Checklist para tu primer lanzamiento por SMS

Antes de lanzar, confirma que:

1. El remitente y la ruta SMS sean compatibles con el país de destino, incluidas respuestas si las prometes.
2. Cada destino tenga permiso válido para SMS y el tipo de contenido; revisa exclusiones y perfiles existentes.
3. El texto final identifique al negocio y tenga un propósito claro, URL correcta y baja utilizable.
4. La estimación de partes sea aceptable con valores de personalización representativos y las tarifas del acuerdo actual.
5. Las respuestas y bajas lleguen al negocio y al equipo o misión que puedan atenderlas.
6. Hayas validado entrega, respuestas, URLs, personalización y baja con datos ficticios aislados y destinos autorizados, sin usar audiencias reales para probar.
7. Sepas revisar estados, motivos y reportes; reconciliar resultados inciertos y pausar el flujo antes de nuevos intentos.

## Guías relacionadas

- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Códigos cortos exclusivos]({% link _numbers/exclusive-short-codes.md %})
- [Precios de SMS y tipos de número]({% link _billing/sms-pricing-and-number-types.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
