Las señales son datos y actividad de clientes y del negocio que Hellotext puede usar para entender qué está pasando y decidir qué debería pasar después.

Una señal puede venir de tu tienda, sitio web, canales conectados, herramientas de captura, tracking personalizado, perfiles de cliente o conversaciones en el Inbox.

Las señales ayudan a Hellotext a responder preguntas como:

- ¿Este cliente abandonó un carrito?
- ¿Vio un producto varias veces?
- ¿Compró recientemente?
- ¿Puede recibir un mensaje por este canal?
- ¿Respondió con una pregunta o necesita ayuda humana?
- ¿Un producto volvió a estar disponible?

## Por qué importan las señales

Hellotext es más útil cuando puede actuar con contexto actualizado en lugar de enviar el mismo mensaje a todos.

Misiones, rutas, campañas, segmentos, reportes y flujos del Inbox pueden usar señales de distintas maneras.

Por ejemplo:

- Una misión puede decidir si un cliente debería recibir un seguimiento de carrito abandonado.
- Una ruta puede empezar cuando un cliente se suscribe o coincide con un disparador.
- Un segmento puede actualizarse automáticamente cuando cambia el comportamiento del cliente.
- Una campaña planificada por tu equipo puede seleccionar su audiencia según actividad reciente o datos de perfil.
- Un reporte puede mostrar actividad registrada e ingresos atribuidos cuando se cumplen las [reglas de origen y atribución]({% link _analytics-reporting-attribution/sales-attribution.md %}).
- El Inbox puede darle más contexto a tu equipo antes de responder.

## Tipos comunes de señales

Las señales de comercio incluyen carritos, vistas de producto, compras, estado de órdenes, devoluciones, cupones, cambios de stock y datos del catálogo.

Las señales de perfil incluyen propiedades del cliente, estado de suscripción, consentimiento, ubicación, cumpleaños, etiquetas y pertenencia a listas o segmentos.

Las señales de conversación incluyen respuestas, intención, preguntas de soporte, necesidad de derivación y si una conversación está abierta, asignada o cerrada.

Las señales de tracking incluyen vistas de página, clicks en links cortos, eventos personalizados, eventos externos y actividad capturada por Hellotext.js o la API.

Las señales de canal incluyen si WhatsApp, SMS u otro canal está conectado, aprobado, disponible y es adecuado para el cliente.

## Una señal no siempre dispara un mensaje

Una señal es contexto. No siempre significa que Hellotext enviará algo inmediatamente.

Antes de que una misión, ruta o campaña actúe, Hellotext también puede considerar:

- El objetivo de la misión.
- El disparador y las reglas de audiencia.
- Consentimiento y elegibilidad por canal.
- Límites de frecuencia y horarios silenciosos.
- Si otra misión ya está activa para el cliente.
- Si una persona debería tomar la conversación.
- Si los datos necesarios están lo suficientemente completos para tomar una buena decisión.

Por eso dos clientes pueden generar la misma señal y recibir siguientes pasos distintos.

Por ejemplo, una ruta configurada para un carrito abandonado podría hacer seguimiento a un cliente que aún no compró y puede recibir mensajes. Si otro cliente abandona un carrito pero después compra o no tiene consentimiento para ese canal, la misma ruta puede no enviarle el seguimiento. El tipo de evento es el mismo; las reglas y el contexto actualizado cambian la decisión.

## Señales, eventos y propiedades de perfil

Un **evento** es una ocurrencia registrada en un momento específico para un cliente o una sesión anónima. `cart.abandoned`, `product.viewed` y `order.placed` son nombres de acciones que pueden identificar el tipo de evento; tu sistema también puede enviar eventos personalizados.

Una **propiedad de perfil** es información estándar o personalizada guardada sobre el cliente, como cumpleaños, empresa, etiquetas o talla preferida. El estado de suscripción también puede orientar decisiones, pero se administra por separado de las propiedades editables.

Una **señal** es la idea más amplia: cualquier evento, propiedad, estado de canal, estado de conversación o contexto del negocio que Hellotext puede usar para entender al cliente y decidir qué hacer después.

Para ver cómo se presentan los atributos y los eventos registrados, consulta la [guía de perfiles del cliente]({% link _audience/customer-profiles.md %}).

## Cómo hacer disponibles las señales

Empieza conectando los sistemas donde viven tus datos.

Los pasos comunes incluyen:

- Conectar tu plataforma de comercio.
- Conectar WhatsApp, SMS u otro canal de mensajería.
- Agregar herramientas de captura para que los clientes puedan suscribirse.
- Instalar tracking o usar una integración que envíe eventos automáticamente.
- Usar Hellotext.js o la API si tienes actividad personalizada para enviar.
- Confirmar que la actividad aparezca en los perfiles de cliente antes de lanzar una misión o campaña.

## Guías relacionadas

- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
