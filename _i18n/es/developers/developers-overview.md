Usa las guías para desarrolladores cuando necesites conectar Hellotext con tu sitio, backend, CRM, plataforma de comercio o herramientas internas.

Si vas a conectar una tienda propia sin una integración nativa, comienza con [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}). Presenta perfiles, propiedades, productos, pedidos históricos, Hellotext.js, identidad y seguimiento desde el servidor en el orden de implementación correcto.

La mayoría del trabajo técnico con Hellotext cae en seis áreas:

- Integrar una tienda propia de principio a fin.
- Leer la referencia de la API.
- Enviar mensajes desde tu propio sistema.
- Registrar actividad de clientes.
- Definir acciones y objetos específicos del negocio.
- Conectar sesiones no identificadas con perfiles de clientes.

## Integración de una tienda propia

La guía para tiendas propias es el punto de partida práctico para un equipo que todavía no sabe qué datos debe enviar mediante la API, qué actividad debe registrar con Hellotext.js o cómo se conectan ambos lados.

Empieza aquí: [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).

## Referencia de la API

La referencia de la API es la fuente de verdad para recursos, atributos, parámetros y endpoints disponibles.

Abre la [referencia de la API de Hellotext](https://www.hellotext.com/api).

## Recetas de implementación con la API

Usa las guías prácticas de la API cuando necesites pasar del contrato de un endpoint a un flujo de integración completo:

- [Crea y envía plantillas con la API]({% link _developers/templates-with-api.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Crea y registra cupones con la API]({% link _developers/coupons-with-api.md %})
- [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %})

## Autenticación

Las requests a la API usan bearer tokens.

Crea un token de autorización desde la configuración de tu negocio y envíalo en el header `Authorization`:

```text
Authorization: Bearer TU_TOKEN
```

Nunca expongas tokens privados en código del navegador, repositorios públicos o scripts del lado del cliente.

## Envía SMS desde tu sistema

Usa la API de mensajes cuando tu propio sistema necesite enviar recordatorios, confirmaciones o notificaciones por SMS.

Sigue leyendo: [Enviar SMS con la API]({% link _developers/send-sms-with-api.md %}).

## Registra actividad de clientes

Usa el seguimiento de eventos cuando quieres que Hellotext entienda acciones desde tu sitio, tienda, backend o integración personalizada.

Los eventos rastreados pueden ayudarte a segmentar audiencias, activar playbooks o rutas, atribuir ingresos y darle más contexto al equipo del Inbox.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## Modela actividad específica del negocio

Usa acciones personalizadas para nombrar actividad que Hellotext no incluye de forma preestablecida. Usa objetos cuando esa actividad involucra una entidad reutilizable con propiedades y ciclo de vida propios.

Sigue leyendo: [Acciones personalizadas]({% link _developers/custom-actions.md %}) y [Objetos]({% link _developers/objects.md %}).

## Conecta sesiones del navegador con perfiles de clientes

Hellotext.js puede crear una sesión para visitantes no identificados. Cuando el visitante se identifica, puedes adjuntar esa sesión a un perfil del cliente para conservar la actividad anterior.

Sigue leyendo: [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}).

## Guías relacionadas

- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de links en campañas, rutas y playbooks]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
