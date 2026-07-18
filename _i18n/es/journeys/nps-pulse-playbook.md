Usa esta guía cuando quieres medir si los clientes recomendarían tu marca después de recibir un pedido.

Pulso NPS es un playbook de feedback de relación. Hace una pregunta de recomendación de 0 a 10 después de un evento confiable de entrega, clasifica la respuesta como promotor, pasivo o detractor, hace una pregunta de seguimiento según el puntaje y ayuda a tu equipo a recuperar la experiencia cuando el puntaje es bajo.

No es una solicitud de reseña de producto ni una encuesta de satisfacción de soporte. Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) para reseñas de productos después de la entrega. Usa [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) para satisfacción después de una conversación resuelta de soporte, Inbox, IA o playbook.

## Qué hace Pulso NPS

Pulso NPS ayuda a medir lealtad a nivel de relación.

Puede:

- Enviar una pregunta NPS después de un pedido entregado o evento equivalente de entrega.
- Preguntar qué tan probable es que el cliente recomiende la marca en una escala de 0 a 10.
- Aceptar respuestas rápidas cuando el canal las soporta, o un número escrito.
- Clasificar la respuesta como promotor, pasivo o detractor.
- Hacer una pregunta de seguimiento según el puntaje.
- Guardar el puntaje, grupo y motivo para reportes.
- Crear un camino de recuperación cuando el cliente es detractor.
- Evitar solicitudes NPS duplicadas para el mismo evento de entrega.

El objetivo es entender la lealtad hacia la marca después de que el cliente tuvo suficiente experiencia para evaluar el pedido, la entrega y la relación general.

## Cuándo usarlo

Usa Pulso NPS cuando:

- Quieres medir lealtad o probabilidad de recomendación.
- Tienes señales confiables de pedido entregado o envío entregado.
- Quieres una señal simple de relación de 0 a 10, no una reseña de producto.
- Tu equipo quiere dar seguimiento a detractores.
- Tienes suficiente volumen de pedidos entregados para aprender tendencias en el tiempo.

Funciona mejor después de que el cliente recibió el pedido y tuvo un poco de tiempo para formarse una opinión.

## Cómo convive con otros feedbacks

Pulso NPS no reemplaza los demás playbooks de feedback. Puedes tener [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}), [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) y Pulso NPS activos al mismo tiempo.

El motor de decisión de Hellotext usa señales distintas para elegir qué corresponde en cada momento. Por ejemplo, puede pedir una reseña de producto después de la entrega, pedir CSAT después de una conversación resuelta y pedir NPS cuando el objetivo es medir lealtad o probabilidad de recomendación.

Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) cuando necesitas calificaciones por producto, reseñas escritas y registros exportables de reseñas.

Usa [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) cuando la pregunta es si una conversación de soporte, Inbox, IA o playbook fue útil.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando el cliente está preguntando dónde está un pedido.

Usa el Inbox directamente cuando el cliente ya está molesto, pide ayuda o reporta un problema que no debería esperar un flujo de encuesta.

## Qué necesita antes de lanzarlo

Antes de habilitar Pulso NPS, confirma:

- Las señales de pedido entregado o envío entregado son confiables.
- El perfil de cliente tiene un canal de mensajería elegible y consentimiento.
- Tu equipo sabe quién revisa las respuestas de detractores.
- Tu equipo sabe dónde revisar los resultados NPS.
- Las reseñas de producto y la satisfacción de soporte se manejan con sus propios playbooks cuando haga falta.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Edita el mensaje NPS

Abre **Playbooks**, haz clic en **Explorar playbooks** y elige **Pulso NPS**.

Abre **Mensaje NPS** para editar la pregunta principal que reciben los clientes después de la entrega.

La pregunta por defecto es:

En una escala de 0 a 10, ¿qué tan probable es que nos recomiendes a un amigo o colega?

Mantén la pregunta enfocada en recomendación. Si agregas demasiado contexto, los clientes pueden responder sobre una sola interacción de soporte o un solo producto en lugar de la relación general.

Pulso NPS usa preguntas de seguimiento según el puntaje después de que el cliente responde. Esas preguntas ayudan a entender por qué el cliente dio ese puntaje.

## Entiende timing y elegibilidad

Pulso NPS está pensado para enviarse después de la entrega, no inmediatamente después de la compra.

El timing por defecto es alrededor de 7 días después de un hito confiable de entrega.

Una pregunta puede omitirse cuando:

- Hellotext no tiene un hito de entrega para el pedido, envío o evento mapeado.
- La fecha de entrega falta o no es válida.
- El mismo evento de entrega ya recibió una solicitud NPS.
- El cliente no es elegible para el canal.
- Consentimiento, política del canal, límites de envío u otras reglas de envío bloquean el mensaje.

Si NPS se omite por elegibilidad, no lo trates como un playbook roto. Normalmente significa que Hellotext no tenía un momento seguro o útil para preguntar.

## Entiende el puntaje

NPS usa una respuesta de 0 a 10.

Hellotext clasifica el puntaje así:

| Puntaje | Grupo | Significado |
| --- | --- | --- |
| 9-10 | Promotor | El cliente probablemente recomendaría la marca. |
| 7-8 | Pasivo | El cliente está suficientemente satisfecho, pero no muestra lealtad fuerte. |
| 0-6 | Detractor | El cliente puede estar insatisfecho o en riesgo. |

Si el cliente responde algo que no es un número de 0 a 10, Pulso NPS pide un número válido una vez. Si la respuesta sigue siendo inválida, se detiene en lugar de entrar en un ciclo.

## Maneja respuestas de seguimiento

Después de un puntaje válido, Pulso NPS hace una pregunta de seguimiento según el grupo.

Para detractores, pregunta qué salió mal o qué podría mejorar.

Para pasivos, pregunta qué haría que la experiencia fuera un 9 o 10.

Para promotores, pregunta qué le gustó más al cliente.

La respuesta escrita se guarda con el resultado NPS para que tu equipo entienda el motivo detrás del puntaje.

## Da seguimiento a detractores

Los puntajes detractores necesitan atención.

Cuando un cliente da un puntaje de 0 a 6, Pulso NPS puede crear un camino de recuperación para que el equipo dé seguimiento.

El seguimiento de detractores puede:

- Llevar la conversación al Inbox.
- Crear un caso de recuperación para el equipo.
- Mantener el motivo conectado al puntaje NPS original.
- Ayudar a detectar problemas repetidos de entrega, producto, política o soporte.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Revisa reportes NPS

Los reportes NPS ayudan a entender lealtad en el tiempo.

Revisa:

- Puntaje NPS general.
- Tasa de respuesta.
- Cantidad de promotores, pasivos y detractores.
- Distribución de grupos en el tiempo.
- Motivos escritos por grupo.
- Seguimiento de recuperación de detractores.
- Diferencias por canal, rango de fechas, intención, playbook, campaña o fuente de entrega cuando esté disponible.

El puntaje NPS se calcula como porcentaje de promotores menos porcentaje de detractores.

## Cómo probarlo

Prueba con escenarios realistas de pedidos entregados antes de habilitar Pulso NPS ampliamente.

Prueba:

- Un pedido entregado que debería recibir NPS.
- Un pedido sin hito de entrega que no debería recibir NPS.
- Un puntaje promotor de 9 a 10.
- Un puntaje pasivo de 7 a 8.
- Un puntaje detractor de 0 a 6.
- Un número escrito en lugar de una respuesta rápida.
- Una respuesta inválida.
- Un cliente que no es elegible para el canal de mensajería elegido.

Confirma que la pregunta NPS se envía solo cuando corresponde, los puntajes válidos se guardan, el grupo correcto aparece en reportes, se envía una sola pregunta de seguimiento y los detractores llegan al proceso de recuperación correcto.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Cuántos pedidos entregados fueron elegibles.
- Cuántas preguntas fueron enviadas, omitidas, entregadas y respondidas.
- Puntaje NPS y tasa de respuesta.
- Distribución de promotores, pasivos y detractores.
- Temas comunes en los motivos escritos.
- Seguimiento de detractores y velocidad de respuesta.
- Señales de que la pregunta se envía antes de que el cliente tenga suficiente contexto de entrega.

Ajusta una cosa por vez: texto del mensaje, calidad de datos de entrega, preparación del canal o responsable del seguimiento de detractores.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Playbook Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Playbook Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
