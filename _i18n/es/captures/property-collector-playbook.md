Usa esta guía cuando quieres que Hellotext recopile información faltante del perfil del cliente mediante una conversación con IA.

Recolector de Propiedades es un playbook de captura con IA. Pide las propiedades que configures, valida y guarda las respuestas, y evita preguntar por valores que ya existen en el perfil.

Puede funcionar como playbook directo de captura o intervenir temporalmente cuando otro playbook necesita datos del perfil antes de continuar.

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
- Devolver la conversación al playbook original después de completar una recopilación previa.
- Derivar o asignar la conversación cuando una persona debería continuar.

Recolector de Propiedades se mantiene enfocado en los datos del perfil. No es un agente general de soporte o ventas.

## Dos formas de participar

### Como playbook directo de captura

Usa Recolector de Propiedades directamente cuando el propósito principal de la conversación es enriquecer el perfil del cliente.

El playbook sigue su lista configurada, pide los valores faltantes y guarda las respuestas válidas en el perfil. Esto funciona bien cuando el negocio necesita una captura conversacional reutilizable para ciertas propiedades.

### Como requisito de otro playbook

Otros playbooks con IA pueden incluir un subcomponente Recolector de Propiedades con los datos del perfil que necesitan.

Cuando el playbook de origen detecta que faltan una o más propiedades configuradas, puede entregar temporalmente la conversación al Recolector de Propiedades habilitado. Recolector de Propiedades pide solamente el conjunto activo de propiedades faltantes.

El playbook original continúa siendo responsable de la tarea del cliente. Cuando la recopilación necesaria se resuelve, la conversación vuelve a ese playbook en vez de cambiar permanentemente de ownership.

[Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %}) usa este modelo para elegir qué propiedades del perfil recopilar junto con el consentimiento de suscripción.

## Elige propiedades con intención

Recopila solamente datos que tengan un uso claro en la experiencia del cliente, segmentación, personalización, soporte u otro playbook.

Las opciones disponibles pueden incluir:

- Nombre.
- Propiedades de teléfono y email.
- Propiedades del perfil definidas por el negocio, como empresa, género, números, texto corto o texto largo.

Recolector de Propiedades no necesita pedir un valor configurado que ya existe en el perfil.

Usa nombres claros para las propiedades. El cliente debería entender qué solicita la IA sin ver terminología interna de base de datos o CRM.

## Propiedades obligatorias y opcionales

Cada propiedad seleccionada puede marcarse como obligatoria u opcional.

Cuando un cliente rechaza compartir una propiedad opcional, Recolector de Propiedades registra esa decisión para la recopilación activa y puede continuar sin pedir repetidamente el mismo dato opcional.

Una propiedad obligatoria permanece dentro de la recopilación activa hasta que se resuelve o la conversación se deriva. Marca una propiedad como obligatoria solo cuando la tarea de origen realmente no puede continuar sin ella.

Demasiados campos obligatorios hacen que una captura conversacional se sienta como un formulario sin salida. Mantén pequeño el conjunto obligatorio.

## Qué necesita antes de lanzarlo

Antes de habilitar Recolector de Propiedades, confirma:

- Las propiedades del perfil ya existen en Hellotext y tienen nombres útiles para el cliente.
- Sabes cuáles son obligatorias y cuáles opcionales.
- Los canales entrantes seleccionados están conectados.
- El país y código telefónico del negocio son correctos si se recopilarán teléfonos.
- La asignación o derivación tiene una persona o equipo apropiado.
- Cada playbook que usa Recolector de Propiedades como requisito explica por qué necesita esa información.

## Qué puedes configurar

Abre **Playbooks**, haz clic en **Explorar playbooks**, busca el grupo **Capturas** y elige **Recolector de Propiedades**.

Recolector de Propiedades expone:

- **Propiedades:** los campos ordenados del perfil que el playbook puede pedir.
- **Debe recopilar:** si cada propiedad seleccionada es obligatoria para la recopilación activa.
- **Canales entrantes:** dónde puede responder cuando los clientes escriben.
- **Tono:** la voz que usa al pedir información.
- **Asignación o derivación:** quién debería continuar cuando la recopilación no puede completarse automáticamente.

Otros playbooks compatibles pueden mostrar un subcomponente Recolector de Propiedades con su propia lista de propiedades requeridas. Recolector de Propiedades debe estar habilitado para que esa configuración previa pueda ejecutarse.

## Cómo maneja las respuestas la IA

Recolector de Propiedades debería guardar solamente información que el cliente realmente proporcione.

Puede pedir una aclaración breve cuando:

- Un valor es ambiguo.
- Un teléfono u otro valor estructurado está incompleto.
- La respuesta no coincide con la propiedad solicitada.

No debería inventar, inferir ni fabricar datos del perfil. Cuando existe una regla determinista de normalización, puede aplicarla antes de guardar el valor.

Si el cliente cambia de tema durante una recopilación previa, la conversación puede volver a la tarea de origen o seguir el camino de derivación configurado en vez de dejar que Recolector de Propiedades responda fuera de su alcance.

## Cómo probarlo

Usa el Playground y perfiles de prueba antes de habilitar el playbook ampliamente.

Prueba:

- Un perfil al que le faltan todas las propiedades configuradas.
- Un perfil que ya contiene algunas de las propiedades seleccionadas.
- Una respuesta válida para cada tipo de propiedad.
- Un valor ambiguo que debería generar una aclaración.
- Un teléfono local que debería normalizarse con el código del negocio.
- Un cliente que rechaza compartir una propiedad opcional.
- Una propiedad obligatoria que el cliente no proporciona.
- Una recopilación previa iniciada por Impulsor de Suscriptores u otro playbook compatible.
- El regreso a la tarea original después de terminar la recopilación.
- La asignación o derivación cuando el playbook no puede completar la recopilación.

Verifica que los eventos del Playground y el perfil resultante coincidan con las respuestas dadas durante la prueba.

## Qué revisar después del lanzamiento

Revisa:

- Si el playbook pide solamente propiedades que realmente faltan.
- Si los clientes entienden cada solicitud.
- Si los valores guardados usan la propiedad correcta del perfil.
- Si se respetan los rechazos de propiedades opcionales.
- Si las propiedades obligatorias son realmente necesarias.
- Si teléfonos y otros valores estructurados se normalizan correctamente.
- Si la recopilación previa devuelve a los clientes al playbook original.
- Si las derivaciones llegan a la persona o equipo correcto.

Si los clientes abandonan la recopilación con frecuencia, reduce la cantidad de propiedades, mejora sus nombres o reconsidera qué campos deben ser obligatorios.

## Guías relacionadas

- [Playbook Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
