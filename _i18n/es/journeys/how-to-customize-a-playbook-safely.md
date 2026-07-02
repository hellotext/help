Usa esta guía cuando un playbook ya está configurado y quieres adaptarlo sin cambiar por accidente cómo decide, responde o envía mensajes.

No todos los playbooks se personalizan igual. Algunos son agentes de IA autónomos, otros son playbooks activos de venta que envían o recomiendan según señales, otros son playbooks reactivos de atención que responden cuando un cliente escribe, y otros son rutas con pasos definidos. Antes de cambiar algo, identifica qué tipo de playbook estás editando y qué tarjetas de configuración están disponibles.

Si todavía no lanzaste el playbook, empieza por [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

Si el playbook está activo pero no envió, primero revisa [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}). La edición más segura depende de si el problema está en disparador, elegibilidad, preparación del canal, timing, derivación o contenido.

Si necesitas una lista de diagnóstico para un ejemplo, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}) antes de editar.

## Antes de editar

Abre **Playbooks**, elige el playbook y revisa sus tarjetas de configuración. Cada playbook muestra solo las partes que se pueden personalizar para ese caso.

Pregúntate según el tipo de playbook:

- Para un playbook activo de venta: ¿qué señal, audiencia o momento permite que Hellotext actúe?
- Para un playbook reactivo de atención: ¿qué tipo de consulta debería responder y cuándo debería derivar?
- Para un agente personalizado: ¿qué intenciones deberían activar este agente y qué debería quedar fuera?
- Para una ruta: ¿qué disparador, pasos, esperas, condiciones, ramas y asignaciones forman el flujo?
- Para cualquier playbook: ¿qué reporte, conversación del Inbox o prueba en Playground va a mostrar si el cambio funcionó?

No todos los playbooks tienen una regla visible de detención. En una ruta, sí puede haber condiciones de salida o pasos que terminan el flujo. En un agente de atención, la conversación puede terminar naturalmente si el cliente deja de responder o puede derivarse según reglas. En playbooks activos de venta, muchas reglas de elegibilidad, frecuencia o finalización son internas o están controladas por la lógica del playbook.

## Cuándo conviene deshabilitar

No necesitas deshabilitar un playbook por cada edición.

Normalmente puedes editar y probar sin deshabilitar cuando cambias:

- Tono.
- Documentos de conocimiento.
- Sitios de búsqueda web.
- Equipo de derivación.
- Ejemplos o aclaraciones pequeñas.

Considera deshabilitar temporalmente solo cuando el cambio pueda afectar a clientes en vivo mientras editas, por ejemplo:

- Estás cambiando el prompt de un playbook que lo permite y el agente podría responder de forma incorrecta.
- Estás cambiando intenciones de un agente personalizado.
- Estás modificando canales de entrada o salida.
- Estás cambiando descuentos, incentivos u ofertas.
- Estás editando una ruta con pasos, condiciones, ramas o asignaciones.

Para playbooks activos de venta, el riesgo depende de qué tarjeta estás cambiando. Muchos ajustes no afectan clientes inmediatamente, pero un cambio de prompt, oferta, canal o lógica de ruta sí merece prueba antes de volver a ampliar.

## Qué puedes personalizar

Usa esta tabla como mapa rápido:

| Si el playbook tiene... | Aplica normalmente a... | Qué cambia |
| --- | --- | --- |
| **Prompt del agente** | Agentes de IA, agentes personalizados y algunos playbooks autónomos | Misión, tono, límites y cuándo derivar. |
| **Intenciones** | Agentes personalizados y playbooks personalizados | Qué mensajes de clientes activan ese agente. |
| **Conocimiento** | Agentes de IA de venta o atención | Qué información usa el agente para responder. |
| **Canales de entrada/salida** | Playbooks que permiten selección de canales | Dónde puede responder o enviar mensajes. |
| **Descuentos** | Playbooks de venta que permiten ofertas | Qué incentivos puede usar el agente. |
| **Derivación** | Agentes de IA, atención, Webchat y algunos playbooks personalizados | Quién toma la conversación cuando el agente no debe seguir. |
| **Pasos de ruta** | Journeys o rutas | Secuencia, esperas, ramas, asignaciones y salida del flujo. |

Si una tarjeta no aparece en el playbook, no fuerces ese concepto en la configuración. Significa que esa parte no aplica o está manejada por la lógica del playbook.

## Personaliza el prompt

Esta sección aplica solo a playbooks que muestran la tarjeta **Prompt del agente**.

El prompt debería decirle al agente qué trabajo tiene, cómo debe hablar, qué información puede usar y cuándo debe derivar. No todos los playbooks tienen un prompt editable; muchos playbooks preconstruidos ya traen lógica interna.

Los buenos cambios de prompt son específicos:

- Describe la misión del agente en una o dos frases.
- Agrega tono de marca y palabras que debería evitar.
- Define qué puede recomendar, recopilar o responder.
- Indica cuándo debe hacer una pregunta de seguimiento.
- Indica cuándo debe derivar en lugar de adivinar.

Evita instrucciones amplias como "vende más", "responde todo" o "haz lo que ayude al cliente". Suenan útiles, pero hacen más difícil probar los límites del agente.

Para una estructura más profunda, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Personaliza intenciones

Esta sección aplica principalmente a agentes personalizados o playbooks personalizados que muestran la tarjeta **Intenciones**.

Las intenciones definen qué mensajes de clientes deberían activar ese agente. Un playbook preconstruido puede reaccionar a señales o mensajes sin que tengas que editar intenciones manualmente.

Usa lenguaje del cliente, no etiquetas internas. Por ejemplo, "quiero cambiar mi pedido" es más claro que "modificación post-compra".

Después de editar intenciones, prueba:

- Un mensaje que debería activar el agente.
- Un mensaje que no debería activarlo.
- Un mensaje ambiguo.
- Un mensaje que debería manejar otro playbook.
- Un mensaje que debería derivar al Inbox.

Si dos intenciones se solapan demasiado, el Supervisor puede tener más dificultad para elegir el agente correcto.

## Personaliza conocimiento

Esta sección aplica a playbooks con tarjeta **Conocimiento** o carga de documentos.

El conocimiento debería hacer que el agente responda con más precisión. No sirve para cambiar el tipo de playbook ni reemplaza una integración de tienda, catálogo u órdenes.

Antes de subir o reemplazar documentos:

- Elimina políticas desactualizadas, precios viejos, ofertas vencidas y FAQs duplicadas.
- Usa nombres de archivo claros para que tu equipo sepa qué controla cada documento.
- Mantén información de producto, orden, devolución, envío y garantía consistente con tu tienda.
- Evita documentos que contradicen el prompt.
- Define qué debe pasar cuando el agente no encuentra una respuesta.

Después de actualizar conocimiento, usa el Playground para hacer preguntas que dependan de la información cambiada.

## Personaliza canales

En general, deja la selección automática de canales si el playbook ya funciona bien. Muchos playbooks manejan canales automáticamente según el tipo de conversación, disponibilidad del cliente y configuración del negocio.

Cambia canales solo cuando tengas una razón clara:

- Quieres que un agente reactivo responda solo en ciertos canales.
- Un canal todavía no está listo.
- El tono o formato del playbook no funciona bien en un canal específico.
- Un playbook de salida necesita limitarse a WhatsApp, SMS u otro canal por estrategia.

Si cambias canales, prueba el mismo escenario en cada canal seleccionado. Algunos contenidos, botones, plantillas y ventanas de respuesta funcionan distinto según el canal.

## Personaliza ofertas y descuentos

Esta sección aplica a playbooks de venta que muestran configuración de **Descuentos** u ofertas.

Las ofertas afectan expectativas del cliente e ingresos, así que cámbialas con cuidado.

Antes de cambiar descuentos:

- Confirma si el playbook puede usar ofertas existentes de la tienda, incentivos de IA, ambos o ningún incentivo.
- Define máximos claros para cualquier oferta impulsada por IA.
- Evita acumular descuentos más allá de tus reglas de negocio.
- Prueba qué pasa cuando un cliente pide una mejor oferta.
- Revisa reportes después del cambio para confirmar que la oferta mejora el resultado correcto.

Si el playbook nunca debería ofrecer descuentos, déjalo explícito en la configuración de descuentos y, si existe, en el prompt.

## Personaliza derivación

Esta sección aplica a agentes de IA, playbooks de atención, Webchat y playbooks personalizados que muestran configuración de **Derivación**.

No todos los playbooks necesitan que definas reglas manuales. Algunos playbooks de atención derivan automáticamente cuando no pueden responder, cuando una regla lo indica o cuando la consulta necesita una persona. Algunos playbooks también pueden derivar si detectan enojo, producto defectuoso o una solicitud que no puede resolver el playbook activo.

Revisa:

- Si la conversación debería ir a una persona o a un equipo.
- Qué casos siempre deberían derivarse.
- Qué contexto debería dejar el agente para el equipo.
- Si el equipo del Inbox sabe que este playbook está activo.

Sigue leyendo: [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Personaliza journeys o rutas

Esta sección aplica a playbooks tipo **journey** o **ruta**.

Las rutas sí tienen pasos visibles y son sensibles a cambios de secuencia. Cuando edites una ruta, cambia una parte por vez:

- El disparador o señal inicial.
- El primer mensaje.
- Un paso de espera.
- Una condición o rama.
- Un paso de asignación.
- Una condición de salida o detención.
- Un cupón, link o recomendación de producto.

Si una ruta no tiene más pasos que ejecutar, el flujo termina. Si agregas condiciones o ramas, prueba tanto el camino esperado como el camino que no debería ejecutarse.

## Prueba según el tipo de playbook

Usa el Playground o vista previa cuando esté disponible.

Para un agente de IA, prueba lenguaje realista con errores, respuestas cortas, objeciones e intención poco clara.

Para un agente personalizado, prueba mensajes que deberían activar ese agente y mensajes que deberían ir a otro playbook.

Para un playbook activo de venta, prueba que las recomendaciones, ofertas, links y condiciones de elegibilidad sigan teniendo sentido.

Para una ruta, prueba un perfil de cliente que debería entrar, otro que no debería entrar y al menos una rama alternativa.

Para un playbook de atención, prueba una consulta que puede responder, una que debe derivar y una que debería quedar fuera de su alcance.

## Revisa después del cambio

Después de publicar el cambio, revisa los primeros resultados antes de hacer otro ajuste.

Busca:

- Derivaciones inesperadas.
- Preguntas repetidas sin respuesta.
- Respuestas fuera de alcance.
- Uso de descuentos demasiado agresivo o demasiado débil.
- Clientes entrando al playbook incorrecto.
- Cambios en conversión, ingresos, respuestas, bajas o tasa de derivación.

Si los resultados se mueven en la dirección equivocada, revierte primero el cambio más pequeño.

## Guías relacionadas

- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
