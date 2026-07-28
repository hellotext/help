Usa esta guía cuando quieres que Hellotext recupere carritos abandonados con seguimiento adaptable y contextual, en lugar de una ruta fija.

Recuperador de Carritos con IA es un playbook activo de venta. Reacciona a actividad de carrito abandonado, lee contexto del carrito, producto, perfil del cliente, conversación y compra, y usa los chequeos de envío de Hellotext antes de que algo llegue al cliente.

A diferencia de una ruta, no construyes cada paso manualmente. Configuras las partes que el playbook expone, pruebas la experiencia, lo habilitas y revisas la primera actividad.

## Qué hace Recuperador de Carritos con IA

Recuperador de Carritos con IA ayuda a recuperar una intención de compra que ya existe.

Puede:

- Reaccionar cuando un cliente deja un carrito o checkout sin completar la compra.
- Usar productos del carrito, link de checkout, contexto de producto, datos del perfil del cliente, conversación reciente y señales de compra.
- Elegir un camino de envío según alcanzabilidad del cliente y preparación del canal.
- Incluir contexto de producto, un link de checkout, texto personalizado y un descuento cuando el playbook está configurado para usar uno.
- Esperar, omitir o detenerse cuando el cliente no es elegible, compró recientemente, no puede ser alcanzado o no tiene un link de checkout usable.
- Derivar a una persona o equipo cuando la conversación necesita intervención humana.

La experiencia exacta puede variar según cuenta, tienda conectada, canal, plantillas disponibles y estado de despliegue del playbook.

## Cuándo usarlo

Usa Recuperador de Carritos con IA cuando la recuperación de carrito debería adaptarse al cliente.

Encaja bien cuando:

- Los clientes pueden responder con preguntas, dudas u objeciones.
- Los detalles de producto, alternativas, talles, stock o políticas pueden cambiar el mejor siguiente paso.
- El valor del carrito, combinación de productos, perfil del cliente o historial de compra deberían influir en el seguimiento.
- Quieres que Hellotext evite enviar cuando el mensaje ya no tiene sentido.
- Tu equipo quiere respaldo del Inbox para casos que el playbook no debería manejar solo.

Si solo necesitas uno o dos recordatorios fijos, usa [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}). Para comparar ambas opciones, mira [Carrito abandonado: plantilla de ruta vs playbook con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

Si el cliente vio productos pero nunca creó un carrito o checkout, usa [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Recuperador de Carritos con IA, confirma la configuración de la que depende.

Revisa que:

- Tu integración de tienda o checkout esté conectada.
- La actividad de carrito abandonado o checkout aparezca en los perfiles de cliente correctos.
- Los datos de producto, carrito, checkout y compra estén lo suficientemente actualizados para que el mensaje tenga sentido.
- Los links de checkout funcionen para carritos de prueba.
- El canal que puede usar el playbook esté conectado y listo.
- Las plantillas de WhatsApp estén listas cuando WhatsApp sea parte del camino de envío.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Una señal de compra u orden pueda evitar seguimientos después de que el cliente compra.
- Una persona o equipo esté listo para recibir derivaciones desde el Inbox.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Recuperador de Carritos con IA**.

Recuperador de Carritos con IA expone:

- **Canales:** dónde Hellotext puede enviar o continuar la conversación de recuperación de carrito.
- **Estrategia de descuento:** si el playbook sigue las reglas de oferta del ecommerce, puede crear descuentos con IA hasta un porcentaje máximo o envía sin descuentos.
- **Tono:** cómo debería sonar el seguimiento generado.
- **Derivación o asignación:** quién debería tomar la conversación cuando necesita una persona.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el playbook. Muchas decisiones de recuperación de carrito dependen de si el cliente realmente puede ser alcanzado en un canal y si el formato del mensaje está permitido ahí.

Recuperador de Carritos con IA no requiere configurar un prompt, intenciones ni pasos de ruta. Esos controles pertenecen a agentes personalizados y rutas.

## Cómo funciona con rutas de carrito

No ejecutes flujos de recuperación de carrito superpuestos para la misma audiencia, salvo que estés probando intencionalmente cómo interactúan.

Usa [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando quieres una secuencia predecible: esperar, enviar un recordatorio fijo, revisar si hubo compra y quizás enviar un seguimiento más.

Usa Recuperador de Carritos con IA cuando quieres que Hellotext tome una decisión más contextual según carrito, productos, perfil del cliente, respuestas, estado de compra y preparación del canal.

Si mantienes ambas opciones disponibles, define claramente la propiedad: qué clientes deberían entrar en la ruta, cuáles debería manejar el playbook con IA y qué reporte vas a revisar para cada uno.

## Por qué puede no enviar

Que Recuperador de Carritos con IA esté habilitado no significa que cada carrito abandonado produzca un mensaje.

El playbook puede esperar, omitir, detenerse o derivar cuando:

- La señal de carrito abandonado no llegó.
- La actividad no está conectada a un perfil de cliente usable.
- El perfil no puede ser alcanzado en un canal elegible.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- El link de checkout no se puede resolver.
- El cliente ya compró o la recuperación del carrito ya no aplica.
- Reglas de frecuencia, timing u horarios silenciosos impiden el envío.
- El canal o formato de mensaje elegido no está listo.
- La conversación debería ir a una persona o equipo.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). Para diagnosticar un caso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Cómo probarlo

Prueba con un camino pequeño y realista antes de habilitarlo para tráfico normal.

Usa un perfil de cliente de prueba que tenga consentimiento de canal, luego:

- Crea o abandona un carrito con productos reales.
- Confirma que la actividad de carrito o checkout aparezca en el perfil del cliente.
- Confirma que el link de checkout abra el carrito correcto.
- Previsualiza o usa el Playground si el playbook lo ofrece.
- Prueba un cliente que debería ser elegible y uno que no debería serlo.
- Revisa qué pasa después de que el cliente compra.
- Envía una respuesta, pregunta u objeción realista si el camino conversacional está disponible.
- Confirma que la derivación vaya a la persona o equipo correcto.
- Revisa los primeros mensajes, omisiones, respuestas y reportes.

Mantén el primer lanzamiento acotado hasta que tu equipo revise conversaciones reales y confirme que productos, links, descuentos, timing y derivaciones funcionan como esperaban.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Cuántos perfiles de cliente entraron en el playbook.
- Qué mensajes se enviaron, demoraron, omitieron o derivaron.
- Si los links de checkout y el contexto de producto fueron correctos.
- Si los descuentos se usaron como esperabas.
- Si las respuestas llegaron al Inbox con contexto suficiente.
- Si los clientes compraron antes de que saliera un seguimiento.
- Conversión, ingresos, bajas, tasa de derivación y mensajes fallidos.

Ajusta una cosa por vez: estrategia de descuento, tono, selección de canal o destino de derivación.

## Guías relacionadas

- [Carrito abandonado: plantilla de ruta vs playbook con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
