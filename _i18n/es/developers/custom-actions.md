Una acción personalizada define una actividad propia de tu negocio que Hellotext no incluye entre sus acciones preestablecidas. Por ejemplo, puedes definir `appointment.booked`, `loyalty.reward_redeemed` o `physical_store.payment_completed`.

La acción es la definición reutilizable. Cada vez que esa actividad ocurre, registras un **evento** con el nombre de tracking de la acción. Hellotext puede usar esos eventos como señales en el perfil del cliente, segmentos, rutas, reportes y otras funciones compatibles.

## Antes de crear una acción

Revisa primero las acciones preestablecidas en **Ajustes > Acciones**. Hellotext ya incluye actividades comunes de eCommerce, mensajes, formularios, suscripciones y conversaciones.

Usa una acción personalizada cuando necesitas registrar algo que ocurrió en un momento específico y no existe una acción equivalente. Usa una propiedad del perfil del cliente cuando el dato describe un estado actual que puede cambiar, como nivel de fidelidad, tienda preferida o fecha de renovación.

No crees otra acción para reemplazar `order.placed`, `product.viewed` o una actividad preestablecida equivalente. Los playbooks y reportes pueden depender del significado y del objeto asociado a la acción original.

## Crea una acción desde Hellotext

Necesitas un plan y permisos que admitan acciones personalizadas.

1. Abre **Ajustes**.
2. Selecciona **Acciones**.
3. Abre la pestaña **Personalizado**.
4. Haz clic en **Crear nueva acción**.
5. Completa el nombre legible y el nombre de tracking.
6. Decide si debe marcarse como conversión o como importante.
7. Guarda la acción.

El **nombre legible** es la etiqueta que verá tu equipo en Hellotext. El **nombre de tracking** es el identificador exacto que deben enviar tu sitio, backend e integraciones.

## Elige un nombre de tracking estable

Usa minúsculas y separa el objeto de la actividad con un punto. Por ejemplo:

- `appointment.booked`
- `membership.renewed`
- `quote.requested`
- `store_visit.completed`

Cada nombre de tracking debe ser único dentro del negocio y no puede usar el nombre de una acción preestablecida.

Trátalo como un contrato técnico. Si cambias `appointment.booked` por `appointment.scheduled`, también debes actualizar cada sitio, backend, integración, segmento o ruta que usa el nombre anterior.

## Configura su efecto

### Marcar como conversión

Usa esta opción cuando una ocurrencia representa un resultado que quieres ver como conversión en los reportes compatibles.

Marcar la acción no atribuye automáticamente ingresos. Para evaluar un monto como ingreso atribuido, el evento debe incluir un monto monetario positivo, moneda, cliente o sesión identificable y evidencia que cumpla las reglas de atribución.

### Marcar como importante

Usa esta opción cuando una nueva ocurrencia requiere atención inmediata. Hellotext puede priorizar la conversación relacionada en el Inbox cuando ocurre.

No marques toda la actividad como importante. Reserva esta opción para eventos que realmente requieren una respuesta operativa, como una solicitud urgente o un fallo que debe revisar una persona.

## Crea acciones mediante la API

Puedes administrar acciones personalizadas con la [API de Acciones](https://www.hellotext.com/api#actions). Autentica las solicitudes con un token creado para el negocio y usa los endpoints de acciones para crear, listar, obtener, actualizar o eliminar definiciones.

La creación necesita al menos un nombre de tracking. También puedes enviar un título legible y la configuración de conversión o importancia. Si el plan no admite acciones personalizadas, la API rechazará la creación.

Crear la definición no registra un evento. Después debes enviar cada ocurrencia al endpoint de eventos usando el nombre exacto de la acción.

## Registra eventos desde el navegador

Instala e inicializa [Hellotext.js](https://github.com/hellotext/hellotext.js) antes de usar la acción.

```javascript
const response = await Hellotext.track('appointment.booked')

if (response.failed) {
  console.error(response.data)
}
```

Puedes incluir datos generales del evento:

```javascript
await Hellotext.track('appointment.booked', {
  amount: 45,
  currency: 'USD',
  tracked_at: 1786032000,
})
```

Hellotext.js incorpora la URL actual y la sesión del navegador. Cuando el cliente ya fue identificado, también conserva esa identidad en las llamadas posteriores. Si todavía es anónimo, el evento queda asociado a la sesión y puede relacionarse con el cliente cuando Hellotext recibe una identificación válida.

No envíes secretos, información de pago ni datos personales innecesarios dentro de los parámetros del evento.

## Registra eventos desde tu backend

Usa la [API de tracking](https://www.hellotext.com/api#tracking) cuando la actividad ocurre en un CRM, punto de venta, aplicación móvil, proceso de servidor u otro sistema donde el navegador del cliente no participa.

1. Crea un token de autorización en Hellotext.
2. Confirma que la acción personalizada ya existe.
3. Identifica el perfil del cliente o la sesión correspondiente.
4. Envía el nombre exacto de la acción y los parámetros del evento.
5. Conserva la respuesta y cualquier identificador de solicitud para diagnosticar errores.

Para decidir entre perfil del cliente y sesión, consulta [Seguimiento de origen externo]({% link _developers/external-tracking.md %}). No expongas el token de autorización en código que se ejecuta en el navegador.

## Asocia un objeto cuando haga falta

Una acción personalizada no necesita un objeto para poder registrarse. Puedes agregar uno cuando la ocurrencia debe conservar contexto estructurado.

Por ejemplo, `appointment.booked` puede apuntar a una cita existente o crear una nueva instancia al registrar el evento. Consulta [Objetos]({% link _developers/objects.md %}) para diseñar la estructura y elegir entre un identificador existente y los parámetros de un objeto nuevo.

No conviertas todo el contexto en un objeto. Úsalo cuando esa entidad necesita identidad propia, propiedades reutilizables o más eventos a lo largo de su ciclo de vida.

## Registra una ocurrencia manual

Para un caso puntual:

1. Abre el perfil del cliente en **Audiencia**.
2. Selecciona **Nuevo Evento**.
3. Elige la acción personalizada.
4. Completa la fecha, monto, URL u objeto cuando corresponda.
5. Guarda el evento.

Esto registra una sola ocurrencia. No configura el tracking automático de eventos futuros.

## Usa la acción en Hellotext

Después de probarla, una acción personalizada puede servir para:

- iniciar una ruta cuando ocurre el evento;
- crear segmentos a partir de la actividad del cliente;
- mostrar contexto en el perfil del cliente;
- medir conversiones personalizadas; y
- ayudar a playbooks compatibles a interpretar señales del negocio.

Prueba primero con un perfil del cliente controlado. Confirma que el evento aparece en su actividad antes de activar rutas, segmentos o reportes que dependan de él.

## Evita eventos duplicados

Define una fuente principal para cada acción. No registres la misma ocurrencia desde Hellotext.js, tu backend y una integración conectada al mismo tiempo.

Conserva en tu sistema el identificador de la operación de origen y registra el evento una sola vez. Si una solicitud queda en estado incierto, revisa si el evento ya aparece antes de repetirla.

## Edita o elimina una acción

Puedes cambiar su nombre legible, nombre de tracking y configuración. Cambiar el nombre de tracking requiere actualizar todas sus fuentes y dependencias.

Trata la eliminación como una operación destructiva. Hellotext advierte que puede afectar eventos asociados y no se puede deshacer; la API también puede rechazar la eliminación cuando ya existen eventos registrados. Antes de eliminarla, revisa rutas, segmentos, reportes e integraciones y detén primero todas las fuentes que todavía envían el evento.

## Soluciona problemas

| Problema | Qué revisar |
| --- | --- |
| La acción no aparece | Plan, permisos, negocio seleccionado y pestaña **Personalizado**. |
| La API devuelve que no encuentra la acción | La acción debe existir y el nombre de tracking debe coincidir exactamente. |
| El evento está en el perfil equivocado | Identificador del perfil del cliente, sesión e implementación de identidad. |
| El evento no inicia una ruta | Estado de la ruta, acción configurada como disparador y filtros aplicables. |
| No aparece como conversión | Opción **Marcar como conversión**, período del reporte y reglas de atribución. |
| Aparece más de una vez | Fuentes duplicadas, reintentos del cliente o backend y eventos manuales. |

Para un diagnóstico más amplio, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Objetos]({% link _developers/objects.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
