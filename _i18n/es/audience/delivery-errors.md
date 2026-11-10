Usa **Audiencia → Errores de envío** para encontrar los perfiles cuyo correo o teléfono no puede recibir mensajes. Un perfil aparece aquí cuando falló un mensaje de una campaña, ruta o misión y el proveedor informó que el destino en sí no se puede usar. Puedes revisar el perfil, exportar los datos afectados y quitar del perfil el dato que falló.

Los demás fallos no agregan perfiles a esta lista. Los problemas temporales, como un buzón lleno o una caída del proveedor, y los de cuenta o configuración, como una plantilla pausada o un problema de pago, quedan en el reporte de la campaña o la misión. Para investigarlos, consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).

## Abre los errores de envío

1. Ve a **Audiencia**.
2. Selecciona **Errores de envío**.

También puedes seleccionar **Revisar errores** cuando una campaña o misión tiene errores de envío:

- en la información del estado **Parcialmente entregado** de una campaña.
- en el encabezado **Actividad y resultados** del reporte de una misión.

La lista se abre con esa campaña o misión como origen.

Cada fila es un perfil. Los fallos repetidos del mismo correo o teléfono se agrupan, y la fila muestra el motivo más reciente y su canal. Por eso, el total de perfiles puede diferir del total de mensajes fallidos de un reporte.

## Busca y filtra los resultados

Busca por nombre o por el correo o teléfono que falló. Los teléfonos se buscan por sus dígitos, así que los espacios y símbolos no importan.

En el menú de más opciones junto al buscador, combina:

- **Origen:** campañas, rutas, misiones o un origen específico.
- **Tipo de error:** **Número no alcanzable**, **Correo rebotado**, **El correo no existe** o **Correo bloqueado**.
- **Canal:** WhatsApp o Email.

Los filtros aplicados aparecen debajo del buscador. Usa el botón de cierre de uno para quitar solamente ese filtro. Cambiar un filtro borra la búsqueda. Desplázate para ver más resultados.

## Entiende el motivo

| Tipo de error | Qué significa |
| --- | --- |
| **Número no alcanzable** | WhatsApp no pudo entregar a este número. Puede que el número no use WhatsApp o no pueda recibir mensajes de WhatsApp. Puede seguir funcionando para SMS. |
| **Correo rebotado** | El servidor de correo del destinatario rechazó la dirección de forma permanente. |
| **El correo no existe** | El servidor de correo del destinatario informó que la dirección no existe. |
| **Correo bloqueado** | Los correos a esta dirección están bloqueados porque antes rebotó o el destinatario marcó un correo como spam. |

Antes de quitar un dato, revisa si tiene un error de escritura o está desactualizado. Puede que el cliente tenga un correo o teléfono más reciente.

## Revisa el perfil

Selecciona una fila para abrir el perfil. Compara el dato afectado con los demás datos del cliente y revisa **Actividad** y **Notas**.

Junto a cada dato que falló aparece un aviso, en lugar de su marca de verificación. Pasa el cursor sobre el aviso o dale foco para ver el motivo del error. En esta vista, **Actividad** también muestra cada mensaje fallido con su destino y su motivo. Los filtros de la lista no limitan los demás datos del perfil.

## Exporta los datos con errores

1. Aplica la búsqueda y los filtros que necesites.
2. Para exportar todos los resultados, deja la selección vacía. Para exportar una parte, marca sus casillas. Para incluir también los resultados que todavía no se cargaron, selecciona **Seleccionar todos los N clientes**.
3. Abre el menú de más opciones.
4. Selecciona **Exportar a archivo** o **Exportar seleccionados**, según corresponda.

El CSV tiene una fila por perfil y dato que falló: el ID y el nombre del perfil, el canal, el dato de contacto, el tipo de error, el código del proveedor, el último error, el último origen, todos los orígenes y la cantidad de errores. Para descargar las propiedades de los clientes, usa la [exportación de perfiles]({% link _audience/exporting-data.md %}).

## Quita uno o varios datos

Quitar un dato quita ese correo o teléfono del perfil, no el perfil completo. Se conservan los demás datos y el historial de mensajes. El perfil deja de usar ese dato en todos los canales: quitar un teléfono lo quita tanto para WhatsApp como para SMS.

Para quitar un dato:

1. Abre el perfil y encuentra el dato que falló.
2. Selecciona el aviso junto al dato. Se convierte en una papelera al pasar el cursor o darle foco.
3. Revisa el dato en **Quitar correo electrónico** o **Quitar número de teléfono**.
4. Selecciona **Quitar**, o **Cancelar** para conservarlo.

Cuando al perfil no le quedan errores en la lista que estás viendo, vuelves a la lista.

Para quitar varios, selecciona sus perfiles y pulsa **Quitar del perfil (N)**. Revisa las cantidades de correos y teléfonos en **Quitar datos de contacto de los perfiles** y confirma **Quitar N**. Una selección se quita en el momento. Después de **Seleccionar todos los N clientes**, se quita en segundo plano y una notificación muestra el progreso.

Quitar un dato no reenvía los mensajes fallidos ni cambia el consentimiento del cliente. Si el dato viene de una importación o integración, revisa si necesitas corregirlo en su origen, porque una sincronización posterior puede volver a agregarlo.

Los propietarios, administradores y gerentes pueden quitar datos. Los agentes pueden revisar la lista, pero no pueden quitar datos ni exportar.

## Guías relacionadas

- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
- [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Exportar datos]({% link _audience/exporting-data.md %})
- [Consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
