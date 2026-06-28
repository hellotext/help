Las señales son la actividad de clientes y del negocio que Hellotext puede usar para entender qué está pasando y decidir qué debería pasar después.

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

Playbooks, rutas, campañas, segmentos, reportes y flujos del Inbox pueden usar señales de distintas maneras.

Por ejemplo:

- Un playbook puede decidir si un cliente debería recibir un seguimiento de carrito abandonado.
- Una ruta puede empezar cuando un cliente se suscribe o coincide con un disparador.
- Un segmento puede actualizarse automáticamente cuando cambia el comportamiento del cliente.
- Una campaña puede dirigirse a clientes que coinciden con actividad reciente o datos de perfil.
- Un reporte puede conectar clicks, órdenes, respuestas e ingresos con el mensaje o playbook que influyó en el resultado.
- El Inbox puede darle más contexto a tu equipo antes de responder.

## Tipos comunes de señales

Las señales de comercio incluyen carritos, vistas de producto, compras, estado de órdenes, devoluciones, cupones, cambios de stock y datos del catálogo.

Las señales de perfil incluyen propiedades del perfil de cliente, estado de suscripción, consentimiento, canal preferido, ubicación, cumpleaños, etiquetas y pertenencia a listas o segmentos.

Las señales de conversación incluyen respuestas, intención, preguntas de soporte, necesidad de derivación y si una conversación está abierta, asignada o cerrada.

Las señales de tracking incluyen vistas de página, clicks en links cortos, eventos personalizados, eventos externos y actividad capturada por Hellotext.js o la API.

Las señales de canal incluyen si WhatsApp, SMS u otro canal está conectado, aprobado, disponible y es adecuado para el cliente.

## Una señal no siempre dispara un mensaje

Una señal es contexto. No siempre significa que Hellotext enviará algo inmediatamente.

Antes de que un playbook, ruta o campaña actúe, Hellotext también puede considerar:

- El objetivo del playbook.
- El disparador y las reglas de audiencia.
- Consentimiento y elegibilidad por canal.
- Límites de frecuencia y horarios silenciosos.
- Si otro playbook ya está activo para el cliente.
- Si una persona debería tomar la conversación.
- Si los datos necesarios están lo suficientemente completos para tomar una buena decisión.

Por eso dos clientes pueden generar la misma señal y recibir siguientes pasos distintos.

## Señales, eventos y propiedades de perfil

Un **evento** es una acción registrada en un momento específico, como `cart.abandoned`, `product.viewed`, `order.placed` o un evento personalizado de tu sistema.

Una **propiedad de perfil** es información guardada en el perfil de cliente, como nombre, ciudad, cumpleaños, talle preferido, estado de consentimiento o campos personalizados que recopilas.

Una **señal** es la idea más amplia: cualquier evento, propiedad, estado de canal, estado de conversación o contexto del negocio que Hellotext puede usar para entender al cliente y decidir qué hacer después.

## Cómo hacer disponibles las señales

Empieza conectando los sistemas donde viven tus datos.

Los pasos comunes incluyen:

- Conectar tu plataforma de comercio.
- Conectar WhatsApp, SMS u otro canal de mensajería.
- Agregar herramientas de captura para que los clientes puedan suscribirse.
- Instalar tracking o usar una integración que envíe eventos automáticamente.
- Usar Hellotext.js o la API si tienes actividad personalizada para enviar.
- Confirmar que la actividad aparezca en los perfiles de cliente antes de lanzar un playbook o campaña.

## Guías relacionadas

- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
