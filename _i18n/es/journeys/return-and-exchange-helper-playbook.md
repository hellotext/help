Usa esta guía cuando tu equipo dedica tiempo a explicar políticas de devolución, reglas de cambio, elegibilidad y siguientes pasos después de una compra.

Asistente de Cambios y Devoluciones es un playbook reactivo de atención. Ayuda a clientes a entender si un cambio o devolución podría ser posible, qué información hace falta, cuál es el siguiente paso y cuándo debería tomar la conversación una persona.

No es un agente general de FAQs y no debería aprobar excepciones por sí solo. Funciona mejor cuando tus políticas están claras, el contexto de orden está disponible y tu equipo definió cuándo el playbook puede seguir y cuándo debe derivar.

## Qué hace Asistente de Cambios y Devoluciones

Asistente de Cambios y Devoluciones ayuda a que clientes avancen en una solicitud de cambio o devolución.

Puede:

- Responder cuando un cliente pide devolver, cambiar, reemplazar o recibir reembolso por un producto.
- Explicar políticas de cambios y devoluciones usando conocimiento aprobado.
- Pedir datos faltantes como número de orden, artículo, motivo, talle, estado del producto o fotos cuando hagan falta.
- Usar contexto de orden cuando está disponible para ayudar a identificar la compra.
- Explicar siguientes pasos, plazos, requisitos de empaque, instrucciones de retiro o entrega, y expectativas de reembolso según tu política.
- Derivar cuando la solicitud necesita aprobación, una excepción, una decisión de reembolso o investigación humana.
- Trabajar junto con [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}), [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}), Webchat, asignación en Inbox y reglas de respuesta.

El playbook debería mantenerse basado en la información aprobada por tu negocio. Si la política o los datos de orden no están claros, debería pedir aclaración o derivar en lugar de adivinar.

## Cuándo usarlo

Usa Asistente de Cambios y Devoluciones cuando:

- Los clientes preguntan seguido cómo cambiar o devolver productos.
- Tu política tiene reglas repetibles: ventana de tiempo, estado del producto, productos elegibles, comprobantes requeridos, método de reembolso, opciones de cambio e instrucciones de envío.
- Tu equipo quiere que la IA maneje el primer paso de soporte antes de que una persona revise excepciones.
- Los clientes necesitan un camino guiado en lugar de una respuesta general de FAQ.
- Quieres que cambios y devoluciones lleguen al Inbox con un responsable claro cuando hace falta una persona.

Es útil para explicar políticas, recopilar contexto requerido y encaminar casos elegibles al siguiente paso.

## Cuándo no usarlo

No uses Asistente de Cambios y Devoluciones como dueño de todos los casos post-compra.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando el cliente pregunta principalmente dónde está una orden, si ya se envió o cómo rastrear un paquete.

Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) cuando el cliente solo necesita una explicación general de política y no un flujo guiado de cambio o devolución.

Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente quiere ayuda para elegir otro producto antes de comprar.

Usa un [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) cuando tu proceso de cambios y devoluciones necesita intenciones propias, acciones externas, integraciones especiales o un flujo acotado que el playbook preconstruido no cubre.

Usa el Inbox directamente cuando el caso involucra sospecha de fraude, lenguaje legal, excepciones de alto valor, disputas de pago o un cliente muy molesto.

## Qué necesita antes de lanzarlo

Antes de habilitar Asistente de Cambios y Devoluciones, confirma:

- La política de cambios y devoluciones está actualizada y aprobada.
- La política explica ventanas, estado del producto, productos no retornables, comprobantes requeridos, método de reembolso, opciones de cambio y responsabilidad de envío.
- Los datos de orden están disponibles cuando el playbook debería identificar compras.
- Tu equipo sabe qué casos puede manejar el playbook y qué casos requieren una persona.
- Los canales de entrada donde clientes piden cambios o devoluciones están conectados y listos.
- Hay una persona o equipo configurado para derivaciones.
- Las reglas de respuesta y el horario comercial coinciden con la urgencia del soporte post-compra.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Asistente de Cambios y Devoluciones**.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Conocimiento o documentos cargados:** política de devolución, política de cambios, reglas de garantía, instrucciones de envío, exclusiones de producto y guías internas de soporte.
- **Canales de entrada:** dónde clientes pueden pedir ayuda con cambios o devoluciones.
- **Tono:** la voz usada en las respuestas.
- **Derivación o asignación:** quién debería tomar la conversación cuando hace falta una persona.
- **Prompt o instrucciones, cuando esté disponible:** qué puede explicar el playbook, qué no debe aprobar y cuándo debe derivar.
- **Búsqueda web o sitios aprobados, cuando esté disponible:** páginas públicas de políticas que el agente puede usar para esta misión.

Mantén la primera configuración acotada. Es más fácil ampliar un flujo claro de cambios y devoluciones que diagnosticar un agente que intenta resolver todos los problemas post-compra.

## Prepara el conocimiento de políticas

El playbook necesita contenido de políticas suficientemente específico para guiar al cliente.

Incluye:

- Ventanas de cambio y devolución.
- Categorías de productos elegibles y no retornables.
- Estado requerido del producto, empaque, etiquetas, recibo, número de orden o fotos.
- Si los cambios pueden hacerse por talle, color, producto, crédito en tienda o reembolso.
- Quién paga el envío de devolución.
- Instrucciones de retiro, entrega, envío por correo o devolución en tienda.
- Método de reembolso y plazos esperados.
- Reglas de garantía o producto defectuoso.
- Qué pasa si el producto fue venta final, con descuento, personalizado, abierto, dañado o usado.

Evita contenido vago como "contáctanos para devoluciones" si quieres que el playbook responda de forma consistente. Si la política cambia, actualiza la fuente antes de esperar que el playbook use la nueva regla.

## Define qué necesita una persona

Los cambios y devoluciones suelen requerir criterio humano.

Configura derivación o asignación a equipo para casos como:

- El cliente pide aprobación de reembolso.
- La solicitud está fuera de la ventana normal de cambio o devolución.
- El producto está dañado, defectuoso, equivocado, faltante, usado, personalizado o fue venta final.
- El cliente disputa el pago, costo de envío o monto de reembolso.
- La orden no se encuentra.
- El cliente pide una excepción.
- El cliente está enojado, frustrado o insatisfecho.
- La solicitud requiere etiqueta de envío, retiro, reemplazo, crédito en tienda o una acción operativa que el playbook no puede completar de forma segura.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Conéctalo con Webchat e Inbox

Asistente de Cambios y Devoluciones puede funcionar bien con [Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %}) cuando los clientes buscan ayuda post-compra desde tu sitio.

Antes de lanzar, confirma:

- Webchat o el canal de entrada está habilitado.
- El mensaje inicial no promete una aprobación instantánea.
- El responsable de derivación es la persona o equipo correcto.
- Las reglas de respuesta reflejan qué tan rápido debería responder una persona después de una derivación.
- El equipo del Inbox sabe qué contexto debería recopilar el playbook antes de derivar.

## Cómo probarlo

Prueba con mensajes post-compra realistas antes de habilitar el playbook ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, y prueba:

- Una solicitud simple de devolución dentro de la ventana de política.
- Una solicitud simple de cambio por talle o color.
- Una solicitud sin número de orden o sin detalle del artículo.
- Una solicitud donde la orden puede encontrarse desde el perfil del cliente.
- Una solicitud fuera de la ventana de devolución.
- Un producto de venta final, personalizado, abierto, usado o no retornable.
- Un producto dañado, defectuoso, equivocado o faltante.
- Una solicitud de aprobación de reembolso.
- Un reclamo de un cliente molesto.
- Una pregunta que es solo una FAQ general de política y podría ir a Respuestas Instantáneas.
- Una pregunta de tracking que debería ir a Seguimiento de Pedidos.

Revisa si el playbook pide los datos faltantes correctos, sigue la política, evita aprobar sin respaldo y deriva a la persona o equipo correcto.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el playbook.
- Si el playbook siguió la fuente de política correcta.
- Si recopiló información útil antes de derivar.
- Qué casos se resolvieron sin una persona.
- Qué casos requirieron aprobación, excepción o investigación.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Casos repetidos poco claros que sugieren contenido de política faltante.
- Velocidad de respuesta, tasa de resolución, tasa de derivación, respuestas de clientes, reembolsos, cambios, mensajes fallidos y satisfacción cuando aplique.

Ajusta una cosa por vez: conocimiento de políticas, selección de canales, tono, destino de derivación o los casos que el playbook debería manejar.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Playbook Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Playbook Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
