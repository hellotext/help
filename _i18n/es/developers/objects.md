Los objetos dan estructura e identidad a las entidades involucradas en la actividad del cliente. Un producto visto, una orden creada o una cita reservada resulta más útil cuando el evento apunta al producto, orden o cita específicos.

Hellotext incluye estructuras de objetos preestablecidas para entidades comunes. Puedes crear una estructura personalizada cuando tu negocio necesita representar otro tipo de entidad.

## Comprende estructura, instancia y evento

Estos tres conceptos funcionan en conjunto:

- Una **estructura de objeto** define el tipo de entidad y sus propiedades. Por ejemplo, `appointment` con referencia, sala y fecha programada.
- Una **instancia de objeto** es una entidad específica que sigue esa estructura. Por ejemplo, la cita `APT-1042` en la sala 3.
- Un **evento** registra algo que ocurrió y puede apuntar a la instancia. Por ejemplo, `appointment.booked` para esa cita y ese cliente.

Crear una estructura o una instancia no registra por sí solo una reserva ni suscribe al cliente. `APT-1042` es una referencia de tu negocio: no es el ID de Hellotext de la estructura, de la instancia ni de una propiedad.

La estructura es reutilizable. Las instancias conservan el contexto y los eventos construyen el historial de lo que ocurrió a lo largo del tiempo.

## Usa el modelo de datos correcto

Usa un objeto cuando la entidad necesita identidad propia, propiedades y posiblemente varios eventos durante su ciclo de vida.

Usa una propiedad del perfil del cliente cuando un valor describe el estado actual del cliente, como tienda preferida o nivel de membresía. Usa un evento sin objeto cuando registrar la ocurrencia es suficiente y no hay una entidad separada que necesites conservar.

Por ejemplo:

| Necesidad | Modelo recomendado |
| --- | --- |
| Guardar la ubicación preferida del cliente | Propiedad del perfil del cliente |
| Registrar que se reservó una cita | Evento |
| Conservar la referencia, sala, fecha y cambios de estado posteriores de la cita | Objeto asociado con eventos |

## Reutiliza los objetos preestablecidos

Hellotext ya incluye estructuras para:

- aplicaciones;
- carritos;
- formularios;
- ubicaciones;
- órdenes;
- productos; y
- reembolsos.

Las plataformas de eCommerce conectadas y el tracking de Hellotext usan estas estructuras para conservar el significado esperado. Agrega propiedades a un objeto preestablecido cuando necesites más contexto, pero no crees un reemplazo personalizado para producto, orden, carrito u otro objeto preestablecido equivalente.

Los nombres preestablecidos no se pueden cambiar y sus estructuras no se pueden eliminar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Catálogo de Objetos con siete estructuras preestablecidas, Citas y Crear nueva estructura de objeto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/catalog-es-mobile.png 2x" width="764" height="1876" />
        <img src="/images/developers/objects/catalog-es.png" srcset="/images/developers/objects/catalog-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="2180" loading="lazy" decoding="async" alt="Catálogo de Objetos con siete estructuras preestablecidas, Citas y Crear nueva estructura de objeto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catálogo real con los objetos preestablecidos y una estructura ficticia Citas. Crear una estructura no registra un evento.</figcaption>
</figure>

## Crea una estructura de objeto personalizada

Necesitas un plan y permisos compatibles para crear estructuras de objetos personalizadas.

1. Abre **Ajustes**.
2. Selecciona **Objetos**.
3. Haz clic en **Crear nueva estructura de objeto**.
4. Ingresa el nombre visible, como **Citas**.
5. Ingresa un nombre singular estable, como `appointment`.
6. Agrega las propiedades que puede contener cada instancia.
7. Guarda la estructura.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Borrador de Nuevo objeto con Nombre Citas y Nombre singular appointment, antes de agregar propiedades.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/draft-es-mobile.png 2x" width="778" height="1240" />
        <img src="/images/developers/objects/draft-es.png" srcset="/images/developers/objects/draft-es.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1240" loading="lazy" decoding="async" alt="Borrador de Nuevo objeto con Nombre Citas y Nombre singular appointment, antes de agregar propiedades." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Primer paso del formulario sin guardar: Citas es el nombre visible y appointment el identificador técnico. A continuación se agregan las propiedades.</figcaption>
</figure>

El nombre visible identifica el objeto para tu equipo. El nombre singular es el identificador técnico que usan la API y el tracking de eventos. Mantenlo estable y evita crear otra estructura con el mismo significado.

## Diseña las propiedades

Agrega solamente los campos que describen al objeto. Según el tipo de propiedad disponible, puedes modelar texto, números, fechas, horas, valores de sí o no, listas, dinero, URLs, métodos de pago y canales de venta.

Para cada propiedad, decide si debe ser:

- **Requerida:** cada instancia debe proporcionar un valor.
- **Única:** el mismo valor no puede pertenecer a más de una instancia de ese objeto.
- **Opcional:** una instancia puede existir sin ese valor.

La opción **Único** solo aparece para los tipos compatibles. No todos los tipos de propiedad aceptan unicidad; comprueba la configuración guardada o el valor `unique` de la respuesta de la API.

Usa una propiedad única para un identificador externo estable, como la referencia de una cita, número de membresía o ID de un caso de servicio. No marques como únicos campos como estado o categoría.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editar objeto Citas: reference tiene Único y Requerido; su menú permite quitar esas reglas.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/reference-es-mobile.png 2x" width="778" height="1900" />
        <img src="/images/developers/objects/reference-es.png" srcset="/images/developers/objects/reference-es.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1900" loading="lazy" decoding="async" alt="Editar objeto Citas: reference tiene Único y Requerido; su menú permite quitar esas reglas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Menú real de reference, un campo de texto único y requerido. room es opcional; los nombres técnicos de las propiedades los define el negocio.</figcaption>
</figure>

Puedes reordenar las propiedades. En los objetos personalizados, coloca primero el valor que mejor identifica cada instancia porque Hellotext usa la primera propiedad como etiqueta principal en la lista de objetos.

## Hereda el monto de un evento

En el menú de una propiedad de dinero, selecciona **Heredar este monto** y guarda la estructura. La etiqueta **Heredado** identifica la propiedad elegida; solo una puede estar seleccionada.

El registro manual de actividad puede tomar ese valor cuando el monto del evento queda en cero. Úsalo si el valor del objeto representa el importe de esa actividad y comprueba la moneda del resultado.

Para una acción personalizada enviada por la API, envía `amount` y `currency` explícitamente: no supongas que se aplicará la herencia del registro manual. Usa unidades monetarias principales, por ejemplo `89.90` con `USD`, y el importe real de la ocurrencia cuando difiera del valor del objeto.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Propiedad de dinero fee con Heredado y menú Heredar este monto, junto a reference y room.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/money-es-mobile.png 2x" width="778" height="1900" />
        <img src="/images/developers/objects/money-es.png" srcset="/images/developers/objects/money-es.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1900" loading="lazy" decoding="async" alt="Propiedad de dinero fee con Heredado y menú Heredar este monto, junto a reference y room." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El menú de fee ofrece Heredar este monto y la etiqueta identifica la propiedad elegida. La herencia del registro manual no debe suponerse para tracking por API.</figcaption>
</figure>

## Crea y administra instancias

Una estructura de objeto debe tener al menos una propiedad antes de que puedas crear instancias desde Hellotext.

1. Ve a **Ajustes > Objetos**.
2. Abre la estructura que quieres administrar.
3. Haz clic en **Crear nuevo** seguido del nombre del objeto.
4. Completa todas las propiedades requeridas y el contexto opcional que necesites.
5. Guarda la instancia.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Borrador Crear Citas con referencia requerida APT-1043, Sala 3 y fee 89.90 USD, sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/objects/instance-es-mobile.png 2x" width="778" height="1040" />
        <img src="/images/developers/objects/instance-es.png" srcset="/images/developers/objects/instance-es.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="1040" loading="lazy" decoding="async" alt="Borrador Crear Citas con referencia requerida APT-1043, Sala 3 y fee 89.90 USD, sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador ficticio de una nueva instancia APT-1043, distinto de la cita APT-1042 del ejemplo. No se guardó ni se registró ninguna actividad.</figcaption>
</figure>

Desde la misma lista puedes editar o eliminar una instancia. Eliminarla no se puede deshacer y puede quitar el contexto asociado con sus eventos, por lo que debes confirmar que las integraciones y el tracking ya no dependan de ella.

## Crea una estructura mediante la API

Usa la [API de Objetos](https://www.hellotext.com/api#objects) para listar estructuras preestablecidas y personalizadas, o para crear y administrar las personalizadas.

`GET /v1/objects` lista estructuras y `GET /v1/objects/OBJECT_STRUCTURE_ID` consulta una. `POST /v1/objects` crea una estructura personalizada; no crea una cita concreta. El cuerpo siguiente es un ejemplo de esa creación, con título visible, nombre singular y definiciones de propiedades:

```json
{
  "title": "Citas",
  "name": "appointment",
  "properties": [
    {
      "kind": "text",
      "name": "reference",
      "required": true,
      "unique": true
    },
    {
      "kind": "text",
      "name": "room",
      "required": false,
      "unique": false
    }
  ]
}
```

Autentica desde tu servidor con un token privado del mismo negocio (`Authorization: Bearer YOUR_PRIVATE_TOKEN`) y una suscripción activa con la función y permisos compatibles. No pongas ese token en una página pública.

Una creación válida devuelve HTTP `201` con la estructura y sus propiedades; un error de validación devuelve `422`. Guarda por separado el `id` de la estructura y los IDs de sus propiedades. Ninguno es el ID de una instancia. Consulta la referencia para los tipos y formatos completos, y revisa los valores realmente devueltos, incluidos `required`, `unique` y `modifiable`.

`PATCH /v1/objects/OBJECT_STRUCTURE_ID` administra las propiedades de una estructura existente: conserva sus IDs al actualizarlas y consulta la estructura después. Para renombrarla, usa **Ajustes > Objetos > Editar**; no des por hecho que un `PATCH` renombró `title` o `name` solo porque respondió correctamente.

## Asocia un objeto durante el tracking

Cuando registras una acción personalizada mediante la API, identifica la estructura con `object_type`. Usa el nombre singular, como `appointment`, o el ID de la estructura.

La acción, por ejemplo `appointment.booked` o `appointment.confirmed`, debe estar definida antes. El ID de perfil debe corresponder al cliente real del mismo negocio; crear el objeto no demuestra consentimiento para mensajes. Si tu integración usa una sesión, conserva su identificador real y la asociación correcta con ese cliente.

Después elige uno de estos enfoques, sin enviar ambos en la misma solicitud:

- Envía `object` con el ID de una instancia existente.
- Envía `object_parameters` para crear una instancia nueva junto con el evento.

Para crear una instancia nueva al registrar el evento:

```json
{
  "action": "appointment.booked",
  "profile": "CUSTOMER_PROFILE_ID",
  "object_type": "appointment",
  "object_parameters": {
    "reference": "APT-1042",
    "room": "Sala 3"
  }
}
```

Para asociar una instancia existente:

```json
{
  "action": "appointment.confirmed",
  "profile": "CUSTOMER_PROFILE_ID",
  "object_type": "appointment",
  "object": "OBJECT_INSTANCE_ID"
}
```

Los ejemplos son cuerpos JSON para `POST /v1/attribution/events`; sustituye los IDs de marcador por los reales. Usa los nombres de las propiedades directamente dentro de `object_parameters`, como `reference`, o un mapa `object_parameters.property_by_id` con los IDs de las propiedades. No uses el ID de la estructura en `object`. Hellotext valida las reglas de propiedades requeridas y únicas al crear la instancia.

`object_parameters` intenta crear una instancia: no busca ni actualiza automáticamente la que tenga la misma referencia. La respuesta de tracking indica `received`; no devuelve el ID de la instancia ni prueba que el evento ya esté procesado. La validación o creación de la instancia puede ocurrir antes de completar el procesamiento del evento.

No envíes `object_parameters` repetidamente para la misma entidad única. Para obtener su ID público, busca la instancia por su referencia en **Configuración > Objetos > Citas**, abre el menú de la fila y copia el vínculo de **Editar**. El ID de la instancia es el segmento entre `/instances/` y `/edit`; no es el ID de la estructura ni un ID numérico interno de una respuesta anidada. Guarda esa correspondencia con tu referencia. `GET /v1/objects` devuelve estructuras, no IDs de citas.

Usa `object` para las ocurrencias posteriores. Reutilizar el objeto no evita duplicar eventos: ante un timeout o resultado incierto, concilia la actividad antes de reenviar.

## Actualiza una estructura con cuidado

Agregar una propiedad opcional no exige que las instancias existentes tengan un valor. Agregar una propiedad requerida implica que las instancias nuevas y editadas necesitan ese valor, por lo que conviene preparar primero los datos de origen.

Antes de activar unicidad, revisa los duplicados existentes; cambiar la regla no limpia los datos históricos. No cambies el tipo de una propiedad con valores guardados sin comprobar su compatibilidad.

Cambiar un nombre singular o el nombre de una propiedad requiere actualizar cada integración y solicitud de tracking que lo envía. Reordenar propiedades cambia su presentación, mientras que modificarlas o eliminarlas puede afectar datos ya guardados.

Eliminar una estructura personalizada borra sus instancias y datos asociados y no se puede deshacer. Detén primero su tracking y revisa las acciones, rutas, segmentos e integraciones que dependan de ella.

## Soluciona problemas con objetos

| Problema | Qué revisar |
| --- | --- |
| No puedes crear una estructura | Plan, permisos, suscripción activa y negocio seleccionado. |
| No puedes crear una instancia | La estructura debe contener al menos una propiedad. |
| La API informa un valor duplicado | Una propiedad marcada como única ya usa ese valor. |
| Una propiedad requerida falla la validación | Envía un valor no vacío con el formato que espera su tipo de propiedad. |
| El evento no encuentra el tipo de objeto | Usa el nombre singular exacto o el ID de la estructura que aparece en **Ajustes > Objetos**. |
| El evento no encuentra la instancia | Confirma que el ID de la instancia pertenece a esa estructura y negocio. |
| El monto no coincide | Distingue registro manual de API; envía importe y moneda explícitos para una acción personalizada de la API. |
| La lista de objetos es difícil de revisar | Mueve la propiedad más reconocible a la primera posición. |

Si falta actividad después del tracking, consulta [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Acciones personalizadas]({% link _developers/custom-actions.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
