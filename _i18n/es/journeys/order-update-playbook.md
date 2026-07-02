Usa esta guía cuando los clientes preguntan seguido dónde está una orden, si ya fue enviada o cómo rastrear un paquete.

Seguimiento de Pedidos es un playbook reactivo de soporte con IA. Responde cuando un cliente pregunta por el estado de una orden, envío, entrega o número de tracking. Usa datos de orden y envío conectados a Hellotext y decide si responder, pedir datos faltantes, enviar un CTA de tracking o derivar.

No es un agente de soporte general y no es un recomendador de productos. Su trabajo es seguimiento de pedidos. Para descubrimiento de producto, usa [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}). Para soporte más amplio o preguntas de políticas, usa el playbook de soporte correcto, un [agente personalizado]({% link _journeys/custom-agent-playbook.md %}) o el Inbox.

## Qué hace Seguimiento de Pedidos

Seguimiento de Pedidos ayuda a clientes a entender qué está pasando con una orden existente.

Puede:

- Reconocer preguntas de estado de pedido como "¿Dónde está mi pedido?", "¿Ya salió?", "¿Puedes rastrearlo?" o "¿Cuál es el estado de la orden 123?"
- Buscar envíos activos, órdenes en preparación u órdenes enviadas recientemente del cliente cuando no da un ID de orden.
- Consultar una orden o envío cuando el cliente da un ID de orden o número de tracking.
- Usar datos del operador logístico conectado, cuando está disponible, para obtener más detalle sobre el estado de entrega.
- Explicar etapas básicas de orden, envío, preparación y entrega usando datos disponibles.
- Enviar un mensaje corto de estado de pedido con botón de tracking cuando el canal lo soporta y hay una URL de tracking disponible.
- Pedir el ID de orden o número de tracking cuando Hellotext no puede identificar la orden correcta.
- Derivar cuando el pedido requiere una persona o está fuera de seguimiento de pedidos.

El playbook debería mantenerse basado en datos de orden. No debería inventar estados, URLs de tracking ni fechas de entrega.

## Cuándo usarlo

Usa Seguimiento de Pedidos cuando las preguntas de estado de pedido generan trabajo repetitivo de soporte.

Encaja bien cuando:

- Los clientes preguntan seguido dónde está su pedido.
- Tu tienda o fuente de órdenes envía información de orden, envío y tracking a Hellotext.
- Los clientes pueden vincularse con sus órdenes mediante su perfil de cliente, ID de orden o número de tracking.
- Tu equipo quiere que la IA responda preguntas simples de estado antes de derivar.
- Quieres un camino claro de soporte para preguntas que necesitan una persona.

No lo uses para modificar, cancelar, crear o aprobar órdenes. No lo uses para cambiar direcciones de envío, cambiar instrucciones de entrega, exponer datos de facturación o pago, ni prometer fechas de entrega que no estén en los datos conectados de orden o envío.

## Qué necesita antes del lanzamiento

Antes de habilitar Seguimiento de Pedidos, confirma la configuración de la que depende.

Revisa que:

- Tu tienda, fuente de órdenes o integración de eCommerce esté conectada.
- Referencias de orden, estados de orden, estados de envío, números de tracking y URLs de tracking estén disponibles cuando tu equipo espera que el playbook las use.
- La actividad reciente de órdenes y envíos aparezca en los perfiles de cliente correctos.
- Un operador logístico o integración de transportista esté conectado si quieres que Hellotext consulte información más detallada sobre el estado de entrega además de los datos de orden ya guardados en Hellotext.
- Los canales donde los clientes preguntan por pedidos estén conectados y listos.
- El canal de salida pueda enviar el formato de respuesta de estado de pedido que quieres usar.
- Los clientes tengan consentimiento y sean elegibles para los canales que quieres usar.
- Una persona o equipo esté listo para tomar la conversación cuando el playbook no pueda resolver la consulta.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Seguimiento de Pedidos**.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Canales de entrada:** dónde el playbook puede recibir preguntas de estado de pedido.
- **Canales de salida:** dónde el playbook puede enviar respuestas de estado o CTAs de tracking.
- **Derivación o asignación:** quién debería tomar la conversación cuando hace falta una persona.
- **Tono:** la voz usada en las respuestas.

Seguimiento de Pedidos usa una intención interna de estado de pedido. Normalmente no necesitas crear intenciones manuales para él. Tampoco funciona como un agente personalizado con prompt editable; el trabajo principal de configuración es confirmar que los datos de orden, canales y camino de derivación estén correctos.

## Qué debería derivar

Seguimiento de Pedidos debería derivar o enviar a otro lugar cuando el cliente pide algo más allá del tracking de órdenes.

Casos comunes de derivación incluyen:

- Cancelar una orden.
- Cambiar artículos de una orden.
- Crear una nueva orden.
- Cambiar dirección de envío o instrucciones de entrega.
- Acceder a detalles de facturación o pago.
- Aprobar un reembolso, devolución, cambio o reemplazo.
- Manejar reclamos, productos dañados, productos faltantes o excepciones de courier que requieren una persona.
- Responder preguntas de descubrimiento de producto que pertenecen a un playbook de venta.

Para comportamiento de derivación humana, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Por qué puede no responder

Que Seguimiento de Pedidos esté habilitado no significa que cada mensaje de soporte recibirá una respuesta de estado de pedido.

El playbook puede no responder, pedir más información o derivar cuando:

- El mensaje no es sobre seguimiento de pedidos.
- Otro playbook activo es mejor dueño de la conversación.
- Hellotext no puede asociar al cliente con una orden activa, en preparación o enviada recientemente.
- El cliente da un ID de orden o número de tracking que no se encuentra.
- La orden existe pero todavía no hay datos de envío o tracking disponibles.
- No hay operador logístico conectado, o la consulta de tracking expira o no puede resolver la información del transportista.
- El canal no puede enviar el botón o CTA de tracking esperado.
- El cliente pide un cambio, cancelación, detalle de pago, reembolso, devolución, cambio o resolución de reclamo.
- Una persona necesita decidir, aprobar o investigar el caso.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo probarlo

Prueba con preguntas de soporte realistas antes de habilitar el playbook ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, luego prueba:

- "¿Dónde está mi pedido?" desde un cliente con envío activo.
- "¿Dónde está mi pedido?" desde un cliente con orden reciente pero todavía sin envío.
- Un mensaje con ID de orden válido.
- Un mensaje con número de tracking válido.
- Un mensaje con número de tracking válido que debería usar el operador logístico conectado.
- Un mensaje con ID de orden o tracking desconocido.
- Una orden enviada con URL de tracking que debería producir un CTA de tracking.
- Una orden enviada sin URL de tracking.
- Un pedido de cancelar una orden o cambiar una dirección.
- Un mensaje de facturación, pago, devolución, cambio, producto dañado o reclamo que debería derivarse.
- Una pregunta de recomendación de producto que debería ir a otro playbook.

Revisa si el playbook usa datos disponibles, evita adivinar, pide el identificador faltante correcto, envía la acción de tracking esperada y deriva a la persona o equipo correcto.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el playbook.
- Si el playbook encontró la orden o envío correcto.
- Si el cliente tuvo que dar ID de orden o número de tracking.
- Si los CTAs de tracking abrieron la URL correcta.
- Casos donde el playbook no pudo encontrar datos de orden.
- Casos donde derivó y si esa derivación llegó al owner correcto.
- Preguntas repetidas que sugieren datos de orden faltantes, comunicación de envío poco clara o demoras del transportista.
- Tasa de resolución, tasa de derivación, velocidad de respuesta, respuestas de clientes y mensajes fallidos.

Ajusta una cosa por vez: calidad de datos de orden, selección de canal, destino de derivación, tono o la integración de órdenes/envíos que lo alimenta.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
