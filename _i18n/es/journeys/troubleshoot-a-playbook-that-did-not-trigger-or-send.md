Usa esta guía cuando un playbook no se comportó como esperabas.

Empieza con un perfil del cliente, un playbook y un momento específico. Los problemas amplios son mucho más fáciles de diagnosticar después de explicar un ejemplo concreto.

Si primero quieres entender el modelo general de decisión, lee [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Antes de cambiar algo

Reúne los datos primero:

- El nombre y tipo de playbook.
- El perfil del cliente que esperabas que entrara o recibiera un mensaje.
- La hora aproximada en que ocurrió la señal, mensaje o paso de ruta.
- La señal, intención, audiencia, disparador de ruta o mensaje del cliente que esperabas que iniciara el playbook.
- El canal que esperabas que Hellotext usara.
- Qué pasó realmente: nada, una demora, otro canal, una derivación u otro playbook.
- Cambios recientes en integraciones, tracking, configuración de canales, prompts, intenciones, conocimiento, ofertas o derivación.

No edites el prompt, intenciones, ruta o canales hasta saber qué parte del camino falló.

## 1. Identifica el tipo de playbook

Distintos playbooks fallan en distintos lugares.

| Tipo de playbook | Qué suele iniciarlo | Qué revisar primero |
| --- | --- | --- |
| Playbook activo de venta | Una señal de comercio o comportamiento | Señal, audiencia, elegibilidad del cliente, frecuencia, timing, datos de producto. |
| Playbook reactivo de atención | Un mensaje entrante del cliente | Canal de entrada, intención/alcance, conocimiento, reglas de derivación. |
| Agente personalizado | Una intención configurada o decisión de routing | Intenciones, canales de entrada, solapamiento con otros agentes, destino de derivación. |
| Ruta | Un disparador y condiciones de ruta | Disparador, esperas, condiciones, ramas, asignaciones, estado de detención/finalización. |
| Playbook tipo campaña | Una audiencia seleccionada y configuración de envío | Audiencia, preparación del canal, consentimiento, programación, validez del mensaje. |

Si se está usando el tipo de playbook incorrecto, el síntoma puede parecer un bug cuando en realidad hay una diferencia entre la misión y la configuración.

## 2. Confirma que el playbook esté habilitado

Abre **Playbooks** y revisa el estado del playbook.

Si el playbook está deshabilitado, no debería aceptar nuevos clientes o conversaciones elegibles. Habilítalo solo después de que las señales, canales, conocimiento y camino de derivación estén listos.

También confirma que estás mirando la versión correcta. Algunos playbooks pueden existir una sola vez para el negocio. Agentes personalizados y playbooks personalizados pueden tener varias versiones con nombres similares.

## 3. Si el playbook no se disparó

Usa esta sección cuando no hay evidencia de que el playbook haya empezado.

Revisa:

- La señal esperada existe en el perfil del cliente.
- La señal ocurrió después de configurar la integración, script, API o captura.
- El nombre y propiedades de la señal coinciden con lo que espera el playbook.
- El perfil del cliente coincide con la audiencia del playbook.
- El playbook está activo en el mismo negocio donde ocurrió la actividad.
- El disparador, condición o rama de la ruta coincide con el perfil.
- El mensaje entrante del cliente coincide con la intención o alcance de atención.
- Otro playbook o agente activo no tomó la conversación primero.

Si la señal no aparece en el perfil del cliente, detente acá y usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## 4. Si el playbook se disparó pero no envió

Usa esta sección cuando la señal o conversación existe, pero no se envió ningún mensaje.

Revisa:

- El perfil del cliente está suscrito o es elegible para el canal.
- El perfil no está bloqueado.
- El perfil tiene teléfono, WhatsApp, Instagram, Webchat u otra identidad requerida alcanzable.
- El canal está conectado, activo y disponible para ese cliente.
- El formato del mensaje funciona en el canal seleccionado.
- El playbook no alcanzó un límite de frecuencia o presión de contacto.
- El cliente no compró recientemente el producto o familia de productos que el playbook iba a recuperar o recomendar.
- El envío no fue bloqueado por horarios silenciosos, horario nocturno o reglas de timing.
- El playbook pudo construir un mensaje, producto, link, botón, plantilla o candidato de ruta válido.

Si consentimiento o contactabilidad no están claros, usa [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %}).

## 5. Si el playbook esperó

Una demora no siempre es una falla.

Algunos playbooks esperan porque:

- La ruta tiene un paso de espera.
- Aplican horarios silenciosos u horario nocturno.
- La zona horaria del negocio cambia qué hora local está permitida.
- El playbook espera un mejor momento de envío.
- Una ventana de conversación o respuesta no está disponible en este momento.
- Un mensaje anterior ya generó presión de contacto.

Revisa los pasos de la ruta, configuración de horarios del negocio y timeline del cliente antes de cambiar el playbook.

## 6. Si el playbook usó otro canal

Algunos playbooks pueden elegir entre canales disponibles.

Revisa:

- Qué canales de salida permite el playbook.
- Si el canal esperado está activo.
- Si el perfil del cliente es alcanzable en el canal esperado.
- Si el formato del mensaje, botones, medios, plantilla o ventana de conversación puede funcionar en ese canal.
- Si otro canal disponible era mejor para el cliente y el mensaje.

Para comportamiento específico de WhatsApp, usa [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %}).

## 7. Si el playbook derivó

Una derivación puede ser el resultado correcto.

Revisa si:

- El playbook tiene configuración de **Derivación**.
- Una ruta llegó a un paso de asignación.
- Un paso de IA no pudo resolver la conversación y pasó a asignación.
- Un agente personalizado coincidió con una intención pero llegó a sus límites.
- El cliente estaba enojado, reportó un producto defectuoso o necesitaba una persona.
- El Supervisor no encontró otro playbook activo para manejar la solicitud.
- La persona o equipo destino es correcto.

Si la derivación fue inesperada, revisa prompt, conocimiento, alcance, intenciones y destino de derivación. Para más detalle, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## 8. Si el agente respondió distinto a lo esperado

Si el playbook envió o respondió, pero el contenido estuvo mal, normalmente no es un problema de disparador.

Revisa:

- El prompt dice qué controla el agente y qué queda fuera de alcance.
- Los documentos de conocimiento están actualizados y no se contradicen.
- El agente tiene suficientes datos de producto, orden, devolución, envío o políticas.
- Tono y configuración de ofertas coinciden con el objetivo del negocio.
- El mensaje fue probado en Playground con lenguaje realista de clientes.
- La respuesta esperada pertenece a este playbook, no a otro playbook o equipo.

Para cambios más seguros, usa [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## 9. Revisa reportes y un timeline real

Usa reportes para entender patrones, pero usa un perfil del cliente real para diagnosticar.

Revisa:

- Timeline del perfil del cliente.
- Historial de conversación en Inbox.
- Reportes de playbooks.
- Actividad de campañas o rutas que pudo contactar al mismo perfil.
- Estado de entrega del canal.
- Actividad reciente de integración o tracking.
- Destino y dueño de la derivación.

Si muchos clientes muestran el mismo síntoma, corrige la causa compartida: integración, tracking, preparación del canal, audiencia, timing, frecuencia, prompt o configuración de derivación.

## Mapa rápido de síntomas

| Síntoma | Primer lugar donde mirar |
| --- | --- |
| Ningún cliente entró | Señal, audiencia, disparador, estado activo o condición de ruta. |
| La señal existe pero no envía | Consentimiento, contactabilidad, preparación del canal, frecuencia, timing o compra reciente. |
| El mensaje se envió más tarde | Paso de espera, horarios silenciosos, zona horaria u optimización de horario de envío. |
| Se usó otro canal | Disponibilidad del canal, alcance del cliente, formato del mensaje o prioridad de canal. |
| La conversación fue al Inbox | Configuración de derivación, paso de asignación, camino no resuelto de IA o routing del Supervisor. |
| El agente respondió mal | Prompt, conocimiento, alcance, datos de producto, prueba en Playground o dueño equivocado. |
| Los reportes se ven bajos | Rango de fechas, atribución, sincronización de eventos, entrega del canal o intentos omitidos/derivados. |

## Guías relacionadas

- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
