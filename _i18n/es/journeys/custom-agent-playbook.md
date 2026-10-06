Usa esta guía cuando necesitas un agente de IA para un trabajo de negocio específico que una misión preconstruida de Hellotext no cubre.

Agente Personalizado es una misión de IA reactiva para una tarea concreta. Las intenciones ayudan a seleccionar una misión habilitada a partir del contexto del mensaje; el prompt guía su respuesta y los componentes configurados delimitan el conocimiento, los canales de entrada y la derivación disponibles.

No es una ruta. No construyes una secuencia fija de esperas, mensajes, condiciones y ramas. Defines qué trabajo tiene el agente, qué debería activarlo, qué conocimiento puede usar y quién debería tomar la conversación cuando hace falta una persona.

## Qué hace Agente Personalizado

Agente Personalizado te ayuda a crear uno o varios agentes de IA especializados.

Puede:

- Participar en la selección contextual cuando una misión habilitada tiene una intención relevante para el mensaje del cliente.
- Seguir un prompt personalizado para una misión específica.
- Usar documentos cargados, sitios web aprobados u otras fuentes de conocimiento habilitadas.
- Responder en los canales de entrada que permites.
- Usar el tono que eliges para el agente.
- Solicitar derivación al compañero o equipo configurado cuando el cliente necesita ayuda humana, sujeta a la recepción, asignación y capacidad disponibles.
- Trabajar junto a otras misiones activas, siempre que cada una tenga un trabajo claro.

Agente Personalizado funciona mejor cuando cada agente tiene una misión acotada. Un buen agente personalizado no es "responder cualquier cosa". Es más cercano a "responder preguntas de garantía para esta línea de productos", "calificar pedidos mayoristas", "ayudar a elegir una rutina de skincare" o "manejar preguntas sobre retiro en tienda".

## Cuándo usarlo

Usa Agente Personalizado cuando el trabajo es conversacional, reactivo y específico.

Encaja bien cuando:

- Ninguna misión preconstruida coincide suficientemente bien con el trabajo.
- Necesitas varios agentes que se activen por distintas intenciones del cliente.
- El agente necesita instrucciones propias de tu negocio.
- La respuesta depende de políticas cargadas, notas de producto, guías de talle, reglas de garantía, información de tiendas o sitios web aprobados.
- El agente debería responder primero y derivar solo cuando el caso es sensible, no resuelto o está fuera de alcance.
- Una ruta sería demasiado rígida porque el cliente puede pedir lo mismo de muchas formas.

## Cuándo no usarlo

No uses Agente Personalizado solo porque es flexible.

Usa una misión preconstruida cuando ya existe una que cubre tu objetivo. Por ejemplo:

- Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) para descubrimiento y recomendación de productos.
- Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) para estado de pedidos y envíos.
- Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) para preguntas comunes de soporte que pueden responderse con conocimiento aprobado.
- Usa [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) para soporte guiado de cambios o devoluciones cuando la misión preconstruida encaja.
- Usa [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) para soporte guiado de cancelaciones y caminos aprobados para salvar la venta cuando la misión preconstruida encaja.
- Usa [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) para recuperar carritos abandonados.
- Usa [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) para feedback de satisfacción después de conversaciones resueltas.

Usa una [ruta]({% link _journeys/getting-started-with-journeys.md %}) cuando la experiencia debe seguir pasos explícitos, esperas, preguntas, condiciones, asignaciones y ramas.

Usa una campaña cuando el mensaje debería enviarse una vez a una audiencia seleccionada. Usa una captura cuando el trabajo es recopilar suscriptores o datos del perfil del cliente.

## Qué necesita antes del lanzamiento

Antes de habilitar un agente personalizado, confirma la configuración de la que depende.

Revisa que:

- El agente tenga una misión clara.
- Las intenciones sean suficientemente específicas y no se solapen demasiado con otros agentes u otras misiones activas.
- El prompt explique qué debería hacer el agente, qué no debería hacer y cuándo debería derivar.
- Los documentos cargados o sitios aprobados estén actualizados y no se contradigan.
- Los canales de entrada seleccionados estén conectados y listos.
- El agente tenga un destino de derivación válido y el equipo conozca su capacidad, horarios y protocolo de atención.
- Tu equipo sepa cómo revisar conversaciones respondidas, no resueltas o derivadas.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Agente Personalizado**. La disponibilidad depende del tipo de misión, las funciones de tu cuenta, tu rol y el cupo de configuración. Que un componente exista en otra misión no significa que esté disponible en esta.

Abrir la misión nueva prepara un borrador; no la crea ni la habilita por sí solo. Volver desde un componente conserva cambios locales. El guardado final puede crear o clonar la misión y persistir su configuración; habilitarla también puede enviar esos cambios. Antes de continuar, comprueba qué quedó guardado y qué está habilitado.

Agente Personalizado expone:

- **Intenciones:** necesidades del cliente que ayudan a seleccionar el agente por contexto, no palabras clave exactas.
- **Prompt del agente:** misión, instrucciones, límites, guía de tono y reglas de derivación.
- **Documentos cargados:** políticas, notas de producto, preguntas frecuentes, guías de talle, reglas de garantía, instrucciones operativas u otro contexto aprobado.
- **Canales de entrada:** dónde puede responder el agente cuando los clientes escriben.
- **Derivación o asignación:** quién debería tomar la conversación cuando el agente necesita ayuda.
- **Tono:** la voz usada en las respuestas.
- **Búsqueda web, cuando esté disponible:** dominios aprobados para la herramienta de búsqueda. Una integración o herramienta externa necesita su propia configuración y acceso; escribir una solicitud HTTP en el prompt no agrega una herramienta de solicitudes externas.
- **[Seguimiento]({% link _journeys/how-to-customize-a-playbook-safely.md %}#personaliza-el-seguimiento):** la cantidad de recordatorios, la espera y la acción final si el cliente deja de responder.

**Canales de entrada** delimita qué mensajes entrantes pueden participar. Todos los canales de entrada y la selección manual son opciones distintas; elige las que correspondan a tu alcance y conexiones reales. Este control no configura el canal de salida, el destino, el consentimiento ni una garantía de respuesta o entrega.

La figura muestra el control compartido en un borrador ficticio independiente de Recolector de Propiedades: **Todos los canales de entrada** está seleccionado y la opción manual está disponible. No se guardó ni conectó un canal.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Todos los canales de entrada seleccionados sin conexión ni envío">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" srcset="/images/captures/property-collector/channels-es.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Todos los canales de entrada seleccionados sin conexión ni envío" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

**Tono** permite elegir de uno a tres tonos para orientar la voz. No reemplaza las instrucciones ni garantiza una respuesta determinada. La figura corresponde a otro borrador ficticio independiente del Recolector: **Amigable**, **Juguetón** y **Exclusivo** están seleccionados sin guardar; no es una respuesta generada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tres tonos seleccionados sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-es-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-es.png" srcset="/images/captures/property-collector/tone-es.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tres tonos seleccionados sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

## Define intenciones claras

Una intención describe la necesidad del cliente. La clasificación usa el contexto de la conversación y las misiones habilitadas; no es una búsqueda literal de una frase ni una promesa de selección exclusiva. Habilitar o deshabilitar la misión afecta la admisión de nuevo trabajo, pero no demuestra que se haya cancelado trabajo ya en cola.

Escribe las intenciones en lenguaje de cliente, no en lenguaje interno de producto. Incluye formas realistas en que un cliente pediría lo mismo.

El borrador ficticio de **Intenciones** muestra «Quiero consultar una devolución.» en el campo, sin agregar, guardar ni clasificar la frase. No representa una conversación recibida ni una misión activada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Frase de intención sin agregar ni clasificar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-es-mobile.png 2x" width="764" height="592" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-es.png" srcset="/images/team/ai-handoff-to-inbox/intents-es.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Frase de intención sin agregar ni clasificar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Buenas intenciones son específicas:

- "El cliente quiere saber si un producto está cubierto por garantía."
- "El cliente quiere ayuda para elegir un regalo para un niño."
- "El cliente pregunta si hoy hay retiro en tienda."

Intenciones débiles son demasiado amplias:

- "Soporte"
- "Pregunta"
- "Productos"
- "Ayuda"

Si dos agentes personalizados tienen intenciones parecidas, los clientes pueden ir al agente equivocado. Sepáralos por misión, área de producto, canal, idioma o resultado solo cuando la diferencia sea útil y se pueda probar.

## Escribe el prompt del agente

El prompt le dice al agente cómo hacer el trabajo cuando es seleccionado. Agente Personalizado necesita instrucciones guardadas no vacías. El prompt no agrega herramientas, permisos, integraciones, consentimiento ni capacidad para modificar datos por sí solo.

La figura muestra **Prompt** vacío en un borrador ficticio de Agente Personalizado. El texto gris es un placeholder, no instrucciones guardadas ni una respuesta del agente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo de prompt vacío en un borrador ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campo de prompt vacío en un borrador ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Incluye:

- La misión del agente.
- La situación del cliente que debería manejar.
- La información que puede usar.
- Las respuestas o acciones que puede dar.
- Qué debería preguntar cuando falta información.
- Qué no debe prometer, aprobar, modificar ni decidir.
- Cuándo debería derivar a una persona o equipo.
- Cómo debería explicar la derivación al cliente.

Evita prompts que pidan al agente resolver todos los casos de soporte y venta. Si un prompt necesita demasiadas excepciones, crea un agente más acotado o usa una misión preconstruida.

Para estructura de prompt, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Agrega conocimiento con cuidado

Los documentos cargados y sitios aprobados pueden aportar contexto específico del negocio cuando sus componentes y herramientas están disponibles.

En **Conocimiento**, elegir un archivo, guardar la misión y tenerlo listo para recuperación son etapas diferentes. El procesamiento posterior es asíncrono: un archivo guardado no demuestra que la herramienta ya pueda encontrar su contenido. Comprueba la preparación y la respuesta frente a la fuente, no solo el nombre del archivo.

La figura es un borrador ficticio independiente de Agente Personalizado con el área de conocimiento vacía. No se eligió ni subió un archivo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Área de conocimiento sin archivos elegidos">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Área de conocimiento sin archivos elegidos" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

**Búsqueda web** configura dominios para la búsqueda disponible. El sitio se normaliza a su hostname; no es una garantía de consultar una página, ruta o puerto exactos, recuperar todo el sitio ni obtener información siempre actualizada.

La figura muestra el campo vacío con el placeholder nativo `https://www.example.com`, sin añadir un sitio ni ejecutar una búsqueda.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Búsqueda web vacía con placeholder nativo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es-mobile.png 2x" width="844" height="408" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png 2x" width="1256" height="384" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Búsqueda web vacía con placeholder nativo" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Úsalos para:

- Políticas, preguntas frecuentes, educación de producto, guías de talle, reglas de servicio, reglas de garantía e información de tiendas.
- Instrucciones estables que el equipo ya confía.
- Detalles que todavía no están disponibles mediante datos conectados de tienda, catálogo, órdenes o perfiles de cliente.

No uses archivos desactualizados, políticas contradictorias, borradores internos o afirmaciones sin respaldo. Si la fuente cambia, actualiza el documento o sitio aprobado antes de esperar que el agente responda correctamente.

El conocimiento no reemplaza los datos estructurados. Si la misión necesita pedidos, catálogo, propiedades del perfil, consentimiento o eventos de tracking, verifica la integración y la herramienta concreta que los expone. No todos los tipos de agente reciben todas las propiedades ni inventario universal en tiempo real. Recopilar una propiedad requiere los elementos válidos configurados y, cuando corresponde, un Recolector de Propiedades habilitado; pedirla en el prompt no amplía ese alcance ni concede consentimiento.

## Configura derivación

Los agentes personalizados deberían saber cuándo detenerse.

Configura un destino válido de derivación o asignación y explica cuándo usarlo. Seleccionar un equipo, recibir la conversación, asignar un owner y obtener una respuesta son etapas diferentes. La capacidad, las personas asignables, los horarios y el protocolo de atención pueden dejar trabajo pendiente; no prometas respuesta inmediata ni que toda derivación pausa la IA permanentemente.

La figura muestra el control compartido **Derivación** en un borrador ficticio independiente de Recolector de Propiedades, con **Atención demo** como equipo de destino. No es el nombre de una misión, una asignación realizada ni una respuesta; no se guardó ni activó este borrador.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Equipo de derivación ficticio sin asignación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Equipo de derivación ficticio sin asignación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Casos comunes de derivación incluyen:

- El cliente pide hablar con una persona.
- El cliente está enojado, frustrado o insatisfecho.
- El cliente reporta un producto defectuoso, dañado, incorrecto o faltante.
- El pedido está fuera de la misión del agente.
- El agente no puede verificar la respuesta con el conocimiento o datos disponibles.
- El cliente pide un reembolso, cancelación, excepción, cambio de cuenta, detalle de pago o acción de venta humana.
- Ninguna misión activa puede resolver el pedido de forma segura.

Para el modelo de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Cómo probarlo

Primero revisa las instrucciones, fuentes, intenciones y destinos con ejemplos escritos. Si tu cuenta y el tipo de misión ofrecen Playground, úsalo como simulación: puede guardar una conversación de prueba, aplicar cambios del borrador a la simulación y consultar proveedores de IA. No utiliza la identidad de un contacto real ni demuestra consentimiento, elegibilidad, envío o entrega por un canal.

Para comprobar el comportamiento real, acuerda un entorno de prueba aislado, perfiles ficticios y canales propios autorizados. Separa la revisión del contenido de la prueba de recepción, clasificación, asignación y entrega; habilitar o enviar son acciones con efectos. Evalúa:

- Un mensaje que debería activar el agente personalizado.
- Un mensaje parecido que debería activar otra misión.
- Un mensaje que no debería activar ningún agente personalizado.
- Un mensaje ambiguo que debería pedir una aclaración o derivar.
- Un mensaje que requiere conocimiento cargado.
- Un mensaje donde el conocimiento cargado falta o no es claro.
- Un mensaje que debería derivarse porque el cliente está molesto, reporta un producto defectuoso o pide una decisión humana.
- Un mensaje en cada canal de entrada que planeas usar.
- Un caso que necesita búsqueda web o una herramienta integrada realmente disponible, junto con otro donde no puede obtener una fuente suficiente.

Revisa si el agente se selecciona por las intenciones correctas, se mantiene dentro de alcance, usa la fuente adecuada, evita adivinar y formatea bien la respuesta. Verifica por separado el destino de derivación, el owner asignado y la respuesta. Las figuras de esta guía son borradores independientes; no prueban ninguno de esos resultados. Si guardar, habilitar o ejecutar una prueba da un resultado incierto, reconcilia el estado antes de repetir la acción.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el agente.
- Qué mensajes deberían haber ido a otra misión.
- Si las intenciones son demasiado amplias, demasiado estrechas o se solapan.
- Si el prompt le dio suficientes límites al agente.
- Si el conocimiento cargado respondió las preguntas reales de clientes.
- Si las derivaciones fueron esperadas y llegaron a la persona o equipo correcto.
- Si el agente respondió preguntas sin respaldo o evitó respuestas útiles que podía manejar.
- Resolución, derivación y tiempos de respuesta con las conversaciones y herramientas disponibles. Revisa bajas, fallos, conversión e ingresos atribuidos solo cuando correspondan al flujo y al reporte consultado; no son todas métricas garantizadas de un reporte propio de Agente Personalizado.

Compara el mismo período y población, conserva los denominadores y distingue una conversación resuelta de un mensaje entregado o una venta atribuida. Ajusta una cosa por vez: texto de intención, prompt, conocimiento cargado, sitios aprobados, selección de canal, tono o destino de derivación. Revisa el estado guardado y habilitado después del cambio.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
