Usa las guías para desarrolladores cuando necesites conectar Hellotext con tu sitio, backend, CRM, plataforma de comercio o herramientas internas.

Si vas a conectar una tienda propia sin una integración nativa, comienza con [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}). Presenta perfiles, propiedades, productos, pedidos históricos, Hellotext.js, identidad y seguimiento desde el servidor en el orden de implementación correcto.

La mayoría del trabajo técnico con Hellotext cae en seis áreas:

- Integrar una tienda propia de principio a fin.
- Leer la referencia de la API.
- Enviar mensajes desde tu propio sistema.
- Registrar actividad de clientes.
- Definir acciones y objetos específicos del negocio.
- Conectar sesiones no identificadas con perfiles de clientes.

Antes de implementar, decide qué parte ejecutará tu servidor y qué parte ejecutará el navegador:

| Parte de la integración | Datos que usa |
| --- | --- |
| Servidor | Token privado del negocio para autenticar la API. |
| Navegador | ID público del negocio para inicializar Hellotext.js. |
| Sincronización | IDs de Hellotext y referencias de tu sistema para identificar cada recurso. |

## Integración de una tienda propia

La guía para tiendas propias es el punto de partida práctico para un equipo que todavía no sabe qué datos debe enviar mediante la API, qué actividad debe registrar con Hellotext.js o cómo se conectan ambos lados.

Empieza aquí: [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).

## Referencia de la API

La referencia de la API es la fuente de verdad para recursos, atributos, parámetros y endpoints disponibles.

Abre la [referencia de la API de Hellotext](https://www.hellotext.com/api). Revisa el recurso, método, campos requeridos, tipos de datos, errores y paginación antes de implementar una receta. Guarda los IDs devueltos por Hellotext junto con las referencias de tu propio sistema; un nombre visible no sustituye el ID que pide un endpoint.

## Recetas de implementación con la API

Usa las guías prácticas de la API cuando necesites pasar del contrato de un endpoint a un flujo de integración completo:

- [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %})
- [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Crea y registra cupones con la API]({% link _developers/coupons-with-api.md %})
- [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %})

## Autenticación

Las solicitudes a la API privada usan bearer tokens específicos del negocio donde se crearon. Confirma primero que estás en el negocio que quieres integrar.

Abre **Ajustes**, selecciona **Administrar tokens de autorización** y luego **Crear token nuevo**. Asigna un nombre que identifique la integración. El ejemplo muestra únicamente un nombre ficticio sin guardar; no contiene una credencial ni confirma que se haya creado un token.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Crear un token nuevo con Nombre del token Tienda propia · desarrollo, en un borrador sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-es-mobile.png 2x" width="748" height="480" />
        <img src="/images/developers/custom-store-integration/token-es.png" srcset="/images/developers/custom-store-integration/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="524" loading="lazy" decoding="async" alt="Crear un token nuevo con Nombre del token Tienda propia · desarrollo, en un borrador sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real del formulario de autorización, con un nombre ficticio sin guardar. No se creó ni expuso ningún token privado.</figcaption>
</figure>

Después de completar la creación en tu propio negocio, guarda el token en la configuración privada de tu servidor y envíalo en el header `Authorization`:

```text
Authorization: Bearer TU_TOKEN
```

Nunca expongas tokens privados en código del navegador, repositorios públicos o scripts del lado del cliente. El **ID del negocio** usado por Hellotext.js es público y cumple otra función: no autentica las solicitudes de la API privada. No confundas ese ID, el nombre del token y el valor secreto del token.

## Envía mensajes desde tu sistema

Usa la API de mensajes cuando tu propio sistema necesite enviar un mensaje individual libre o con plantilla mediante un canal compatible. Comprueba la conexión del canal, los permisos, el consentimiento del destinatario y las reglas de plantillas o de la ventana de conversación que correspondan al canal.

Una respuesta `status: received` confirma la recepción de la solicitud, no la entrega del mensaje. Verifica su resultado en Hellotext antes de asumir que se envió; no repitas un envío sólo porque tu sistema no recibió una respuesta a tiempo.

Comienza con [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %}). Para conocer longitud, codificación, costos y límites específicos de SMS, consulta [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %}).

## Registra actividad de clientes

Usa el seguimiento de eventos cuando quieres que Hellotext entienda acciones desde tu sitio, tienda, backend o integración personalizada.

Registra la navegación y la interacción del visitante con Hellotext.js cuando el origen sea el navegador. Registra desde tu backend los hechos que ese servidor confirma, como un pago. Define una sola fuente por ocurrencia para evitar duplicar el mismo evento.

Los eventos rastreados pueden ayudarte a segmentar audiencias, activar misiones o rutas, atribuir ingresos y darle más contexto al equipo de Bandeja. Cada resultado depende de sus datos y configuración: una solicitud recibida no prueba que el evento ya se haya procesado ni que haya atribuido una venta.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}). Esa guía contiene una descripción heredada de `page.viewed` automático. Para una instalación nueva con el SDK **2.6.0**, sigue los pasos de instalación y actividad del navegador en la guía de tienda propia enlazada arriba: espera la inicialización y registra `page.viewed` explícitamente una vez por navegación, sin duplicar la primera vista.

## Modela actividad específica del negocio

Usa acciones personalizadas para nombrar actividad que Hellotext no incluye de forma preestablecida. La acción define el tipo de actividad; el evento registra una ocurrencia concreta. Por ejemplo, definir `appointment.booked` no registra una cita.

En **Ajustes > Acciones > Personalizado**, el nombre legible «Cita reservada» y el nombre de seguimiento `appointment.booked` representan la misma definición ficticia. Los eventos usan el nombre de seguimiento exacto; los endpoints que administran la definición usan su ID. Crear acciones personalizadas requiere un plan y permisos compatibles.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Acción ficticia Cita reservada con nombre de seguimiento appointment.booked en la pestaña Personalizado de Acciones, junto a Crear nueva acción.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 894px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/catalog-es-mobile.png 2x" width="764" height="346" />
        <img src="/images/developers/custom-actions/catalog-es.png" srcset="/images/developers/custom-actions/catalog-es.png 2x" style="width: auto; margin: 0 auto;" width="1752" height="838" loading="lazy" decoding="async" alt="Acción ficticia Cita reservada con nombre de seguimiento appointment.booked en la pestaña Personalizado de Acciones, junto a Crear nueva acción." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catálogo real de acciones con una definición ficticia sin eventos; el foco móvil muestra su fila y Crear nueva acción.</figcaption>
</figure>

Usa una propiedad del perfil cuando el dato describe un estado actual del cliente, como su nivel de fidelidad. Usa objetos cuando la actividad involucra una entidad reutilizable con propiedades y ciclo de vida propios, como una cita con referencia, fecha y estado.

Sigue leyendo: [Acciones personalizadas]({% link _developers/custom-actions.md %}) y [Objetos]({% link _developers/objects.md %}).

## Conecta sesiones del navegador con perfiles de clientes

Hellotext.js puede crear una sesión para visitantes no identificados. Para conectar su actividad anterior, usa el ID de la sesión real del navegador y el ID del perfil correcto en ese mismo negocio. Verifica la identidad del cliente con tu propio sistema antes de adjuntar la sesión; no asignes un perfil a partir de un ID arbitrario recibido del navegador.

Identificar un perfil y adjuntar una sesión no concede consentimiento para enviar mensajes. Tampoco registra por sí solo una compra ni garantiza atribución: esas operaciones tienen sus propios requisitos.

Sigue leyendo: [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}).

## Guías relacionadas

- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de links en campañas, rutas y misiones]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
