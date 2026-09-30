Los objetos dan estructura e identidad a las entidades involucradas en la actividad del cliente. Un producto visto, una orden creada o una cita reservada resulta más útil cuando el evento apunta al producto, orden o cita específicos.

Hellotext incluye estructuras de objetos preestablecidas para entidades comunes. Puedes crear una estructura personalizada cuando tu negocio necesita representar otro tipo de entidad.

## Comprende estructura, instancia y evento

Estos tres conceptos funcionan en conjunto:

- Una **estructura de objeto** define el tipo de entidad y sus propiedades. Por ejemplo, `appointment` con referencia, sala y fecha programada.
- Una **instancia de objeto** es una entidad específica que sigue esa estructura. Por ejemplo, la cita `APT-1042` en la sala 3.
- Un **evento** registra algo que ocurrió y puede apuntar a la instancia. Por ejemplo, `appointment.booked` para esa cita y ese cliente.

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

## Crea una estructura de objeto personalizada

Necesitas un plan y permisos compatibles para crear estructuras de objetos personalizadas.

1. Abre **Ajustes**.
2. Selecciona **Objetos**.
3. Haz clic en **Crear nueva estructura de objeto**.
4. Ingresa el nombre visible, como **Citas**.
5. Ingresa un nombre singular estable, como `appointment`.
6. Agrega las propiedades que puede contener cada instancia.
7. Guarda la estructura.

El nombre visible identifica el objeto para tu equipo. El nombre singular es el identificador técnico que usan la API y el tracking de eventos. Mantenlo estable y evita crear otra estructura con el mismo significado.

## Diseña las propiedades

Agrega solamente los campos que describen al objeto. Según el tipo de propiedad disponible, puedes modelar texto, números, fechas, horas, valores de sí o no, listas, dinero, URLs, métodos de pago y canales de venta.

Para cada propiedad, decide si debe ser:

- **Requerida:** cada instancia debe proporcionar un valor.
- **Única:** el mismo valor no puede pertenecer a más de una instancia de ese objeto.
- **Opcional:** una instancia puede existir sin ese valor.

Usa una propiedad única para un identificador externo estable, como la referencia de una cita, número de membresía o ID de un caso de servicio. No marques como únicos campos como estado o categoría.

Puedes reordenar las propiedades. En los objetos personalizados, coloca primero el valor que mejor identifica cada instancia porque Hellotext usa la primera propiedad como etiqueta principal en la lista de objetos.

## Hereda el monto de un evento

Cuando un objeto tiene propiedades de dinero, puedes elegir una como monto heredado. Si se registra una actividad para ese objeto sin un monto explícito, Hellotext usa el valor de esa propiedad como monto del evento.

Solo una propiedad de dinero puede seleccionarse para este comportamiento. Úsala cuando el valor del objeto representa de forma consistente el monto de sus eventos. Envía un monto explícito en el evento cuando el importe de la transacción pueda ser diferente del valor guardado.

## Crea y administra instancias

Una estructura de objeto debe tener al menos una propiedad antes de que puedas crear instancias desde Hellotext.

1. Ve a **Ajustes > Objetos**.
2. Abre la estructura que quieres administrar.
3. Haz clic en **Crear nuevo** seguido del nombre del objeto.
4. Completa todas las propiedades requeridas y el contexto opcional que necesites.
5. Guarda la instancia.

Desde la misma lista puedes editar o eliminar una instancia. Eliminarla no se puede deshacer y puede quitar el contexto asociado con sus eventos, por lo que debes confirmar que las integraciones y el tracking ya no dependan de ella.

## Crea una estructura mediante la API

Usa la [API de Objetos](https://www.hellotext.com/api#objects) para listar estructuras preestablecidas y personalizadas, o para crear y administrar las personalizadas.

Una estructura nueva necesita un título visible, un nombre singular y sus definiciones de propiedades. Por ejemplo:

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

Autentica la solicitud con un token del negocio. Usa los IDs que devuelve para la estructura y las propiedades cuando otra operación de la API los admita. Consulta la referencia de la API para conocer los tipos de propiedades compatibles y los formatos completos de solicitud y respuesta.

## Asocia un objeto durante el tracking

Cuando registras una acción personalizada mediante la API, identifica la estructura con `object_type`. Usa el nombre singular, como `appointment`, o el ID de la estructura.

Después elige uno de estos enfoques:

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

Usa los nombres de las propiedades dentro de `object_parameters` o `property_by_id` cuando tu integración conserva los IDs de las propiedades. Hellotext valida las reglas de propiedades requeridas y únicas al crear la instancia.

No envíes `object_parameters` repetidamente para la misma entidad única. Guarda o recupera el ID de la instancia existente y usa `object` para los eventos posteriores de su ciclo de vida.

## Actualiza una estructura con cuidado

Agregar una propiedad opcional no exige que las instancias existentes tengan un valor. Agregar una propiedad requerida implica que las instancias nuevas y editadas necesitan ese valor, por lo que conviene preparar primero los datos de origen.

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
| La lista de objetos es difícil de revisar | Mueve la propiedad más reconocible a la primera posición. |

Si falta actividad después del tracking, consulta [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Acciones personalizadas]({% link _developers/custom-actions.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
