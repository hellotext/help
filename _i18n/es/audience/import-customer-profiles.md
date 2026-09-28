Importa perfiles de cliente cuando necesitas llevar datos existentes a Hellotext antes de usarlos en audiencias, campañas, misiones, rutas o flujos del Inbox.

Una importación puede crear perfiles de cliente, actualizar sus propiedades y agregarlos a listas. Los pasos dependen de si los datos vienen de una integración o de un archivo.

Esta es una guía de producto para operar Hellotext. No reemplaza una revisión legal o de cumplimiento para los países y canales que usas.

## Elige una integración o un archivo

Usa una **integración** cuando los datos de tus clientes ya viven en una plataforma de eCommerce o servicio compatible y deben continuar sincronizándose con Hellotext.

Usa un **archivo** para una migración, limpieza puntual o exportación de CRM guardada como CSV o TXT.

Los dos caminos funcionan de manera diferente:

| Integración | Archivo |
| --- | --- |
| La integración define cómo se mapean los campos de origen en Hellotext. | Tú mapeas cada columna del archivo a una propiedad del perfil de cliente. |
| El estado de suscripción viene de la fuente conectada cuando esta lo admite. | Eliges el estado de suscripción de los perfiles nuevos; los existentes conservan el suyo. |
| Puede continuar sincronizando datos después de la importación inicial. | Importa una copia puntual del archivo. |
| Algunas integraciones también pueden importar el historial de pedidos. | Una importación por archivo no importa el historial de pedidos. |

## Inicia una importación

1. Ve a **Audiencia**.
2. Abre el menú para agregar y elige **Importar Clientes**.
3. Elige **Conectar un servicio** o **Elegir un archivo para subir**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Importar Clientes en el menú de Audiencia">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 240px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-audience-add-es-20260928-crop.png" width="480" height="630" loading="lazy" decoding="async" alt="Menú para agregar en Audiencia con Importar Clientes entre Nuevo Evento y Nuevo Segmento." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Captura de la interfaz real en español; el menú está abierto y no muestra datos de clientes.</figcaption>
</figure>

La pantalla siguiente muestra las dos opciones:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Dos opciones para importar clientes">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: max-content; min-width: min(100%, 408px); max-width: 100%; margin: 0 auto;">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-chooser-file-es-20260928-crop.png 945w" sizes="390px" width="945" height="1170" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-chooser-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-chooser-es-20260928-crop.png 2080w" sizes="760px" style="width: auto; max-width: 100%; margin: 0 auto;" width="2080" height="1300" loading="eager" decoding="async" alt="Pantalla para importar clientes: la tarjeta de archivo muestra Elegir un archivo para subir; en la vista amplia también aparece Conectar un servicio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con las dos rutas de importación. En pantallas estrechas se muestra un recorte de la tarjeta para subir un archivo.</figcaption>
</figure>

Si eliges **Conectar un servicio**, Hellotext te lleva por la configuración de esa integración. Según la integración, puede preguntarte si quieres importar clientes y a qué listas agregarlos. El mapeo y el consentimiento pueden resolverse automáticamente desde la fuente.

Si eliges un archivo, continúa con los pasos siguientes.

## Prepara y sube un archivo

Antes de subirlo:

- Usa un archivo CSV o TXT con un cliente por fila.
- Incluye al menos un identificador confiable, como teléfono o email.
- Usa la primera fila para nombres claros de columnas.
- Mantén fechas, teléfonos, monedas y otros valores en un formato consistente.
- Quita filas de prueba, internas, inválidas o duplicadas cuando sea posible.
- Separa los perfiles con consentimiento de marketing confirmado de aquellos cuyo consentimiento es desconocido.

Arrastra el archivo al área de carga o elígelo desde tu computadora. Prepara siempre la primera fila con nombres de columnas: el importador la usa como encabezado y no la importa como perfil. Hellotext detecta el separador del archivo antes de continuar.

Cuando aparezca el nombre del archivo, selecciona **Continuar con la importación** para pasar al mapeo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Archivo de ejemplo seleccionado antes del mapeo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 477px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-selected-file-es-20260928-crop.png" width="955" height="1100" loading="lazy" decoding="async" alt="Archivo de demostración de 260 B seleccionado, con la primera fila como encabezados marcada y el botón Continuar con la importación." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con un CSV ficticio seleccionado; aún no se ha iniciado la importación.</figcaption>
</figure>

## Mapea columnas a propiedades del perfil

Hellotext muestra cada columna del archivo para que elijas qué propiedad del perfil de cliente debe actualizar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Columnas del archivo asignadas a propiedades del perfil">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: max-content; min-width: min(100%, 408px); max-width: 100%; margin: 0 auto;">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-mapping-mobile-es-20260928-crop.png 780w" sizes="390px" width="780" height="1390" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-mapping-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-mapping-es-20260928-crop.png 2060w" sizes="760px" style="width: auto; max-width: 100%; margin: 0 auto;" width="2060" height="1000" loading="eager" decoding="async" alt="Pantalla de mapeo donde email se asigna a E-mail y first_name a Nombre; ambas columnas están seleccionadas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con datos de demostración ficticios y dos asignaciones visibles.</figcaption>
</figure>

- Mapea solo las columnas que quieres importar. Las columnas sin mapear se omiten.
- Antes de iniciar la importación, crea en Audiencia las [propiedades personalizadas]({% link _audience/custom-properties-and-events.md %}) que necesites; durante el mapeo, selecciona propiedades existentes.
- Mapea cada propiedad del perfil una sola vez en la misma importación.
- Para teléfonos, fechas o dinero, revisa la configuración de país, formato de fecha o moneda que aparece.

Por ejemplo, al mapear una columna a **Cumpleaños**, revisa el formato de fecha del archivo:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Opciones de formato para la propiedad Cumpleaños">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 425px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-date-format-es-20260928-crop.png" width="850" height="1175" loading="lazy" decoding="async" alt="Menú de propiedades con Cumpleaños abierto y un submenú de formatos de fecha; YYYY-MM-DD está resaltado." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Detalle de la interfaz real en español para un campo de fecha del CSV ficticio.</figcaption>
</figure>

Si dos columnas representan la misma propiedad, elige la más confiable o combínalas en el archivo de origen antes de importar.

Después de revisar las asignaciones, selecciona **Guardar & Continuar** para pasar a la pregunta sobre consentimiento.

## Elige el estado de suscripción

En una importación por archivo, Hellotext pregunta si los clientes dieron consentimiento para promociones de marketing.

- Responde **Sí** solo si todos los registros del archivo tienen consentimiento confirmado.
- Responde **No** si no tienes evidencia confiable de consentimiento para todos los registros.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Pregunta sobre consentimiento de marketing en una importación por archivo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: max-content; min-width: min(100%, 408px); max-width: 100%; margin: 0 auto;">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-consent-mobile-es-20260928-crop.png 780w" sizes="390px" width="780" height="1200" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-consent-es-20260928-crop.png 2065w" sizes="760px" style="width: auto; max-width: 100%; margin: 0 auto;" width="2065" height="705" loading="eager" decoding="async" alt="Pregunta de consentimiento con opciones Sí y No; No está seleccionada." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español de una importación de demostración; la opción No está seleccionada y no se inició el procesamiento.</figcaption>
</figure>

La elección determina el estado de suscripción de los perfiles nuevos. Si una fila coincide con un perfil existente, la importación conserva el estado que ese perfil ya tenía; revísalo por separado antes de usar la audiencia. Si el archivo contiene registros con y sin consentimiento confirmado, divídelo en importaciones separadas. No respondas **Sí** solo porque contiene teléfonos o emails.

Esta elección corresponde a las importaciones por archivo. Una integración conectada puede obtener el estado de suscripción desde su propia fuente.

Después de elegir una respuesta, selecciona **Guardar & Continuar** para organizar los perfiles en listas.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Elige listas y cómo tratar datos existentes

Antes de iniciar la importación, puedes agregar los perfiles importados a una o más listas. Esto es útil para revisar el resultado o crear una audiencia fija según la fuente de importación.

También puedes elegir si los valores mapeados del archivo deben sobrescribir las propiedades de perfiles existentes:

- Deja la sobrescritura desactivada cuando el archivo pueda estar incompleto o sea más antiguo que los datos que ya existen en Hellotext.
- Actívala cuando el archivo sea la fuente de verdad y sus valores mapeados deban reemplazar los existentes.

Revisa esta opción con cuidado: no cambia por sí misma el estado de suscripción de los perfiles existentes.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Lista de destino y opción de sobrescribir propiedades">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: max-content; min-width: min(100%, 408px); max-width: 100%; margin: 0 auto;">
      <picture style="display: block;">
        <source media="(max-width: 760px)" srcset="/images/audience/import-customer-profiles/import-lists-mobile-es-20260928-crop.png 780w" sizes="390px" width="780" height="850" />
        <img class="ht-editorial-visual__image" src="/images/audience/import-customer-profiles/import-lists-es-20260928-crop.png" srcset="/images/audience/import-customer-profiles/import-lists-es-20260928-crop.png 1520w" sizes="760px" style="width: auto; max-width: 100%; margin: 0 auto;" width="1520" height="640" loading="eager" decoding="async" alt="Pantalla Organiza a tus clientes con una lista de ejemplo seleccionada y la casilla para actualizar propiedades existentes desmarcada." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con una lista ficticia; la sobrescritura está desactivada y no se inició la importación.</figcaption>
</figure>

Cuando hayas revisado las listas y la sobrescritura, selecciona **Guardar e importar**. Este paso inicia el procesamiento de los perfiles en segundo plano.

## Revisa el resultado

Las importaciones corren en segundo plano. Puedes salir de la página mientras Hellotext deduplica y procesa las filas.

Cuando termine, revisa:

- Cuántos perfiles fueron importados y cuántos presentan valores parciales o inválidos.
- Si los perfiles quedaron en las listas esperadas.
- Si identificadores, fechas, monedas y propiedades personalizadas se ven correctos.
- Si los perfiles nuevos tienen el estado de suscripción elegido para el archivo o recibido de la integración, y los perfiles existentes conservaron el suyo.
- Si los segmentos que dependen de las propiedades importadas se actualizan como esperabas.

Abre algunos perfiles antes de usar la audiencia importada. Si algunos perfiles presentan errores, corrige los valores de origen y vuelve a importar solo los registros afectados.

## Guías relacionadas

- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
- [Crea y gestiona listas]({% link _audience/lists.md %})
- [Crea segmentos]({% link _audience/segments.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
