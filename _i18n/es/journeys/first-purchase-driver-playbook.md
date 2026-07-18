Usa esta guía cuando tienes muchos registros, nuevos suscriptores o perfiles del cliente identificados que navegan o se suscriben, pero todavía no hicieron su primera compra.

Impulsor de Primera Compra es un playbook activo de conversión. Ayuda a Hellotext a convertir interés temprano en una primera compra, especialmente poco después del registro, antes de que el cliente quede inactivo o pase a una señal más fuerte de carrito.

No es una ruta de bienvenida, no es recuperación de carrito y no es un agente conversacional general de recomendación de productos. Vive entre crecimiento de audiencia y recuperación de compra: después de que el cliente puede ser alcanzado, antes de que haya comprado por primera vez.

## Qué hace Impulsor de Primera Compra

Impulsor de Primera Compra ayuda a convertir prospectos alcanzables en compradores por primera vez.

Puede:

- Reaccionar a un nuevo registro, opt-in o perfil del cliente suscrito.
- Revisar si el cliente todavía no tiene historial de compra.
- Usar contexto de fuente de suscripción, producto, catálogo, navegación, compra, canal y consentimiento antes de enviar un mensaje.
- Poner en cola un recordatorio de primera compra después de una espera corta cuando el cliente todavía no hizo un pedido.
- Usar productos agregados recientemente o interés de producto cuando ese contexto está disponible.
- Usar una oferta o descuento solo cuando esa opción está disponible y configurada.
- Omitir, esperar o detenerse cuando el cliente compra, deja de ser elegible, pasa a recuperación de carrito u otro playbook es mejor dueño del momento.

La experiencia exacta puede variar según cuenta, tienda conectada, canal, plantillas disponibles y estado de despliegue del playbook.

## Cuándo usarlo

Usa Impulsor de Primera Compra cuando el cuello de botella es convertir prospectos alcanzables en compradores por primera vez.

Encaja bien cuando:

- Muchos visitantes se suscriben, se registran, inician un chat o llegan desde una captura, pero no compran.
- Tu tienda puede decirle a Hellotext si un cliente ya hizo un pedido.
- Los perfiles del cliente tienen suficiente consentimiento de canal para recibir seguimiento.
- Links de producto, datos de catálogo y ofertas opcionales están listos.
- Tu equipo quiere un empujón liviano de conversión, no una campaña amplia para todos.

Impulsor de Primera Compra funciona bien después de capturas y momentos de bienvenida. Una captura o bienvenida trae al cliente a Hellotext; Impulsor de Primera Compra ayuda a decidir si más tarde tiene sentido un seguimiento para conseguir el primer pedido.

También se complementa con [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}), [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) y [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}). Usa la señal para decidir quién debería ser dueño del momento: registro sin compra pertenece a Impulsor de Primera Compra, navegación de producto pertenece a Recuperación de Navegación y carrito o checkout abandonado pertenece a recuperación de carrito.

No lo uses para clientes que ya compraron. Para recompra, usa recompra, venta cruzada, reactivación u otro playbook post-compra cuando esté disponible.

## Qué necesita antes del lanzamiento

Antes de habilitar Impulsor de Primera Compra, confirma la configuración de la que depende.

Revisa que:

- Nuevos registros, opt-ins, importaciones o fuentes de captura creen perfiles del cliente usables.
- El perfil muestre claramente si el cliente está suscrito y puede ser alcanzado.
- El historial de compras y pedidos pueda identificar clientes sin pedidos completados.
- Los datos de producto y catálogo estén disponibles si los mensajes deberían incluir productos o links.
- Datos de nuevos productos, navegación, stock u ofertas estén actualizados si el playbook debería usarlos.
- El canal que puede usar el playbook esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Links, descuentos y plantillas funcionen en el canal elegido.
- Los reportes estén listos para revisar mensajes en cola, enviados, omitidos, clicks, compras y resultados atribuidos.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Impulsor de Primera Compra**.

Las tarjetas disponibles pueden variar, pero el playbook puede mostrar:

- **Timing del recordatorio:** cuándo hacer seguimiento después del registro si el cliente todavía no tiene pedidos.
- **Oferta o descuento:** si el playbook puede usar un incentivo de primera compra.
- **Destacado de nuevos productos:** si hay un bloque recurrente de productos nuevos para clientes que todavía no compraron.
- **Canales:** dónde Hellotext puede enviar o continuar la conversación.
- **Tono o feedback en Playground:** cómo deberían aprender los seguimientos generados qué encaja con tu negocio.
- **Derivación o asignación:** quién debería tomar la conversación cuando una respuesta necesita una persona.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Impulsor de Primera Compra depende de si el cliente realmente puede ser alcanzado y si el formato del mensaje está permitido en el canal.

No asumas que al playbook le falta algo si no muestra tarjetas de prompt, intenciones o pasos de ruta. Algunos playbooks preconstruidos manejan esas decisiones dentro de la lógica del playbook. Si necesitas un agente conversacional a medida con intenciones manuales, usa [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

## Cómo funciona el disparador

Impulsor de Primera Compra parte de un perfil alcanzable nuevo que todavía no hizo pedidos.

La configuración de referencia para este playbook usa un recordatorio de primera compra alrededor de 48 horas después del registro cuando no existe un pedido. Hellotext igualmente revisa el estado actual del cliente antes de enviar. Si el cliente ya compró, perdió elegibilidad o pasó a una señal más fuerte de carrito o checkout, el playbook puede omitir, esperar o dejar actuar a otro playbook.

Cuando está disponible, un destacado de nuevos productos puede darle al playbook una razón fresca de producto para hacer seguimiento con prospectos que todavía no compraron. Ese tipo de bloque debería usar contexto actual de catálogo y compra para no seguir empujando a clientes que ya convirtieron.

Antes de enviar, Hellotext también puede considerar:

- Si la señal de registro u opt-in es lo suficientemente reciente.
- Si el cliente tiene alguna compra completada.
- Si el contexto de producto, oferta o catálogo está lo suficientemente completo.
- Si el cliente agregó al carrito o empezó checkout, donde recuperación de carrito normalmente debería tomar el control.
- Si el perfil puede recibir un mensaje en un canal elegible.
- Si otro playbook ya encaja mejor para este momento.
- Si consentimiento, timing, frecuencia o reglas de canal permiten el envío.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con otros playbooks de conversión

Usa la señal del cliente para decidir quién debería ser dueño del momento.

| Momento del cliente | Mejor opción |
| --- | --- |
| Nuevo registro o suscriptor que todavía no hizo un pedido | Impulsor de Primera Compra |
| Vio productos pero no agregó al carrito | Recuperación de Navegación |
| Agregó productos al carrito o empezó checkout y se fue | Ruta Recuperador de Carritos o Recuperador de Carritos con IA |
| Pidió consejo, comparaciones, talles, alternativas o recomendaciones | Recomendador Inteligente |
| Ya compró y debería volver a comprar | Recompra, venta cruzada o reactivación cuando estén disponibles |

Impulsor de Primera Compra, Recuperación de Navegación y Recuperador de Carritos con IA pueden estar activos juntos cuando la propiedad está clara. Impulsor de Primera Compra maneja el hueco de primer pedido, Recuperación de Navegación maneja intención por vista de producto y recuperación de carrito maneja el momento más fuerte de carrito o checkout.

## Revisa mensajes en el Playground

Impulsor de Primera Compra puede generar seguimientos personalizados usando contexto del cliente, registro, producto, compra y canal. Normalmente no necesitas escribir cada mensaje a mano.

Usa el Playground para revisar ejemplos de mensajes antes del lanzamiento. Marca los ejemplos que te gustan y los que no te gustan, para que Hellotext pueda aprender el estilo, wording y nivel de detalle que encajan con tu negocio.

Cuando revises ejemplos, mira:

- Si el mensaje le da al cliente una razón clara para hacer su primera compra.
- Si el tono se siente útil y no demasiado insistente.
- Si recomendaciones, nuevos productos, links u ofertas son relevantes.
- Si cualquier descuento se siente intencional y no más fuerte de lo necesario.
- Si el mensaje evita tratar a todos los nuevos suscriptores de la misma forma.
- Si las respuestas pueden continuar naturalmente en el canal o llegar al Inbox cuando hace falta.

Mientras más realistas sean los ejemplos del Playground, más fácil es entrenar al sistema sobre cómo se ve un buen mensaje para tu tienda.

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo ampliamente.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Crea o identifica un nuevo perfil suscrito sin pedidos.
- Confirma que el registro, opt-in o fuente de captura aparezca en el perfil del cliente.
- Confirma que el perfil no tenga compras completadas.
- Prueba si el timing del recordatorio se comporta como esperas para tu despliegue.
- Prueba un cliente que se registra y luego compra antes del recordatorio, lo que debería evitar el seguimiento de primera compra.
- Prueba un cliente que agrega al carrito o empieza checkout, donde recuperación de carrito normalmente debería tomar el control.
- Prueba un cliente que no es elegible para el canal.
- Revisa links de producto, ofertas, tono del mensaje y atribución.
- Envía una respuesta realista y confirma que llegue a la persona o equipo correcto si hay derivación disponible.

Si el tracking es personalizado, confirma también que registro, compra, producto, timestamp e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Que Impulsor de Primera Compra esté habilitado no significa que cada nuevo registro reciba un mensaje.

El playbook puede esperar, omitir, detenerse o dejar actuar a otro playbook cuando:

- El registro u opt-in falta, llega tarde o no está conectado a un perfil del cliente usable.
- El cliente ya compró.
- El cliente agregó al carrito o empezó checkout.
- Faltan datos de producto, catálogo, oferta o link cuando son necesarios.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- Reglas de frecuencia, timing u horarios silenciosos impiden el envío.
- El canal, remitente, plantilla, link o formato del mensaje no está listo.
- Otro playbook activo encaja mejor.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Cuántos perfiles nuevos quedaron elegibles.
- Qué fuentes de registro o captura generaron primeras compras.
- Qué mensajes quedaron en cola, se enviaron, demoraron, omitieron o bloquearon.
- Clicks, primeras compras, ingresos atribuidos, bajas, respuestas y mensajes fallidos.
- Si los descuentos ayudan o solo reducen margen.
- Si Impulsor de Primera Compra se superpone con Recuperación de Navegación o recuperación de carrito.
- Si los clientes hacen preguntas que deberían ir a Recomendador Inteligente o al Inbox.

Ajusta una cosa por vez: audiencia, canal, timing, mensaje, oferta, contexto de producto o camino de derivación.

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
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Playbook Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %})
- [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
