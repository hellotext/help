Usa esta guía cuando los clientes compran productos que se consumen, se gastan o necesitan reponerse en un ciclo predecible.

Impulsor de Recompra es un playbook activo de retención. Ayuda a Hellotext a recordar a los clientes que repongan cerca del momento en que podrían necesitar el producto otra vez, usando datos de uso del producto, historial de pedidos, comportamiento del cliente, elegibilidad de canal y chequeos de envío.

No es una campaña genérica de reactivación y no es recuperación de carrito. Empieza después de una compra y se enfoca en nuevos pedidos para productos donde el timing importa.

## Qué hace Impulsor de Recompra

Impulsor de Recompra ayuda a que los clientes vuelvan a comprar antes de quedarse sin producto.

Puede:

- Reaccionar después de que un cliente compra un producto reponible.
- Usar datos de uso a nivel producto, como `usage_duration_days`, cuando están disponibles.
- Usar valores por defecto de familia de producto o patrones promedio de recompra cuando falta un valor específico del producto.
- Aprender del ciclo propio del cliente cuando hay suficiente historial.
- Programar un recordatorio cerca de la ventana estimada de reposición.
- Incluir un link de recompra, link de producto o descuento cuando esas opciones están disponibles y configuradas.
- Omitir, esperar o detenerse cuando el cliente ya recompró, el producto no es elegible, otro playbook es mejor dueño del momento o el cliente no puede ser alcanzado.

La experiencia exacta puede variar según cuenta, tienda conectada, canal, plantillas disponibles y estado de despliegue del playbook.

## Cuándo usarlo

Usa Impulsor de Recompra cuando la recompra depende de que un producto se consuma o se reemplace.

Encaja bien para productos como:

- Vitaminas, suplementos o productos de bienestar.
- Café, té, comida, alimento para mascotas o productos del hogar.
- Cuidado de la piel, belleza o cuidado personal.
- Recargas, repuestos, filtros o accesorios consumibles.
- Cualquier familia de producto donde tu equipo conoce una ventana razonable de uso.

Funciona mejor cuando Hellotext puede ver historial de pedidos, identidad de producto, cantidad y una señal de timing de reposición para el SKU o familia de producto.

No lo uses para productos que normalmente se compran una vez y duran mucho tiempo. Para sugerir productos relacionados después de una compra, usa [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}). Para clientes que quedaron fríos a nivel marca, usa un playbook de reactivación. Para clientes que todavía no compraron, usa [Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Impulsor de Recompra, confirma la configuración de la que depende.

Revisa que:

- Tu tienda, ERP o fuente de datos envíe historial de pedidos y compras a Hellotext.
- Productos, variantes, SKUs, nombres y links coincidan con tu catálogo.
- Los productos reponibles puedan identificarse por producto, SKU, categoría o familia de producto.
- Las ventanas de uso estén disponibles, como un valor `usage_duration_days`, valor por defecto de familia de producto o promedio interno.
- Fechas de compra y cantidades sean lo suficientemente confiables para estimar cuándo un cliente podría necesitar más.
- Links de recompra, links de producto, precios, stock y reglas de descuento opcionales estén actualizados.
- El canal que puede usar el playbook esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de activar el playbook, usa los reportes automáticos para revisar recordatorios programados, enviados, omitidos, clics, recompras y resultados atribuidos.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Impulsor de Recompra**.

Las tarjetas disponibles pueden variar, pero el playbook puede mostrar:

- **Ventana de uso:** cuántos días suele durar un producto, SKU o familia de producto.
- **Elegibilidad de producto:** qué productos, categorías o familias deberían incluirse o excluirse.
- **Estrategia de descuento:** si el recordatorio sigue las reglas de oferta del ecommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Canales:** dónde Hellotext puede enviar o continuar la conversación.
- **Tono o feedback en Playground:** cómo deberían aprender los seguimientos generados qué encaja con tu negocio.
- **Derivación o asignación:** quién debería tomar la conversación cuando una respuesta necesita una persona.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Impulsor de Recompra depende de si el cliente realmente puede ser alcanzado cuando llega la ventana de reposición.

Algunas opciones se manejan automáticamente o pueden no estar disponibles en todas las cuentas. Si no ves un control, prueba el playbook con un perfil realista antes de asumir que necesitas recrear el flujo manualmente. Si necesitas un flujo a medida o un agente de IA personalizado, usa [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) o una ruta personalizada.

## Cómo funciona el timing

El timing de reposición es una estimación, no una prueba de que el cliente se quedó sin producto.

Hellotext puede usar varios niveles de señal:

- Una configuración del producto, como `usage_duration_days`, cuando tu equipo sabe cuánto suele durar un producto.
- Un valor por defecto de familia o categoría cuando un producto específico no tiene su propio valor.
- Comportamiento promedio de recompra de clientes que compraron el mismo producto.
- El patrón propio de recompra del cliente cuando hay suficiente historial.

Luego el playbook puede programar un recordatorio antes del punto estimado de reposición. El timing exacto y los controles disponibles pueden variar según cuenta y despliegue.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de compra está conectada a un perfil del cliente usable.
- Si el producto comprado es elegible para reposición.
- Si el cliente ya recompró el mismo producto o un reemplazo.
- Si el producto, precio, stock, descuento o link todavía tiene sentido.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si otro playbook ya encaja mejor para este momento.
- Si consentimiento, timing, frecuencia o reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con otros playbooks post-compra

Usa el momento del cliente para decidir quién debería ser dueño.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente podría estar por quedarse sin un producto consumible | Impulsor de Recompra |
| El cliente compró un producto y podría querer uno relacionado | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) |
| El cliente recibió un pedido y debería reseñar el producto | [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) |
| El cliente debería dar feedback de lealtad después de la entrega | [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) |
| El cliente lleva mucho tiempo inactivo | Reactivación o recuperación de clientes cuando esté disponible |
| El cliente todavía no compró | [Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}) |

Impulsor de Recompra puede convivir con playbooks de feedback cuando los momentos son diferentes. Generador de Reseñas pregunta por la experiencia con el producto después de la entrega; Impulsor de Recompra hace seguimiento cerca de la ventana estimada de reposición.

## Revisa mensajes en el Playground

Impulsor de Recompra puede generar seguimientos personalizados usando contexto de producto, compra, uso, cliente y canal. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos de mensajes antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext pueda aprender el estilo, wording y nivel de detalle que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje suena como un recordatorio útil de reposición, no como presión.
- Si el texto dice que el cliente podría estar por quedarse sin producto en lugar de afirmarlo con certeza.
- Si producto, cantidad, link y descuento son relevantes.
- Si el timing se siente natural para la ventana de uso del producto.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Mientras más realistas sean los ejemplos del Playground, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Crea un pedido de prueba con un producto reponible.
- Confirma que el pedido y el producto aparezcan en el perfil del cliente.
- Confirma que el producto tenga una ventana de uso, valor por defecto de familia o suficiente historial de compra para estimarla.
- Revisa el timing del recordatorio programado para ese producto.
- Prueba un cliente que recompra antes del recordatorio, lo que debería evitar o actualizar el seguimiento de reposición.
- Prueba un producto no reponible que debería quedar excluido.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de recompra, links de producto, descuentos y atribución.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma también que eventos de compra, identificadores de producto, cantidades, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Impulsor de Recompra esté habilitado no significa que cada compra produzca un recordatorio de reposición.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- El historial de compra falta, llega tarde o no está conectado a un perfil del cliente usable.
- El producto no está marcado o reconocido como reponible.
- Falta duración de uso, valores por defecto de familia o datos promedio de recompra.
- El cliente ya recompró.
- El producto no está disponible, fue discontinuado, no tiene stock o no tiene un link usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Reglas de frecuencia, timing u horarios silenciosos impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué productos y familias de producto crearon momentos elegibles de reposición.
- Qué recordatorios se programaron, enviaron, demoraron, omitieron o bloquearon.
- Qué productos tienen ventanas de uso faltantes o sospechosas.
- Clics, recompras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos aumentan recompras o solo reducen margen.
- Si Impulsor de Recompra se superpone con [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}), reactivación o campañas.

Ajusta una cosa por vez cuando el playbook exponga ese control: elegibilidad de producto, ventana de uso, mensaje, estrategia de descuento, canal o camino de derivación.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Elige tu primer playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Playbook Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %})
- [Playbook Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Playbook Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Playbook Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
