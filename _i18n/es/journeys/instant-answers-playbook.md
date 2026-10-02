Usa esta guía cuando tu equipo responde las mismas preguntas de soporte una y otra vez.

Respuestas Instantáneas es una misión reactiva de atención con IA. Responde cuando un cliente hace una pregunta frecuente de soporte y usa conocimiento aprobado, políticas y contexto conectado para responder o derivar cuando una persona debe tomar la conversación.

No es una ruta, una campaña, un recomendador de productos ni un agente personalizado con intenciones propias. Es la misión de atención para preguntas repetidas que deberían responderse rápido y de forma consistente.

## Qué hace Respuestas Instantáneas

Respuestas Instantáneas ayuda a responder preguntas comunes con información documentada. El nombre de la misión no garantiza una respuesta inmediata, atención humana fuera de horario ni un nivel de servicio.

Puede:

- Responder a preguntas dentro de su alcance cuando la misión está habilitada y la conversación es admitida por la selección contextual de intención y sus reglas. Una frase aislada no garantiza que esta misión tome la conversación.
- Usar instrucciones y conocimiento aprobado que estén disponibles para esta misión y preparados para consulta.
- Responder preguntas sobre políticas de envío, métodos de pago, información de tienda, cuidado de producto, garantías básicas, guías de talle y otros temas repetidos de soporte.
- Hacer una pregunta de aclaración cuando a la solicitud le faltan datos importantes.
- Reconocer que no puede confirmar una respuesta o solicitar otra misión o atención humana cuando corresponde.
- Trabajar junto con Webchat, asignación en Inbox, reglas de respuesta y otras misiones de atención.

Respuestas Instantáneas funciona mejor cuando la respuesta ya está escrita en una fuente confiable. Puede explicar datos estáticos de un producto, como materiales o cuidados; no ofrece inventario, precios o disponibilidad en tiempo real, seguimiento de una orden ni ejecución de una devolución. El contexto conectado y un documento no amplían ese alcance.

## Cuándo usarla

Usa Respuestas Instantáneas cuando:

- Tu equipo responde las mismas preguntas frecuentes muchas veces.
- Los clientes preguntan antes o después de comprar y la respuesta no requiere una decisión personalizada.
- Tienes políticas, páginas de ayuda, PDFs, notas de producto o guías internas de soporte actualizadas que el agente puede usar.
- Quieres reducir el trabajo repetitivo sin prometer tiempos de respuesta ni disponibilidad continua de IA o de personas.
- Quieres que el agente responda preguntas simples y derive excepciones a la persona o equipo correcto.

Buenos temas incluyen política de envío, explicación de ventanas de devolución, métodos de pago, horarios de tienda, instrucciones de cuidado de producto, garantías básicas, explicación de guías de talle y dónde encontrar información de cuenta u orden.

## Cuándo no usarla

No uses Respuestas Instantáneas como dueño de todas las conversaciones.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando la pregunta es sobre una orden específica, envío, número de tracking, estado de entrega o "¿dónde está mi pedido?".

Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente quiere descubrimiento de producto, comparación o recomendaciones.

Usa [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) cuando tu cuenta tenga esa misión disponible y el cliente necesita un flujo de cambios o devoluciones, no solo una explicación de política.

Usa [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) cuando tu cuenta tenga esa misión disponible y el cliente necesita ayuda para pedir una cancelación, no solo una explicación de política.

Usa un [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) cuando necesitas intenciones propias, instrucciones para un especialista acotado o un objetivo de soporte demasiado específico para la misión preconstruida.

Usa una [ruta]({% link _journeys/getting-started-with-journeys.md %}) cuando la experiencia debe seguir pasos visibles, esperas, preguntas, ramas y asignaciones.

## Qué necesita antes de lanzarla

Confirma que tu cuenta permite configurar este tipo de misión: su disponibilidad, tarjetas y cupo dependen de funciones, plan y rol. Tener acceso a otro tipo de misión no garantiza acceso a esta.

Antes de habilitar Respuestas Instantáneas, confirma:

- Los temas de soporte que debería responder están claros.
- Las políticas, FAQs, documentos o sitios aprobados que debería usar están actualizados.
- El contenido contradictorio o desactualizado fue removido.
- Los canales de entrada previstos están conectados y habilitados. Comprueba por separado el destino, permiso y canal de salida; recibir una consulta no garantiza poder enviar una respuesta.
- Hay un destino de derivación válido y personas con acceso, pertenencia al equipo y capacidad para atenderlo.
- Tu equipo sabe qué preguntas debería responder la misión y cuáles debería dejar a una persona.
- Las reglas de respuesta y el horario comercial coinciden con el nivel de servicio que quieres para conversaciones de soporte.

Las instrucciones no crean herramientas, integraciones ni permiso para guardar datos, realizar solicitudes HTTP o ejecutar operaciones externas. Si necesitas una acción, verifica la herramienta específica disponible y su alcance antes de diseñar el flujo.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Respuestas Instantáneas**.

Abrir un formulario nuevo prepara un borrador; revisa qué conservará **Guardar** antes de usarlo. Volver desde una tarjeta puede mantener cambios locales. El guardado final y la habilitación son pasos distintos que pueden persistir configuración y cambiar el flujo.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Conocimiento o documentos cargados:** FAQs, políticas, notas de producto, guías u otro contenido de soporte aprobado.
- **Canales de entrada:** por dónde pueden llegar consultas elegibles; no seleccionan por sí solos el canal de salida.
- **Tono:** de uno a tres tonos para orientar la voz, sin garantizar una respuesta exacta.
- **Derivación o asignación:** quién debería tomar la conversación cuando la misión no puede resolverla.
- **Fuentes y herramientas disponibles:** comprueba cuáles admite esta misión. No presupongas una tarjeta de Búsqueda web por haberla visto en Agente Personalizado. Escribir una URL en instrucciones no añade ni consulta un sitio. Cuando otra configuración sí admite búsqueda por dominio, no garantiza la ruta, puerto, página exacta ni frescura de la información.

**Ejemplo ficticio independiente:** este control compartido de Canales de Entrada proviene de un borrador de Recolector de Propiedades. Muestra **Todos los canales de entrada** y la alternativa manual, sin guardar. No representa una misión Respuestas Instantáneas configurada, una conexión ni una respuesta enviada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Canales de entrada compartidos sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" srcset="/images/captures/property-collector/channels-es.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Canales de entrada compartidos sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

**Ejemplo ficticio independiente:** el control compartido de Tono tiene **Amigable**, **Juguetón** y **Exclusivo** seleccionados sin guardar. Son una orientación de estilo; no prueban cómo respondió la IA.

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

Mantén la configuración enfocada. Si la misión necesita demasiadas excepciones, divide el trabajo: usa una misión de atención especializada, un agente personalizado o un proceso de Inbox para los casos de mayor riesgo.

## Prepara el conocimiento

La calidad del conocimiento es el factor más importante para la calidad de las respuestas.

Usa fuentes en las que tu equipo ya confía:

- Páginas del help center.
- Políticas de envío, devoluciones, cambios, garantía y privacidad.
- Horarios de tienda, instrucciones de pickup e información de contacto.
- Notas de cuidado de producto, guías de talle y materiales.
- Instrucciones internas de soporte que sean lo suficientemente estables para clientes.

Antes de subir o aprobar fuentes, elimina:

- Promociones vencidas o precios viejos.
- Texto de políticas en borrador.
- Reglas contradictorias de devolución o garantía.
- Notas internas que no deberían compartirse con clientes.
- Promesas no respaldadas sobre tiempos de entrega, reembolsos o aprobaciones.

Elegir un archivo, guardarlo y tenerlo preparado para consulta por el proveedor son estados distintos. Comprueba la preparación de las fuentes que la misión realmente puede usar; no asumas que un archivo visible ya está disponible para responder. Si la fuente cambia, revisa versiones, contradicciones y preparación antes de esperar una respuesta actualizada.

**Ejemplo ficticio independiente:** el área compartida de Conocimiento procede de un borrador de Agente Personalizado. Está vacía: no se eligió ni subió un archivo. Sirve para reconocer el control, no para demostrar conocimiento listo o una respuesta de Respuestas Instantáneas.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Área de conocimiento sin archivo elegido">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Área de conocimiento sin archivo elegido" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Si configuras propiedades de cliente, revisa la lista válida de esta misión y el Recolector de Propiedades habilitado. Los elementos requeridos se persiguen en un momento natural de la conversación, sin convertir el inicio en un cuestionario; los opcionales pueden rechazarse. Un elemento resuelto puede no haberse recopilado por sus límites. Ninguna prioridad equivale a consentimiento ni concede permiso para otros datos o acciones.

## Define límites de derivación

Respuestas Instantáneas debería derivar cuando el cliente necesita una persona, no una respuesta general.

Casos comunes de derivación:

- El cliente pide hablar con una persona.
- La necesidad del cliente requiere trabajo fuera de alcance. La frustración por sí sola, un saludo o una búsqueda fallida no son motivos automáticos de derivación.
- El cliente pide gestionar un producto defectuoso, dañado, incorrecto o faltante. Una explicación general de la política puede seguir dentro del alcance.
- La solicitud exige gestionar una aprobación, excepción, reembolso, cancelación, cambio, modificación de cuenta, acceso a detalles privados de pago o acción humana de venta.
- Las fuentes disponibles no permiten una respuesta respaldada y una aclaración útil no resuelve la falta de información. Revisa conflictos y posibilidades de consulta antes de concluir que no hay respuesta.
- El cliente pregunta por una orden específica y [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) debería manejarlo.
- Ninguna misión activa puede resolver la solicitud de forma segura.

Una solicitud de derivación puede cambiar de misión o pasar a atención humana según las misiones activas, admisión y configuración. No confirma por sí sola un dueño, una respuesta ni una pausa universal y permanente de IA. Destino, equipo, capacidad, horario y protocolo de asignación determinan cómo continúa la atención. Deshabilitar una misión tampoco demuestra que todo trabajo ya en cola quedó cancelado.

**Ejemplo ficticio independiente:** la Derivación compartida de un borrador de Recolector de Propiedades muestra **Atención demo**, un equipo de destino. No es una misión ni evidencia de conversación asignada, persona disponible o respuesta. No se guardó ni habilitó.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Equipo de destino ficticio sin asignación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Equipo de destino ficticio sin asignación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Conéctalo con Webchat e Inbox

Respuestas Instantáneas puede funcionar muy bien con [Widget de Webchat]({% link _captures/webchat-widget-playbook.md %}).

Webchat le da a visitantes un lugar para preguntar desde el sitio. Respuestas Instantáneas puede responder preguntas soportadas después de que empieza la conversación. El Inbox le da a tu equipo un lugar para manejar excepciones, derivaciones y respuestas de seguimiento.

**Ejemplo ficticio independiente:** esta vista previa completa del editor de Webchat muestra un saludo sin guardar, una burbuja de cliente de demostración y el compositor. La etiqueta **En línea ahora** es parte de la vista previa: no prueba disponibilidad humana, conversación real, instalación ni ejecución de Respuestas Instantáneas. La invitación del widget a elegir productos no amplía el alcance de esta misión.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Vista previa completa de Webchat con saludo de ejemplo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 422px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/webchat-widget/preview-follow-up/es/preview.png 2x" width="808" height="1380" />
        <img class="ht-editorial-visual__image" src="/images/captures/webchat-widget/preview-follow-up/es/preview.png" srcset="/images/captures/webchat-widget/preview-follow-up/es/preview.png 2x" width="808" height="1380" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Vista previa completa de Webchat con saludo de ejemplo" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Antes de lanzar, confirma:

- Webchat o el canal de entrada está habilitado.
- El mensaje inicial no promete soporte que la misión no puede dar.
- El responsable de derivación es la persona o equipo correcto.
- Las reglas de respuesta reflejan qué tan rápido debería responder una persona después de una derivación.

**Ejemplo ficticio independiente:** esta política existente de Inbox tiene objetivos de cinco minutos para la primera respuesta y las siguientes. No se cambió. Los objetivos y el calendario sirven para seguimiento de atención; no garantizan latencia de IA ni respuesta de una persona. Una derivación humana requiere una respuesta humana para satisfacer su espera; cerrar o posponer no equivale a responder.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Política existente de respuesta sin cambios">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-es-mobile.png 2x" width="824" height="844" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-es.png" srcset="/images/team/understanding-response-times/default-es.png 2x" width="972" height="820" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Política existente de respuesta sin cambios" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

## Cómo probarla

Primero prepara por escrito casos realistas y el resultado esperado: responder con una fuente concreta, aclarar, reconocer un límite o derivar. Incluye:

- Una pregunta frecuente con respuesta clara en el conocimiento aprobado.
- La misma pregunta con errores, texto corto o lenguaje casual.
- Una pregunta que necesita una aclaración.
- Una pregunta no cubierta por los documentos cargados o páginas aprobadas.
- Una pregunta donde dos documentos podrían contradecirse.
- Una pregunta específica de estado de pedido que debería ir a Seguimiento de Pedidos o derivar.
- Una pregunta de recomendación de producto que debería ir a Recomendador Inteligente o derivar.
- Una solicitud de ejecutar una devolución, cambio, reembolso, cancelación o resolución de un reclamo que debería derivar o ir a otro flujo; compárala con una pregunta general sobre la política.
- Un mensaje desde cada canal de entrada que piensas usar.

Si tu cuenta ofrece Playground, verifica su alcance antes de ejecutarlo: puede guardar conversaciones, mensajes y eventos simulados y llamar al proveedor de IA. Una simulación no prueba identidad, consentimiento, elegibilidad, permiso de salida ni entrega en un canal real.

Para una prueba real autorizada, confirma previamente perfiles de prueba, destinos, permisos, canales y efectos previstos. No repitas un envío o acción de resultado incierto sin reconciliar primero lo que ocurrió. Revisa si la respuesta está basada en conocimiento, es breve, correcta para el canal y clara sobre los siguientes pasos.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron la misión.
- Qué preguntas se respondieron correctamente.
- Qué preguntas deberían haber ido a otra misión.
- Si las respuestas siguieron la fuente correcta.
- Si clientes hicieron preguntas de seguimiento porque la respuesta no fue clara.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Preguntas repetidas sin respuesta que sugieren conocimiento faltante.
- Velocidad de respuesta, tasa de resolución, tasa de derivación, respuestas de clientes, mensajes fallidos y bajas cuando aplique.

Usa las vistas y métricas disponibles para este tipo de misión. No presupongas un reporte exclusivo de Respuestas Instantáneas ni todos esos indicadores. Conserva población, período y denominador al comparar; una conversación resuelta o derivada no prueba entrega ni atribución de una venta.

Ajusta una cosa por vez: conocimiento, selección de canales, tono, destino de derivación o los temas de soporte que esperas que la misión cubra.

Si quieres medir satisfacción después de conversaciones de soporte resueltas, usa [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) junto a la misión de soporte.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
