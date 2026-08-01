Usa las guías para desarrolladores cuando necesites conectar Hellotext con tu sitio, backend, CRM, plataforma de comercio o herramientas internas.

La mayoría del trabajo técnico con Hellotext cae en cuatro áreas:

- Leer la referencia de la API.
- Enviar mensajes desde tu propio sistema.
- Rastrear actividad de clientes.
- Conectar sesiones no identificadas con perfiles de cliente.

## Referencia de la API

La referencia de la API es la fuente de verdad para recursos, atributos, parámetros y endpoints disponibles.

Abre la [referencia de la API de Hellotext](https://www.hellotext.com/api).

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

## Rastrea actividad de clientes

Usa tracking cuando quieres que Hellotext entienda acciones desde tu sitio, tienda, backend o integración personalizada.

Los eventos rastreados pueden ayudarte a segmentar audiencias, activar playbooks o rutas, atribuir ingresos y darle más contexto al equipo del Inbox.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## Conecta sesiones del navegador con perfiles de cliente

Hellotext.js puede crear una sesión para visitantes no identificados. Cuando el visitante se identifica, puedes adjuntar esa sesión a un perfil de cliente para conservar la actividad anterior.

Sigue leyendo: [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}).

## Guías relacionadas

- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de links en campañas, rutas y playbooks]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
