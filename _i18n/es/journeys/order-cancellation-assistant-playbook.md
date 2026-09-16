Usa esta guía cuando clientes piden cancelar un pedido después de comprar, especialmente antes de que el pedido haya sido enviado o preparado.

Asistente de Cancelación de Pedidos es una misión reactiva de soporte post-compra. Ayuda a clientes a entender si una cancelación podría ser posible, recopila el contexto que tu equipo necesita, ofrece alternativas útiles cuando corresponde y deriva cuando una persona debe decidir o tomar acción.

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

La misión debería mantenerse basada en datos de pedido y políticas. Si no puede confirmar el estado del pedido, necesita una aprobación o la solicitud requiere una acción que no puede completar, debería derivar en lugar de adivinar.

## Cuándo usarla

Usa Asistente de Cancelación de Pedidos cuando:

- Los clientes piden seguido cancelar pedidos después de comprar.
- Tu equipo quiere que la IA maneje el primer paso de soporte antes de que una persona revise excepciones.
- Tu política de cancelación tiene reglas repetibles, como hora límite, estado de preparación, estado de envío, método de pago o límites por venta final.
- Quieres entender por qué los clientes cancelan y salvar la venta cuando existe una alternativa útil.
- Quieres que las solicitudes de cancelación lleguen al Inbox con el responsable correcto cuando hace falta una persona.

Es útil para solicitudes de cancelación antes del envío, recopilar motivos de cancelación, explicar políticas y encaminar casos al siguiente paso correcto.

## Cuándo no usarla

No uses Asistente de Cancelación de Pedidos como dueño de todos los pedidos post-compra.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando el cliente pregunta principalmente dónde está un pedido, si ya se envió o cómo rastrear un paquete.

Usa [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) cuando el cliente quiere cambiar o devolver un pedido que ya fue entregado o que ya no puede cancelarse.

Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) cuando el cliente solo necesita una explicación general de la política de cancelación.

Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente todavía quiere ayuda para elegir otro producto antes de comprar.

Usa el Inbox directamente cuando el caso involucra sospecha de fraude, disputas de pago, lenguaje legal, excepciones de alto valor o un cliente muy molesto.

## Qué necesita antes de lanzarla

Antes de habilitar Asistente de Cancelación de Pedidos, confirma:

- Tu política de cancelación está actualizada y aprobada.
- La política explica cuándo es posible cancelar, cuándo ya es tarde y qué pasa después de recibir una solicitud de cancelación.
- Los datos de pedido están disponibles cuando la misión debería identificar compras.
- Tu equipo sabe qué casos de cancelación puede manejar la misión y qué casos requieren una persona.
- Las opciones para salvar la venta están aprobadas, como ajustar la solicitud, ofrecer un reemplazo o derivar a una persona de ventas.
- Los canales de entrada donde clientes piden cancelar están conectados y listos.
- Hay una persona o equipo configurado para derivaciones.
- Las reglas de respuesta y el horario comercial coinciden con la urgencia de las solicitudes de cancelación.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Misiones**, haz clic en **Explorar misiones** y elige **Asistente de Cancelación de Pedidos**.

Configura estas tarjetas en el orden en que aparecen:

| Componente | Qué configuras |
| --- | --- |
| **Política de cancelación** | Hasta qué etapa permites cancelar, si ofreces orientación sobre devoluciones y si permites cancelar parte del pedido. |
| **Estrategia de retención** | Qué alternativas puede ofrecer el asistente para ayudar al cliente a conservar su pedido y cuál es el límite de crédito en tienda. |
| **Derivación** | La persona o el equipo que interviene cuando el asistente necesita apoyo. |
| **Conocimiento** | Documentos con tu política de cancelación, reglas de preparación y envío, expectativas de reembolso e instrucciones de soporte. |
| **Canales de salida** | Los canales por los que esta misión puede enviar mensajes. |
| **Tono** | La voz de las respuestas del asistente. |
| **Prompt del agente** | Instrucciones adicionales sobre cómo responder, qué explicar y cuándo pedir apoyo. |
| **Descuentos** | La estrategia de descuentos y los límites de los incentivos permitidos. |
| **Búsqueda web** | Los sitios web donde el asistente puede consultar información. |

Mantén la primera configuración acotada. Es más fácil ampliar un flujo claro de cancelación que diagnosticar una misión que intenta resolver todos los problemas post-compra.

## Componente Política de cancelación

Esta tarjeta define las condiciones que tu negocio acepta para una cancelación. Las restricciones de la tienda y del pedido también se aplican: elegir una etapa no garantiza que todos los pedidos en esa etapa puedan cancelarse.

> **Importante:** Para habilitar **Permitir cancelaciones parciales**, conecta Shopify o VTEX; basta con una de las dos plataformas. Sin ninguna conexión, esta opción está deshabilitada y aparece en gris. Puedes configurar **Permitir cancelaciones hasta** y **Ofrecer devoluciones después del envío** de forma independiente.

| Opción | Qué significa |
| --- | --- |
| **Permitir cancelaciones hasta** | Selecciona la última etapa en la que permites cancelar. El límite incluye esa etapa y las anteriores que aparecen en la tabla de abajo. |
| **Ofrecer devoluciones después del envío** | Permite orientar al cliente hacia el proceso de devolución cuando el envío impide cancelar. Esta orientación no cancela el pedido ni inicia una devolución o un reembolso. Desactívala si prefieres que estos casos pasen a tu equipo. |
| **Permitir cancelaciones parciales** | Permite retirar los artículos seleccionados y conservar el resto del pedido cuando la tienda y el pedido admitan el cambio. Es distinto de reemplazar un artículo, que se configura en Estrategia de retención. |

### Elige la etapa de cancelación

Las opciones de **Permitir cancelaciones hasta** son:

| Etapa seleccionada | Etapas incluidas por tu política |
| --- | --- |
| **Realizó una orden** | Realizó una orden. |
| **Orden confirmada** | Realizó una orden y Orden confirmada. |
| **Orden enviada** | Realizó una orden, Orden confirmada y Orden enviada. |
| **Orden entregada** | Realizó una orden, Orden confirmada, Orden enviada y Orden entregada. |

Por ejemplo, si eliges **Orden confirmada**, un pedido confirmado está dentro del límite y uno enviado está fuera. Si eliges **Orden enviada**, la política incluye esa etapa, pero la tienda todavía puede impedir cancelar un pedido que ya fue enviado. En ese caso, el asistente puede orientar sobre devoluciones si activaste esa opción o pedir apoyo al equipo. Lo mismo ocurre con los pedidos entregados.

El inicio del proceso de compra, la impresión de etiquetas de envío y los pedidos ya cancelados no son opciones de este límite. Un pedido dentro de la etapa permitida aún puede necesitar revisión por su estado de pago, reembolso, cancelación o preparación. Mantén la política cargada en **Conocimiento** alineada con estas opciones.

## Componente Estrategia de retención

Esta tarjeta permite ofrecer una alternativa antes de continuar con la cancelación. Activa solo las opciones que tu negocio autoriza y que puedes cumplir para el pedido concreto. El cliente puede rechazarlas y continuar con su solicitud sin que el asistente repita la oferta.

> **Se requiere Shopify o VTEX:** La tarjeta **Estrategia de retención** requiere una conexión con una de estas plataformas; no necesitas ambas. La conexión no garantiza que todas las acciones estén disponibles: los cambios de artículos, reembolsos del envío y créditos en tienda dependen de la plataforma, de la configuración de la tienda y del pedido. Si una operación no está disponible, debe intervenir tu equipo.

| Opción | Qué significa |
| --- | --- |
| **Intentar conservar el pedido** | Permite ofrecer una alternativa autorizada antes de cancelar. Al desactivarla, se atiende la cancelación sin intentar conservar el pedido. Las opciones que dependen de ella quedan deshabilitadas y en gris; sus valores guardados se conservan. |
| **Ofrecer un cambio de artículos** | Permite ofrecer otro artículo, talla, color o variante cuando el pedido todavía admite esa modificación antes de la preparación. No es un cambio de un artículo ya entregado. |
| **Ofrecer un reembolso del envío** | Permite ofrecer el reembolso de gastos de envío ya pagados cuando la tienda y el pedido lo admitan. No acelera la entrega ni cambia el servicio de envío ni hace gratuito un envío futuro. |
| **Ofrecer crédito en tienda** | Permite ofrecer crédito para una compra futura como incentivo para conservar el pedido. Es independiente del reembolso del pago original. |
| **Crédito máximo en tienda** | Define el importe máximo de crédito que el asistente puede ofrecer por pedido y la moneda de ese límite. Este campo aparece al activar **Ofrecer crédito en tienda** y requiere un importe mayor que cero y una moneda seleccionada. Es un límite monetario, no un porcentaje ni una promesa de ofrecer siempre el importe completo. |

Por ejemplo, un límite de **10 USD** autoriza ofrecer hasta **10 USD de crédito por pedido**. Elige la moneda que tu negocio usará para ese crédito. Este límite no regula los reembolsos del envío ni los descuentos: la estrategia y el límite de descuentos se configuran en **Descuentos**.

Activar una opción autoriza al asistente a considerarla; no ejecuta un cambio, reembolso o crédito por sí solo. El asistente solo debe confirmar el resultado cuando la acción se haya completado. Si la operación no está disponible o requiere intervención, debe derivar al equipo configurado en **Derivación**.

## Prepara el conocimiento de cancelación

La misión necesita contenido de política suficientemente específico para guiar al cliente.

Incluye:

- Cuándo puede cancelarse un pedido.
- Qué estados de pedido son demasiado tarde para cancelar.
- Qué pasa cuando el pedido ya está empacado, preparado, enviado, retirado, entregado o entregado al transportista.
- Si aplican autorización de pago, captura, reembolso, crédito en tienda o cargos de cancelación.
- Si ciertos productos son venta final, personalizados, perecederos, digitales o no cancelables.
- Qué información necesita el equipo antes de revisar la solicitud.
- Qué casos deberían pasar a cambios, devoluciones, seguimiento de pedidos o Inbox.
- Qué debería esperar el cliente después de que se recibe la solicitud.

Evita contenido vago como "contáctanos para cancelar" si quieres que la misión responda de forma consistente. Si la política cambia, actualiza la fuente antes de esperar que la misión use la nueva regla.

## Define límites para salvar la venta

Algunas solicitudes de cancelación pueden salvarse sin presionar al cliente.

Usa **Estrategia de retención** para autorizar cambios de artículos, reembolsos del envío o crédito en tienda, y **Descuentos** para definir la estrategia y los límites de descuentos. Ofrece estas alternativas solo cuando correspondan al motivo del cliente y estén disponibles para su pedido.

También puedes explicar el estado de envío si el cliente quiere cancelar porque no sabe dónde está su pedido, o conectarlo con [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) si quiere ayuda para elegir otro producto.

No uses la misión para presionar a un cliente a mantener un pedido. Si rechaza la alternativa, respeta su decisión y continúa con la solicitud de cancelación según **Política de cancelación**. Deriva cuando haga falta una aprobación o una acción que el asistente no pueda completar.

## Define qué necesita una persona

Las solicitudes de cancelación suelen requerir criterio humano o una acción operativa.

Configura derivación o asignación a equipo para casos como:

- El cliente necesita una cancelación que no puede completarse mediante la conexión disponible con la tienda.
- El pedido está fuera del límite de **Política de cancelación** o la tienda impide la operación solicitada, y la orientación sobre devoluciones no resuelve la solicitud.
- La solicitud necesita revisión de pago, aprobación de reembolso, revisión de fraude o verificación de cuenta.
- El cliente pide cambiar la dirección, el método de pago o las instrucciones de entrega, o un cambio de artículos que no está autorizado o no está disponible para ese pedido.
- El pedido no se encuentra después de pedir los datos necesarios.
- El cliente pide una excepción.
- El cliente está enojado, frustrado o insatisfecho.
- La solicitud requiere una intervención en tu sistema de comercio, preparación, pagos o envíos que el asistente no puede realizar.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Conéctalo con Webchat e Inbox

Asistente de Cancelación de Pedidos puede funcionar bien con [Widget de Webchat]({% link _captures/webchat-widget-playbook.md %}) cuando los clientes necesitan ayuda post-compra rápida desde tu sitio.

Antes de lanzar, confirma:

- Webchat o el canal de entrada está habilitado.
- El mensaje inicial no promete cancelación instantánea.
- El responsable de derivación es la persona o equipo correcto.
- Las reglas de respuesta reflejan qué tan rápido debería responder una persona después de una derivación.
- El equipo del Inbox sabe qué contexto debería recopilar la misión antes de derivar.

## Cómo probarla

Prueba con mensajes post-compra realistas antes de habilitar la misión ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, y prueba:

- Una solicitud de cancelación para un pedido que todavía no fue enviado.
- Una solicitud de cancelación para un pedido ya empacado, enviado o entregado.
- Un pedido justo en la etapa elegida en **Permitir cancelaciones hasta** y otro en la etapa siguiente: la primera está incluida en la política y la segunda queda fuera, siempre respetando las restricciones de la tienda.
- **Permitir cancelaciones parciales** sin Shopify ni VTEX conectado: debe quedar deshabilitado y en gris, mientras las otras opciones de **Política de cancelación** siguen disponibles. Prueba también una cancelación parcial con la conexión compatible que usarás.
- **Ofrecer crédito en tienda** con un importe positivo y una moneda seleccionada; comprueba que un importe vacío o de cero requiera corrección y que las ofertas respeten el máximo por pedido.
- Un cliente que rechaza la alternativa: el asistente debe respetar la decisión y continuar con su solicitud de cancelación.
- Una operación que tu tienda no pueda completar: debe pasar a tu equipo sin prometer que se realizó.
- Una solicitud sin número de pedido o sin datos del cliente.
- Una solicitud donde el pedido puede encontrarse desde el perfil del cliente.
- Un cliente que quiere cancelar porque el envío está demorado.
- Un cliente que quiere otro talle, color o producto en lugar de cancelar.
- Una pregunta de pago o reembolso.
- Una solicitud para cambiar dirección, artículo, método de pago o instrucciones de entrega.
- Un reclamo de un cliente molesto.
- Una pregunta de tracking que debería ir a Seguimiento de Pedidos.
- Una pregunta de cambio o devolución que debería ir a Asistente de Cambios y Devoluciones.

Revisa si la misión pide los datos faltantes correctos, sigue la política, evita promesas sin respaldo, ofrece alternativas aprobadas y deriva a la persona o equipo correcto.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron la misión.
- Si la misión siguió la fuente de política correcta.
- Si recopiló información útil antes de derivar.
- Qué motivos de cancelación aparecieron más seguido.
- Qué casos se salvaron con una alternativa aprobada.
- Qué casos requirieron aprobación, revisión de reembolso, acción de preparación o investigación.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Casos repetidos poco claros que sugieren contenido de política faltante.
- Velocidad de respuesta, tasa de resolución, tasa de derivación, tasa de cancelación, tasa de pedidos salvados, respuestas de clientes, mensajes fallidos y satisfacción cuando aplique.

Ajusta una cosa por vez: conocimiento de políticas, límites para salvar la venta, selección de canales, tono, destino de derivación o los casos de cancelación que la misión debería manejar.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
