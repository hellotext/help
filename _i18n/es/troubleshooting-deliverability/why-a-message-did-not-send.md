Usa esta guía cuando esperabas un mensaje de una campaña, playbook, ruta, conversación o integración, pero no se envió o no llegó al cliente.

Empieza por encontrar el mensaje o la actividad que debía crearlo. El siguiente paso depende de si el mensaje nunca existió, todavía se está procesando o terminó con un error de entrega.

## Primero identifica qué ocurrió

### El mensaje nunca se creó

Si no encuentras ningún mensaje, todavía no estás ante un fallo de entrega. Revisa el origen:

- **Campaña:** confirma que no siga como borrador, en revisión o programada, y que el perfil del cliente fuera elegible para la audiencia y los canales elegidos.
- **Playbook:** confirma que se haya disparado, que la oportunidad siga siendo válida y que Hellotext haya decidido enviar en ese momento.
- **Ruta:** revisa el disparador, las condiciones, esperas, ramas y el paso que debía enviar.
- **Inbox:** confirma que la respuesta se haya enviado y no haya quedado como nota interna o borrador.
- **API:** confirma que la solicitud haya sido aceptada y luego revisa el estado real del mensaje. Una respuesta `status: received` confirma recepción de la solicitud, no entrega al cliente.

Para automatizaciones, consulta [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}). Si falta la actividad que debía iniciar el flujo, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

### El mensaje está pendiente o enrutado

Un mensaje puede estar creado pero todavía no tener confirmación final:

- `pending` indica que espera procesamiento;
- `routed` indica que se envió al proveedor externo; y
- `delivered` indica que el proveedor confirmó la entrega.

Revisa la hora del mensaje y espera un tiempo razonable antes de reintentar. Una demora del proveedor no siempre termina en fallo, y crear otro mensaje demasiado pronto puede producir un duplicado.

### El mensaje aparece como no enviado

Abre el mensaje dentro de la conversación y lee el motivo mostrado junto a **No enviado**. Hellotext normaliza la respuesta del canal para explicar qué impidió la entrega y, cuando corresponde, puede ofrecer **Reintentar**, **Elegir canal** o una acción para corregir la cuenta.

El motivo exacto es más útil que el estado general. Anótalo antes de cambiar configuración.

## Consentimiento y datos del cliente

No reintentes un mensaje cuando el perfil del cliente está desuscrito. La baja debe respetarse en todos los envíos que dependan de ese consentimiento.

También revisa que el perfil del cliente tenga una identidad válida para el canal:

- teléfono completo y correcto para SMS o WhatsApp;
- cuenta alcanzable en el canal correspondiente; y
- estado de bloqueo y suscripción compatible con el mensaje.

Si el cliente tiene otro canal disponible, Hellotext puede permitir elegirlo para un nuevo intento. Un canal alternativo no evita las reglas de consentimiento que le correspondan.

Consulta [A quién puedes enviar mensajes]({% link _audience/consent-and-subscriber-status.md %}) para diferenciar identidad, verificación, alcance y suscripción.

## Facturación y límites de la cuenta

El mensaje puede quedar bloqueado cuando el negocio necesita:

- agregar o actualizar un método de pago;
- agregar saldo o activar la recarga automática;
- aumentar un límite de recarga; o
- resolver un límite diario o mensual de mensajes.

Corrige la condición indicada antes de reintentar. Si el motivo es un límite temporal diario, espera hasta que el envío vuelva a estar permitido. Para cuentas SMS nuevas, revisa [Límites de envío SMS para negocios nuevos]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## Problemas del canal o remitente

Confirma que el canal siga conectado y activo, que el remitente seleccionado pertenezca al negocio y que la integración conserve los permisos necesarios.

Una configuración que funcionaba antes puede dejar de hacerlo si se desconecta una cuenta, cambia un permiso, Meta restringe un número o el proveedor deja temporalmente de estar disponible.

No cambies el contenido ni la automatización hasta confirmar si el motivo pertenece al canal. Revisa [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %}) para volver a la configuración correspondiente.

## Motivos de WhatsApp

Los motivos más comunes incluyen:

- **Ventana de 24 horas cerrada:** un mensaje libre ya no puede enviarse. Usa una plantilla aprobada o un canal alternativo disponible.
- **Número no alcanzable:** Meta no pudo entregar al número del cliente.
- **Marketing limitado u opt-out:** Meta limitó el mensaje de marketing o el cliente indicó que no quiere recibirlo.
- **Plantilla pausada o deshabilitada:** usa otra plantilla aprobada o corrige su estado en Meta.
- **Nombre para mostrar pendiente:** Meta debe aprobar el nombre antes de habilitar envíos.
- **Permisos, registro, políticas o pago:** revisa la cuenta y el número dentro de Meta.
- **Límite de envíos o servicio temporalmente no disponible:** espera antes de reintentar.
- **Experimento activo:** Meta puede excluir ese mensaje de una prueba de entrega. Si Hellotext ofrece otro canal elegible, puedes usarlo.

No repitas inmediatamente un envío limitado por Meta. Primero corrige la condición o espera el período indicado. Para contenido todavía en revisión o rechazado, revisa el estado de la plantilla antes de volver a programar la campaña.

## Motivos de SMS

Un SMS puede aparecer como no entregado cuando:

- el operador informó que no llegó al destinatario;
- el proveedor canceló el envío;
- el número es inválido o no está disponible; o
- ocurrió un problema temporal del proveedor.

Comprueba el formato internacional del número y evita insistir sobre destinos que el operador marcó como no alcanzables. Si el problema fue temporal y Hellotext muestra **Reintentar**, espera unos minutos y vuelve a intentarlo una sola vez.

## Motivos de Mercado Libre

Mercado Libre puede impedir el envío por:

- el horario o los límites de conversaciones iniciadas por el vendedor;
- el estado del pago o fulfillment;
- un bloqueo del comprador;
- una mediación activa; o
- restricciones de una tienda invitada.

Estos motivos dependen del estado de la operación o conversación en Mercado Libre. Corrige o espera ese estado antes de reintentar; cambiar el texto no elimina la restricción.

## El mensaje ya no era relevante

Algunos mensajes de playbooks se cancelan intencionalmente antes de salir porque la oportunidad cambió. Por ejemplo:

- el cliente ya completó el carrito o compró el producto;
- el producto está agotado o dejó de estar disponible;
- falta la URL de checkout;
- un cambio de precio más reciente reemplazó al anterior; o
- el pedido que originó un recordatorio fue cancelado o reembolsado.

En estos casos no reintentes el mensaje. La cancelación evita comunicar información vencida o insistir después de que el cliente ya convirtió.

## Decide si debes reintentar

Reintenta solamente cuando:

- el motivo era temporal;
- corregiste la configuración, el pago o los permisos; y
- Hellotext muestra una opción válida para reintentar o elegir otro canal.

No reintentes cuando:

- el cliente está desuscrito o bloqueó mensajes;
- el destino es definitivamente no alcanzable;
- el mensaje ya no aplica por una compra, cancelación o cambio de producto; o
- la plataforma prohíbe ese tipo de mensaje en la conversación actual.

Después de reintentar, confirma que el nuevo mensaje llegue a `delivered`. No uses varios reintentos seguidos para resolver una causa que todavía sigue activa.

## Qué incluir al pedir ayuda

Si el motivo no alcanza para resolver el problema, incluye:

- nombre del negocio;
- link al perfil del cliente y a la conversación;
- campaña, playbook, ruta o integración de origen;
- canal y remitente;
- fecha, hora y zona horaria;
- motivo exacto mostrado en **No enviado**;
- resultado de cualquier reintento; y
- captura de pantalla y cambios recientes de configuración.

No incluyas tokens de API, contraseñas ni datos completos de pago.

## Guías relacionadas

- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Crear una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %})
