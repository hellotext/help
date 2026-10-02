Usa esta guía cuando una misión ya está configurada y quieres adaptarla sin cambiar por accidente cómo decide, responde o envía mensajes.

No todas las misiones se personalizan igual. Algunas son agentes de IA autónomos, otras son misiones activas de venta que envían o recomiendan según señales, otras son misiones reactivas de atención que responden cuando un cliente escribe, y otras son rutas con pasos definidos. Antes de cambiar algo, identifica qué tipo de misión estás editando y qué tarjetas de configuración están disponibles.

Si todavía no lanzaste la misión, empieza por [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %}).

Si la misión está activa pero no envió, primero revisa [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). La edición más segura depende de si el problema está en disparador, elegibilidad, preparación del canal, timing, derivación o contenido.

Si necesitas una lista de diagnóstico para un ejemplo, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}) antes de editar.

## Antes de editar

Abre **Misiones**, elige la misión y revisa sus tarjetas de configuración. Los controles dependen del tipo, las funciones del plan y tu acceso. Una tarjeta puede mostrar una opción de mejora del plan; verla no garantiza que puedas guardarla. Comprueba también que estás en el negocio y la misión correctos.

Pregúntate según el tipo de misión:

- Para una misión activa de venta: ¿qué señal, audiencia o momento permite que Hellotext actúe?
- Para una misión reactiva de atención: ¿qué tipo de consulta debería responder y cuándo debería derivar?
- Para un [agente personalizado]({% link _journeys/custom-agent-playbook.md %}): ¿qué intenciones deberían activar este agente y qué debería quedar fuera?
- Para una ruta: ¿qué disparador, pasos, esperas, condiciones, ramas y asignaciones forman el flujo?
- Para cualquier misión: ¿qué reporte, conversación del Inbox o prueba en Playground va a mostrar si el cambio funcionó?

Antes de tocar un control, conserva la configuración anterior y define un cambio concreto. En el editor de componentes, **Volver** permite regresar a las tarjetas; no confirma el guardado definitivo de la misión. Comprueba la acción final de guardado y su resultado. Otros controles, como habilitar la misión, pueden persistir inmediatamente. Si el resultado es incierto, vuelve a leer el estado guardado antes de repetir.

No todas las misiones tienen una regla visible de detención. En una ruta, sí puede haber condiciones de salida o pasos que terminan el flujo. En un agente de atención, la conversación puede terminar naturalmente si el cliente deja de responder o puede derivarse según reglas. En misiones activas de venta, muchas reglas de elegibilidad, frecuencia o finalización son internas o están controladas por la lógica de la misión.

## Cuándo conviene deshabilitar

Decide según el efecto del cambio sobre clientes reales y el momento en que se guarda. Tono, documentos, sitios de búsqueda y equipo de derivación también pueden cambiar la próxima respuesta o su destino; no son automáticamente seguros por pertenecer a una categoría.

Para una aclaración pequeña, conserva la versión anterior, cambia una sola parte y revisa el resultado antes de seguir. Considera deshabilitar temporalmente cuando cambies:

- El objetivo o los límites del prompt.
- Las intenciones que seleccionan un agente.
- Las propiedades que debe recopilar.
- Los canales de entrada o salida.
- La estrategia de descuento o las reglas de oferta.
- Pasos, condiciones, ramas o asignaciones de una ruta.

Deshabilitar afecta la admisión de nueva actividad según el tipo de misión. No garantiza cancelar todas las conversaciones, propuestas, mensajes o trabajos ya en cola. Comprueba su estado actual antes de esperar una detención inmediata. Volver a habilitar tampoco confirma elegibilidad o entrega: revisa primero el cambio guardado y las dependencias de ese flujo.

## Qué puedes personalizar

Usa esta tabla como mapa rápido:

| Si la misión tiene... | Aplica normalmente a... | Qué cambia |
| --- | --- | --- |
| **Prompt del agente** | Agentes de IA, agentes personalizados y algunas misiones autónomas | Misión, tono, límites y cuándo derivar. |
| **Tono** | Misiones con respuestas o mensajes generados por IA | La voz y el estilo con los que se comunica la misión. |
| **Intenciones** | Agentes personalizados y misiones personalizadas | Qué mensajes de clientes activan ese agente. |
| **Conocimiento** | Agentes de IA de venta o atención | Qué información usa el agente para responder. |
| **Propiedades** | Misiones que incluyen el subcomponente Recolector de Propiedades | Qué datos faltantes del perfil debe pedir antes de continuar. |
| **Canales de entrada/salida** | Misiones que permiten selección de canales | Dónde puede responder o enviar mensajes. |
| **Descuentos** | Misiones de venta que permiten ofertas | Qué reglas de oferta del eCommerce y límites de descuento con IA puede usar el agente. |
| **Derivación** | Agentes de IA, atención, [Webchat]({% link _captures/webchat-widget-playbook.md %}) y algunas misiones personalizadas | Quién toma la conversación cuando el agente no debe seguir. |
| **Pasos de ruta** | Journeys o rutas | Secuencia, esperas, ramas, asignaciones y salida del flujo. |

Si una tarjeta no aparece, revisa el tipo de misión, acceso y funciones disponibles. Esa parte puede no aplicar, estar controlada por lógica interna o no estar disponible para tu cuenta. Un prompt no sustituye un control ausente ni habilita una herramienta, permiso o canal.

## Personaliza el prompt

Esta sección aplica solo a misiones que muestran la tarjeta **Prompt del agente**.

El prompt debería decirle al agente qué trabajo tiene, cómo debe hablar, qué información puede usar y cuándo debe derivar. No todas las misiones tienen un prompt editable; muchas misiones preconstruidas ya traen lógica interna.

El ejemplo muestra el campo **Prompt del agente** de un Agente Personalizado ficticio nuevo. Está vacío: el texto gris es un placeholder, no instrucciones guardadas. No se habilitó la misión ni se ejecutó el Playground.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo de prompt vacío en un borrador ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campo de prompt vacío en un borrador ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Campo completo sin editar ni guardar.</figcaption>
</figure>

Los buenos cambios de prompt son específicos:

- Describe la misión del agente en una o dos frases.
- Agrega tono de marca y palabras que debería evitar.
- Define qué puede recomendar, recopilar o responder.
- Indica cuándo debe hacer una pregunta de seguimiento.
- Indica cuándo debe derivar en lugar de adivinar.

Evita instrucciones amplias como "vende más", "responde todo" o "haz lo que ayude al cliente". Suenan útiles, pero hacen más difícil probar los límites del agente.

Para una estructura más profunda, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Personaliza el tono

Esta sección aplica a misiones que muestran la tarjeta **Tono**.

El tono controla la voz y el estilo de las respuestas o mensajes generados por IA. No cambia el objetivo, el alcance, el conocimiento, la elegibilidad, los descuentos ni las reglas de derivación de la misión; usa el subcomponente correspondiente para esos cambios.

La tarjeta permite seleccionar de uno a tres tonos. El borrador independiente del Recolector de Propiedades muestra **Amigable**, **Juguetón** y **Exclusivo** seleccionados sin guardar. Es una combinación de ejemplo, no una recomendación universal ni una respuesta generada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tres tonos seleccionados en un borrador">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-es-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-es.png" srcset="/images/captures/property-collector/tone-es.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tres tonos seleccionados en un borrador" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Opciones seleccionadas sin guardar.</figcaption>
</figure>

Elige una voz concreta y coherente con tu marca:

- Usa dos o tres atributos compatibles, como "cálido, claro y directo".
- Define si la comunicación debería sentirse formal o conversacional.
- Considera cuánta brevedad, entusiasmo o humor funciona para el canal y el tipo de conversación.
- Evita combinar indicaciones que compitan entre sí, como "muy formal" y "casual y juguetón".
- Si el prompt también incluye instrucciones de tono, asegúrate de que coincidan con esta tarjeta.

Después de cambiar el tono, prueba varios mensajes realistas en el Playground o la vista previa. Revisa que la voz siga siendo natural en respuestas breves, explicaciones, objeciones y derivaciones, y que no vuelva ambiguas las políticas ni demasiado agresivas las ofertas.

## Personaliza intenciones

Esta sección aplica principalmente a [agentes personalizados]({% link _journeys/custom-agent-playbook.md %}) o misiones personalizadas que muestran la tarjeta **Intenciones**.

Las intenciones definen qué mensajes de clientes deberían activar ese agente. Una misión preconstruida puede reaccionar a señales o mensajes sin que tengas que editar intenciones manualmente.

Usa lenguaje del cliente, no etiquetas internas. Por ejemplo, "quiero cambiar mi pedido" es más claro que "modificación post-compra".

La selección considera el contexto de la conversación y las misiones activas; no es una coincidencia exacta de palabras. En este borrador, **Quiero consultar una devolución.** sigue en el campo sin agregar: no se pulsó **Nueva intención**, Enter ni guardar. No es un mensaje recibido ni una clasificación realizada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Frase de intención sin agregar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-es-mobile.png 2x" width="764" height="592" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-es.png" srcset="/images/team/ai-handoff-to-inbox/intents-es.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Frase de intención sin agregar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador independiente sin clasificación.</figcaption>
</figure>

Después de editar intenciones, prueba:

- Un mensaje que debería activar el agente.
- Un mensaje que no debería activarlo.
- Un mensaje ambiguo.
- Un mensaje que debería manejar otra misión.
- Un mensaje que debería derivar al Inbox.

Si dos intenciones se solapan demasiado, el Supervisor puede tener más dificultad para elegir el agente correcto.

## Personaliza conocimiento

Esta sección aplica a misiones con tarjeta **Conocimiento** o carga de documentos.

El conocimiento debería hacer que el agente responda con más precisión. No sirve para cambiar el tipo de misión ni reemplaza una integración de tienda, catálogo u órdenes.

La figura muestra **Conocimiento** en el Agente Personalizado ficticio: área de carga y **Elige archivos para subir** completos, sin archivos elegidos o subidos. Elegir un archivo, guardarlo y que esté disponible para consulta son estados distintos; el procesamiento posterior puede ser asíncrono.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Área de conocimiento sin archivos">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Área de conocimiento sin archivos" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario vacío sin subir documentos.</figcaption>
</figure>

Antes de subir o reemplazar documentos:

- Elimina políticas desactualizadas, precios viejos, ofertas vencidas y FAQs duplicadas.
- Usa nombres de archivo claros para que tu equipo sepa qué controla cada documento.
- Mantén información de producto, pedido, devolución, envío y garantía consistente con tu tienda.
- Evita documentos que contradicen el prompt.
- Define qué debe pasar cuando el agente no encuentra una respuesta.

Después de actualizar conocimiento, usa el Playground para hacer preguntas que dependan de la información cambiada.

Si aparece **Búsqueda web**, configura sitios oficiales pertinentes a la misión y revisa la información que encuentra. Una URL limita dominios de búsqueda; no es una integración, instalación ni garantía de que una página exacta será leída. El campo de este borrador está vacío: **https://www.example.com** es el placeholder nativo, no un sitio agregado o consultado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo de búsqueda web vacío">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es-mobile.png 2x" width="844" height="408" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png 2x" width="1256" height="384" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campo de búsqueda web vacío" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Placeholder sin URL añadida ni búsqueda ejecutada.</figcaption>
</figure>

## Personaliza propiedades

Esta sección aplica a las misiones que muestran la tarjeta **Propiedades** o un subcomponente **Recolector de Propiedades**.

Selecciona solamente los datos del perfil que esa misión realmente necesita. Cuando llega el momento de recopilarlos, la misión omite las propiedades que el cliente ya tiene y pregunta únicamente por las seleccionadas que todavía faltan.

El borrador del Recolector de Propiedades muestra **Nombre** marcado **Importante** y **E Mail** opcional. No se guardó ni se recopiló ningún dato. La opción expresa una prioridad de recopilación; no demuestra un valor verificado, consentimiento para mensajes o permiso de envío.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre importante y correo opcional">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 666px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/style-refresh/fields-es-mobile.png 2x" width="764" height="674" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/style-refresh/fields-es.png" srcset="/images/captures/property-collector/style-refresh/fields-es.png 2x" width="1296" height="698" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nombre importante y correo opcional" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selección ficticia sin recopilación.</figcaption>
</figure>

Al configurar las propiedades:

- Usa propiedades con nombres claros para el cliente, no términos internos de tu CRM.
- Mantén corta la lista para no convertir la conversación en un formulario largo.
- Si aparece la opción **Importante**, márcala solo cuando la misión no pueda continuar sin ese dato. Las demás propiedades pueden quedar como opcionales.
- Prueba un perfil sin ninguna de las propiedades, otro que ya tenga algunas y un cliente que no quiera compartir una propiedad opcional.

Por detrás, la misión usa el agente de [Recolector de Propiedades]({% link _captures/property-collector-playbook.md %}) para pedir, validar y guardar las respuestas. La misión que estás configurando conserva su propia selección de propiedades previas, pero el negocio también debe habilitar la misión independiente Recolector de Propiedades para que su agente ejecute esa recopilación. Puedes configurar aparte la lista propia de esa misión independiente si además quieres usarla directamente como experiencia de captura.

## Personaliza canales

En general, deja la selección automática de canales si la misión ya funciona bien. Muchas misiones manejan canales automáticamente según el tipo de conversación, disponibilidad del cliente y configuración del negocio.

En el ejemplo independiente del Recolector de Propiedades, **Canales de entrada** muestra **Todos los canales de entrada** seleccionado y **Selección manual** disponible, sin guardar. Delimita dónde puede atender esa misión; no prueba que los canales estén conectados, que el perfil pueda recibir mensajes ni que una salida haya sido entregada. Comprueba si tu tarjeta controla entrada o salida antes de cambiarla.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selección de canales de entrada sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" srcset="/images/captures/property-collector/channels-es.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Selección de canales de entrada sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Entrada automática y opción manual; no resultado de envío.</figcaption>
</figure>

Cambia canales solo cuando tengas una razón clara:

- Quieres que un agente reactivo responda solo en ciertos canales.
- Un canal todavía no está listo.
- El tono o formato de la misión no funciona bien en un canal específico.
- Una misión de salida necesita limitarse a WhatsApp, SMS u otro canal por estrategia.

Si cambias canales, prueba el mismo escenario en cada canal seleccionado. Algunos contenidos, botones, plantillas y ventanas de respuesta funcionan distinto según el canal.

## Personaliza la estrategia de descuento

Esta sección aplica a misiones de venta que muestran configuración de **Descuentos**.

Las reglas de descuento afectan expectativas del cliente e ingresos, así que cámbialas con cuidado.

Antes de cambiar descuentos:

- Confirma si la misión debería seguir las reglas de oferta del eCommerce, crear descuentos con IA hasta un porcentaje máximo, combinar ambos o enviar sin descuentos.
- Define máximos claros para cualquier descuento generado por IA.
- Evita acumular descuentos más allá de tus reglas de negocio.
- Prueba qué pasa cuando un cliente pide un mejor descuento.
- Revisa reportes después del cambio para confirmar que la estrategia de descuento mejora el resultado correcto.

Si la misión nunca debería ofrecer descuentos, déjalo explícito en la configuración de descuentos y, si existe, en el prompt.

Si tu misión ofrece un cupón del negocio, verifica el cupón concreto y sus condiciones además de la estrategia. La disponibilidad, integración y reglas de la oferta se comprueban por flujo; un selector de porcentaje no acredita creación ni canje.

La tarjeta compartida de ejemplo tiene **Hasta 10%** seleccionado en un borrador del **Impulsor de Suscriptores** sin guardar. En esa misión, el incentivo generado usa el porcentaje configurado como tasa fija; no lo interpretes como un máximo variable de IA para todas las misiones. El foco estrecho muestra los cuatro porcentajes de la fuente de escritorio. No se generó un descuento ni se cambió una promoción de tienda.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Porcentaje en la tarjeta de descuento compartida">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 548px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/subscriber-booster/discount-mobile-es.png 2x" width="490" height="236" />
        <img class="ht-editorial-visual__image" src="/images/captures/subscriber-booster/discount-es.png" srcset="/images/captures/subscriber-booster/discount-es.png 2x" width="1060" height="820" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Porcentaje en la tarjeta de descuento compartida" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador de Subscriber Booster; tasa fija por ese flujo.</figcaption>
</figure>

## Personaliza derivación

Esta sección aplica a agentes de IA, misiones de atención, [Webchat]({% link _captures/webchat-widget-playbook.md %}) y misiones personalizadas que muestran configuración de **Derivación**.

No todas las misiones necesitan que definas reglas manuales. Algunas misiones de atención derivan automáticamente cuando no pueden responder, cuando una regla lo indica o cuando la consulta necesita una persona. Algunas misiones también pueden derivar si detectan enojo, producto defectuoso o una solicitud que no puede resolver la misión activa.

Revisa:

- Si la conversación debería ir a una persona o a un equipo.
- Qué casos siempre deberían derivarse.
- Qué contexto debería dejar el agente para el equipo.
- Si el equipo del Inbox sabe que esta misión está activa.

**Atención demo** es el equipo ficticio elegido en este borrador de **Derivación** del Recolector de Propiedades. No es una misión ni una conversación asignada. Destino, miembros asignables, capacidad, estado de la conversación y respuesta humana son etapas distintas. El protocolo puede conservar la colaboración de IA o pausar según el flujo; no asumas una pausa universal y permanente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Equipo ficticio en el control de derivación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Equipo ficticio en el control de derivación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Destino sin guardar ni asignar una conversación.</figcaption>
</figure>

Sigue leyendo: [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Personaliza journeys o rutas

Esta sección aplica a misiones tipo **journey** o **ruta**.

Las rutas sí tienen pasos visibles y son sensibles a cambios de secuencia. Cuando edites una ruta, cambia una parte por vez:

- El disparador o señal inicial.
- El primer mensaje.
- Un paso de espera.
- Una condición o rama.
- Un paso de asignación.
- Una condición de salida o detención.
- Un cupón, link o recomendación de producto.

La figura identifica el componente **Asignación** en un formulario ficticio de ruta nueva, sin guardar. Sus cinco acciones completas son controles del paso; no representan una ruta ya construida ni una conversación procesada. Revisa el orden y los destinos: cerrar, asignar y cambiar la atención de IA no son acciones equivalentes. Un cambio de pasos tampoco demuestra que el trabajo existente se canceló.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cinco acciones en el componente Asignación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-es.png" srcset="/images/team/ai-handoff-to-inbox/assignment-es.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Cinco acciones en el componente Asignación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Componente independiente; no ruta ejecutada.</figcaption>
</figure>

Si una ruta no tiene más pasos que ejecutar, el flujo termina. Si agregas condiciones o ramas, prueba tanto el camino esperado como el camino que no debería ejecutarse.

## Prueba según el tipo de misión

Usa el Playground o vista previa cuando esté disponible.

Comprueba qué configuración usa la prueba: un borrador o la versión guardada. El Playground puede ejecutar IA y guardar una conversación de simulación; no es solo una imagen estática. Una respuesta allí no confirma identidad, consentimiento, canal, elegibilidad, asignación o entrega en una conversación real. Las figuras de esta guía no ejecutaron pruebas. Para validar un flujo real, usa únicamente datos y destinatarios de prueba autorizados y revisa cada etapa de forma separada.

Para un agente de IA, prueba lenguaje realista con errores, respuestas cortas, objeciones e intención poco clara.

Para un agente personalizado, prueba mensajes que deberían activar ese agente y mensajes que deberían ir a otra misión.

Para una misión activa de venta, prueba que las recomendaciones, descuentos, links y condiciones de elegibilidad sigan teniendo sentido.

Para una ruta, prueba un perfil de cliente que debería entrar, otro que no debería entrar y al menos una rama alternativa.

Para una misión de atención, prueba una consulta que puede responder, una que debe derivar y una que debería quedar fuera de su alcance.

## Revisa después del cambio

Después de publicar el cambio, revisa los primeros resultados antes de hacer otro ajuste.

Busca:

- Derivaciones inesperadas.
- Preguntas repetidas sin respuesta.
- Respuestas fuera de alcance.
- Uso de descuentos demasiado agresivo o demasiado débil.
- Clientes entrando a la misión incorrecta.
- Cambios en conversión, ingresos, respuestas, bajas o tasa de derivación.

Compara el mismo tipo de misión, población y período, con las unidades y reglas del reporte. Una variación tras editar no demuestra por sí sola que el cambio la causó; algunas señales y atribuciones llegan después.

Si los resultados se mueven en la dirección equivocada, revierte primero el cambio más pequeño. Vuelve a comprobar el estado guardado y el trabajo pendiente: restaurar configuración no deshace mensajes enviados, acciones de proveedores o datos ya guardados.

## Guías relacionadas

- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Misión Recolector de Propiedades]({% link _captures/property-collector-playbook.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
