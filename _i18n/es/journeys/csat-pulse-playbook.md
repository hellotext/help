Usa esta guía cuando quieres que Hellotext pregunte a clientes si quedaron satisfechos después de resolver una conversación de soporte, Inbox, IA o playbook.

Pulso CSAT es un playbook de feedback posterior a una interacción. Envía una pregunta breve de satisfacción después de cerrar una conversación, registra la respuesta para reportes CSAT y puede crear un camino de recuperación cuando el cliente responde negativamente.

No es una solicitud de reseña de producto ni una encuesta de lealtad de marca. Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) para reseñas de productos después de la entrega, y usa Pulso NPS cuando el objetivo es medir lealtad o probabilidad de recomendación.

## Qué hace Pulso CSAT

Pulso CSAT ayuda a medir si el cliente quedó satisfecho con una interacción resuelta.

Puede:

- Enviar una pregunta CSAT después de que una conversación se resuelve o cierra.
- Usar una respuesta simple de pulgar arriba o pulgar abajo por defecto.
- Registrar respuestas positivas y negativas de satisfacción.
- Evitar preguntar dos veces por la misma conversación.
- Respetar reglas de canal, consentimiento y elegibilidad de envío.
- Crear un camino de recuperación cuando el cliente responde negativamente.
- Asignar o derivar feedback negativo a la persona o equipo correcto.
- Alimentar reportes CSAT por canal, rango de fechas, camino de resolución, agente, intención o playbook cuando ese contexto está disponible.

El objetivo es aprender si la interacción funcionó y recuperar rápido cuando no funcionó.

## Cuándo usarlo

Usa Pulso CSAT cuando:

- Tu equipo cierra conversaciones de soporte o venta en el Inbox.
- Agentes de IA o playbooks resuelven conversaciones y quieres feedback de satisfacción.
- Quieres comparar resultados de conversaciones resueltas solo por IA, solo por personas o con derivación.
- Quieres que el feedback negativo cree un seguimiento en lugar de quedar solo en un reporte.
- Tienes suficiente volumen de conversaciones para aprender de los resultados.

Funciona mejor después de un evento real de resolución. Si el cliente nunca tuvo una interacción significativa, no envíes una pregunta CSAT.

## Cuándo no usarlo

No uses Pulso CSAT para todos los tipos de feedback.

Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) cuando el objetivo es recopilar una calificación de producto y una reseña escrita después de la entrega.

Usa Pulso NPS cuando el objetivo es medir lealtad o probabilidad de recomendar la marca.

Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) o un [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) cuando el cliente todavía necesita una respuesta, no una encuesta de satisfacción.

Usa el Inbox directamente cuando el cliente está molesto, sigue esperando ayuda o la conversación no está realmente resuelta.

## Qué necesita antes de lanzarlo

Antes de habilitar Pulso CSAT, confirma:

- Tu equipo tiene una forma clara de marcar conversaciones como resueltas o cerradas.
- El historial de conversación está disponible para que Hellotext pueda detectar si la interacción fue significativa.
- Los canales donde quieres pedir CSAT están conectados y son elegibles.
- Los perfiles de cliente tienen consentimiento para el canal.
- Tu equipo sabe quién revisa y da seguimiento al feedback negativo.
- Tu equipo sabe dónde revisar los resultados CSAT.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Edita el mensaje CSAT

Abre **Playbooks**, haz clic en **Explorar playbooks** y elige **Pulso CSAT**.

Abre **Mensaje CSAT** para editar la pregunta que reciben los clientes después de resolver la conversación.

El mensaje CSAT por defecto es corto y conversacional, por ejemplo:

Antes de cerrar: ¿quedaste satisfecho con la ayuda? 👍 / 👎

Puedes adaptar el mensaje al tono de tu marca. Mantenlo breve y fácil de responder.

Evita hacer varias preguntas a la vez. CSAT funciona mejor cuando la primera respuesta es simple.

## Elige cuándo debería dispararse

El disparador es **al resolver**: Pulso CSAT envía después de que una conversación se marca como resuelta o cerrada.

No uses Pulso CSAT como reemplazo del timing de reseñas de producto después de entrega. Si el timing depende de productos entregados, usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}).

## Entiende elegibilidad

Pulso CSAT debería preguntar solo cuando la interacción fue significativa.

Una pregunta puede omitirse cuando:

- La conversación no tuvo suficiente actividad del cliente.
- La misma conversación ya recibió una pregunta CSAT.
- El cliente no es elegible para el canal.
- El canal no puede enviar la pregunta de forma válida.
- Consentimiento, límites de envío u otras reglas de envío bloquean el mensaje.

Si una pregunta CSAT se omite por elegibilidad, no lo trates como una encuesta fallida. Significa que Hellotext evitó preguntar en un mal momento.

## Maneja respuestas positivas y negativas

Cuando el cliente responde positivamente, Pulso CSAT registra la respuesta.

Cuando el cliente responde negativamente, Pulso CSAT debería crear un camino de recuperación.

El feedback negativo puede:

- Reabrir la conversación o enviarla al Inbox para seguimiento.
- Crear un caso de recuperación para el equipo.
- Mantener el feedback conectado a la conversación original.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Revisa reportes CSAT

Los reportes CSAT ayudan a entender la satisfacción después de conversaciones resueltas.

Revisa:

- Porcentaje CSAT.
- Tasa de respuesta.
- Cantidad de respuestas positivas y negativas.
- Desglose por canal.
- Caminos de resolución: solo IA, solo persona o con derivación.
- Desglose por agente o equipo cuando esté disponible.
- Desglose por intención o playbook cuando esté disponible.
- Motivos de feedback negativo.
- Tendencias por rango de fechas.
- Links a conversaciones para seguimiento.

Para la respuesta de pulgar arriba/abajo, el porcentaje CSAT es respuestas positivas dividido entre respuestas positivas más negativas.

## Cómo probarlo

Prueba con conversaciones resueltas realistas antes de habilitar Pulso CSAT ampliamente.

Prueba:

- Una conversación resuelta que debería recibir CSAT.
- Una conversación demasiado corta que no debería recibir CSAT.
- Una respuesta positiva.
- Una respuesta negativa que debería crear un camino de recuperación.
- Un canal fuera de su ventana de envío.
- Una conversación resuelta solo por IA.
- Una conversación resuelta por una persona.
- Una conversación que fue derivada de IA a una persona.

Confirma que la pregunta se envía solo cuando corresponde, las respuestas se registran correctamente, el feedback negativo llega al responsable correcto y los reportes reflejan los casos de prueba.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Cuántas conversaciones resueltas fueron elegibles.
- Cuántas preguntas fueron enviadas, omitidas, entregadas y respondidas.
- Porcentaje CSAT y tasa de respuesta.
- Motivos de feedback negativo.
- Seguimiento de recuperación y velocidad de respuesta.
- Diferencias entre conversaciones solo IA, solo persona y con derivación.
- Diferencias por canal, equipo, agente, intención o playbook.
- Señales de que las preguntas se envían en el momento equivocado.

Ajusta una cosa por vez: texto del mensaje, proceso de resolución, preparación del canal o responsable del feedback negativo.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Playbook Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
