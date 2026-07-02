Usa esta guía cuando quieres que visitantes inicien una conversación desde tu sitio web.

Widget de Webchat es una entrada conversacional dentro del sitio. En Hellotext se configura como playbook y captura: controlas cómo aparece, cuándo se abre, qué dice primero y si los visitantes pueden continuar por otro canal como WhatsApp.

No es el agente de IA en sí. Piensa en el webchat como la puerta de entrada en tu sitio. Después de que una persona inicia una conversación, tu equipo, reglas del Inbox, playbooks con IA o agentes personalizados pueden manejar el siguiente paso según tu configuración.

## Qué hace Widget de Webchat

Widget de Webchat permite que clientes escriban a tu negocio directamente desde tu sitio.

Puede:

- Mostrar un lanzador en páginas seleccionadas del sitio.
- Abrirse cuando el visitante hace click en el lanzador o, si lo configuras, después de cargar la página.
- Mostrar un teaser corto antes de que la persona abra el chat.
- Empezar con una secuencia inicial configurada.
- Permitir que visitantes pidan ayuda, orientación sobre órdenes, recomendaciones de producto o soporte.
- Enviar la conversación al Inbox cuando una persona necesita responder.
- Continuar por WhatsApp cuando la derivación de canal está configurada.
- Trabajar junto con playbooks de IA, playbooks de atención, agentes personalizados, rutas y reglas de respuesta.

Webchat funciona mejor cuando el sitio necesita una forma simple para que visitantes hagan preguntas sin salir de la página.

## Cuándo usarlo

Usa Widget de Webchat cuando:

- Los visitantes suelen necesitar ayuda antes de comprar.
- Tu equipo quiere una entrada de chat visible en la tienda.
- Quieres que preguntas de recomendación, soporte u órdenes empiecen desde el sitio.
- Quieres invitar a visitantes a una conversación sin depender solo de SMS, WhatsApp o redes sociales.
- Quieres que las conversaciones lleguen al Inbox con el proceso correcto del equipo.
- Quieres ofrecer continuidad por WhatsApp después de que la persona empieza en el sitio.

Es especialmente útil combinado con playbooks de atención, [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}), [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) o un [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) enfocado.

## Cuándo no usarlo

No uses Widget de Webchat como reemplazo de todos los demás playbooks.

Usa una [campaña]({% link _campaigns/campaigns-overview.md %}) cuando necesitas un anuncio puntual a una audiencia seleccionada.

Usa una [ruta]({% link _journeys/getting-started-with-journeys.md %}) cuando la experiencia del cliente debe seguir pasos, esperas, condiciones y asignaciones explícitas.

Usa un playbook de producto o soporte con IA cuando el trabajo principal es el razonamiento del agente, no la entrada desde el sitio. Webchat puede iniciar la conversación, pero el agente igual necesita misión, conocimiento y reglas de derivación propias.

Usa opt-in de checkout, formularios, códigos QR o links compartibles cuando el trabajo principal es recopilar consentimiento o datos del perfil en vez de iniciar un chat en el sitio.

## Qué necesita antes de lanzarlo

Antes de habilitar Widget de Webchat, confirma:

- Tu sitio web o plataforma de comercio está conectada, o sabes qué método de instalación vas a usar.
- Hellotext.js, la instalación automática en Shopify o VTEX, o el camino del plugin de WooCommerce está listo para tu sitio.
- Los dominios permitidos incluyen el sitio donde debería cargar el widget, si tu cuenta restringe webchat, popups y formularios por dominio.
- El equipo sabe quién se hace cargo de las nuevas conversaciones de webchat en el Inbox.
- El mensaje inicial explica qué puede preguntar el visitante.
- La derivación a WhatsApp está configurada si quieres que visitantes continúen por ese canal.
- Cualquier playbook con IA o agente personalizado que debería responder conversaciones de webchat está listo.
- Las reglas de respuesta y el horario comercial coinciden con el nivel de servicio que quieres para webchat.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Widget de Webchat**.

Las tarjetas disponibles pueden variar, pero Widget de Webchat normalmente incluye:

- **Apariencia:** color de marca, tipografía, lanzador, encabezado, colores de conversación, logo y marca Hellotext.
- **Comportamiento:** ubicación, apertura por click o apertura automática, demora, comportamiento de primera visita y una vez por sesión.
- **Secuencia inicial:** los primeros mensajes que se muestran en una nueva conversación de webchat.
- **Teaser:** la invitación pequeña que aparece antes de que la persona abra el chat.
- **Canales o derivación:** si se muestra WhatsApp, si se restringe la continuación a WhatsApp y qué número de WhatsApp se muestra.
- **Instalación:** opciones de instalación automática o instrucciones manuales.

No necesitas personalizar todas las tarjetas. Empieza por las que definen la experiencia del visitante: apariencia, comportamiento, secuencia inicial y derivación.

## Diseña la apariencia

El widget debería sentirse parte de tu sitio, pero seguir siendo fácil de encontrar.

Revisa:

- Color del lanzador, color de texto, notificación e ícono.
- Encabezado, nombre del negocio, logo y colores.
- Fondo de conversación y colores de burbujas.
- Colores de botones y carruseles cuando aparezcan.
- Si tu plan permite remover la marca Hellotext.

Prueba en desktop y mobile. El lanzador no debería tapar botones de checkout, agregar al carrito, links de soporte, banners de cookies u otros controles importantes del sitio.

## Elige el comportamiento con cuidado

Para un primer lanzamiento, usa apertura por click salvo que tengas una razón clara para abrirlo automáticamente.

La apertura automática puede aumentar visibilidad, pero también puede interrumpir la navegación. Si la usas, elige una demora corta y considera limitarlo a primera visita o una vez por sesión para que el widget no se abra repetidamente para la misma persona.

La ubicación importa. Abajo a la derecha suele ser familiar para visitantes, pero usa la posición que no choque con el layout de tu tienda, navegación mobile o controles de checkout.

## Escribe la secuencia inicial

La secuencia inicial debería ayudar al visitante a elegir qué hacer después.

Hazla corta:

- Da la bienvenida.
- Nombra las principales cosas que puede preguntar.
- Ofrece uno o dos caminos útiles, como ayuda con una orden, recomendación de producto o hablar con una persona.
- Evita textos largos de política en el primer mensaje.

Los buenos mensajes iniciales son suficientemente específicos para orientar al visitante sin prometer que el webchat puede resolver todo por sí solo.

Si un playbook con IA o agente personalizado va a responder después de que empieza la conversación, asegúrate de que la secuencia inicial coincida con el alcance real de ese agente.

## Usa el teaser con intención

El teaser es el mensaje pequeño que invita al visitante a abrir el chat.

Úsalo para que el chat se sienta útil:

- "¿Necesitas ayuda con el talle?"
- "¿Quieres una recomendación de producto?"
- "¿Tienes una pregunta sobre tu orden?"
- "¿Necesitas ayuda antes de pagar?"

Evita textos que se sientan como un popup forzado o una promesa que tu equipo no puede cumplir.

Si usas una secuencia de teaser personalizada, prueba el camino completo desde teaser hasta mensaje inicial para que el texto no se repita.

## Configura la derivación de canal

Webchat puede derivar o continuar la conversación por otro canal, normalmente WhatsApp.

Usa continuidad por WhatsApp cuando:

- Los clientes pueden salir del sitio antes de que tu equipo responda.
- Tu equipo prefiere continuar conversaciones largas en WhatsApp.
- Los visitantes mobile tienen más probabilidad de responder desde WhatsApp que desde el navegador.
- Quieres que el visitante vea un número específico de WhatsApp del negocio.

Ten cuidado con restringir la comunicación solo a WhatsApp. Usa esa opción cuando webchat debería funcionar principalmente como puerta hacia WhatsApp, no cuando quieres que visitantes sigan respondiendo en el sitio.

Si las conversaciones deberían asignarse a una persona o equipo, configura el camino de ownership en Inbox y revisa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Instala y prueba

Usa la opción de instalación que coincide con tu sitio:

- Instalación automática en Shopify.
- Instalación automática en VTEX.
- Instalación manual en un sitio con Hellotext.js.
- Instalación manual en WooCommerce con el plugin de Hellotext.

Después prueba el sitio exacto donde debería aparecer el widget.

Revisa:

- El widget carga solo en dominios permitidos y páginas esperadas.
- El lanzador, teaser y secuencia inicial aparecen correctamente.
- La apertura por click o automática se comporta como configuraste.
- La demora, primera visita y una vez por sesión funcionan como esperas.
- Los mensajes llegan al Inbox.
- La asignación, ownership de equipo y reglas de respuesta se comportan como esperas.
- La derivación o continuidad por WhatsApp usa el número correcto.
- Cualquier playbook con IA o agente personalizado conectado responde solo dentro de su alcance.
- El widget funciona en desktop y mobile sin tapar controles importantes del sitio.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué páginas inician más conversaciones de webchat.
- Si los visitantes entienden la secuencia inicial.
- Si el teaser atrae conversaciones útiles o genera ruido.
- Si las conversaciones se responden suficientemente rápido.
- Si las derivaciones llegan a la persona, equipo o número de WhatsApp correcto.
- Si los playbooks con IA responden correctamente o derivan cuando corresponde.
- Preguntas repetidas que sugieren crear Respuestas Instantáneas, un Agente Personalizado, mejor contenido de políticas o mejor copy en el sitio.
- Opt-ins, órdenes, ingresos atribuidos, salud de respuesta y respuestas perdidas cuando aplique.

Ajusta una parte por vez: ubicación, disparador, demora, teaser, secuencia inicial, derivación o el playbook que responde después de que empieza la conversación.

## Guías relacionadas

- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
