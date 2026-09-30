Usa esta guía cuando quieres que Hellotext recopile información faltante del perfil del cliente mediante una conversación con IA.

Recolector de Propiedades es una misión de captura con IA. Pide las propiedades que configures, valida y guarda las respuestas, y evita preguntar por valores que ya existen en el perfil.

Puede funcionar como misión directa de captura o intervenir temporalmente cuando otra misión necesita datos del perfil antes de continuar.

## Qué hace Recolector de Propiedades

Recolector de Propiedades convierte el enriquecimiento del perfil en una conversación enfocada.

Puede:

- Recopilar información estándar del perfil como nombre, teléfono y email.
- Recopilar propiedades personalizadas del perfil configuradas por el negocio.
- Pedir solamente las propiedades seleccionadas que todavía faltan.
- Seguir el orden configurado de las propiedades.
- Distinguir entre propiedades que deben recopilarse y propiedades opcionales.
- Aclarar respuestas ambiguas o inválidas en vez de adivinar.
- Normalizar valores cuando existe una regla determinista, como convertir teléfonos locales al formato internacional con el código del negocio.
- Registrar cuando un cliente no quiere compartir una propiedad opcional.
- Devolver la conversación a la misión original después de completar una recopilación previa.
- Derivar o asignar la conversación cuando una persona debería continuar.

Recolector de Propiedades se mantiene enfocado en los datos del perfil. No es un agente general de soporte o ventas.

## Dos formas de participar

### Como misión directa de captura

Usa Recolector de Propiedades directamente cuando el propósito principal de la conversación es enriquecer el perfil del cliente.

La misión sigue su lista configurada, pide los valores faltantes y guarda las respuestas válidas en el perfil. Esto funciona bien cuando el negocio necesita una captura conversacional reutilizable para ciertas propiedades. Para usarla de esta forma, configura y habilita la misión Recolector de Propiedades independiente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Recolector de Propiedades">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 416px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/capture-overview/desktop-properties-es.png" width="800" height="480" loading="lazy" decoding="async" alt="Recolector de Propiedades en una cuenta ficticia." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Tarjeta de Recolector de Propiedades en la vista de escritorio del catálogo ficticio.</figcaption>
</figure>

### Como requisito de otra misión

Otras misiones con IA pueden incluir un subcomponente Recolector de Propiedades con los datos del perfil que necesitan.

Cuando la misión de origen detecta que faltan una o más propiedades configuradas, usa internamente ese subcomponente. Recolector de Propiedades pide solamente el conjunto activo de propiedades faltantes.

Para que esa recopilación previa funcione, el negocio también debe tener habilitada la misión Recolector de Propiedades: su agente realiza la conversación temporal. El subcomponente pertenece a la misión de origen y conserva su propia selección de propiedades; no usa la lista configurada en la misión independiente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Aviso en Impulsor de Suscriptores que exige habilitar Recolector de Propiedades antes de configurar sus propiedades.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/prerequisite-es-mobile.png" width="780" height="1160" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/prerequisite-es.png" width="1150" height="1160" loading="lazy" decoding="async" alt="Impulsor de Suscriptores muestra el aviso para habilitar Recolector de Propiedades y desactiva su selección de propiedades." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Así aparece el requisito en una misión ficticia de Impulsor de Suscriptores antes de habilitar Recolector de Propiedades.</figcaption>
</figure>

La misión original continúa siendo responsable de la tarea del cliente. Cuando la recopilación necesaria se resuelve, la conversación vuelve a esa misión en vez de cambiar permanentemente de responsable.

[Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %}) usa este modelo para elegir qué propiedades del perfil recopilar junto con el consentimiento de suscripción.

## Elige propiedades con intención

Recopila solamente datos que tengan un uso claro en la experiencia del cliente, segmentación, personalización, soporte u otra misión.

Las opciones disponibles pueden incluir:

- Nombre.
- Propiedades de teléfono y email.
- Propiedades del perfil definidas por el negocio, como empresa, género, números, texto corto o texto largo.

Recolector de Propiedades no necesita pedir un valor configurado que ya existe en el perfil.

Usa nombres claros para las propiedades. El cliente debería entender qué solicita la IA sin ver terminología interna de base de datos o CRM.

## Propiedades obligatorias y opcionales

Cada propiedad seleccionada puede marcarse como obligatoria u opcional.

Cuando un cliente rechaza compartir una propiedad opcional, Recolector de Propiedades registra esa decisión para la recopilación activa y puede continuar sin pedir repetidamente el mismo dato opcional.

En la mayoría de las misiones, Recolector de Propiedades limita los intentos de preguntar por una propiedad obligatoria. Si el cliente no aporta un valor utilizable tras esos intentos, registra que no se recopiló y sigue el flujo o la derivación correspondiente. Impulsor de Suscriptores tiene un tratamiento distinto para sus datos obligatorios. Marca una propiedad como obligatoria solo cuando la tarea de origen realmente no puede continuar sin ella.

Demasiados campos obligatorios hacen que una captura conversacional se sienta como un formulario sin salida. Mantén pequeño el conjunto obligatorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor ficticio con Nombre importante y E Mail opcional en la lista de propiedades a recopilar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/fields-es-mobile.png" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/fields-es.png" width="1150" height="760" loading="lazy" decoding="async" alt="Editor ficticio con Nombre importante y E Mail opcional en la lista de propiedades a recopilar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Lista sin guardar: Nombre está marcado como importante y E Mail queda opcional.</figcaption>
</figure>

## Qué necesita antes de usarlo directamente

Antes de habilitar Recolector de Propiedades como misión independiente, confirma:

- Las propiedades del perfil ya existen en Hellotext y tienen nombres útiles para el cliente.
- Sabes cuáles son obligatorias y cuáles opcionales.
- Los canales entrantes seleccionados están conectados.
- El país y código telefónico del negocio son correctos si se recopilarán teléfonos.
- La asignación o derivación tiene una persona o equipo apropiado.
- Cada misión que usa Recolector de Propiedades como requisito explica por qué necesita esa información.
- La misión Recolector de Propiedades está habilitada si otra misión necesita usar su agente para recopilar datos previamente.

## Qué puedes configurar

Abre **Misiones**, haz clic en **Explorar misiones**, busca el grupo **Capturas** y elige **Recolector de Propiedades**.

Recolector de Propiedades expone:

- **Propiedades:** los campos ordenados del perfil que la misión puede pedir.
- **Debe recopilar:** si cada propiedad seleccionada es obligatoria para la recopilación activa.
- **Canales entrantes:** dónde puede responder cuando los clientes escriben.
- **Tono:** la voz que usa al pedir información.
- **Asignación o derivación:** quién debería continuar cuando la recopilación no puede completarse automáticamente.

Otras misiones compatibles pueden mostrar un subcomponente Recolector de Propiedades con su propia lista de propiedades requeridas. La lista se configura en la misión de origen, pero su ejecución necesita que Recolector de Propiedades esté habilitado.

### Controles del editor

Las siguientes vistas muestran estados de configuración de una misión ficticia sin guardar:

En **Canales entrantes**, elige si la misión responde en todos los canales disponibles o sólo en una selección manual.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Control de canales entrantes con todos los canales seleccionados y opción de selección manual.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" width="1150" height="1180" loading="lazy" decoding="async" alt="Control de canales entrantes con todos los canales seleccionados y opción de selección manual." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Elige todos los canales entrantes o selecciona manualmente los que usará la misión. Ejemplo sin guardar.</figcaption>
</figure>

En **Tono**, selecciona hasta tres opciones para definir cómo pide los datos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Control de tono con Amigable, Juguetón y Exclusivo seleccionados.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-es-mobile.png" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-es.png" width="1150" height="1030" loading="lazy" decoding="async" alt="Control de tono con Amigable, Juguetón y Exclusivo seleccionados." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El editor permite elegir hasta tres tonos; estos tres son una selección ficticia sin guardar.</figcaption>
</figure>

En **Derivación**, activa el traspaso y elige un compañero o equipo que pueda intervenir.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Control de derivación activo con el equipo ficticio Atención demo seleccionado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 575px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" width="1150" height="660" loading="lazy" decoding="async" alt="Control de derivación activo con el equipo ficticio Atención demo seleccionado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La derivación puede asignarse a un equipo; el ejemplo muestra Atención demo sin guardar la misión.</figcaption>
</figure>

## Cómo maneja las respuestas la IA

Recolector de Propiedades debería guardar solamente información que el cliente realmente proporcione.

Puede pedir una aclaración breve cuando:

- Un valor es ambiguo.
- Un teléfono u otro valor estructurado está incompleto.
- La respuesta no coincide con la propiedad solicitada.

No debería inventar, inferir ni fabricar datos del perfil. Cuando existe una regla determinista de normalización, puede aplicarla antes de guardar el valor.

Si el cliente cambia de tema durante una recopilación previa, la conversación puede volver a la tarea de origen o seguir el camino de derivación configurado en vez de dejar que Recolector de Propiedades responda fuera de su alcance.

## Cómo probarlo

Usa el Playground y perfiles de prueba antes de habilitar la misión ampliamente.

Prueba:

- Un perfil al que le faltan todas las propiedades configuradas.
- Un perfil que ya contiene algunas de las propiedades seleccionadas.
- Una respuesta válida para cada tipo de propiedad.
- Un valor ambiguo que debería generar una aclaración.
- Un teléfono local que debería normalizarse con el código del negocio.
- Un cliente que rechaza compartir una propiedad opcional.
- Una propiedad obligatoria que el cliente no proporciona.
- Una recopilación previa iniciada por Impulsor de Suscriptores u otra misión compatible.
- El regreso a la tarea original después de terminar la recopilación.
- La asignación o derivación cuando la misión no puede completar la recopilación.

Verifica que los eventos del Playground y el perfil resultante coincidan con las respuestas dadas durante la prueba.

## Qué revisar después del lanzamiento

Revisa:

- Si la misión pide solamente propiedades que realmente faltan.
- Si los clientes entienden cada solicitud.
- Si los valores guardados usan la propiedad correcta del perfil.
- Si se respetan los rechazos de propiedades opcionales.
- Si las propiedades obligatorias son realmente necesarias.
- Si teléfonos y otros valores estructurados se normalizan correctamente.
- Si la recopilación previa devuelve a los clientes a la misión original.
- Si las derivaciones llegan a la persona o equipo correcto.

Si los clientes abandonan la recopilación con frecuencia, reduce la cantidad de propiedades, mejora sus nombres o reconsidera qué campos deben ser obligatorios.

## Guías relacionadas

- [Misión Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
