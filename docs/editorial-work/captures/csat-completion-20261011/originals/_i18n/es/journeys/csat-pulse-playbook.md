Usa esta guía cuando quieres que Hellotext pregunte a clientes si quedaron satisfechos después de resolver una conversación de soporte, Inbox, IA o misión.

Pulso CSAT es una misión de feedback posterior a una interacción. Envía una pregunta breve de satisfacción después de cerrar una conversación, registra la respuesta para Satisfacción del cliente en Calidad de servicio y puede derivar el feedback negativo a un colaborador cuando hay una derivación configurada.

No es una solicitud de reseña de producto ni una encuesta de lealtad de marca. Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) para reseñas de productos después de la entrega, y usa [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) cuando el objetivo es medir lealtad o probabilidad de recomendación.

## Qué hace Pulso CSAT

Pulso CSAT ayuda a medir si el cliente quedó satisfecho con una interacción resuelta.

Puede:

- Enviar una pregunta CSAT después de que una conversación se resuelve o cierra.
- Usar una respuesta simple de pulgar arriba o pulgar abajo por defecto.
- Registrar respuestas positivas y negativas de satisfacción.
- Evitar preguntar dos veces por la misma conversación.
- Respetar reglas de canal, consentimiento y elegibilidad de envío.
- Enviar un seguimiento después de una respuesta y derivar el feedback negativo cuando hay una derivación configurada.
- Aportar las respuestas recibidas a los porcentajes de CSAT de agentes de IA y CSAT de colaboradores en Calidad de servicio.

El objetivo es aprender si la interacción funcionó y recuperar rápido cuando no funcionó.

## Cuándo usarla

Usa Pulso CSAT cuando:

- Tu equipo cierra conversaciones de soporte o venta en el Inbox.
- Agentes de IA o misiones resuelven conversaciones y quieres feedback de satisfacción.
- Quieres comparar la satisfacción agregada de agentes de IA y colaboradores.
- Puedes asignar a un colaborador el seguimiento del feedback negativo cuando hay una derivación configurada.
- Tienes suficiente volumen de conversaciones para aprender de los resultados.

Funciona mejor después de un evento real de resolución. Si el cliente nunca tuvo una interacción significativa, no envíes una pregunta CSAT.

## Cómo convive con otros feedbacks

Pulso CSAT no reemplaza las demás misiones de feedback. Puedes tener [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) y [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) activos junto con Pulso CSAT cuando cada uno tiene su señal y responsable de seguimiento.

El motor de decisión de Hellotext los trata como momentos de feedback distintos. Pulso CSAT pregunta después de una conversación resuelta, Generador de Reseñas pide reseñas de producto después de la entrega y Pulso NPS mide lealtad de relación después de una experiencia de entrega.

Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) cuando el objetivo es recopilar una calificación de producto y una reseña escrita después de la entrega.

Usa [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) cuando el objetivo es medir lealtad o probabilidad de recomendar la marca.

Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) o un [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}) cuando el cliente todavía necesita una respuesta, no una encuesta de satisfacción.

Usa el Inbox directamente cuando el cliente está molesto, sigue esperando ayuda o la conversación no está realmente resuelta.

## Qué necesita antes de lanzarla

Antes de habilitar Pulso CSAT, confirma:

- Tu equipo tiene una forma clara de marcar conversaciones como resueltas o cerradas.
- El historial de conversación está disponible para que Hellotext pueda detectar si la interacción fue significativa.
- Los canales donde quieres pedir CSAT están conectados y son elegibles.
- Los perfiles de cliente tienen consentimiento para el canal.
- Tu equipo sabe quién revisa y da seguimiento al feedback negativo.
- Tu equipo sabe dónde revisar Satisfacción del cliente en Calidad de servicio y cómo dar seguimiento en las conversaciones de clientes.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Edita el mensaje CSAT

Abre **Misiones**, haz clic en **Explorar misiones** y elige **Pulso CSAT**.

Abre **Mensaje CSAT** para editar la pregunta que reciben los clientes después de resolver la conversación.

El mensaje CSAT por defecto es corto y conversacional, por ejemplo:

Antes de cerrar: ¿quedaste satisfecho con la ayuda? 👍 / 👎

Puedes adaptar el mensaje al tono de tu marca. Mantenlo breve y fácil de responder.

Evita hacer varias preguntas a la vez. CSAT funciona mejor cuando la primera respuesta es simple.

## Elige cuándo debería dispararse

El disparador es **al resolver**: Pulso CSAT envía después de que una conversación se marca como resuelta o cerrada.

Si el timing depende de productos entregados en lugar de una conversación resuelta, ese es un momento de [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}).

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

Cuando el cliente responde negativamente, Pulso CSAT registra la respuesta y envía un seguimiento. La respuesta y el motivo elegido, si lo hay, permanecen conectados a la conversación original. Si hay un componente de derivación configurado, también asigna la conversación para que un colaborador o equipo haga el seguimiento.

Para el comportamiento de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Revisa Satisfacción del cliente

En **Calidad de servicio**, **Satisfacción del cliente** muestra dos porcentajes agregados para el período seleccionado: **CSAT de agentes de IA** y **CSAT de colaboradores**. El porcentaje de colaboradores combina las conversaciones atendidas por una persona desde el inicio con las derivadas de IA a una persona. El período usa la fecha en que respondió el cliente.

Cada porcentaje se calcula como respuestas positivas divididas entre respuestas positivas más negativas. Cuando ambos períodos tienen datos, el panel compara el período seleccionado con el anterior.

No hay un reporte de resultados específico de Pulso CSAT en **Misiones**. El panel de Calidad de servicio no muestra tasa de respuesta, cantidades de respuestas, porcentajes separados de conversaciones solo con personas y con derivación, ni desgloses por canal, agente, equipo, intención o misión. Revisa las conversaciones individuales de clientes para consultar motivos negativos y el contexto del seguimiento. Consulta [Reporte de Calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %}) para conocer el reporte.

## Cómo probarla

Prueba con conversaciones resueltas realistas antes de habilitar Pulso CSAT ampliamente.

Prueba:

- Una conversación resuelta que debería recibir CSAT.
- Una conversación demasiado corta que no debería recibir CSAT.
- Una respuesta positiva.
- Una respuesta negativa con una derivación configurada para el seguimiento.
- Un canal fuera de su ventana de envío.
- Una conversación resuelta solo por IA.
- Una conversación resuelta por una persona.
- Una conversación que fue derivada de IA a una persona.

Confirma que la pregunta se envía solo cuando corresponde, las respuestas se registran correctamente, la derivación configurada llega al responsable correcto y los porcentajes de Calidad de servicio reflejan los casos respondidos en el período seleccionado.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- CSAT de agentes de IA y CSAT de colaboradores en Calidad de servicio para el período seleccionado.
- Ejemplos de preguntas y respuestas en las conversaciones de clientes, incluidos los motivos negativos.
- Si la derivación configurada llevó el feedback negativo al colaborador correcto.
- Señales en las conversaciones que revisas de que las preguntas se envían en el momento equivocado.

Ajusta una cosa por vez: texto del mensaje, proceso de resolución, preparación del canal o responsable del feedback negativo.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
