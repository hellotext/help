Un perfil del cliente es el registro unificado que Hellotext usa para entender a un cliente. Reúne su identidad, direcciones de canal, propiedades, actividad y contexto de conversaciones a medida que llegan datos desde las herramientas conectadas.

Un perfil no es necesariamente un suscriptor. Hellotext puede conocer a un cliente antes de que esa persona sea elegible para recibir un mensaje promocional.

## Abre un perfil del cliente

Ve a **Audiencia** y selecciona un perfil. El perfil se abre junto a la lista de audiencia para que puedas revisar su información sin perder tu ubicación.

Usa la búsqueda cuando conozcas el nombre, teléfono, email u otro identificador del cliente.

## Qué puede contener un perfil

La información disponible depende de los canales y las integraciones conectadas al negocio. Un perfil puede incluir:

* **Identidad:** nombre e identificadores que Hellotext usa para reconocer al cliente.
* **Direcciones de canal:** teléfonos, emails, identidades de WhatsApp o identidades de otros canales conectados.
* **Estado de suscripción y del perfil:** si el cliente está suscrito, desuscrito o sin confirmar y si el perfil tiene una restricción adicional, como un bloqueo.
* **Propiedades:** información estándar o personalizada como cumpleaños, ubicación, empresa, etiquetas y preferencias.
* **Listas y segmentos:** listas fijas y segmentos dinámicos que actualmente incluyen al perfil.
* **Actividad:** acciones rastreadas como cambios de suscripción, clics, actividad de productos, pedidos y otros eventos recibidos por Hellotext.
* **Contexto de conversaciones:** actividad de mensajes y notas internas que ayudan al equipo de Inbox a entender al cliente.

Algunos perfiles contienen solo un nombre o una identidad de canal al principio. Se vuelven más útiles a medida que Hellotext recibe propiedades y actividad adicionales.

## Las propiedades y la actividad son diferentes

Las **propiedades** describen lo que se sabe actualmente del cliente. Se pueden usar para segmentación y personalización y normalmente pueden editarse cuando la fuente lo permite.

La **actividad** es el registro cronológico de lo que ocurrió. Los eventos pueden venir de integraciones de comercio, herramientas de captura, links rastreados, conversaciones, Hellotext.js o la API.

Por ejemplo, `cumpleaños` puede ser una propiedad del perfil, mientras que una vista de producto o un pedido confirmado se registra como actividad. Ambos pueden ayudar a Hellotext a decidir qué experiencia es relevante, pero representan datos diferentes.

## Cómo se crean y actualizan los perfiles

Hellotext puede crear o enriquecer un perfil cuando recibe datos desde:

* Una plataforma de eCommerce conectada u otra integración.
* Un playbook de captura, como Webchat, un popup, un formulario, un código QR o un link compartible.
* Una conversación iniciada por el cliente en un canal conectado.
* Una importación de perfiles de clientes.
* Hellotext.js, la API o una integración personalizada.
* Una actualización manual de un integrante del equipo.

Cuando está disponible el mismo identificador confiable, Hellotext puede usarlo para asociar nueva información con un perfil existente. Los identificadores incompletos o en conflicto todavía pueden producir posibles duplicados que requieren revisión.

## Revisa y une posibles duplicados

Hellotext muestra una advertencia cuando encuentra perfiles con información de identidad similar. Revisa los perfiles sugeridos antes de unirlos; dos personas pueden compartir un nombre, teléfono o email en datos importados.

Usa las opciones del perfil para abrir el proceso de unión. Confirma qué datos pertenecen al mismo cliente antes de completarlo para que los reportes, la segmentación y el contexto de conversaciones permanezcan asociados con la persona correcta.

## Usa los perfiles en Hellotext

Los perfiles de clientes conectan las áreas principales de Hellotext:

* **Las campañas** usan listas y segmentos para elegir una audiencia.
* **Los playbooks** usan propiedades y actividad como señales para tomar decisiones autónomas y crear experiencias personalizadas.
* **Los journeys** pueden ramificar o ejecutar acciones según datos y eventos del perfil.
* **Inbox** muestra contexto del cliente a agentes e integrantes del equipo que atienden una conversación.
* **Los reportes y la atribución** usan identidad y actividad rastreada para asociar resultados con el cliente y el origen correctos.

## Gestiona la información con cuidado

Desde un perfil, los integrantes con los permisos necesarios pueden editar propiedades, gestionar listas, revisar el estado de suscripción, iniciar o abrir una conversación, unir duplicados, bloquear el perfil o eliminarlo.

Ten en cuenta estas prácticas:

* No marques a un cliente como suscrito si no tienes el consentimiento necesario.
* Corrige los datos de identidad antes de crear otro perfil para la misma persona.
* Usa propiedades para información que debería describir el estado actual del cliente.
* Usa eventos para acciones que ocurrieron en un momento determinado.
* Revisa la fuente de los datos sincronizados antes de sobrescribirlos manualmente.
* Trata la eliminación como una acción final de gestión de datos, no como un atajo para corregir un duplicado.

## Guías relacionadas

* [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
* [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
* [Importa perfiles de clientes]({% link _audience/import-customer-profiles.md %})
* [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
* [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
* [Seguimiento de eventos]({% link _developers/tracking-events.md %})
