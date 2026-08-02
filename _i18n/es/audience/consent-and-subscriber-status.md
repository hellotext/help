Usa esta guía antes de importar perfiles de cliente o enviar una campaña, playbook o ruta. Explica cómo se combinan el estado de suscripción y la disponibilidad de los canales en Hellotext.

Esta es una guía de producto para operar Hellotext. No reemplaza una revisión legal o de cumplimiento para los países y canales que usas.

## Tres preguntas antes de enviar

Hellotext evalúa más de una condición antes de poder contactar a un cliente:

1. **¿Cuál es el estado de suscripción del perfil?** Hellotext registra si el perfil está suscrito, no confirmado o desuscrito.
2. **¿Hay un destino utilizable?** Un teléfono, identidad de WhatsApp o email puede tener su propia condición de baja o disponibilidad.
3. **¿El canal elegido puede entregar ese mensaje?** SMS y WhatsApp aplican distintas reglas de destino, remitente, plantilla y conversación.

Un perfil suscrito no necesariamente está disponible en todos los canales. Un teléfono válido no demuestra, por sí solo, que exista consentimiento de marketing.

## Perfiles de cliente, suscriptores y audiencias

Un **perfil de cliente** es el registro de Hellotext para un cliente. Puede incluir identificadores, propiedades, eventos, compras, conversaciones y un estado de suscripción.

Un **suscriptor** es un perfil de cliente con una suscripción registrada. Este estado no garantiza que todos los identificadores del perfil sean válidos o alcanzables.

Una **audiencia** es el grupo seleccionado para una campaña, playbook, ruta o reporte. Pertenecer a una audiencia o lista no concede consentimiento.

## Estados de suscripción

Hellotext guarda uno de estos estados de suscripción en el perfil de cliente:

| Estado | Qué significa | Cómo usarlo |
| --- | --- | --- |
| **Suscrito** | Hellotext tiene una suscripción registrada para el perfil. | Confirma que el destino y canal que quieres usar estén disponibles antes de enviar. |
| **No confirmado** | Hellotext no tiene una suscripción confirmada para el perfil. | No trates este estado como evidencia de consentimiento de marketing. Confirma la fuente o usa un camino de captura válido. |
| **Desuscrito** | Hellotext registró que el cliente se dio de baja. | No incluyas el perfil en envíos de marketing ni restaures la suscripción sin un nuevo opt-in válido. |

Estos estados son diferentes de condiciones del perfil o sus datos, como bloqueado, eliminado, duplicado, inválido o no alcanzable. Esas condiciones también pueden impedir el contacto, pero no son estados de suscripción.

## Estado del perfil y consentimiento del destino

El perfil de cliente muestra un estado general de suscripción. Cuando Hellotext registra una suscripción o una baja, también asocia esa decisión con los identificadores que se usan en ese momento para contactar al cliente y guarda su origen.

Al enviar, Hellotext revisa el destino del canal seleccionado. Por ejemplo, puede rechazar un teléfono dado de baja, inválido para SMS o no disponible en WhatsApp aunque el perfil figure como suscrito.

Esta diferencia explica por qué:

- Un perfil suscrito puede no ser alcanzable en el canal elegido.
- Un perfil con varios identificadores puede tener solo algunos destinos utilizables.
- Un perfil no confirmado puede existir en una audiencia sin demostrar que puede recibir mensajes de marketing.
- Una respuesta dentro de una conversación activa puede seguir reglas del canal diferentes a las de un nuevo mensaje saliente de marketing.

## De dónde viene la información de suscripción

Hellotext puede registrar o actualizar la información de suscripción mediante:

- Playbooks de captura como formularios, popups, códigos QR y links compartibles.
- El checkout u otras acciones de opt-in sincronizadas por una integración.
- Una integración que obtiene el estado de suscripción desde la plataforma de origen.
- Una importación por archivo donde eliges explícitamente **Suscrito** o **No confirmado** para el grupo importado.
- Una acción de opt-in o baja del cliente.
- Un cambio manual de una persona autorizada del equipo cuando el negocio tiene evidencia para hacerlo.

En las integraciones, la plataforma de origen determina qué estados están disponibles y cómo se traducen en Hellotext. En los archivos, el estado elegido se aplica a toda la importación, por eso debes separar los archivos cuando el consentimiento cambia entre filas.

## Disponibilidad no significa consentimiento

Un perfil puede no ser alcanzable porque su teléfono es inválido, es una línea fija, no admite el canal seleccionado o tiene una baja asociada al identificador. Corregir la disponibilidad no crea consentimiento.

Del mismo modo, tener un teléfono válido o una identidad de WhatsApp no convierte un perfil no confirmado en suscriptor. Mantén la evidencia de consentimiento y la calidad del destino como verificaciones separadas.

## Antes de enviar

Antes de lanzar una campaña o habilitar un playbook que puede enviar mensajes salientes:

- Confirma cómo se creó la audiencia y de dónde viene su información de suscripción.
- Excluye registros desuscritos, de prueba, internos, inválidos y duplicados cuando corresponda.
- Revisa que el remitente y canal previstos estén conectados.
- Prueba con una audiencia pequeña y revisa entregas, respuestas, bajas y reportes.
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
