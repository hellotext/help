Usa esta guía cuando tu equipo responde las mismas preguntas de soporte una y otra vez.

Respuestas Instantáneas es un playbook reactivo de atención con IA. Responde cuando un cliente hace una pregunta frecuente de soporte y usa conocimiento aprobado, políticas y contexto conectado para responder o derivar cuando una persona debe tomar la conversación.

No es una ruta, una campaña, un recomendador de productos ni un agente personalizado con intenciones propias. Es el playbook de atención para preguntas repetidas que deberían responderse rápido y de forma consistente.

## Qué hace Respuestas Instantáneas

Respuestas Instantáneas ayuda a que clientes reciban soporte inmediato para preguntas comunes.

Puede:

- Responder cuando un cliente hace una pregunta de soporte en un canal de entrada habilitado.
- Usar documentos cargados, sitios aprobados, FAQs, políticas u otras fuentes de conocimiento cuando estén disponibles.
- Responder preguntas sobre políticas de envío, métodos de pago, información de tienda, cuidado de producto, garantías básicas, guías de talle y otros temas repetidos de soporte.
- Hacer una pregunta de aclaración cuando a la solicitud le faltan datos importantes.
- Derivar cuando la respuesta no está disponible, el cliente está molesto o la solicitud necesita criterio humano.
- Trabajar junto con Webchat, asignación en Inbox, reglas de respuesta y otros playbooks de atención.

Respuestas Instantáneas funciona mejor cuando la respuesta ya está escrita en algún lugar confiable para tu equipo.

## Cuándo usarlo

Usa Respuestas Instantáneas cuando:

- Tu equipo responde las mismas preguntas frecuentes muchas veces.
- Los clientes preguntan antes o después de comprar y la respuesta no requiere una decisión personalizada.
- Tienes políticas, páginas de ayuda, PDFs, notas de producto o guías internas de soporte actualizadas que el agente puede usar.
- Quieres primeras respuestas más rápidas fuera del horario comercial o durante momentos de mucha carga.
- Quieres que el agente responda preguntas simples y derive excepciones a la persona o equipo correcto.

Buenos temas incluyen política de envío, explicación de ventanas de devolución, métodos de pago, horarios de tienda, instrucciones de cuidado de producto, garantías básicas, explicación de guías de talle y dónde encontrar información de cuenta u orden.

## Cuándo no usarlo

No uses Respuestas Instantáneas como dueño de todas las conversaciones.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando la pregunta es sobre una orden específica, envío, número de tracking, estado de entrega o "¿dónde está mi pedido?".

Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente quiere descubrimiento de producto, comparación o recomendaciones.

Usa [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) cuando tu cuenta tenga ese playbook disponible y el cliente necesita un flujo de cambios o devoluciones, no solo una explicación de política.

Usa un [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) cuando necesitas intenciones propias, un agente especialista acotado, acciones externas o una misión de soporte demasiado específica para el playbook preconstruido.

Usa una [ruta]({% link _journeys/getting-started-with-journeys.md %}) cuando la experiencia debe seguir pasos visibles, esperas, preguntas, ramas y asignaciones.

## Qué necesita antes de lanzarlo

Antes de habilitar Respuestas Instantáneas, confirma:

- Los temas de soporte que debería responder están claros.
- Las políticas, FAQs, documentos o sitios aprobados que debería usar están actualizados.
- El contenido contradictorio o desactualizado fue removido.
- Los canales de entrada donde los clientes hacen estas preguntas están conectados y listos.
- Hay una persona o equipo configurado para derivaciones.
- Tu equipo sabe qué preguntas debería responder el playbook y cuáles debería dejar a una persona.
- Las reglas de respuesta y el horario comercial coinciden con el nivel de servicio que quieres para conversaciones de soporte.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Respuestas Instantáneas**.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Conocimiento o documentos cargados:** FAQs, políticas, notas de producto, guías u otro contenido de soporte aprobado.
- **Canales de entrada:** dónde puede responder preguntas de clientes.
- **Tono:** la voz usada en las respuestas.
- **Derivación o asignación:** quién debería tomar la conversación cuando el playbook no puede resolverla.
- **Búsqueda web o sitios aprobados, cuando esté disponible:** páginas públicas que el agente puede usar para la misión de soporte.

Mantén la configuración enfocada. Si el playbook necesita demasiadas excepciones, divide el trabajo: usa un playbook de atención especializado, un agente personalizado o un proceso de Inbox para los casos de mayor riesgo.

## Prepara el conocimiento

La calidad del conocimiento es el factor más importante para la calidad de las respuestas.

Usa fuentes que tu equipo ya confía:

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

Si la fuente cambia, actualiza el conocimiento antes de esperar que el playbook responda correctamente.

## Define límites de derivación

Respuestas Instantáneas debería derivar cuando el cliente necesita una persona, no una respuesta general.

Casos comunes de derivación:

- El cliente pide hablar con una persona.
- El cliente está enojado, frustrado o insatisfecho.
- El cliente reporta un producto defectuoso, dañado, incorrecto o faltante.
- La solicitud necesita aprobación, excepción, reembolso, cancelación, cambio, modificación de cuenta, detalle de pago o acción humana de venta.
- La respuesta no está en el conocimiento aprobado.
- El cliente pregunta por una orden específica y [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) debería manejarlo.
- Ningún playbook activo puede resolver la solicitud de forma segura.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Conéctalo con Webchat e Inbox

Respuestas Instantáneas puede funcionar muy bien con [Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %}).

Webchat le da a visitantes un lugar para preguntar desde el sitio. Respuestas Instantáneas puede responder preguntas soportadas después de que empieza la conversación. El Inbox le da a tu equipo un lugar para manejar excepciones, derivaciones y respuestas de seguimiento.

Antes de lanzar, confirma:

- Webchat o el canal de entrada está habilitado.
- El mensaje inicial no promete soporte que el playbook no puede dar.
- El responsable de derivación es la persona o equipo correcto.
- Las reglas de respuesta reflejan qué tan rápido debería responder una persona después de una derivación.

## Cómo probarlo

Prueba con mensajes realistas de soporte antes de habilitar el playbook ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, y prueba:

- Una pregunta frecuente con respuesta clara en el conocimiento aprobado.
- La misma pregunta con errores, texto corto o lenguaje casual.
- Una pregunta que necesita una aclaración.
- Una pregunta no cubierta por los documentos cargados o páginas aprobadas.
- Una pregunta donde dos documentos podrían contradecirse.
- Una pregunta específica de estado de pedido que debería ir a Seguimiento de Pedidos o derivar.
- Una pregunta de recomendación de producto que debería ir a Recomendador Inteligente o derivar.
- Un mensaje de devolución, cambio, reembolso, cancelación, producto dañado o reclamo que debería derivar o ir a otro flujo.
- Un mensaje desde cada canal de entrada que piensas usar.

Revisa si la respuesta está basada en conocimiento, es breve, correcta para el canal y clara sobre los siguientes pasos.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el playbook.
- Qué preguntas se respondieron correctamente.
- Qué preguntas deberían haber ido a otro playbook.
- Si las respuestas siguieron la fuente correcta.
- Si clientes hicieron preguntas de seguimiento porque la respuesta no fue clara.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Preguntas repetidas sin respuesta que sugieren conocimiento faltante.
- Velocidad de respuesta, tasa de resolución, tasa de derivación, respuestas de clientes, mensajes fallidos y bajas cuando aplique.

Ajusta una cosa por vez: conocimiento, selección de canales, tono, destino de derivación o los temas de soporte que esperas que el playbook cubra.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Playbook Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %})
- [Playbook Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Playbook Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
