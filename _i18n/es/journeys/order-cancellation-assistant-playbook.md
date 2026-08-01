Usa esta guía cuando clientes piden cancelar un pedido después de comprar, especialmente antes de que el pedido haya sido enviado o preparado.

Asistente de Cancelación de Pedidos es un playbook reactivo de soporte post-compra. Ayuda a clientes a entender si una cancelación podría ser posible, recopila el contexto que tu equipo necesita, ofrece alternativas útiles cuando corresponde y deriva cuando una persona debe decidir o tomar acción.

No es un agente general de FAQs y no debería prometer que un pedido ya fue cancelado salvo que la acción realmente se complete mediante tu proceso de negocio. Funciona mejor cuando tu política de cancelación, datos de pedido, reglas de derivación y opciones para salvar la venta están claras.

## Qué hace Asistente de Cancelación de Pedidos

Asistente de Cancelación de Pedidos ayuda a que clientes avancen en una solicitud de cancelación de pedido.

Puede:

- Responder cuando un cliente pide cancelar, deshacer o detener un pedido.
- Usar contexto de pedido cuando está disponible para ayudar a identificar la compra.
- Pedir datos faltantes como número de pedido, información del cliente, artículo, motivo o urgencia.
- Explicar si la cancelación todavía podría ser posible según la política aprobada y el estado del pedido.
- Ofrecer alternativas cuando corresponde, como ajustar la solicitud, elegir un reemplazo, recibir ayuda con estado de pedido o hablar con una persona.
- Derivar cuando la cancelación necesita aprobación, una acción operativa, revisión de pago o manejo de excepción.
- Trabajar junto con [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}), [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}), Webchat, asignación en Inbox y reglas de respuesta.

El playbook debería mantenerse basado en datos de pedido y políticas. Si el estado del pedido no está claro, el cliente pide una decisión o la cancelación requiere una acción fuera del playbook, debería derivar en lugar de adivinar.

## Cuándo usarlo

Usa Asistente de Cancelación de Pedidos cuando:

- Los clientes piden seguido cancelar pedidos después de comprar.
- Tu equipo quiere que la IA maneje el primer paso de soporte antes de que una persona revise excepciones.
- Tu política de cancelación tiene reglas repetibles, como hora límite, estado de preparación, estado de envío, método de pago o límites por venta final.
- Quieres entender por qué los clientes cancelan y salvar la venta cuando existe una alternativa útil.
- Quieres que las solicitudes de cancelación lleguen al Inbox con el responsable correcto cuando hace falta una persona.

Es útil para solicitudes de cancelación antes del envío, recopilar motivos de cancelación, explicar políticas y encaminar casos al siguiente paso correcto.

## Cuándo no usarlo

No uses Asistente de Cancelación de Pedidos como dueño de todos los pedidos post-compra.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando el cliente pregunta principalmente dónde está un pedido, si ya se envió o cómo rastrear un paquete.

Usa [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) cuando el cliente quiere cambiar o devolver un pedido que ya fue entregado o que ya no puede cancelarse.

Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) cuando el cliente solo necesita una explicación general de la política de cancelación.

Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente todavía quiere ayuda para elegir otro producto antes de comprar.

Usa el Inbox directamente cuando el caso involucra sospecha de fraude, disputas de pago, lenguaje legal, excepciones de alto valor o un cliente muy molesto.

## Qué necesita antes de lanzarlo

Antes de habilitar Asistente de Cancelación de Pedidos, confirma:

- Tu política de cancelación está actualizada y aprobada.
- La política explica cuándo es posible cancelar, cuándo ya es tarde y qué pasa después de recibir una solicitud de cancelación.
- Los datos de pedido están disponibles cuando el playbook debería identificar compras.
- Tu equipo sabe qué casos de cancelación puede manejar el playbook y qué casos requieren una persona.
- Las opciones para salvar la venta están aprobadas, como ajustar la solicitud, ofrecer un reemplazo o derivar a una persona de ventas.
- Los canales de entrada donde clientes piden cancelar están conectados y listos.
- Hay una persona o equipo configurado para derivaciones.
- Las reglas de respuesta y el horario comercial coinciden con la urgencia de las solicitudes de cancelación.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz clic en **Explorar playbooks** y elige **Asistente de Cancelación de Pedidos**.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Conocimiento o documentos cargados:** política de cancelación, reglas de corte de preparación, reglas de envío, guía de pagos, expectativas de reembolso e instrucciones internas de soporte.
- **Canales de entrada:** dónde clientes pueden pedir ayuda con cancelaciones.
- **Tono:** la voz usada en las respuestas.
- **Derivación o asignación:** quién debería tomar la conversación cuando hace falta una persona.
- **Prompt o instrucciones, cuando esté disponible:** qué puede explicar el playbook, qué alternativas puede ofrecer, qué no debe prometer y cuándo debe derivar.
- **Búsqueda web o sitios aprobados, cuando esté disponible:** páginas públicas de políticas que el agente puede usar para esta misión.

Mantén la primera configuración acotada. Es más fácil ampliar un flujo claro de cancelación que diagnosticar un playbook que intenta resolver todos los problemas post-compra.

## Prepara el conocimiento de cancelación

El playbook necesita contenido de política suficientemente específico para guiar al cliente.

Incluye:

- Cuándo puede cancelarse un pedido.
- Qué estados de pedido son demasiado tarde para cancelar.
- Qué pasa cuando el pedido ya está empacado, preparado, enviado, retirado, entregado o entregado al transportista.
- Si aplican autorización de pago, captura, reembolso, crédito en tienda o cargos de cancelación.
- Si ciertos productos son venta final, personalizados, perecederos, digitales o no cancelables.
- Qué información necesita el equipo antes de revisar la solicitud.
- Qué casos deberían pasar a cambios, devoluciones, seguimiento de pedidos o Inbox.
- Qué debería esperar el cliente después de que se recibe la solicitud.

Evita contenido vago como "contáctanos para cancelar" si quieres que el playbook responda de forma consistente. Si la política cambia, actualiza la fuente antes de esperar que el playbook use la nueva regla.

## Define límites para salvar la venta

Algunas solicitudes de cancelación pueden salvarse sin presionar al cliente.

Ofrece solo alternativas aprobadas por tu equipo, como:

- Ayudar al cliente a elegir otro talle, color o artículo.
- Enviar al cliente a [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando quiere otro producto.
- Explicar el estado de envío si el cliente quiere cancelar porque no sabe dónde está su pedido.
- Ofrecer conectar al cliente con una persona cuando el motivo no está claro o es sensible.

No uses el playbook para presionar a un cliente a mantener un pedido. Si el cliente claramente quiere cancelar y la cancelación requiere una persona o acción operativa, deriva.

## Define qué necesita una persona

Las solicitudes de cancelación suelen requerir criterio humano o una acción operativa.

Configura derivación o asignación a equipo para casos como:

- El cliente pide cancelación inmediata.
- El pedido ya está preparado, enviado, entregado o en un estado que el playbook no puede cambiar.
- La solicitud necesita revisión de pago, aprobación de reembolso, revisión de fraude o verificación de cuenta.
- El cliente pide cambiar dirección, artículos, método de pago o instrucciones de entrega.
- El pedido no se encuentra.
- El cliente pide una excepción.
- El cliente está enojado, frustrado o insatisfecho.
- La solicitud requiere una acción en tu sistema de comercio, preparación, pagos o envíos.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Conéctalo con Webchat e Inbox

Asistente de Cancelación de Pedidos puede funcionar bien con [Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %}) cuando los clientes necesitan ayuda post-compra rápida desde tu sitio.

Antes de lanzar, confirma:

- Webchat o el canal de entrada está habilitado.
- El mensaje inicial no promete cancelación instantánea.
- El responsable de derivación es la persona o equipo correcto.
- Las reglas de respuesta reflejan qué tan rápido debería responder una persona después de una derivación.
- El equipo del Inbox sabe qué contexto debería recopilar el playbook antes de derivar.

## Cómo probarlo

Prueba con mensajes post-compra realistas antes de habilitar el playbook ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, y prueba:

- Una solicitud de cancelación para un pedido que todavía no fue enviado.
- Una solicitud de cancelación para un pedido ya empacado, enviado o entregado.
- Una solicitud sin número de pedido o sin datos del cliente.
- Una solicitud donde el pedido puede encontrarse desde el perfil del cliente.
- Un cliente que quiere cancelar porque el envío está demorado.
- Un cliente que quiere otro talle, color o producto en lugar de cancelar.
- Una pregunta de pago o reembolso.
- Una solicitud para cambiar dirección, artículo, método de pago o instrucciones de entrega.
- Un reclamo de un cliente molesto.
- Una pregunta de tracking que debería ir a Seguimiento de Pedidos.
- Una pregunta de cambio o devolución que debería ir a Asistente de Cambios y Devoluciones.

Revisa si el playbook pide los datos faltantes correctos, sigue la política, evita promesas sin respaldo, ofrece alternativas aprobadas y deriva a la persona o equipo correcto.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el playbook.
- Si el playbook siguió la fuente de política correcta.
- Si recopiló información útil antes de derivar.
- Qué motivos de cancelación aparecieron más seguido.
- Qué casos se salvaron con una alternativa aprobada.
- Qué casos requirieron aprobación, revisión de reembolso, acción de preparación o investigación.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Casos repetidos poco claros que sugieren contenido de política faltante.
- Velocidad de respuesta, tasa de resolución, tasa de derivación, tasa de cancelación, tasa de pedidos salvados, respuestas de clientes, mensajes fallidos y satisfacción cuando aplique.

Ajusta una cosa por vez: conocimiento de políticas, límites para salvar la venta, selección de canales, tono, destino de derivación o los casos de cancelación que el playbook debería manejar.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Playbook Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Playbook Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Playbook Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
