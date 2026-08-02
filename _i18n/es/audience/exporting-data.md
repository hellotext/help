Hellotext puede preparar archivos CSV para dos propósitos diferentes: exportar el estado actual de los perfiles de clientes desde **Audiencia** y exportar las ventas atribuidas que muestra el reporte de **Ingresos**.

Usa la exportación de perfiles para llevar una audiencia definida a un flujo de BI, CRM o retargeting. Usa la exportación de Ingresos cuando necesites el detalle de atribución por pedido para analizarlo o conciliarlo.

## Elige la exportación correcta

| Exportación | Es útil para | Alcance |
| --- | --- | --- |
| **Perfiles de clientes** | Actualizaciones de CRM, análisis de audiencia, retargeting y revisión de datos | Todos los perfiles, perfiles seleccionados, una lista o un segmento |
| **Reporte de Ingresos** | Análisis de atribución, revisión financiera y conciliación de pedidos atribuidos | Ventas atribuidas dentro del período seleccionado en el reporte |

Ambas exportaciones son archivos CSV que representan un momento determinado. No crean una sincronización continua con otro sistema.

## Exporta perfiles de clientes

1. Ve a **Audiencia**.
2. Abre **Todos los perfiles**, una lista o un segmento, según la audiencia que necesites.
3. Para exportar solamente algunos clientes, marca sus checkboxes. Puedes seleccionar la página actual o todos los clientes de la audiencia abierta.
4. Abre el menú de más opciones en la barra de búsqueda de Audiencia.
5. Selecciona **Exportar a archivo** o **Exportar seleccionados**.

Hellotext prepara el archivo en segundo plano y muestra el progreso en Audiencia. Cuando está listo, la descarga comienza automáticamente y Hellotext también envía el archivo por email. Si la descarga automática no comienza, usa el botón de descarga de la notificación de exportación completada.

Puedes cancelar una exportación mientras todavía se está preparando. Si la acción de exportar no está disponible, pide a un administrador que revise tu rol y permisos dentro del equipo.

## Entiende el CSV de perfiles

El archivo contiene una fila por cada perfil de cliente exportado. Incluye columnas estándar como el ID del perfil, nombre, teléfono y email, además de las propiedades actuales del negocio que estén disponibles para exportar. Esto puede incluir propiedades personalizadas, dirección, etiquetas y pertenencia a listas. El nombre de usuario de Mercado Libre aparece cuando está disponible.

Las columnas reflejan las definiciones de propiedades configuradas para el negocio, por lo que una columna puede quedar vacía para los clientes que no tengan ese valor. La exportación contiene una columna de teléfono y una de email; no es una descarga completa de todos los identificadores vinculados con cada perfil.

El CSV de perfiles representa los valores actuales y la pertenencia a listas. No incluye todo el historial de actividad o eventos del cliente, su historial de mensajes ni todas las métricas de reportes.

## Usa una lista o segmento para definir la audiencia

Crea o abre la audiencia útil más específica antes de exportar:

- Usa una **lista** para un grupo mantenido cuya pertenencia se gestione directamente o mediante una importación, integración, captura o paso de una ruta.
- Usa un **segmento** cuando la pertenencia deba calcularse a partir de datos del perfil, estado de suscripción o actividad registrada.
- Selecciona perfiles individuales cuando necesites una excepción o un conjunto operativo pequeño.
- Usa **Todos los perfiles** solamente cuando el destino realmente necesite la audiencia completa.

Revisa la cantidad de clientes y una muestra de sus perfiles antes de crear la exportación. Un segmento se evalúa con los datos disponibles cuando lo abres y exportas, mientras que el CSV queda como una instantánea fija después de generarse.

## Prepara el CSV para BI o CRM

Antes de importar el archivo en otro sistema:

1. Conserva el **ID del perfil** como referencia estable de Hellotext.
2. Mapea el teléfono, email e identificadores personalizados únicos con los campos correspondientes del destino.
3. Confirma los formatos de fechas, números, dinero, checkboxes y etiquetas antes de modificarlos.
4. Registra la audiencia de origen y la fecha de exportación para poder reproducir o auditar el conjunto de datos.
5. Define cómo debe tratar el destino los valores vacíos y registros existentes antes de importar.

Para actualizaciones recurrentes, datos a nivel de eventos o una integración automatizada, usa la [referencia de la API]({% link _developers/api.md %}) en lugar de tratar exportaciones CSV repetidas como una sincronización en vivo.

## Prepara una audiencia para retargeting

Exporta la lista o segmento que represente la audiencia deseada en lugar de exportar todos los perfiles y filtrarlos después.

Antes de subirla a una plataforma publicitaria o de mensajería:

- Confirma que los criterios de la audiencia todavía coincidan con el objetivo de la campaña.
- Verifica el estado de suscripción y consentimiento del cliente para el canal y destino previstos.
- Usa los identificadores requeridos por el destino y evita subir propiedades que no sean necesarias.
- Cumple con las políticas de audiencias, privacidad y retención de datos de la plataforma de destino.

Exportar un perfil no suscribe al cliente, no otorga consentimiento ni lo habilita para cualquier tipo de comunicación.

## Exporta ingresos atribuidos

1. Ve a **Dashboard** y abre el reporte de **Ingresos**.
2. Selecciona el período que quieres revisar.
3. Selecciona el ícono de descarga junto al encabezado del reporte.
4. Espera mientras Hellotext prepara el CSV. La descarga comienza automáticamente cuando está listo y Hellotext también lo envía por email.

La exportación de Ingresos está diseñada para revisar ventas atribuidas. Según la evidencia disponible, puede incluir el pedido y cliente, la campaña, ruta o playbook que recibió la atribución, la fuente y canal, el monto atribuido, el motivo de atribución, evidencia comercial de IA y humana y un link a la conversación correspondiente.

Esta exportación contiene las ventas atribuidas del período elegido. No es una exportación completa de todos los pedidos de la tienda ni de todos los ingresos del negocio. Consulta [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para entender la evidencia y ventanas detrás de esas filas.

## Maneja los archivos exportados de forma segura

Los archivos CSV pueden contener datos personales y propiedades propias del negocio.

- Exporta solamente los registros y columnas necesarios para la tarea.
- Guarda el archivo en una ubicación aprobada y con acceso limitado.
- No envíes datos exportados de clientes por un canal inseguro.
- Elimina las copias temporales cuando termine el análisis o transferencia.
- Cumple con la política de retención de tu organización y los requisitos de privacidad aplicables.

Una exportación CSV operativa no es automáticamente una respuesta completa a una solicitud de acceso o privacidad de un cliente.

## Guías relacionadas

- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
- [Listas y segmentos]({% link _audience/lists-and-segments.md %})
- [Crea listas]({% link _audience/lists.md %})
- [Crea segmentos]({% link _audience/segments.md %})
- [Consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Referencia de la API]({% link _developers/api.md %})
