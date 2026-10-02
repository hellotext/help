Usa misiones y automatizaciones cuando Hellotext debe leer señales de clientes, decidir qué hacer después y actuar sin que alguien de tu equipo envíe cada mensaje manualmente.

Una misión es una configuración reutilizable para un objetivo de negocio. Según el tipo, usa reglas, pasos definidos o IA para evaluar señales y proponer la siguiente acción. Su acceso, datos, herramientas, integración, permiso del cliente y canal limitan lo que puede hacer; estar habilitada no garantiza un mensaje ni un resultado.

Si estás comparando misiones con campañas e Inbox, empieza por [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %}).

Una misión puede funcionar de forma autónoma, como un agente de IA reactivo, como una ruta con pasos definidos o como una captura. Las misiones de captura están en **Misiones** > **Explorar misiones** > **Captura**. Las capturas y campañas tienen secciones propias en el Centro de Ayuda porque su configuración y forma de operar son distintas.

Las señales pueden incluir carritos, navegación, compras, cambios de stock, cumpleaños, respuestas, propiedades del perfil de cliente y elegibilidad por canal.

Sigue leyendo: [Qué son las señales]({% link _journeys/what-are-signals.md %}).

Una señal, una propiedad o un objeto guardado son evidencias distintas. Tener un pedido en Hellotext no confirma su entrega ni autoriza contactar al cliente. La admisión de una misión proactiva, la selección contextual de un agente reactivo y el disparador de una ruta tienen reglas propias; no hay una secuencia de IA universal para todas las herramientas.

## Elige el tipo de misión correcto

Si estás decidiendo por dónde empezar, usa [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %}).

Si quieres explorar opciones comunes por objetivo de negocio, usa [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %}).

Cuando ya sabes qué opción quieres lanzar, usa [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %}).

Usa una **misión preconstruida** cuando el objetivo es común y la misión recomendada ya encaja con tu negocio. Revisa su disponibilidad y requisitos antes de adoptarla; la plantilla no demuestra que tus datos o canales estén listos.

Usa una **misión con IA** o un **agente de IA** cuando la experiencia necesita responder conversacionalmente, usar conocimiento de productos o políticas, recomendar artículos, responder preguntas frecuentes, recopilar información del cliente o decidir cuándo derivar.

El alcance cambia por tipo. Respuestas Instantáneas y el Asistente de Cambios y Devoluciones orientan con información fundamentada; no adquieren consulta de pedidos, inventario, cancelación o reembolso por escribir instrucciones. Una operación requiere la herramienta concreta, integración, acceso y reglas del flujo. Ningún prompt crea consentimiento ni permiso de envío.

El **Prompt** vacío de este borrador ficticio de **Agente Personalizado** muestra dónde se escriben instrucciones. El texto gris es un placeholder; no hay instrucciones guardadas ni una respuesta de IA ejecutada. Otros tipos pueden mostrar controles diferentes.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Prompt vacío en un borrador de Agente Personalizado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Prompt vacío en un borrador de Agente Personalizado" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario independiente sin guardar ni ejecutar IA.</figcaption>
</figure>

Para nuevos suscriptores o registros que todavía no compraron, mira [Misión Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}). Para compradores que esperan un producto no disponible, mira [Misión Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}). Para compradores que vieron un producto antes de que bajara de precio, mira [Misión Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %}). Para intención de navegación que no llegó a carrito, mira [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}). Para descubrimiento de producto específicamente, mira [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}). Para complementos de los productos de una orden confirmada elegible vinculada al cliente, mira [Misión Completa el Look]({% link _journeys/complete-the-look-playbook.md %}). Para complementos después de una compra elegible, mira [Misión Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}). Para recompra de productos consumibles, mira [Misión Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}). Para cumpleaños guardados en el perfil, mira [Misión Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %}). Para el aniversario de la primera compra registrada, con señales y objeto de origen válidos, mira [Misión Sorpresa de Aniversario]({% link _journeys/anniversary-surprise-playbook.md %}). Para clientes que empiezan a enfriarse, mira [Misión Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}). Para clientes inactivos que cumplen los criterios de esa misión, mira [Misión Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}). Para clientes sin actividad o sin reactivarse que cumplen sus criterios, mira [Misión Último Intento]({% link _journeys/sunset-saver-playbook.md %}). Para preguntas de estado de pedido, mira [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}). Para reseñas de productos después de la entrega, mira [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}). Para lealtad después de la entrega, mira [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}). Para satisfacción después de conversaciones resueltas, mira [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}). Para preguntas frecuentes de soporte, mira [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}). Para soporte guiado de cambios o devoluciones, mira [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}). Para solicitudes de cancelación, mira [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}). Para un agente reactivo a medida con intenciones, prompt, conocimiento, canales, tono y derivación propios, mira [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

Usa una **ruta** cuando necesitas un flujo de clientes paso a paso con disparador, mensajes, esperas, condiciones, ramas y derivaciones. Un seguimiento básico de carrito abandonado puede ser [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}); una misión de carrito abandonado con IA puede decidir de forma más dinámica usando señales y contexto del cliente.

Cada paso tiene una función y el orden importa. **Asignación** muestra cinco acciones en un formulario ficticio independiente de ruta nueva, sin guardar. Elegir una acción no equivale a responder al cliente; esta figura no muestra una ruta construida, un disparador confirmado ni una conversación procesada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Acciones del paso Asignación en una ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-es.png" srcset="/images/team/ai-handoff-to-inbox/assignment-es.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Acciones del paso Asignación en una ruta" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Componente independiente; sin guardar, publicar ni ejecutar la ruta.</figcaption>
</figure>

Para esa decisión específica, mira [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}), [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) y [Carrito abandonado: plantilla de ruta vs misión con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

Usa una **campaña** cuando quieres un envío puntual a una audiencia seleccionada, y una **captura** cuando el objetivo es recolectar suscriptores, datos de clientes o conversaciones desde el sitio. Para una entrada conversacional en el sitio, mira [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %}).

Este catálogo ficticio muestra las tarjetas **Popup** y **Formulario** del grupo **Captura**; la vista estrecha enfoca la tarjeta Formulario de la misma interfaz de escritorio. Reconocer una tarjeta no prueba que la herramienta esté guardada, publicada, visible o instalada, ni que haya recibido un envío o consentimiento. Los opt-ins del checkout pertenecen a sus integraciones.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Popup y Formulario en el catálogo de Captura">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-es.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/es/catalog-desktop-row.png" srcset="/images/captures/forms/es/catalog-desktop-row.png 2x" width="1632" height="480" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Popup y Formulario en el catálogo de Captura" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Catálogo de escritorio y foco de Formulario; no captura ejecutada.</figcaption>
</figure>

## Antes de habilitar una misión

Confirma que los datos y canales de los que depende estén listos.

Comprueba el negocio, tipo, rol, plan o cuota y los componentes disponibles. Verifica el origen y fecha de cada señal, la identidad y destino del cliente, el permiso aplicable y la preparación del canal. Una dirección visible, un estado de perfil o una lista de entrada no acredita todo ese recorrido.

**Camila Torres** es un perfil ficticio **Sin confirmar**, con email de ejemplo y sin teléfono. La figura distingue los campos guardados de identidad verificada o permiso para contactar; su vista estrecha es un foco de escritorio. No se envió un mensaje ni se cambió una suscripción.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campos de un perfil ficticio sin confirmar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campos de un perfil ficticio sin confirmar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil independiente; datos visibles no prueban consentimiento o entrega.</figcaption>
</figure>

Para el flujo completo de lanzamiento, usa [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %}).

Cuando necesites cambiar una configuración existente, usa [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

Si una misión está activa pero no envía cuando esperabas, usa [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}) antes de cambiar la configuración.

Cuando necesites diagnosticar un ejemplo concreto, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

Para misiones de eCommerce, asegúrate de que la integración de tu tienda esté conectada y que la actividad reciente aparezca en los perfiles de cliente como señales utilizables.

Para misiones de WhatsApp, revisa la conexión, el destino y el permiso. Cuando el flujo requiera una plantilla, verifica su versión activa y aprobación; la ventana de conversación y las restricciones del canal también importan.

Para misiones de SMS, revisa remitente, cobertura del destino, permiso y límites aplicables. El país del negocio o una conexión de WhatsApp no demuestra una ruta SMS disponible.

## Qué revisar antes de publicar

- El disparador coincide con la acción del cliente a la que quieres reaccionar.
- Las señales de las que depende la misión están disponibles y actualizadas.
- Los mensajes usan el canal y tono correctos.
- Los pasos de espera dan suficiente tiempo antes del siguiente seguimiento.
- Las condiciones y ramas envían a cada persona por el camino correcto.
- Los cupones, links, etiquetas y recomendaciones de producto funcionan.
- Las reglas de derivación humana son claras para cuando una conversación debe salir de la ruta o del agente.
- Los límites de frecuencia, consentimiento y horarios silenciosos están claros para que las misiones no compitan por el mismo cliente en el mismo momento.

Aplica esta lista a los controles que existen en tu tipo: una misión autónoma no necesariamente tiene esperas o ramas editables. Las reglas de frecuencia y competencia tienen poblaciones y excepciones propias; no prometen un envío a una hora exacta. La selección de canales de entrada tampoco garantiza un canal de salida o entrega.

En este borrador ficticio independiente del **Recolector de Propiedades**, **Tono** tiene **Amigable**, **Juguetón** y **Exclusivo** seleccionados sin guardar. Los tipos que ofrecen este control permiten de uno a tres tonos; son una guía de estilo, no una garantía de respuesta ni de alcance.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tres tonos seleccionados en un borrador">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-es-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-es.png" srcset="/images/captures/property-collector/tone-es.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tres tonos seleccionados en un borrador" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selección sin guardar; no respuesta de IA.</figcaption>
</figure>

## Mejora después del lanzamiento

La derivación debe distinguir solicitud, equipo de destino, dueño, miembros asignables, capacidad, horario, protocolo y respuesta humana. Cerrar o posponer una conversación no es una respuesta. La IA solo se pausa según el protocolo correspondiente; no asumas una pausa universal y permanente.

La política ficticia existente de Inbox muestra **cinco minutos** para cada objetivo de respuesta, sin cambios. Son objetivos de atención que dependen del calendario y las reglas; no un SLA de ejecución, envío o entrega de todas las misiones. La figura no muestra una respuesta recibida.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Objetivos de respuesta existentes en Inbox">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 504px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-es-mobile.png 2x" width="824" height="844" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-response-times/default-es.png" srcset="/images/team/understanding-response-times/default-es.png 2x" width="972" height="820" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Objetivos de respuesta existentes en Inbox" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Política independiente sin editar; no promesa de respuesta o entrega.</figcaption>
</figure>

Empieza con una audiencia enfocada y revisa las primeras conversaciones antes de ampliar. Busca respuestas, expectativas no cubiertas, links rotos, problemas de timing y lugares donde una persona tuvo que intervenir.

Usa lo aprendido para ajustar solo los controles que expone ese tipo de misión: prompts en agentes; esperas, condiciones de ramas o textos de plantilla en rutas; y tono, estrategia de oferta o canales en misiones autónomas de venta. Para métricas de ingresos, conversión y derivación, usa [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

Para un proceso de edición más seguro, usa [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

Distingue configuración local, guardado final y habilitación: guardar puede persistir componentes, crear un flujo o iniciar procesamiento de archivos. Elegir o guardar un documento no demuestra que el índice del proveedor esté listo. Deshabilitar no cancela universalmente el trabajo ya en cola. Si el resultado de una operación es incierto, reconcilia el estado antes de repetirla.

Usa el Playground solo si está disponible y entiendes sus efectos: puede guardar una simulación, mensajes o eventos y llamar al proveedor. Una respuesta simulada no prueba identidad, consentimiento, elegibilidad ni entrega real. Esta guía no ejecutó pruebas.

Elige el reporte que exista para ese tipo y define población, período y denominador. No todas las misiones o rutas tienen un reporte dedicado; resolución, derivación, envío, entrega, devolución y venta atribuida son resultados distintos. No interpretes una captura o un cambio de configuración como prueba de rendimiento.

## Guías relacionadas

- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo funciona Hellotext: misiones, campañas e Inbox]({% link _getting-started/how-hellotext-works.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Misión Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %})
- [Misión Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %})
- [Misión Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %})
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Misión Completa el Look]({% link _journeys/complete-the-look-playbook.md %})
- [Misión Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Misión Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %})
- [Misión Sorpresa de Aniversario]({% link _journeys/anniversary-surprise-playbook.md %})
- [Misión Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %})
- [Misión Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %})
- [Misión Último Intento]({% link _journeys/sunset-saver-playbook.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Carrito abandonado: plantilla de ruta vs misión con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Ruta personalizada]({% link _journeys/custom-journey.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
