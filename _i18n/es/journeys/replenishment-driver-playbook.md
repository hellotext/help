Usa esta guía cuando los clientes compran productos que se consumen, se gastan o necesitan reponerse en un ciclo predecible.

Impulsor de Recompra es un playbook activo de retención. Ayuda a Hellotext a recordar a los clientes que repongan cerca del momento en que podrían necesitar el producto otra vez. Hellotext estima esa cadencia automáticamente mediante IA, historial de recompra del producto en el negocio y comportamiento individual del cliente. El negocio también puede definir una duración explícita opcional con máxima prioridad.

No es una campaña genérica de reactivación y no es recuperación de carrito. Empieza después de una compra y se enfoca en nuevos pedidos para productos donde el timing importa.

## Qué hace Impulsor de Recompra

Impulsor de Recompra ayuda a que los clientes vuelvan a comprar antes de quedarse sin producto.

Puede:

- Reaccionar después de que un cliente compra un producto reponible.
- Estimar con IA cuánto podría tardar en consumirse un producto.
- Mejorar la estimación con el historial agregado de recompra de ese producto en el negocio.
- Personalizarla con el ciclo propio del cliente cuando existe suficiente historial confiable.
- Usar un valor explícito opcional, como `usage_duration_days`, como la fuente de mayor prioridad cuando el negocio lo define.
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
- Cualquier producto reponible cuya duración pueda estimarse con IA o historial, aunque tu equipo no haya configurado una ventana manual.

Funciona mejor cuando Hellotext puede ver historial de pedidos, identidad de producto y cantidad. No necesitas cargar manualmente una duración para cada producto antes de usarlo.

No lo uses para productos que normalmente se compran una vez y duran mucho tiempo. Para sugerir productos relacionados después de una compra, usa [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}). Para clientes que quedaron fríos a nivel marca, usa un playbook de reactivación. Para clientes que todavía no compraron, usa [Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Impulsor de Recompra, confirma la configuración de la que depende.

Revisa que:

- Tu tienda, ERP o fuente de datos envíe historial de pedidos y compras a Hellotext.
- Productos, variantes, SKUs, nombres y links coincidan con tu catálogo.
- Los productos reponibles puedan identificarse por producto, SKU, categoría o familia de producto.
- Fechas de compra, identidad de producto y cantidades sean lo suficientemente confiables para que Hellotext evalúe una cadencia de recompra.
- Links de recompra, links de producto, precios, stock y reglas de descuento opcionales estén actualizados.
- El canal que puede usar el playbook esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.

> **Importante:** `usage_duration_days` es opcional. Hellotext intenta estimar la duración automáticamente con IA, historial del producto a nivel negocio e historial del cliente. Configura un valor explícito solamente cuando tu negocio conoce una duración más precisa y quiere que tenga prioridad sobre las estimaciones automáticas.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de activar el playbook, usa los reportes automáticos para revisar recordatorios programados, enviados, omitidos, clics, recompras y resultados atribuidos.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Impulsor de Recompra**.

El playbook expone las configuraciones que controlan cómo se comunica:

- **Estrategia de descuento:** si el recordatorio sigue las reglas de oferta del eCommerce, puede usar descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Canales:** dónde Hellotext puede enviar o continuar la conversación.
- **Tono o feedback en Playground:** cómo deberían aprender los seguimientos generados qué encaja con tu negocio.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Impulsor de Recompra depende de si el cliente realmente puede ser alcanzado cuando llega la ventana de reposición.

La duración de uso y la elegibilidad para recompra provienen del análisis de IA y del historial de compras. Si tu catálogo admite `usage_duration_days`, puedes usarlo como una indicación explícita opcional. No es un control para programar manualmente el mensaje: es una fuente de mayor autoridad que reemplaza la cadencia estimada para ese producto.

## Cómo funciona el timing

El timing de reposición es una estimación, no una prueba de que el cliente se quedó sin producto.

Hellotext evalúa estas fuentes desde la menor hasta la mayor autoridad:

| Prioridad | Fuente | Cómo se usa |
| --- | --- | --- |
| 1 | Estimación de IA | Estima los días de consumo del producto. Una confianza alta o media se considera confiable; una confianza baja o desconocida todavía puede usarse, pero es menos confiable. |
| 2 | Historial del negocio | Usa una cadencia agregada confiable de recompra para ese producto exacto en el negocio y la combina con la estimación de IA cuando existe. |
| 3 | Historial del cliente | Usa la cadencia personal confiable de recompra del cliente y la combina con el resultado del negocio. |
| 4, máxima y opcional | Valor explícito | Un `usage_duration_days` positivo definido por el negocio reemplaza inmediatamente las demás fuentes para ese producto, incluso cuando la estimación de IA lo clasifica como no consumible. |

El valor explícito es el último nivel de prioridad, no el primer requisito. Si ninguna fuente produce una cantidad positiva de días, Hellotext considera que la cadencia no está disponible y no fuerza un recordatorio.

Luego el playbook calcula cuándo tiene sentido enviar antes del punto estimado de reposición. Hellotext maneja ese timing automáticamente en lugar de pedirte que programes cada recordatorio.

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
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Cuanto más realistas sean los ejemplos del Playground, mejor puede el sistema adaptar los mensajes a tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Crea un pedido de prueba con un producto reponible.
- Confirma que el pedido y el producto aparezcan en el perfil del cliente.
- Confirma que Hellotext pueda estimar una cadencia mediante IA, historial del producto en el negocio o historial del cliente.
- Si configuraste `usage_duration_days`, confirma que sea positivo, razonable y que realmente deba reemplazar las estimaciones automáticas.
- Confirma que el pedido y el producto creen una oportunidad elegible de recompra.
- Prueba un cliente que recompra antes del recordatorio, lo que debería evitar o actualizar el seguimiento de reposición.
- Prueba un producto no reponible que debería quedar excluido.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de recompra, links de producto, descuentos y atribución.
- Envía una respuesta realista y confirma que la conversación resultante aparezca en el Inbox.

Si el tracking es personalizado, confirma también que eventos de compra, identificadores de producto, cantidades, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Impulsor de Recompra esté habilitado no significa que cada compra produzca un recordatorio de reposición.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- El historial de compra falta, llega tarde o no está conectado a un perfil del cliente usable.
- El producto no está marcado o reconocido como reponible.
- Ninguna estimación de IA, historial agregado del producto, historial del cliente ni valor explícito produce una cadencia positiva utilizable.
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
- Para qué productos Hellotext no pudo obtener una cadencia positiva o produjo una estimación que conviene revisar.
- Clics, recompras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos aumentan recompras o solo reducen margen.
- Si Impulsor de Recompra se superpone con [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}), reactivación o campañas.

Ajusta una cosa por vez: datos de producto, estrategia de descuento, canal, tono o feedback en Playground.

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
