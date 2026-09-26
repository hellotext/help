Usa esta guía antes de importar perfiles de cliente o enviar una campaña, misión o ruta. Explica cómo se combinan el estado de suscripción y la disponibilidad de los canales en Hellotext.

Esta es una guía de producto para operar Hellotext. No reemplaza una revisión legal o de cumplimiento para los países y canales que usas.

## Tres preguntas antes de enviar

Hellotext evalúa más de una condición antes de poder contactar a un cliente:

1. **¿Cuál es el estado de suscripción del perfil?** Hellotext registra si el perfil está suscrito, no confirmado o desuscrito.
2. **¿Hay un destino utilizable?** Un número de teléfono para SMS o una identidad de WhatsApp puede estar dado de baja o no estar disponible. Para email, verifica que el perfil tenga una dirección no eliminada.
3. **¿El canal elegido puede entregar ese mensaje?** Revisa el remitente, las plantillas y las reglas de conversación que correspondan al canal.

Un perfil suscrito no necesariamente está disponible en todos los canales. Un teléfono válido no demuestra, por sí solo, que exista consentimiento de marketing.

## Perfiles de cliente, suscriptores y audiencias

Un **perfil de cliente** es el registro de Hellotext para un cliente. Puede incluir identificadores, propiedades, eventos, compras, conversaciones y un estado de suscripción.

Un **suscriptor** es un perfil de cliente con una suscripción promocional registrada. Este estado no garantiza que todos los identificadores del perfil sean válidos o alcanzables.

Una **audiencia** es el grupo seleccionado para una campaña, misión, ruta o reporte. Pertenecer a una audiencia o lista no concede consentimiento.

## Estados de suscripción

Hellotext guarda uno de estos estados de suscripción en el perfil de cliente:

| Estado | Qué significa y qué hacer |
| --- | --- |
| **Suscrito** | Hellotext tiene una suscripción registrada para el perfil. Confirma que el destino y el canal que quieres usar estén disponibles antes de enviar. |
| **No confirmado** | Hellotext no tiene una suscripción confirmada para el perfil. No trates este estado como evidencia de consentimiento de marketing: confirma la fuente o usa un camino de captura válido. |
| **Desuscrito** | Hellotext registró que el cliente se dio de baja. No incluyas el perfil en envíos de marketing ni restaures la suscripción sin un nuevo opt-in válido. |

Estos estados son diferentes de condiciones del perfil o sus datos, como bloqueado, eliminado, duplicado, inválido o no alcanzable. Esas condiciones también pueden impedir el contacto, pero no son estados de suscripción.

## Estado del perfil y consentimiento del destino

El perfil de cliente muestra un estado general de suscripción. Cuando Hellotext registra una suscripción o una baja, también asocia esa decisión con las direcciones de email, los números de teléfono y las identidades de WhatsApp presentes en ese momento, y guarda su origen.

Para campañas por SMS o WhatsApp, Hellotext filtra destinos dados de baja o no aptos para el canal, aunque el perfil figure como suscrito. En campañas de email, la selección usa perfiles suscritos o no confirmados con una dirección de email no eliminada; no aplica la baja registrada para cada dirección. La baja del perfil impide el envío, y el remitente de email debe estar activo.

Esta diferencia explica por qué:

- Un perfil suscrito puede no tener un destino apto para SMS o WhatsApp.
- Un perfil con varios números o identidades de WhatsApp puede tener solo algunos destinos utilizables.
- Hellotext puede seleccionar un perfil no confirmado para una campaña, pero ese estado no acredita consentimiento de marketing.
- Una respuesta dentro de una conversación activa puede seguir reglas del canal diferentes a las de un nuevo mensaje saliente de marketing.

## De dónde viene la información de suscripción

Hellotext puede registrar o actualizar la información de suscripción mediante:

- Misiones de captura como formularios, popups, códigos QR y links compartibles.
- El checkout u otras acciones de opt-in sincronizadas por una integración.
- Una integración que obtiene el estado de suscripción desde la plataforma de origen.
- Una importación por archivo donde eliges explícitamente **Suscrito** o **No confirmado** para el grupo importado.
- Una acción de opt-in o baja del cliente.
- Un cambio manual de una persona autorizada del equipo cuando el negocio tiene evidencia para hacerlo.

En las integraciones, la plataforma de origen determina qué estados están disponibles y cómo se traducen en Hellotext. En los archivos, el estado elegido se aplica a toda la importación, por eso debes separar los archivos cuando el consentimiento cambia entre filas.

## Disponibilidad no significa consentimiento

En SMS o WhatsApp, un número puede ser inválido, una línea fija, no admitir el canal seleccionado o estar dado de baja. Corregir la disponibilidad no crea consentimiento.

Del mismo modo, tener un teléfono válido o una identidad de WhatsApp no convierte un perfil no confirmado en suscriptor. Mantén la evidencia de consentimiento y la calidad del destino como verificaciones separadas.

Por ejemplo, para una campaña promocional por SMS dirigida a una lista importada:

- Un perfil suscrito con un número apto para SMS y sin baja en ese destino todavía requiere comprobar el origen de la suscripción, el remitente y las demás reglas del envío.
- Si el perfil está suscrito pero ese número está dado de baja o no es apto para SMS, no uses ese destino aunque el estado del perfil sea **Suscrito**.
- Si el número es apto pero el perfil está **No confirmado**, no tomes la disponibilidad como prueba de consentimiento aunque Hellotext pueda incluirlo entre los candidatos. Verifica la fuente o recopila un opt-in válido antes de enviar marketing.

## Antes de enviar

Antes de lanzar una campaña o habilitar una misión que puede enviar mensajes salientes:

- Confirma cómo se creó la audiencia y de dónde viene su información de suscripción.
- Excluye registros desuscritos, de prueba, internos, inválidos y duplicados cuando corresponda.
- Revisa que el remitente y canal previstos estén conectados.
- Prueba primero con tu propio número o perfiles internos autorizados; revisa entregas, respuestas, bajas y reportes antes de ampliar la audiencia.
- Asegúrate de que el Inbox o equipo esperado pueda recibir las respuestas.

No ignores una baja para aumentar una audiencia. Si el consentimiento es desconocido, usa una captura u otro camino válido de opt-in antes de tratar al cliente como suscrito.

## Guías relacionadas

- [Perfiles de cliente]({% link _audience/customer-profiles.md %})
- [Importa perfiles de cliente]({% link _audience/import-customer-profiles.md %})
- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
