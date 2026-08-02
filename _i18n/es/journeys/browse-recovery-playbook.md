Usa esta guía cuando quieres que Hellotext haga seguimiento a clientes que vieron productos pero se fueron antes de agregar al carrito o comprar.

Recuperación de Navegación es un playbook activo de venta. Usa señales de vistas de producto y navegación para identificar intención de compra reciente, y luego deja que Hellotext decida si un seguimiento útil tiene sentido para ese cliente.

No es una ruta de recuperación de carrito y no es un agente conversacional de recomendación. Vive antes en el recorrido de compra: después del interés por un producto, antes de que exista un carrito abandonado.

## Qué hace Recuperación de Navegación

Recuperación de Navegación ayuda a recuperar interés de producto que no llegó a convertirse en carrito.

Puede:

- Reaccionar a actividad de vista de producto como `product.viewed`.
- Detectar interés repetido por un producto en una ventana reciente.
- Revisar si el cliente ya compró o pasó a una señal más fuerte de carrito o checkout.
- Usar contexto de producto, catálogo, perfil del cliente, canal y consentimiento antes de enviar un mensaje.
- Usar contexto de stock cuando está disponible, incluyendo urgencia por bajo stock o la cantidad de unidades restantes.
- Enviar un recordatorio, link de producto o invitación útil cuando el playbook es elegible para actuar.
- Omitir, esperar o detenerse cuando la señal es vieja, el cliente no es elegible, otro playbook es mejor dueño del momento o el mensaje ya no tiene sentido.

La experiencia exacta puede variar según cuenta, tienda conectada, canal, plantillas disponibles y estado de despliegue del playbook.

## Cuándo usarlo

Usa Recuperación de Navegación cuando compradores muestran interés pero no crean un carrito.

Encaja bien cuando:

- Los clientes suelen ver páginas de producto pero se van antes de agregar al carrito.
- Las vistas de producto se registran en los perfiles de cliente correctos.
- Tu catálogo y links de producto son lo suficientemente confiables para hacer seguimiento.
- Tu equipo quiere recuperar intención más temprana, no solo carritos abandonados.
- Tienes un camino claro de canal y consentimiento para clientes que navegan.

Recuperación de Navegación va bien con Impulsor de Primera Compra y Recuperador de Carritos con IA. No son excluyentes: [Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}) cubre nuevos clientes alcanzables que todavía no compraron, Recuperación de Navegación cubre clientes que solo vieron productos, mientras que [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) o [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) normalmente deberían tomar el control cuando el cliente agrega productos al carrito o empieza checkout.

No lo uses como recomendador conversacional. Si el cliente pregunta qué comprar, compara opciones o necesita guía de producto por chat, usa [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Recuperación de Navegación, confirma la configuración de la que depende.

Revisa que:

- Tu tienda, sitio web o tracking personalizado envíe actividad de vista de producto.
- Las vistas de producto estén vinculadas a perfiles de cliente usables cuando se puede identificar al cliente.
- Identificadores de producto, variantes, nombres, imágenes y links coincidan con tu catálogo.
- El stock o inventario esté actualizado si quieres que los mensajes mencionen bajo stock o cantidades exactas disponibles.
- La actividad de compra, carrito y checkout pueda decirle a Hellotext cuándo otro playbook encaja mejor.
- El canal que puede usar el playbook esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Links de producto, descuentos o plantillas funcionen en el canal elegido.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de activar el playbook, usa los reportes automáticos para revisar vistas, envíos, clicks, compras, omisiones y bajas.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Recuperación de Navegación**.

Recuperación de Navegación expone:

- **Canales:** dónde Hellotext puede enviar o continuar la conversación de recuperación de navegación.
- **Tono o feedback en Playground:** cómo deberían aprender los seguimientos generados qué encaja con tu negocio.
- **Estrategia de descuento:** si el playbook sigue las reglas de oferta del eCommerce, puede crear descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Derivación o asignación:** quién debería tomar la conversación cuando una respuesta necesita una persona.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Recuperación de Navegación depende de si el cliente realmente puede ser alcanzado y si el formato del mensaje está permitido en el canal.

Recuperación de Navegación no requiere configurar un prompt, intenciones ni pasos de ruta. Esos controles pertenecen a agentes personalizados y rutas.

## Cómo funciona el disparador

Recuperación de Navegación parte desde intención de navegación, no desde una lista manual.

Una señal fuerte es el interés repetido por un producto en una ventana reciente. En el modelo actual de puntuación, vistas repetidas de producto dentro de un día pueden refrescar la evaluación de intención de compra del cliente. Eso no significa que Hellotext siempre envía después de un número específico de vistas.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de vista de producto es lo suficientemente reciente.
- Si el cliente ya compró.
- Si el cliente agregó al carrito o empezó checkout, donde recuperación de carrito normalmente debería tomar el control.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si los datos de producto y catálogo están lo suficientemente completos.
- Si otro playbook ya es mejor dueño de este momento.
- Si frecuencia, timing, consentimiento o reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con Recuperador de Carritos con IA y recomendaciones

Usa la señal para decidir quién debería ser dueño del momento.

| Momento del cliente | Mejor opción |
| --- | --- |
| Nuevo registro o suscriptor que todavía no hizo un pedido | Impulsor de Primera Compra |
| Vio uno o más productos pero no agregó al carrito | Recuperación de Navegación |
| Agregó productos al carrito o empezó checkout y se fue | Ruta Recuperador de Carritos o Recuperador de Carritos con IA |
| Pidió consejo, comparaciones, talles, alternativas o recomendaciones | Recomendador Inteligente |
| Necesita un trabajo de IA a medida con intenciones y conocimiento propios | Agente Personalizado |

Recuperación de Navegación y Recuperador de Carritos con IA pueden estar activos juntos cuando la propiedad está clara. Recuperación de Navegación debería manejar el momento anterior de navegación, y Recuperador de Carritos con IA debería manejar el momento más fuerte de carrito o checkout. Si también usas la plantilla de ruta Recuperador de Carritos, mantenla enfocada en el momento de carrito. Así los playbooks se complementan sin duplicar seguimientos para la misma intención.

## Revisa mensajes en el Playground

Recuperación de Navegación puede generar seguimientos personalizados usando contexto del cliente, producto, navegación y canal. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos de mensajes antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext pueda aprender el estilo, wording y nivel de detalle que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje se siente útil para el producto o categoría vista.
- Si el tono coincide con tu marca.
- Si el mensaje es claro sin sonar demasiado insistente.
- Si la urgencia por bajo stock se siente adecuada y usa cantidades correctas cuando se incluye stock.
- Si links de producto, descuentos o llamados a la acción tienen sentido.
- Si el texto evita sobreexplicar el tracking o hacer que el cliente se sienta observado.

Mientras más realistas sean los ejemplos del Playground, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa un perfil de cliente de prueba que tenga consentimiento de canal, luego:

- Mira una página real de producto más de una vez.
- Confirma que la actividad de vista de producto aparezca en el perfil del cliente.
- Confirma que el producto visto se conecte al ítem y link correctos del catálogo.
- Prueba un producto con bajo stock si el mensaje debería mencionar cuántas unidades quedan.
- Prueba un cliente que ve un producto y luego compra, lo que debería evitar recuperación de navegación.
- Prueba un cliente que ve un producto y luego agrega al carrito, donde recuperación de carrito normalmente debería tomar el control.
- Prueba un cliente que no es elegible para el canal.
- Revisa si el mensaje, link de producto, timing y descuento tienen sentido.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma también que nombre del evento, identificador de producto, timestamp e identificador del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Recuperación de Navegación esté habilitado no significa que cada vista de producto produzca un mensaje.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- Falta tracking de vista de producto o llega tarde.
- La actividad no está conectada a un perfil de cliente usable.
- El producto o registro de catálogo no se puede resolver.
- El cliente ya compró.
- El cliente agregó al carrito o empezó checkout.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Reglas de frecuencia, timing u horarios silenciosos impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Cuántos perfiles de cliente produjeron señales de navegación.
- Qué productos o categorías se vieron antes de un envío.
- Qué mensajes se enviaron, demoraron, omitieron o bloquearon.
- Si links de producto y contexto de catálogo fueron correctos.
- Clicks, compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si Recuperación de Navegación se superpone con recuperación de carrito.
- Si los clientes hacen preguntas que deberían ir a Recomendador Inteligente o al Inbox.

Ajusta una cosa por vez: canal, estrategia de descuento, tono, feedback en Playground o camino de derivación.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Playbook Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
