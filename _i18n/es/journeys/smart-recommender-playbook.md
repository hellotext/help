Usa esta guía cuando quieres que Hellotext ayude a clientes a descubrir, comparar y elegir productos en una conversación.

Recomendador Inteligente es una misión reactiva de venta con IA. Responde cuando un cliente pregunta por productos, colecciones, precios, talles, disponibilidad, comparaciones o recomendaciones. Usa contexto de catálogo y producto, tus instrucciones, conocimiento cargado y la conversación actual para decidir qué recomendar o cuándo derivar.

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

## Cuándo usarla

Usa Recomendador Inteligente cuando el descubrimiento de producto ocurre en conversación.

Encaja bien cuando:

- Los clientes preguntan qué comprar, qué producto encaja con su necesidad o qué alternativas existen.
- Tu catálogo tiene suficientes nombres, descripciones, imágenes, precios, variantes o stock para sostener recomendaciones útiles.
- Los clientes comparan productos, talles, materiales, colores, usos o estilos.
- Tu equipo quiere que la IA responda preguntas comunes de compra antes de derivar.
- Quieres que las recomendaciones sucedan desde canales como WhatsApp, Webchat, Instagram DM o SMS cuando estén soportados.

No uses Recomendador Inteligente como única fuente para estado de orden, incidentes de entrega, reclamos, reembolsos, cancelaciones o decisiones finales de cambios y devoluciones. Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) para estado de orden, [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) para ayuda guiada de cambios o devoluciones, [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) para solicitudes de cancelación, y el Inbox cuando una persona necesita decidir.

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

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Recomendador Inteligente**.

Recomendador Inteligente incluye:

- **Documentos cargados:** notas de producto, FAQs, políticas, guías de talles, instrucciones de pago u otro contexto aprobado.
- **Prompt del agente:** qué debería hacer el recomendador, cómo debería hablar, qué puede recomendar y cuándo debería derivar.
- **Canales de entrada:** dónde la misión puede responder preguntas de producto.
- **Tono:** la voz usada en las respuestas.
- **Derivación o asignación:** quién debería tomar la conversación cuando hace falta una persona.
- **Búsqueda web:** sitios aprobados que el agente puede usar para la misión de recomendación.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar la misión. Algunos formatos de recomendación funcionan mejor en canales enriquecidos, mientras que otros pueden necesitar links o texto más simple.

Esta misión tiene una intención interna de recomendación de productos. Normalmente no necesitas crear intenciones manuales para ella. Si necesitas varios agentes con distintos objetivos de producto o reglas de activación, usa un [agente personalizado]({% link _journeys/custom-agent-playbook.md %}) y define esas intenciones aparte.

## Escribe un prompt útil

El prompt debería darle límites claros al recomendador.

Incluye:

- Qué tipo de cliente está ayudando el agente.
- Qué productos, colecciones, categorías o casos de uso importan más.
- Cuántos productos debería recomendar por vez.
- Si debería priorizar ajuste, precio, stock, margen, novedades, más vendidos o preferencia del cliente.
- Qué afirmaciones requieren respaldo del catálogo o documentos.
- Cuándo debería hacer una pregunta aclaratoria.
- Cuándo debería derivar en lugar de adivinar.

Evita instrucciones como "recomienda cualquier cosa" o "siempre cierra la venta". Hacen más difícil probar la misión y pueden empujar al agente fuera de la necesidad real del cliente.

Para estructurar el prompt, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Por qué puede no responder o recomendar

Que la misión Recomendador Inteligente esté habilitada no significa que cada mensaje recibirá una recomendación de producto.

La misión puede no responder, pedir una aclaración o derivar cuando:

- El mensaje del cliente no es sobre descubrimiento de producto o una nueva decisión de compra.
- Otra misión activa puede encargarse mejor de la conversación.
- El cliente pregunta por una orden existente, entrega, reclamo, reembolso, cambio o devolución.
- El catálogo no tiene una buena coincidencia para el pedido.
- Faltan datos de producto o están desactualizados, o no están disponibles en el canal elegido.
- El canal no puede mostrar la tarjeta de producto, link o formato de media deseado.
- El conocimiento cargado o las fuentes aprobadas no respaldan la respuesta.
- El cliente necesita que una persona decida, apruebe o resuelva algo.

Para el modelo general de decisión, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo probarla

Prueba con preguntas de producto realistas antes de habilitar la misión ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, luego prueba:

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
