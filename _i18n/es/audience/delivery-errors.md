Usa **Audiencia → Errores de entrega** para revisar los correos y teléfonos asociados a envíos fallidos de campañas y misiones. Puedes revisar el perfil, exportar los datos afectados y eliminar valores específicos.

Un error de entrega no siempre significa que el dato sea incorrecto. Revisa el motivo antes de cambiar el perfil.

## Abre los errores de entrega

1. Ve a **Audiencia**.
2. Selecciona **Errores de entrega**.

También puedes abrir la información del estado **Parcialmente entregado** de una campaña y seleccionar **Revisar errores**. La lista se abre filtrada por esa campaña.

Cada fila representa un dato de contacto exacto de un perfil. Los fallos repetidos del mismo dato se agrupan. Por eso, el total de filas puede diferir del total de mensajes fallidos. Un perfil con correo y teléfono afectados puede aparecer en dos filas.

Si el mensaje nunca se creó o todavía está pendiente, consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Busca y filtra los resultados

Busca por nombre, correo o teléfono. En el menú de más opciones junto al buscador, combina:

- **Origen:** campañas, **Playbooks** —misiones— o un origen específico.
- **Tipo de error:** datos inválidos, errores temporales o errores que requieren revisión.
- **Canal:** email o SMS.

Los filtros aplicados aparecen debajo del buscador. Usa el botón de cierre de uno para quitar solamente ese filtro. Desplázate para ver más resultados. Cambiar la búsqueda o los filtros borra la selección.

## Entiende el motivo

| Tipo de error | Qué revisar |
| --- | --- |
| **Datos inválidos** | Un destino informado como inexistente o incorrecto. Revisa el valor exacto por si tiene un error de escritura o está desactualizado. |
| **Errores temporales** | Una condición como un buzón lleno o un teléfono no disponible. El dato puede seguir siendo válido. |
| **Requieren revisión** | Un problema del proveedor, remitente, cuenta o configuración, o una causa poco clara. Investiga el motivo antes de cambiar el dato del cliente. |

Un rechazo del proveedor o un problema de configuración no demuestra que el destinatario sea inválido. Eliminar su correo o teléfono no corrige la cuenta de envío. Para investigar el canal, consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Revisa el perfil

Selecciona el nombre o dato de contacto para abrir el perfil. Compara el valor afectado con los demás datos del cliente y revisa **Actividad** y **Notas**.

El aviso junto al dato muestra el motivo del error. En Actividad, los fallos incluyen el destino y el motivo. Los filtros no limitan los demás datos del perfil.

## Exporta los datos con errores

1. Aplica la búsqueda y los filtros que necesites.
2. Para exportar todos los resultados, deja la selección vacía. Para exportar un subconjunto, marca sus casillas.
3. Abre el menú de más opciones.
4. Selecciona **Exportar a archivo** o **Exportar seleccionados**, según corresponda.

Seleccionar todo incluye resultados del filtro que todavía no hayan aparecido al desplazarte. Revisa el contador antes de exportar.

El CSV contiene los datos con errores que estás revisando. Para descargar las propiedades de los clientes, usa la [exportación de perfiles]({% link _audience/exporting-data.md %}).

## Elimina uno o varios datos

Eliminar un valor quita ese correo o teléfono del perfil, no el perfil completo. Se conservan los demás datos y el historial. Ese perfil deja de usar el valor para enviar en todos los canales: quitar un teléfono afecta los usos de ese número más allá del SMS que falló.

Para eliminar un dato:

1. Abre el perfil y encuentra el valor exacto.
2. Selecciona el control de eliminación junto al dato con error. La papelera aparece al pasar el cursor o darle foco.
3. Revisa el destino en **Eliminar correo** o **Eliminar teléfono**.
4. Selecciona **Eliminar** o **Cancelar** para conservarlo.

Para eliminar varios, selecciona sus filas y pulsa **Eliminar del perfil (N)**. Revisa las cantidades de correos y teléfonos, y confirma **Eliminar N** o cancela sin cambiarlos.

Cualquier categoría puede seleccionarse para eliminar datos; revisa si corresponde hacerlo, especialmente ante un error temporal o de configuración. La eliminación no reenvía mensajes fallidos ni cambia el consentimiento del cliente. Si el dato viene de una importación o integración, revisa también si necesitas corregirlo en su origen.

## Guías relacionadas

- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
- [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Exportar datos]({% link _audience/exporting-data.md %})
- [Consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
