Usa esta guía después de elegir la primera misión que quieres lanzar.

Una misión debería habilitarse solo después de que las señales, canales, mensajes, conocimiento y reglas de derivación estén listos. Las tarjetas de configuración exactas varían según el tipo de misión y la cuenta, pero el patrón de lanzamiento es el mismo: configura la misión, prueba la experiencia, habilítala y revisa los primeros resultados.

Si todavía estás decidiendo qué lanzar, empieza por [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %}).

## Antes de empezar

Confirma primero lo básico:

- Tu tienda, sitio web, catálogo o fuente de datos está conectada cuando la misión depende de actividad de comercio.
- Las señales de cliente que necesita la misión aparecen en los perfiles de cliente.
- El canal que va a usar la misión está conectado y listo.
- La audiencia tiene consentimiento y es elegible para el canal.
- Una persona o equipo está listo para manejar derivaciones.
- Sabes qué reporte o vista del Inbox vas a usar para revisar los primeros resultados.

Si la misión depende de información de productos, órdenes, carrito, políticas o FAQs, asegúrate de que esa información esté actualizada antes de habilitarla.

## Abre la misión

Ve a **Misiones**, haz clic en **Explorar misiones** y elige la misión que quieres configurar.

Algunas misiones se pueden habilitar una sola vez para el negocio. Si ya habilitaste esa misión antes, Hellotext abre la configuración existente en lugar de crear una segunda copia.

Las misiones personalizadas y los [agentes personalizados]({% link _journeys/custom-agent-playbook.md %}) pueden permitir varias versiones. Dale a cada versión un nombre claro que explique su objetivo, audiencia o canal.

## Revisa las tarjetas de configuración

Cada misión muestra las tarjetas de configuración que corresponden a su objetivo.

Puedes ver tarjetas como:

- **Canales de entrada**, para los canales donde los clientes pueden contactar a la misión.
- **Canales de salida**, para los canales que la misión puede usar al enviar mensajes.
- **Prompt del agente**, para instrucciones que indican qué debe hacer el agente de IA y cómo debe responder.
- **Intenciones**, para intenciones de clientes que deberían activar un agente personalizado.
- **Conocimiento**, para FAQs, políticas, notas de producto o documentos que el agente puede usar.
- **Descuentos**, para reglas de oferta del eCommerce y límites máximos de descuento con IA.
- **Tono**, para la voz usada en respuestas generadas por IA.
- **Derivación**, para la persona o equipo que debería tomar la conversación cuando el agente necesita ayuda.
- **Búsqueda web**, para sitios aprobados donde el agente puede buscar información online.
- **[Configuración de Webchat]({% link _captures/webchat-widget-playbook.md %})**, para apariencia, comportamiento, secuencia, teaser y derivación cuando la misión es un webchat.

No necesitas cambiar todas las tarjetas. Cambia solo lo que afecta la experiencia del cliente, los permisos de la misión o el equipo que manejará excepciones.

## Configura canales

Elige dónde puede actuar la misión.

Para misiones de entrada, decide si deberían responder en todos los canales de entrada o solo en canales seleccionados como WhatsApp, Webchat, Instagram DM o SMS.

Para misiones de salida, confirma el canal de salida, remitente, cuenta de WhatsApp o requisitos de plantilla antes de habilitar la misión.

Si un canal no está listo, no habilites una misión que depende de él. Termina primero la configuración del canal.

## Configura el agente o la lógica de la ruta

Para misiones con IA y agentes personalizados, revisa:

- El prompt y las instrucciones del negocio.
- Las intenciones que deberían activar el agente.
- Conocimiento cargado, FAQs, políticas e información de productos.
- Tono y voz de marca.
- Reglas de derivación.
- Si el agente puede usar búsqueda web o acciones externas.

Para misiones tipo ruta, revisa:

- El disparador o señal que inicia la ruta.
- Mensajes, esperas, condiciones, ramas y asignaciones.
- Condiciones de detención y expectativas de frecuencia.
- Links, cupones, recomendaciones de producto y personalización.

Usa la configuración más pequeña que pueda demostrar que la misión funciona. Es más fácil ampliar una misión enfocada que diagnosticar una demasiado amplia.

## Prueba antes de habilitar

Usa la vista previa o playground de la misión cuando esté disponible.

Prueba:

- Un cliente que debería entrar a la misión.
- Un cliente que no debería entrar a la misión.
- El camino principal de éxito.
- Una respuesta o pregunta que la misión debería responder.
- Un caso que la misión debería derivar.
- Links, productos, ofertas y personalización.
- El camino de derivación al Inbox y el destino de asignación.

Para misiones con IA, prueba varios mensajes realistas. Confirma que el agente se mantenga dentro de alcance, use el conocimiento correcto y derive cuando corresponde.

## Guarda y habilita

Cuando la configuración esté lista, guarda la misión y enciende la opción **Habilitar esta misión**.

Después de habilitar una misión, Hellotext puede marcar su flujo como activo y los clientes que coincidan con las condiciones de la misión pueden empezar a entrar.

Habilitada no significa que cada señal coincidente vaya a enviar inmediatamente. Hellotext todavía revisa elegibilidad del perfil del cliente, preparación del canal, frecuencia, timing y reglas de derivación antes de cada envío. Para más detalle, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

Si necesitas detenerla, abre la lista de misiones y deshabilita la misión. Deshabilitarla evita que el flujo acepte nuevos clientes elegibles mientras revisas o editas la configuración.

## Observa la primera actividad

No la lances y te vayas.

Durante el primer día, revisa:

- Si entraron los perfiles de cliente correctos.
- Si se entregaron los mensajes esperados.
- Si las respuestas llegaron al Inbox.
- Si el agente respondió dentro de alcance.
- Si las derivaciones llegaron a la persona o equipo correcto.
- Si links, productos, descuentos y recomendaciones funcionaron.
- Si los reportes empezaron a mostrar actividad.

Si la misión toca ingresos o soporte, mantén la primera audiencia acotada hasta que el equipo revise las primeras conversaciones.

## Ajusta después del lanzamiento

Cambia una cosa por vez.

Ajustes comunes:

- Acotar la audiencia o disparador.
- Mejorar el prompt.
- Agregar o actualizar documentos de conocimiento.
- Cambiar la selección de canales.
- Actualizar tono o estrategia de oferta.
- Ajustar reglas de derivación.
- Corregir tracking, links, plantillas o datos de producto.

Después de cada cambio, dale suficiente actividad a la misión antes de comparar resultados de nuevo.

Para un proceso de edición más seguro, sigue leyendo: [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Guías relacionadas

- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
