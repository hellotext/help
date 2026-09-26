**Audiencia** es el espacio donde puedes entender, organizar y gestionar los perfiles de clientes conocidos por Hellotext.

Usa los datos de audiencia para decidir quién debería recibir una campaña, qué señales debería usar una misión o un journey y qué contexto necesita el equipo de Inbox antes de ayudar a un cliente.

## Perfiles de clientes y suscriptores

Un perfil de cliente es el registro unificado que Hellotext construye para una persona. Puede incluir identidad, direcciones de canal, propiedades, historial de compras, eventos rastreados, listas, segmentos y contexto de conversaciones.

Un suscriptor es un perfil de cliente con una suscripción promocional registrada. No todos los perfiles están suscritos, y una suscripción registrada no garantiza que el cliente esté disponible en todos los canales.

Sigue leyendo: [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %}).

## Listas y segmentos

Usa **listas** para mantener un grupo fijo de perfiles. Un perfil permanece en la lista hasta que se agrega o elimina manualmente, mediante una importación o por una integración.

Usa **segmentos** cuando la pertenencia debería actualizarse automáticamente según propiedades del perfil o actividad del cliente.

Sigue leyendo: [Listas vs. segmentos]({% link _audience/lists-and-segments.md %}).

## Consentimiento y estado de suscripción

Los datos del perfil y el permiso para enviar son cosas diferentes. Antes de enviar una campaña o depender de una misión saliente, entiende si el cliente está suscrito, qué canal está disponible y si las demás reglas de entrega permiten el mensaje.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Importar perfiles de clientes

Usa importaciones cuando necesitas llevar datos existentes de clientes desde una planilla, exportación de CRM u otra fuente a Hellotext.

Las importaciones pueden crear o actualizar perfiles, organizarlos en listas y preparar datos para segmentación, personalización, campañas, misiones, journeys y flujos de Inbox.

Sigue leyendo: [Importa perfiles de clientes]({% link _audience/import-customer-profiles.md %}).

## Enriquece perfiles mediante conversaciones

Usa [Recolector de Propiedades]({% link _captures/property-collector-playbook.md %}) cuando la IA debería recopilar propiedades faltantes seleccionadas directamente o antes de que otra misión continúe.

Usa [Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %}) cuando quieras solicitar una suscripción y recopilar las propiedades configuradas que aún faltan en Webchat o en conversaciones entrantes de canales habilitados, como WhatsApp, Instagram, Messenger o SMS. La disponibilidad depende de la configuración del negocio.

## Usa datos de audiencia en Hellotext

Si importaste asistentes a un evento y quieres conservar ese grupo, usa una **lista**: su pertenencia cambia cuando alguien agrega o quita perfiles. Si quieres encontrar a quienes compraron en los últimos 30 días, usa un **segmento** basado en compras: la pertenencia se actualiza cuando cambia la actividad registrada.

Ambos grupos pueden aportar contexto a campañas, misiones, journeys e Inbox. Pertenecer a una lista o segmento no crea consentimiento ni garantiza que haya un destino utilizable para enviar mensajes.

## Antes de usar una audiencia

Antes de lanzar una campaña o usar una audiencia en una automatización, revisa:

* El tamaño de la audiencia se aproxima a lo esperado y algunos perfiles representativos cumplen los criterios.
* Las propiedades o actividades que usan las reglas están presentes y son confiables.
* Conoces el origen de la suscripción y confirmaste que el estado, el destino y el canal permiten el mensaje previsto.
* Las exclusiones dejan fuera perfiles internos, de prueba o no previstos cuando corresponde.
* La personalización tiene un resultado adecuado cuando falta una propiedad.

## Guías relacionadas

* [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
* [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
* [Crea y gestiona listas]({% link _audience/lists.md %})
* [Crea segmentos]({% link _audience/segments.md %})
* [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
* [Importa perfiles de clientes]({% link _audience/import-customer-profiles.md %})
* [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
* [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
* [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
