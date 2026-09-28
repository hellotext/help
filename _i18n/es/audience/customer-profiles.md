Un perfil del cliente es el registro unificado que Hellotext usa para entender a un cliente. Reúne su identidad, direcciones de canal, propiedades, actividad y contexto de conversaciones a medida que llegan datos desde las herramientas conectadas.

Un perfil no es necesariamente un suscriptor. Hellotext puede conocer a un cliente antes de que esa persona sea elegible para recibir un mensaje promocional.

## Abre un perfil del cliente

Ve a **Audiencia** y selecciona un perfil. En escritorio, se abre junto a la lista de audiencia. En móvil, usa **Atrás** para regresar a la lista.

Usa la búsqueda cuando conozcas el nombre, teléfono, email, alias o ID de perfil del cliente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Lista de Audiencia con un perfil de demostración seleccionado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 688px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 500px)" srcset="/images/audience/customer-profiles/audience-list-es-mobile.png" width="800" height="380" />
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/audience-list-es-medium.png" width="1000" height="380" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/audience-list-es.png" width="1340" height="380" loading="lazy" decoding="async" alt="Control de búsqueda de Audiencia y fila seleccionada de Camila Torres, un perfil ficticio con email de ejemplo." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con datos ficticios. En pantallas estrechas se muestra un recorte más cercano de la misma lista de escritorio.</figcaption>
</figure>

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

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identidad y propiedades de un perfil de demostración">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 420px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" width="910" height="1330" loading="lazy" decoding="async" alt="Perfil ficticio de Camila Torres sin confirmar, con email de ejemplo, dirección, negocio y cumpleaños completos; el teléfono está vacío." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con datos ficticios de un perfil que no puede recibir mensajes.</figcaption>
</figure>

## Las propiedades y la actividad son diferentes

Las **propiedades** describen lo que se sabe actualmente del cliente. Se pueden usar para segmentación y personalización. Los integrantes con los permisos necesarios pueden modificar las propiedades editables.

La **actividad** es el registro cronológico de lo que ocurrió. Los eventos pueden venir de integraciones de comercio, herramientas de captura, links rastreados, conversaciones, Hellotext.js o la API.

Por ejemplo, `cumpleaños` puede ser una propiedad del perfil, mientras que una vista de producto o un pedido confirmado se registra como actividad. Ambos pueden ayudar a Hellotext a decidir qué experiencia es relevante, pero representan datos diferentes.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Actividad reciente en un perfil de demostración">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 468px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 420px)" srcset="/images/audience/customer-profiles/activity-es-mobile.png" width="700" height="460" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/activity-es.png" width="900" height="460" loading="lazy" decoding="async" alt="Pestaña Actividad del perfil ficticio con tres pedidos recientes de 68, 68 y 52 dólares, ordenados cronológicamente." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con actividad de pedidos ficticios; las cifras no representan resultados de clientes.</figcaption>
</figure>

## Cómo se crean y actualizan los perfiles

Hellotext puede crear o enriquecer un perfil cuando recibe datos desde:

* Una plataforma de eCommerce conectada u otra integración.
* Una misión de captura, como Webchat, un popup, un formulario, un código QR o un link compartible.
* Una conversación iniciada por el cliente en un canal conectado.
* Una importación de perfiles de clientes.
* Hellotext.js, la API o una integración personalizada.
* Una actualización manual de un integrante del equipo.

Cuando está disponible el mismo identificador confiable, Hellotext puede usarlo para asociar nueva información con un perfil existente. Los identificadores incompletos o en conflicto todavía pueden producir posibles duplicados que requieren revisión.

## Revisa y une posibles duplicados

Si Hellotext marca posibles duplicados, verás una etiqueta de perfiles similares en el perfil. Revisa los perfiles sugeridos antes de unirlos: un nombre similar o datos importados incompletos no prueban que se trate de la misma persona.

Abre las opciones del perfil y selecciona **Combinar** para iniciar el proceso de unión. Confirma qué datos pertenecen al mismo cliente antes de completarlo para que los reportes, la segmentación y el contexto de conversaciones permanezcan asociados con la persona correcta.

## Usa los perfiles en Hellotext

Los perfiles de clientes conectan las áreas principales de Hellotext:

* **Las campañas** usan listas y segmentos para elegir una audiencia.
* **Las misiones** usan propiedades y actividad como señales para tomar decisiones autónomas y crear experiencias personalizadas.
* **Los journeys** pueden ramificar o ejecutar acciones según datos y eventos del perfil.
* **Inbox** muestra contexto del cliente a agentes e integrantes del equipo que atienden una conversación.
* **Los reportes y la atribución** usan identidad y actividad rastreada para asociar resultados con el cliente y el origen correctos.

## Gestiona la información con cuidado

Desde un perfil, quienes tengan los permisos necesarios pueden gestionar listas, revisar el estado de suscripción y modificar las propiedades que admitan edición. También pueden abrir una conversación existente, iniciar un mensaje si el perfil lo permite, unir duplicados, bloquear el perfil cuando esa opción esté disponible o eliminarlo.

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
