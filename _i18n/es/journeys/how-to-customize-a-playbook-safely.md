Usa esta guía cuando una misión ya está configurada y quieres adaptarla sin cambiar por accidente cómo decide, responde o envía mensajes.

No todas las misiones se personalizan igual. Algunas son agentes de IA autónomos, otras son misiones activas de venta que envían o recomiendan según señales, otras son misiones reactivas de atención que responden cuando un cliente escribe, y otras son rutas con pasos definidos. Antes de cambiar algo, identifica qué tipo de misión estás editando y qué tarjetas de configuración están disponibles.

Si todavía no lanzaste la misión, empieza por [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %}).

Si la misión está activa pero no envió, primero revisa [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). La edición más segura depende de si el problema está en disparador, elegibilidad, preparación del canal, timing, derivación o contenido.

Si necesitas una lista de diagnóstico para un ejemplo, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}) antes de editar.

## Antes de editar

Abre **Misiones**, elige la misión y revisa sus tarjetas de configuración. Cada misión muestra solo las partes que se pueden personalizar para ese caso.

Pregúntate según el tipo de misión:

- Para una misión activa de venta: ¿qué señal, audiencia o momento permite que Hellotext actúe?
- Para una misión reactiva de atención: ¿qué tipo de consulta debería responder y cuándo debería derivar?
- Para un [agente personalizado]({% link _journeys/custom-agent-playbook.md %}): ¿qué intenciones deberían activar este agente y qué debería quedar fuera?
- Para una ruta: ¿qué disparador, pasos, esperas, condiciones, ramas y asignaciones forman el flujo?
- Para cualquier misión: ¿qué reporte, conversación del Inbox o prueba en Playground va a mostrar si el cambio funcionó?

No todas las misiones tienen una regla visible de detención. En una ruta, sí puede haber condiciones de salida o pasos que terminan el flujo. En un agente de atención, la conversación puede terminar naturalmente si el cliente deja de responder o puede derivarse según reglas. En misiones activas de venta, muchas reglas de elegibilidad, frecuencia o finalización son internas o están controladas por la lógica de la misión.

## Cuándo conviene deshabilitar

No necesitas deshabilitar una misión por cada edición.

Normalmente puedes editar y probar sin deshabilitar cuando cambias:

- Tono.
- Documentos de conocimiento.
- Sitios de búsqueda web.
- Equipo de derivación.
- Ejemplos o aclaraciones pequeñas.

Considera deshabilitar temporalmente solo cuando el cambio pueda afectar a clientes en vivo mientras editas, por ejemplo:

- Estás cambiando el prompt de una misión que lo permite y el agente podría responder de forma incorrecta.
- Estás cambiando intenciones de un agente personalizado.
- Estás cambiando qué propiedades debe recopilar una misión.
- Estás modificando canales de entrada o salida.
- Estás cambiando descuentos o reglas de oferta del eCommerce.
- Estás editando una ruta con pasos, condiciones, ramas o asignaciones.

Para misiones activas de venta, el riesgo depende de qué tarjeta estás cambiando. Muchos ajustes no afectan clientes inmediatamente, pero un cambio de prompt, estrategia de descuento, canal o lógica de ruta sí merece prueba antes de volver a ampliar.

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

Si una tarjeta no aparece en la misión, no fuerces ese concepto en la configuración. Significa que esa parte no aplica o está manejada por la lógica de la misión.

## Personaliza el prompt

Esta sección aplica solo a misiones que muestran la tarjeta **Prompt del agente**.

El prompt debería decirle al agente qué trabajo tiene, cómo debe hablar, qué información puede usar y cuándo debe derivar. No todas las misiones tienen un prompt editable; muchas misiones preconstruidas ya traen lógica interna.

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

Antes de subir o reemplazar documentos:

- Elimina políticas desactualizadas, precios viejos, ofertas vencidas y FAQs duplicadas.
- Usa nombres de archivo claros para que tu equipo sepa qué controla cada documento.
- Mantén información de producto, pedido, devolución, envío y garantía consistente con tu tienda.
- Evita documentos que contradicen el prompt.
- Define qué debe pasar cuando el agente no encuentra una respuesta.

Después de actualizar conocimiento, usa el Playground para hacer preguntas que dependan de la información cambiada.

## Personaliza propiedades

Esta sección aplica a las misiones que muestran la tarjeta **Propiedades** o un subcomponente **Recolector de Propiedades**.

Selecciona solamente los datos del perfil que esa misión realmente necesita. Cuando llega el momento de recopilarlos, la misión omite las propiedades que el cliente ya tiene y pregunta únicamente por las seleccionadas que todavía faltan.

Al configurar las propiedades:

- Usa propiedades con nombres claros para el cliente, no términos internos de tu CRM.
- Mantén corta la lista para no convertir la conversación en un formulario largo.
- Si aparece la opción **Debe recopilar**, márcala solo cuando la misión no pueda continuar sin ese dato. Las demás propiedades pueden quedar como opcionales.
- Prueba un perfil sin ninguna de las propiedades, otro que ya tenga algunas y un cliente que no quiera compartir una propiedad opcional.

Por detrás, la misión usa el componente [Recolector de Propiedades]({% link _captures/property-collector-playbook.md %}) para pedir, validar y guardar las respuestas. No necesitas habilitar la misión independiente Recolector de Propiedades: la misión que estás configurando usa su propio subcomponente. Habilita el Recolector de Propiedades independiente solo si también quieres usarlo directamente como una experiencia de captura.

## Personaliza canales

En general, deja la selección automática de canales si la misión ya funciona bien. Muchas misiones manejan canales automáticamente según el tipo de conversación, disponibilidad del cliente y configuración del negocio.

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

## Personaliza derivación

Esta sección aplica a agentes de IA, misiones de atención, [Webchat]({% link _captures/webchat-widget-playbook.md %}) y misiones personalizadas que muestran configuración de **Derivación**.

No todas las misiones necesitan que definas reglas manuales. Algunas misiones de atención derivan automáticamente cuando no pueden responder, cuando una regla lo indica o cuando la consulta necesita una persona. Algunas misiones también pueden derivar si detectan enojo, producto defectuoso o una solicitud que no puede resolver la misión activa.

Revisa:

- Si la conversación debería ir a una persona o a un equipo.
- Qué casos siempre deberían derivarse.
- Qué contexto debería dejar el agente para el equipo.
- Si el equipo del Inbox sabe que esta misión está activa.

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

Si una ruta no tiene más pasos que ejecutar, el flujo termina. Si agregas condiciones o ramas, prueba tanto el camino esperado como el camino que no debería ejecutarse.

## Prueba según el tipo de misión

Usa el Playground o vista previa cuando esté disponible.

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

Si los resultados se mueven en la dirección equivocada, revierte primero el cambio más pequeño.

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
