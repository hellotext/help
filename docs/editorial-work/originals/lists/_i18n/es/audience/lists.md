Las listas son grupos fijos de perfiles de cliente. Úsalas cuando la pertenencia debe asignarse de forma deliberada y permanecer estable hasta que una persona o proceso conectado la cambie.

Una lista no evalúa condiciones. Si la pertenencia debe cambiar automáticamente según las propiedades del perfil o la actividad del cliente, usa un segmento. Sigue leyendo: [Listas vs. segmentos]({% link _audience/lists-and-segments.md %}).

## Crea una lista

1. Ve a **Audiencia**.
2. Selecciona el botón **+** cerca de la esquina inferior derecha.
3. Selecciona **Nueva Lista**.
4. Escribe un nombre único y descriptivo.
5. Selecciona **Guardar**.

Elige un nombre que explique qué representa la pertenencia. Por ejemplo, `Asistentes al evento de la tienda` o `Miembros importados del programa de fidelidad` será más útil que `Nueva lista` o una fecha de campaña que perderá contexto más adelante.

## Agrega un perfil de cliente

Desde **Audiencia**, abre el perfil de cliente que quieres actualizar y busca la propiedad **Listas**.

Busca y selecciona la lista. Hellotext agrega el perfil y muestra la lista como un valor del perfil. Para quitar el perfil más adelante, selecciona el botón de eliminar junto a ese valor de lista.

Agregar un perfil a una lista no cambia el estado de suscripción del cliente.

## Agrega o quita varios perfiles

Usa una actualización masiva cuando el mismo cambio de pertenencia debe aplicarse a varios perfiles:

1. En **Audiencia**, selecciona los perfiles que quieres actualizar o abre la lista cuyos perfiles quieres modificar.
2. Abre la acción de actualización masiva.
3. Busca la propiedad **Listas**.
4. Elige las listas a las que quieres agregar perfiles y aquellas de las que quieres quitarlos.
5. Confirma la actualización.

Las actualizaciones grandes se ejecutan en segundo plano y muestran su progreso. Espera a que terminen antes de revisar la cantidad final de perfiles o usar la lista como audiencia.

## Agrega perfiles mediante una importación

Al importar perfiles de cliente, puedes agregar los perfiles importados a una o más listas existentes o crear una lista para esa importación.

Esto resulta útil cuando necesitas conservar el grupo importado para revisión, control de calidad o uso posterior. Por ejemplo, una lista llamada `Migración de CRM - revisar` permite que el equipo inspeccione esos perfiles sin intentar recrear la importación original mediante condiciones dinámicas.

Una importación puede crear pertenencia a listas y actualizar datos del perfil, pero pertenecer a una lista no confirma el consentimiento. Revisa por separado la decisión de suscripción durante la importación.

Sigue leyendo: [Importa perfiles de cliente]({% link _audience/import-customer-profiles.md %}).

## Agrega perfiles desde una ruta

Una ruta puede agregar un perfil de cliente a una lista mediante un paso que actualiza la propiedad **Listas**.

Úsalo cuando llegar a un punto de la ruta deba registrar una pertenencia estable, como completar un recorrido de bienvenida, registrar interés o entrar en un grupo de seguimiento operativo.

La lista registra que la ruta agregó el perfil. No continúa evaluando las condiciones de la ruta después de ese punto como lo haría un segmento.

## Entiende las listas gestionadas por integraciones

Una integración puede crear y actualizar la pertenencia a listas desde una fuente externa. Siguen siendo grupos explícitos; Hellotext sincroniza la pertenencia en lugar de calcularla mediante reglas de segmentos.

Algunas listas gestionadas por su fuente, como las listas sincronizadas desde Shopify, no pueden renombrarse en Hellotext. El icono de la fuente ayuda a distinguirlas de las listas creadas manualmente. Usa el sistema de origen cuando la pertenencia o el nombre se controlen allí.

## Usa listas en audiencias y segmentos

Puedes usar las listas para:

* Incluir o excluir un grupo fijo al seleccionar la audiencia de una campaña.
* Conservar un grupo importado u operativo.
* Crear una condición de segmento basada en la pertenencia a una lista y combinarla con reglas de perfil o actividad.
* Darle al equipo un grupo estable para buscar, revisar, exportar o actualizar.

Revisa las inclusiones y exclusiones superpuestas antes de enviar. Si una fuente de audiencia incluye un perfil y otra lo excluye, la exclusión quita ese perfil de la audiencia de la campaña.

## Renombra una lista

En **Audiencia**, busca la lista en el grupo **Listas** y usa su botón de edición. Escribe un nombre único y selecciona **Guardar**.

Renombrar la lista no elimina sus perfiles. Una lista controlada por una integración puede no permitir editar su nombre.

## Elimina una lista

Abre el editor de la lista y selecciona el botón de la papelera. Eliminar una lista elimina el grupo y sus registros de pertenencia; no elimina los perfiles de cliente que pertenecían a ella.

Antes de eliminarla, revisa campañas, segmentos, rutas o procesos operativos que dependan de esa lista. Si una campaña en borrador la usa, Hellotext te pide confirmación porque eliminarla también quita esa referencia de audiencia del borrador.

## La pertenencia no concede consentimiento

Un perfil de cliente puede pertenecer a una lista y estar dado de baja, sin confirmar o bloqueado, o tener una dirección inválida o no disponible para el canal que quieres usar.

Antes de enviar mensajes a una lista, revisa la elegibilidad del canal y aplica las exclusiones necesarias. Nunca uses la pertenencia a una lista como prueba de que el cliente dio su consentimiento.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Guías relacionadas

* [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
* [Entiende los perfiles de cliente]({% link _audience/customer-profiles.md %})
* [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
* [Crea segmentos]({% link _audience/segments.md %})
* [Importa perfiles de cliente]({% link _audience/import-customer-profiles.md %})
* [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
