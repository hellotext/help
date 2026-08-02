Importa perfiles de cliente cuando necesitas llevar datos existentes a Hellotext antes de usarlos en audiencias, campañas, playbooks, rutas o flujos del Inbox.

Una importación puede crear perfiles de cliente, actualizar sus propiedades y agregarlos a listas. Los pasos dependen de si los datos vienen de una integración o de un archivo.

Esta es una guía de producto para operar Hellotext. No reemplaza una revisión legal o de cumplimiento para los países y canales que usas.

## Elige una integración o un archivo

Usa una **integración** cuando los datos de tus clientes ya viven en una plataforma de eCommerce o servicio compatible y deben continuar sincronizándose con Hellotext.

Usa un **archivo** para una migración, limpieza puntual o exportación de CRM guardada como CSV o TXT.

Los dos caminos funcionan de manera diferente:

| Integración | Archivo |
| --- | --- |
| La integración define cómo se mapean los campos de origen en Hellotext. | Tú mapeas cada columna del archivo a una propiedad del perfil de cliente. |
| El estado de suscripción viene de la fuente conectada cuando esta lo admite. | Tú eliges si los perfiles importados están suscritos o no confirmados. |
| Puede continuar sincronizando datos después de la importación inicial. | Importa una copia puntual del archivo. |
| Algunas integraciones también pueden importar el historial de pedidos. | Una importación por archivo no importa el historial de pedidos. |

## Inicia una importación

1. Ve a **Audiencia**.
2. Abre el menú para agregar y elige **Importar clientes**.
3. Elige un servicio conectado o sube un archivo.

Si eliges un servicio, Hellotext te lleva por la configuración de esa integración. Según la integración, puede preguntarte si quieres importar clientes y a qué listas agregarlos. El mapeo y el consentimiento pueden resolverse automáticamente desde la fuente.

Si eliges un archivo, continúa con los pasos siguientes.

## Prepara y sube un archivo

Antes de subirlo:

- Usa un archivo CSV o TXT con un cliente por fila.
- Incluye al menos un identificador confiable, como teléfono o email.
- Usa la primera fila para nombres claros de columnas.
- Mantén fechas, teléfonos, monedas y otros valores en un formato consistente.
- Quita filas de prueba, internas, inválidas o duplicadas cuando sea posible.
- Separa los perfiles con consentimiento de marketing confirmado de aquellos cuyo consentimiento es desconocido.

Arrastra el archivo al área de carga o elígelo desde tu computadora. Deja activa la opción de encabezados cuando la primera fila contiene nombres de columnas. Hellotext detecta el separador del archivo antes de continuar.

## Mapea columnas a propiedades del perfil

Hellotext muestra cada columna del archivo para que elijas qué propiedad del perfil de cliente debe actualizar.

- Mapea solo las columnas que quieres importar. Las columnas sin mapear se omiten.
- Usa una propiedad existente o crea una propiedad personalizada cuando sea necesario.
- Mapea cada propiedad del perfil una sola vez en la misma importación.
- Para teléfonos, fechas o dinero, revisa la configuración de país, formato de fecha o moneda que aparece.

Si dos columnas representan la misma propiedad, elige la más confiable o combínalas en el archivo de origen antes de importar.

## Elige el estado de suscripción

En una importación por archivo, Hellotext pregunta si los clientes dieron consentimiento para promociones de marketing.

- Elige **Suscrito** solo cuando todos los perfiles de esa importación tienen consentimiento confirmado.
- Elige **No confirmado** cuando Hellotext no tiene evidencia confiable del consentimiento.

Si el archivo contiene ambos grupos, divídelo en importaciones separadas. No marques todo el archivo como suscrito solo porque contiene teléfonos o emails.

Esta elección corresponde a las importaciones por archivo. Una integración conectada puede obtener el estado de suscripción desde su propia fuente.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Elige listas y cómo tratar datos existentes

Antes de iniciar la importación, puedes agregar los perfiles importados a una o más listas. Esto es útil para revisar el resultado o crear una audiencia fija según la fuente de importación.

También puedes elegir si el archivo debe sobrescribir los valores existentes de las propiedades:

- Deja la sobrescritura desactivada cuando el archivo pueda estar incompleto o sea más antiguo que los datos que ya existen en Hellotext.
- Actívala cuando el archivo sea la fuente de verdad y sus valores mapeados deban reemplazar los existentes.

La opción de sobrescritura también se aplica a los perfiles de cliente que Hellotext encuentre como existentes, por eso conviene revisarla con cuidado.

## Revisa el resultado

Las importaciones corren en segundo plano. Puedes salir de la página mientras Hellotext deduplica y procesa las filas.

Cuando termine, revisa:

- Cuántos perfiles fueron importados y cuántas filas tuvieron errores.
- Si los perfiles quedaron en las listas esperadas.
- Si identificadores, fechas, monedas y propiedades personalizadas se ven correctos.
- Si el estado de suscripción coincide con la decisión de importación o la fuente conectada.
- Si los segmentos que dependen de las propiedades importadas se actualizan como esperabas.

Abre algunos perfiles antes de usar la audiencia importada. Si hubo filas con errores, corrige los datos de origen y vuelve a importar solo esos registros.

## Guías relacionadas

- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
- [Crea y gestiona listas]({% link _audience/lists.md %})
- [Crea segmentos]({% link _audience/segments.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
