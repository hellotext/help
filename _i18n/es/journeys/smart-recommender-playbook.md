Usa esta guía cuando quieres que Hellotext ayude a clientes a descubrir, comparar y elegir productos en una conversación.

Recomendador Inteligente es una misión reactiva de venta con IA. Puede participar cuando el contexto de un mensaje corresponde a descubrimiento de productos, colecciones, precios, talles, disponibilidad, comparaciones o recomendaciones y el agente está habilitado y es admisible. Usa contexto de catálogo y producto, tus instrucciones, conocimiento cargado y la conversación actual para decidir qué recomendar o cuándo derivar.

No es una ruta. No construyes una secuencia fija de esperas y mensajes. Configuras el agente, pruebas pedidos reales de clientes, lo habilitas y revisas las primeras conversaciones.

## Qué hace Recomendador Inteligente

Recomendador Inteligente ayuda a clientes a tomar una decisión de compra.

Puede:

- Entender preguntas de descubrimiento de producto como "¿Cuál me conviene?", "¿Lo tienes en negro?" o "¿Qué se parece a esto?"
- Buscar en tu catálogo usando nombres de productos, categorías, atributos, necesidades del cliente o imágenes cuando la búsqueda por imagen está disponible.
- Recomendar productos con tarjetas o links de producto cuando el canal lo permite.
- Responder preguntas de producto usando datos del catálogo y conocimiento aprobado.
- Usar documentos cargados o sitios aprobados para políticas, instrucciones de pago, guía de talles o notas de producto.
- Hacer una pregunta aclaratoria cuando el pedido es demasiado amplio o el catálogo no tiene una coincidencia clara.
- Derivar a una persona o equipo cuando el cliente necesita intervención humana.

La misión debería mantenerse basada en la información disponible para Hellotext. Si faltan datos de producto, precio, talle, stock, políticas o catálogo, o están desactualizados, la experiencia de recomendación será más débil.

La búsqueda utiliza el catálogo y las capacidades disponibles en la cuenta. Un precio o producto guardado no garantiza inventario universal en tiempo real, disponibilidad en una tienda concreta ni una compra. Las recomendaciones no reservan productos, crean pedidos, procesan pagos ni autorizan descuentos. Las promociones necesitan datos y herramientas específicos; escribir una oferta en el prompt no crea un cupón.

## Cuándo usarla

Usa Recomendador Inteligente cuando el descubrimiento de producto ocurre en conversación.

Encaja bien cuando:

- Los clientes preguntan qué comprar, qué producto encaja con su necesidad o qué alternativas existen.
- Tu catálogo tiene suficientes nombres, descripciones, imágenes, precios, variantes o stock para sostener recomendaciones útiles.
- Los clientes comparan productos, talles, materiales, colores, usos o estilos.
- Tu equipo quiere que la IA responda preguntas comunes de compra antes de derivar.
- Quieres que las recomendaciones sucedan desde canales como WhatsApp, Webchat, Instagram DM o SMS cuando estén soportados.

No uses Recomendador Inteligente como única fuente para estado de orden, incidentes de entrega, reclamos, reembolsos, cancelaciones o decisiones finales de cambios y devoluciones. Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) para estado de orden, [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) para ayuda guiada de cambios o devoluciones, [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) para solicitudes de cancelación, y el Inbox cuando una persona necesita decidir.

Sí puede explicar información general de la tienda o una política de cambio o devolución que esté respaldada por sus fuentes o instrucciones aprobadas. Esa orientación no aprueba ni ejecuta la operación. Un destino físico concreto para un cambio o devolución requiere validación humana; los datos del catálogo no autorizan esa decisión.

Si el cliente no hizo una pregunta y solo mostró intención de navegación al ver productos, usa [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Recomendador Inteligente, confirma la configuración de la que depende.

Revisa que:

- Tu catálogo de productos o integración de eCommerce esté conectada.
- Nombres, descripciones, imágenes, precios, variantes, categorías y stock estén lo suficientemente actualizados para recomendar.
- Los canales donde los clientes hacen preguntas de producto estén conectados y listos.
- Los clientes tengan consentimiento y sean elegibles para los canales que quieres usar.
- Tarjetas de producto, links, imágenes o mensajes enriquecidos funcionen en los canales elegidos.
- Políticas de la tienda, guías de talles, instrucciones de pago, información de envío y notas de producto estén cargadas o disponibles en fuentes aprobadas.
- Tu prompt explique la misión del agente, tono, límites de recomendación y cuándo derivar.
- Una persona o equipo esté listo para tomar la conversación cuando el agente no pueda ayudar.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

Confirma también acceso por tipo, plan, rol y cuota, y el alcance y frescura de cada integración. Perfil, identidad, permiso del cliente y destino utilizable se verifican por separado. Una conexión de WhatsApp no sustituye una ventana o plantilla vigente cuando corresponda; SMS depende de remitente, cobertura y límites.

**Agenda semanal**, referencia **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER** y origen **custom_store** son datos de un producto ficticio en borrador, sin eventos ni variantes adicionales. La figura muestra cómo identificar un registro; no prueba stock, catálogo de Meta, recomendación, permiso ni compra.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identidad de un producto ficticio en borrador">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-es-mobile.png 2x" width="778" height="786" />
        <img class="ht-editorial-visual__image" src="/images/developers/products-and-inventory-with-api/identity-es.png" srcset="/images/developers/products-and-inventory-with-api/identity-es.png 2x" width="1006" height="786" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Identidad de un producto ficticio en borrador" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Identidad de un producto ficticio en borrador. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Recomendador Inteligente**.

Recomendador Inteligente incluye:

- **Conocimiento:** documentos con notas de producto, FAQs, políticas, guías de talles, instrucciones de pago u otro contexto aprobado.
- **Prompt del agente:** qué debería hacer el recomendador, cómo debería hablar, qué puede recomendar y cuándo debería derivar.
- **Canales de entrada:** dónde la misión puede responder preguntas de producto.
- **Tono:** la voz usada en las respuestas.
- **Derivación:** si se permite solicitar una derivación y su equipo o persona de destino.
- **Búsqueda web:** sitios aprobados que el agente puede usar para la misión de recomendación.

Los componentes y permisos pueden variar; revisa también **Audiencia** cuando esté disponible. El filtro limita admisión y no concede identidad, consentimiento o un canal listo. Las figuras siguientes muestran los mismos controles compartidos en borradores ficticios independientes; no presentan una misión Recomendador Inteligente guardada o ejecutada.

En **Conocimiento**, este borrador de Agente Personalizado no tiene un archivo elegido ni cargado. Guardar puede iniciar procesamiento: archivo elegido, guardado, aceptado por el proveedor e índice listo son estados distintos. Usa material aprobado y comprueba su disponibilidad antes de depender de él.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Conocimiento sin archivo elegido">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Conocimiento sin archivo elegido" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Conocimiento sin archivo elegido. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

**Canales de Entrada** muestra **Todos los canales de entrada** y la alternativa manual en un borrador independiente del Recolector de Propiedades, sin guardar. La selección define dónde puede participar el agente; no conecta canales ni demuestra un destino de salida, formato compatible, permiso o entrega.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selección automática o manual de canales de entrada">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" srcset="/images/captures/property-collector/channels-es.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Selección automática o manual de canales de entrada" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selección automática o manual de canales de entrada. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

En **Tono**, **Amigable**, **Juguetón** y **Exclusivo** están seleccionados sin guardar en otro borrador del Recolector. El control permite elegir entre uno y tres tonos. Orienta la redacción; no garantiza una respuesta ni cambia herramientas, datos o permisos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tres tonos seleccionados sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-es-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-es.png" srcset="/images/captures/property-collector/tone-es.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tres tonos seleccionados sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Tres tonos seleccionados sin guardar. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

**Derivación** muestra **Atención demo**, un equipo de destino en un borrador independiente del Recolector de Propiedades, sin guardar. El interruptor y selector son los controles compartidos de la misión; la figura no representa una conversación derivada o un dueño asignado. Revisa destino junto con pertenencia, capacidad, horario y protocolo. Solicitar una derivación, asignar y recibir una respuesta humana son etapas distintas; cerrar o posponer no responde al cliente. La pausa de IA depende del protocolo aplicable.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Equipo de destino en Derivación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Equipo de destino en Derivación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Equipo de destino en Derivación. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

**Búsqueda web** está vacía en este borrador de Agente Personalizado. **https://www.example.com** es un placeholder; no hay sitio añadido ni consultado. La herramienta usa los dominios permitidos que se guardaron y estén disponibles; eso no garantiza una ruta, página exacta, contenido actualizado o una integración comercial.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Búsqueda web vacía con placeholder">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es-mobile.png 2x" width="844" height="408" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png 2x" width="1256" height="384" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Búsqueda web vacía con placeholder" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Búsqueda web vacía con placeholder. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

Mantén la selección automática de canales salvo que tengas una razón clara para limitar la misión. Algunos formatos de recomendación funcionan mejor en canales enriquecidos, mientras que otros pueden necesitar links o texto más simple.

Esta misión tiene una intención interna de recomendación de productos. Normalmente no necesitas crear intenciones manuales para ella. Si necesitas varios agentes con distintos objetivos de producto o reglas de activación, usa un [agente personalizado]({% link _journeys/custom-agent-playbook.md %}) y define esas intenciones aparte.

## Escribe un prompt útil

El prompt debería darle límites claros al recomendador.

El **Prompt** vacío de este borrador de Agente Personalizado muestra el editor compartido y un placeholder, sin instrucciones guardadas. La figura ayuda a reconocer el campo; no muestra una respuesta del Recomendador ni habilita herramientas, conexión, permisos o un catálogo.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Prompt vacío sin instrucciones guardadas">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Prompt vacío sin instrucciones guardadas" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Prompt vacío sin instrucciones guardadas. Estado ficticio independiente; no recomendación, respuesta o entrega ejecutada.</figcaption>
</figure>

Incluye:

- Qué tipo de cliente está ayudando el agente.
- Qué productos, colecciones, categorías o casos de uso importan más.
- Cuántos productos debería recomendar por vez.
- Qué preferencias de producto puede usar con los datos y herramientas disponibles; no prometas margen, más vendidos o stock si la fuente no los respalda.
- Qué afirmaciones requieren respaldo del catálogo o documentos.
- Cuándo debería hacer una pregunta aclaratoria.
- Cuándo debería derivar en lugar de adivinar.

Evita instrucciones como "recomienda cualquier cosa" o "siempre cierra la venta". Hacen más difícil probar la misión y pueden empujar al agente fuera de la necesidad real del cliente.

Para estructurar el prompt, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

El prompt complementa el contrato del agente y no puede ampliar operaciones o herramientas. Las recomendaciones necesitan resultados de búsqueda; los hechos de producto y tienda requieren respaldo. No inventes URLs, precios, descuentos ni disponibilidad. Una pregunta aclaratoria puede ayudar ante ambigüedad; una coincidencia imperfecta no exige una derivación automática.

Si existe una lista de propiedades configuradas y un Recolector habilitado, las propiedades importantes se persiguen en un momento natural, normalmente de una en una, después de ayudar con la consulta. Pueden seguir pendientes aunque la recomendación pueda continuar. Las opcionales pueden declinarse; una resolución acotada no prueba que se haya recopilado un valor. Respeta una negativa y distingue datos del perfil de consentimiento.

## Por qué puede no responder o recomendar

Que la misión Recomendador Inteligente esté habilitada no significa que cada mensaje recibirá una recomendación de producto.

La misión puede no responder, pedir una aclaración o derivar cuando:

- El mensaje del cliente no es sobre descubrimiento de producto o una nueva decisión de compra.
- Otra misión activa puede encargarse mejor de la conversación.
- El cliente necesita seguimiento de una orden, resolver un reclamo o ejecutar un reembolso, cambio o devolución; la orientación general respaldada puede seguir dentro del alcance.
- El catálogo no tiene una buena coincidencia para el pedido.
- Faltan datos de producto o están desactualizados, o no están disponibles en el canal elegido.
- El canal no puede mostrar la tarjeta de producto, link o formato de media deseado.
- El conocimiento cargado o las fuentes aprobadas no respaldan la respuesta.
- El cliente necesita que una persona decida, apruebe o resuelva algo.

Para el modelo general de decisión, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

Un saludo, frustración o una búsqueda sin resultado no prueban que haya que derivar. Distingue aclaración o nueva búsqueda de una solicitud humana explícita o una operación fuera de alcance. El destino configurado no garantiza una persona disponible, capacidad, respuesta inmediata ni una pausa universal y permanente de IA.

## Cómo probarla

Prueba con preguntas de producto realistas antes de habilitar la misión ampliamente.

Revisa primero los datos y controles sin generar mensajes. Si haces una prueba operacional, usa un entorno ficticio aislado y autorizado, comprueba sus efectos y limita los destinatarios. Prepara estos escenarios:

- Un pedido amplio: "Necesito un regalo" o "¿Qué me recomiendas?"
- Un pedido específico: nombre de producto, categoría, color, talle, presupuesto o caso de uso.
- Una comparación: "¿Cuál es mejor para correr?" o "¿Cuál es la diferencia entre estos?"
- Una pregunta de stock o talle.
- Un pedido con imagen si tu cuenta soporta búsqueda de producto por imagen.
- Un pedido que debería producir tarjetas o links de producto.
- Un pedido que debería hacer una pregunta aclaratoria.
- Un mensaje sobre estado de orden, entrega, reclamo, cambio o devolución que debería derivarse o ir a otra misión.
- Un pedido donde ningún producto del catálogo sea una buena coincidencia.

Revisa si el agente recomienda los productos correctos, explica por qué, se mantiene respaldado por información disponible, evita afirmaciones no soportadas y envía la conversación a la persona o equipo correcto cuando hace falta.

Un Playground disponible puede persistir una simulación, mensajes, eventos y productos mostrados; las búsquedas pueden registrar ejecuciones y llamar a proveedores. No demuestra identidad, consentimiento, elegibilidad, envío o entrega reales. Guardar y habilitar también son mutaciones; deshabilitar no cancela universalmente trabajo ya en cola. Si un resultado es incierto, reconcilia el estado antes de repetir la acción. Las figuras de esta guía no ejecutan esos escenarios.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron la misión.
- Qué productos se recomendaron.
- Si las recomendaciones coincidieron con la necesidad expresada por el cliente.
- Si tarjetas, links, imágenes y precios fueron correctos.
- Si el agente hizo preguntas aclaratorias útiles.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Clicks, interacción con productos, conversión, ingresos, bajas y mensajes fallidos.
- Casos donde el agente respondió preguntas de soporte que deberían haber ido a otro lugar.

Ajusta una cosa por vez: prompt, documentos de conocimiento, selección de canal, destino de derivación o calidad de datos del catálogo.

Recomendador Inteligente tiene un reporte registrado, pero cada métrica usa su población, período, zona horaria y denominador. Mensaje creado, enviado, entregado, interacción, derivación, respuesta humana, compra y venta atribuida se revisan por separado. La atribución depende de sus fuentes y cronología; no convierte toda compra posterior en resultado de esta misión. Sigue las guías de reportes y atribución enlazadas abajo para comprobar las medidas disponibles.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
