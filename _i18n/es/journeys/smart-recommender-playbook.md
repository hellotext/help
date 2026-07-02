Usa esta guía cuando quieres que Hellotext ayude a clientes a descubrir, comparar y elegir productos en una conversación.

Recomendador Inteligente es un playbook reactivo de venta con IA. Responde cuando un cliente pregunta por productos, colecciones, precios, talles, disponibilidad, comparaciones o recomendaciones. Usa contexto de catálogo y producto, tus instrucciones, conocimiento cargado y la conversación actual para decidir qué recomendar o cuándo derivar.

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

El playbook debería mantenerse basado en la información disponible para Hellotext. Si faltan datos de producto, precio, talle, stock, políticas o catálogo, o están desactualizados, la experiencia de recomendación será más débil.

## Cuándo usarlo

Usa Recomendador Inteligente cuando el descubrimiento de producto ocurre en conversación.

Encaja bien cuando:

- Los clientes preguntan qué comprar, qué producto encaja con su necesidad o qué alternativas existen.
- Tu catálogo tiene suficientes nombres, descripciones, imágenes, precios, variantes o stock para sostener recomendaciones útiles.
- Los clientes comparan productos, talles, materiales, colores, usos o estilos.
- Tu equipo quiere que la IA responda preguntas comunes de compra antes de derivar.
- Quieres que las recomendaciones sucedan desde canales como WhatsApp, Webchat, Instagram DM o SMS cuando estén soportados.

No uses Recomendador Inteligente como única fuente para estado de orden, incidentes de entrega, reclamos, reembolsos o decisiones finales de cambios y devoluciones. Esos casos deberían ir al playbook de atención correcto o al Inbox.

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

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Recomendador Inteligente**.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Documentos cargados:** notas de producto, FAQs, políticas, guías de talles, instrucciones de pago u otro contexto aprobado.
- **Prompt del agente:** qué debería hacer el recomendador, cómo debería hablar, qué puede recomendar y cuándo debería derivar.
- **Canales de entrada:** dónde el playbook puede responder preguntas de producto.
- **Tono:** la voz usada en las respuestas.
- **Derivación o asignación:** quién debería tomar la conversación cuando hace falta una persona.
- **Búsqueda web:** sitios aprobados que el agente puede usar cuando esa opción está disponible.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Algunos formatos de recomendación funcionan mejor en canales enriquecidos, mientras que otros pueden necesitar links o texto más simple.

Este playbook tiene una intención interna de recomendación de productos. Normalmente no necesitas crear intenciones manuales para él. Si necesitas varios agentes con distintas misiones de producto o reglas de activación, usa un agente personalizado y define esas intenciones aparte.

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

Evita instrucciones como "recomienda cualquier cosa" o "siempre cierra la venta". Hacen más difícil probar el playbook y pueden empujar al agente fuera de la necesidad real del cliente.

Para estructurar el prompt, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Por qué puede no responder o recomendar

Que Recomendador Inteligente esté habilitado no significa que cada mensaje recibirá una recomendación de producto.

El playbook puede no responder, pedir una aclaración o derivar cuando:

- El mensaje del cliente no es sobre descubrimiento de producto o una nueva decisión de compra.
- Otro playbook activo es mejor dueño de la conversación.
- El cliente pregunta por una orden existente, entrega, reclamo, reembolso, cambio o devolución.
- El catálogo no tiene una buena coincidencia para el pedido.
- Faltan datos de producto o están desactualizados, o no están disponibles en el canal elegido.
- El canal no puede mostrar la tarjeta de producto, link o formato de media deseado.
- El conocimiento cargado o las fuentes aprobadas no respaldan la respuesta.
- El cliente necesita que una persona decida, apruebe o resuelva algo.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo probarlo

Prueba con preguntas de producto realistas antes de habilitar el playbook ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, luego prueba:

- Un pedido amplio: "Necesito un regalo" o "¿Qué me recomiendas?"
- Un pedido específico: nombre de producto, categoría, color, talle, presupuesto o caso de uso.
- Una comparación: "¿Cuál es mejor para correr?" o "¿Cuál es la diferencia entre estos?"
- Una pregunta de stock o talle.
- Un pedido con imagen si tu cuenta soporta búsqueda de producto por imagen.
- Un pedido que debería producir tarjetas o links de producto.
- Un pedido que debería hacer una pregunta aclaratoria.
- Un mensaje sobre estado de orden, entrega, reclamo, cambio o devolución que debería derivarse o ir a otro playbook.
- Un pedido donde ningún producto del catálogo sea una buena coincidencia.

Revisa si el agente recomienda los productos correctos, explica por qué, se mantiene respaldado por información disponible, evita afirmaciones no soportadas y envía la conversación a la persona o equipo correcto cuando hace falta.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el playbook.
- Qué productos se recomendaron.
- Si las recomendaciones coincidieron con la necesidad expresada por el cliente.
- Si tarjetas, links, imágenes y precios fueron correctos.
- Si el agente hizo preguntas aclaratorias útiles.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Clicks, interacción con productos, conversión, ingresos, bajas y mensajes fallidos.
- Casos donde el agente respondió preguntas de soporte que deberían haber ido a otro lugar.

Ajusta una cosa por vez: prompt, documentos de conocimiento, selección de canal, destino de derivación o calidad de datos del catálogo.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
