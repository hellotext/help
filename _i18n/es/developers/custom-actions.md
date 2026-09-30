Una acción personalizada define una actividad propia de tu negocio que Hellotext no incluye entre sus acciones preestablecidas. Por ejemplo, puedes definir `appointment.booked`, `loyalty.reward_redeemed` o `physical_store.payment_completed`.

La acción es la definición reutilizable. Cada vez que esa actividad ocurre, registras un **evento** con el nombre de tracking de la acción. Hellotext puede usar esos eventos como señales en el perfil del cliente, segmentos, rutas, reportes y otras funciones compatibles.

## Antes de crear una acción

Revisa primero las acciones preestablecidas en **Ajustes > Acciones**. Hellotext ya incluye actividades comunes de eCommerce, mensajes, formularios, suscripciones y conversaciones.

Usa una acción personalizada cuando necesitas registrar algo que ocurrió en un momento específico y no existe una acción equivalente. Usa una propiedad del perfil del cliente cuando el dato describe un estado actual que puede cambiar, como nivel de fidelidad, tienda preferida o fecha de renovación.

No crees otra acción para reemplazar `order.placed`, `product.viewed` o una actividad preestablecida equivalente. Las misiones y los reportes pueden depender del significado y del objeto asociado a la acción original.

## Crea una acción desde Hellotext

Necesitas un plan y permisos que admitan acciones personalizadas.

1. Abre **Ajustes**.
2. Selecciona **Acciones**.
3. Abre la pestaña **Personalizado**.
4. Haz clic en **Crear nueva acción**.
5. Completa **Nombre legible** y **Nombre de seguimiento**.
6. Decide si debe marcarse como conversión o como importante.
7. Revisa los datos y haz clic en **Guardar**.

El **Nombre legible** es la etiqueta que verá tu equipo en Hellotext, como «Cita reservada». El **Nombre de seguimiento** es el identificador exacto que deben enviar tu sitio, backend e integraciones, como `appointment.booked`. En esta guía, «nombre de tracking» se refiere a ese identificador. Crear la definición no registra ninguna cita ni evento.

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

## Elige un nombre de tracking estable

Usa minúsculas y separa el objeto de la actividad con un punto. Por ejemplo:

- `appointment.booked`
- `membership.renewed`
- `quote.requested`
- `store_visit.completed`

Cada nombre de tracking debe ser único dentro del negocio y no puede usar el nombre de una acción preestablecida.

Trátalo como un contrato técnico. Si cambias `appointment.booked` por `appointment.scheduled`, actualiza cada sitio, backend e integración que todavía envía el nombre anterior. Revisa también los segmentos y rutas que dependen de la acción antes de continuar el seguimiento.

## Configura su efecto

### Marcar como conversión

Usa esta opción cuando una ocurrencia representa un resultado que quieres ver como conversión en los reportes compatibles.

Marcar la acción no atribuye automáticamente ingresos. Para evaluar un monto como ingreso atribuido, el evento debe incluir un monto monetario positivo, moneda, cliente o sesión identificable y evidencia que cumpla las reglas de atribución.

### Marcar como importante

Usa esta opción cuando una nueva ocurrencia requiere atención inmediata. Hellotext mueve la conversación relacionada a la parte superior de **Bandeja** cuando ocurre; la opción de conversión decide cómo se mide, no su prioridad en Bandeja.

No marques toda la actividad como importante. Reserva esta opción para eventos que realmente requieren una respuesta operativa, como una solicitud urgente o un fallo que debe revisar una persona.

El siguiente borrador ficticio activa **Marcar como conversión** y deja **Marcar como importante** desactivado. Los nombres y los dos controles se configuran por separado; la captura no muestra una acción guardada ni un evento registrado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Borrador de Nueva acción: Cita reservada, appointment.booked, conversión activada e importancia desactivada.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/draft-es-mobile.png 2x" width="778" height="1800" />
        <img src="/images/developers/custom-actions/draft-es.png" srcset="/images/developers/custom-actions/draft-es.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1600" loading="lazy" decoding="async" alt="Borrador de Nueva acción: Cita reservada, appointment.booked, conversión activada e importancia desactivada." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario real sin guardar. Los nombres, conversión e importancia son controles independientes; el borrador no registra ninguna ocurrencia.</figcaption>
</figure>

## Crea acciones mediante la API

Puedes administrar acciones personalizadas con la [API de Acciones](https://www.hellotext.com/api#actions). Autentica las solicitudes con un token creado para el negocio y usa los endpoints de acciones para crear, listar, obtener, actualizar o eliminar definiciones.

Para crear una definición, usa `POST /v1/attribution/actions` con un token privado del negocio y una suscripción activa que admita acciones personalizadas. Guarda el `id` devuelto para consultar o actualizar esa definición. Los eventos usan su `name`, no ese ID.

| Campo | Uso |
| --- | --- |
| `name` | Nombre de tracking requerido y único, por ejemplo `appointment.booked`. |
| `title` | Nombre legible opcional, por ejemplo «Cita reservada». |
| `goal` | `true` para marcar como conversión; el valor predeterminado es `false`. |
| `passive` | `false` para marcar como importante; `true`, su valor predeterminado, conserva la actividad sin subir la conversación en Bandeja. |

El siguiente ejemplo es ficticio; carga `HELLOTEXT_API_TOKEN` en el entorno de tu servidor:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/actions \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "appointment.booked",
    "title": "Cita reservada",
    "goal": true,
    "passive": true
  }'
```

Consulta la misma definición con `GET /v1/attribution/actions/:id`, actualízala con `PATCH` y usa `GET /v1/attribution/actions` para listar las acciones. Si la creación devuelve un nombre duplicado o su resultado es incierto, comprueba las definiciones existentes antes de volver a crearla.

Crear la definición no registra un evento. Después debes enviar cada ocurrencia al endpoint de eventos usando el nombre exacto de la acción.

## Registra eventos desde el navegador

Instala e inicializa [Hellotext.js](https://github.com/hellotext/hellotext.js) antes de usar la acción.

```javascript
const response = await Hellotext.track('appointment.booked')

if (response.failed) {
  console.error(response.data)
}
```

Una respuesta satisfactoria con `status: received` indica que la solicitud fue aceptada para procesamiento. Comprueba después el evento en el perfil correcto; esa respuesta no demuestra que ya se haya procesado ni atribuido una conversión.

Puedes incluir datos generales del evento:

```javascript
await Hellotext.track('appointment.booked', {
  amount: 45,
  currency: 'USD',
  tracked_at: 1786032000,
})
```

`amount` es el valor monetario asociado a esa ocurrencia, no una cantidad de citas. Envía su moneda en formato ISO 4217 y usa `tracked_at` como timestamp Unix en segundos de la fecha original. Omite el monto si el evento no representa ingresos.

Hellotext.js incorpora la URL actual y la sesión del navegador. Cuando el cliente ya fue identificado, también conserva esa identidad en las llamadas posteriores. Si todavía es anónimo, el evento queda asociado a la sesión y puede relacionarse con el cliente cuando Hellotext recibe una identificación válida.

No envíes secretos, información de pago ni datos personales innecesarios dentro de los parámetros del evento.

## Registra eventos desde tu backend

Usa la [API de tracking](https://www.hellotext.com/api#tracking) cuando la actividad ocurre en un CRM, punto de venta, aplicación móvil, proceso de servidor u otro sistema donde el navegador del cliente no participa.

1. Crea un token de autorización en Hellotext.
2. Confirma que la acción personalizada ya existe.
3. Identifica el perfil del cliente o la sesión correspondiente.
4. Envía `POST /v1/attribution/events` con `action: "appointment.booked"`, el `profile` o `session` real y los parámetros de esa ocurrencia.
5. Conserva la respuesta y cualquier identificador de solicitud para diagnosticar errores. Una respuesta `status: received` confirma aceptación; verifica después el procesamiento y el perfil. No inventes una sesión para atribuir el evento a una campaña.

Para decidir entre perfil del cliente y sesión, consulta [Seguimiento de origen externo]({% link _developers/external-tracking.md %}). No expongas el token de autorización en código que se ejecuta en el navegador.

## Asocia un objeto cuando haga falta

Al registrar una acción personalizada mediante la API o Hellotext.js, el objeto es opcional: omite `object`, `object_parameters` y `object_type` cuando no corresponde. Puedes añadirlo cuando la ocurrencia deba conservar un contexto estructurado.

Por ejemplo, `appointment.booked` puede apuntar a una cita existente o crear una nueva instancia al registrar el evento. Consulta [Objetos]({% link _developers/objects.md %}) para diseñar la estructura y elegir entre un identificador existente y los parámetros de un objeto nuevo.

Si envías `object` para una instancia existente o `object_parameters` para crearla, incluye también `object_type`: el nombre o ID de la definición de objeto correspondiente. No confundas ese tipo con el nombre de tracking de la acción.

No conviertas todo el contexto en un objeto. Úsalo cuando esa entidad necesita identidad propia, propiedades reutilizables o más eventos a lo largo de su ciclo de vida.

## Registra una ocurrencia manual

Para un caso puntual:

1. Abre el perfil del cliente en **Audiencia**.
2. Abre el menú **+** de la esquina inferior derecha y selecciona **Nuevo evento**.
3. Elige la acción personalizada y comprueba el cliente seleccionado.
4. Completa el objeto, monto y monto convertido cuando correspondan. Usa **Todas las propiedades...** para mostrar la fecha y otros campos, como la URL.
5. Revisa los datos antes de hacer clic en **Guardar**.

En el formulario manual actual, una acción personalizada puede mostrar **Objeto asociado** como requerido y mantener **Guardar** deshabilitado mientras falta. Selecciona un objeto existente que corresponda a esa ocurrencia. Si necesitas registrar una acción sin objeto, usa la API o Hellotext.js con los parámetros anteriores. No añadas un objeto ajeno solamente para habilitar el botón.

El ejemplo muestra «Cita reservada» seleccionada para un cliente ficticio; todavía no hay un objeto asociado ni un evento guardado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nuevo evento para Demo Caso 1 con Cita reservada seleccionada, objeto asociado requerido sin completar y Guardar deshabilitado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/manual-es-mobile.png 2x" width="778" height="1300" />
        <img src="/images/developers/custom-actions/manual-es.png" srcset="/images/developers/custom-actions/manual-es.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1300" loading="lazy" decoding="async" alt="Nuevo evento para Demo Caso 1 con Cita reservada seleccionada, objeto asociado requerido sin completar y Guardar deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario manual real sin guardar para un cliente ficticio no enviable. No hay objeto asociado ni evento registrado; el botón Guardar sigue deshabilitado.</figcaption>
</figure>

Al guardar un evento válido, registras una sola ocurrencia. Esto no configura el tracking automático de eventos futuros.

## Usa la acción en Hellotext

Después de probarla, una acción personalizada puede servir para:

- iniciar una ruta cuando ocurre el evento;
- crear segmentos a partir de la actividad del cliente;
- mostrar contexto en el perfil del cliente;
- medir conversiones personalizadas; y
- ayudar a misiones compatibles a interpretar señales del negocio.

Prueba primero con un perfil del cliente controlado. Confirma que el evento aparece en su actividad antes de activar rutas, segmentos o reportes que dependan de él.

## Evita eventos duplicados

Define una fuente principal para cada acción. No registres la misma ocurrencia desde Hellotext.js, tu backend y una integración conectada al mismo tiempo.

Conserva en tu sistema el identificador de la operación de origen y registra el evento una sola vez, incluso si recibes la misma notificación simultáneamente. Repetir el mismo nombre, perfil, objeto y fecha no garantiza deduplicación. Si una solicitud tiene un timeout o un resultado incierto, pudo haberse aceptado: revisa la actividad antes de reintentarla y reconcilia el resultado en tu integración.

## Edita o elimina una acción

En la fila de la acción, abre el menú de tres puntos y selecciona **Editar**. Puedes cambiar su nombre legible, nombre de tracking y configuración. Cambiar el nombre de tracking requiere actualizar sus fuentes y revisar las dependencias.

Trata la eliminación como una operación destructiva. La opción **Eliminar** muestra una advertencia sobre la eliminación de eventos asociados y que no se puede deshacer. La API rechaza eliminar una acción que ya tiene eventos registrados; no presupongas que permite borrar cualquier definición. Antes de eliminarla, revisa rutas, segmentos, reportes e integraciones y detén primero todas las fuentes que todavía envían el evento.

## Soluciona problemas

| Problema | Qué revisar |
| --- | --- |
| La acción no aparece | Plan, permisos, negocio seleccionado y pestaña **Personalizado**. |
| La API devuelve que no encuentra la acción | La acción debe existir y el nombre de tracking debe coincidir exactamente. |
| La respuesta dice `received`, pero no ves el evento | Procesamiento posterior, perfil o sesión, nombre de acción y parámetros; aceptación no garantiza un evento ya procesado. |
| El formulario manual no deja guardar | Cliente, acción y objeto asociado requerido; para una acción sin objeto, usa API o Hellotext.js. |
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
