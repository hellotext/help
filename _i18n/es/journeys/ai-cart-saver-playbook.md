Usa esta guía cuando quieres que Hellotext recupere carritos abandonados con seguimiento adaptable y contextual, en lugar de una ruta fija.

Recuperador de Carritos con IA es una misión activa de venta. Reacciona cuando se registra `cart.abandoned`, usa el contexto del carrito, los productos, el perfil y las compras de esos productos, y aplica los chequeos de envío de Hellotext antes de que algo llegue al cliente.

A diferencia de una ruta, no construyes cada paso manualmente. Configuras las partes que la misión expone, pruebas la experiencia, la habilitas y revisas la primera actividad.

## Qué hace Recuperador de Carritos con IA

Recuperador de Carritos con IA ayuda a recuperar una intención de compra que ya existe.

Puede:

- Reaccionar cuando se detecta un carrito o checkout abandonado y se registra `cart.abandoned`; salir de una página no basta por sí solo.
- Usar productos del carrito, link de checkout, datos del perfil del cliente y datos de compra de esos productos.
- Elegir un camino de envío según alcanzabilidad del cliente y preparación del canal.
- Incluir contexto de producto, un link de checkout, texto personalizado y un descuento cuando la misión está configurada para usar uno.
- Esperar, omitir o detenerse cuando el cliente no es elegible, compró recientemente, no puede ser alcanzado o no tiene un link de checkout usable.
- Invitar al cliente a responder cuando la configuración de soporte lo permite; prepara por separado la atención de esa respuesta en Inbox.

La experiencia exacta puede variar según cuenta, tienda conectada, canal, plantillas disponibles y estado de despliegue de la misión.

## Cuándo usarla

Usa Recuperador de Carritos con IA cuando la recuperación de carrito debería adaptarse al cliente.

Encaja bien cuando:

- El contenido del carrito y los datos del cliente varían entre casos.
- Los detalles de los productos y el stock comprobado pueden cambiar cómo se redacta el recordatorio.
- El valor del carrito, la combinación de productos, el perfil o las compras pertinentes deberían influir en el recordatorio saliente.
- Quieres que Hellotext evite enviar cuando el mensaje ya no tiene sentido.
- Tu equipo puede atender por separado en Inbox las respuestas a los mensajes que inviten a responder.

Si solo necesitas uno o dos recordatorios fijos, usa [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}). Para comparar ambas opciones, mira [Carrito abandonado: plantilla de ruta vs misión con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

Si el cliente vio productos pero nunca creó un carrito o checkout, usa [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Recuperador de Carritos con IA, confirma la configuración de la que depende.

Revisa que:

- Tu integración de tienda o checkout esté conectada.
- El evento `cart.abandoned` aparezca en los perfiles de cliente correctos.
- Los datos de producto, carrito, checkout y compra estén lo suficientemente actualizados para que el mensaje tenga sentido.
- Los links de checkout funcionen para carritos de prueba.
- El canal que puede usar la misión esté conectado y listo.
- Las plantillas de WhatsApp estén listas cuando WhatsApp sea parte del camino de envío.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Las compras de los productos del carrito figuren en los datos de ingresos por producto que usan los chequeos de envío.
- Si el mensaje invita a responder, una persona o equipo tenga configurada la atención de esas respuestas en Inbox.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Recuperador de Carritos con IA**.

Para el recordatorio saliente, revisa estos controles:

- **Canales:** dónde Hellotext puede enviar el recordatorio de carrito.
- **Estrategia de descuento:** si la misión sigue las reglas de oferta del eCommerce, puede crear descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono:** cómo debería sonar el seguimiento generado.

Si aparece una tarjeta de asignación, no la tomes como garantía de que la misión gestionará respuestas. Si invitas al cliente a responder, configura por separado cómo llegará esa respuesta al Inbox y quién la atenderá. La misión redacta un recordatorio saliente; no responde preguntas ni recomienda otros productos por sí sola.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar la misión. Muchas decisiones de recuperación de carrito dependen de si el cliente realmente puede ser alcanzado en un canal y si el formato del mensaje está permitido ahí.

Recuperador de Carritos con IA no requiere configurar un prompt, intenciones ni pasos de ruta. Esos controles pertenecen a agentes personalizados y rutas.

## Cómo funciona con rutas de carrito

Cuando Recuperador de Carritos con IA está activo, recibe `cart.abandoned` antes que la ruta. La ruta recibe ese evento como camino alternativo cuando la misión no está activa.

Usa [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando quieres una secuencia predecible: esperar, revisar si hubo compra, enviar un recordatorio fijo si corresponde y quizás agregar otro paso.

Usa Recuperador de Carritos con IA cuando quieres que Hellotext prepare y evalúe un recordatorio saliente según el carrito, los productos, el perfil, las compras pertinentes y la preparación del canal.

Si mantienes ambas opciones disponibles, no supongas que se repartirán los mismos eventos por audiencia: comprueba qué opción manejará `cart.abandoned` y qué reporte revisarás.

## Por qué puede no enviar

Que la misión Recuperador de Carritos con IA esté habilitada no significa que cada carrito abandonado produzca un mensaje.

La misión puede esperar, omitir o detener el envío cuando:

- La señal de carrito abandonado no llegó.
- La actividad no está conectada a un perfil de cliente usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- El link de checkout no se puede resolver.
- El cliente hizo una compra pertinente o la recuperación del carrito ya no aplica.
- Reglas de frecuencia, timing u horarios silenciosos impiden el envío.
- El canal o formato de mensaje elegido no está listo.

Para el modelo general de decisión, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). Para diagnosticar un caso, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Cómo probarla

Prueba con un camino pequeño y realista antes de habilitarla para tráfico normal.

Usa un perfil de cliente de prueba que tenga consentimiento de canal, luego:

- Crea o abandona un carrito con productos reales.
- Confirma que `cart.abandoned` aparezca en el perfil del cliente.
- Confirma que el link de checkout abra el carrito correcto.
- Previsualiza o usa el Playground si la misión lo ofrece.
- Prueba un cliente que debería ser elegible y uno que no debería serlo.
- Revisa qué pasa después de que el cliente compra.
- Si el recordatorio invita a responder, confirma por separado que la respuesta llegue al Inbox y que alguien pueda atenderla.
- Revisa los primeros mensajes, omisiones y reportes.

Mantén el primer lanzamiento acotado hasta que tu equipo confirme que productos, links, descuentos, timing y atención de respuestas funcionan como esperaban.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Cuántos perfiles de cliente entraron en la misión.
- Qué mensajes se enviaron, demoraron u omitieron.
- Si los links de checkout y el contexto de producto fueron correctos.
- Si los descuentos se usaron como esperabas.
- Si las respuestas a una invitación llegaron a la atención de Inbox configurada por separado.
- Si los clientes compraron antes de que saliera un seguimiento.
- Conversión, ingresos, bajas y mensajes fallidos.

Ajusta una cosa por vez: estrategia de descuento, tono o selección de canal.

## Guías relacionadas

- [Carrito abandonado: plantilla de ruta vs misión con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
