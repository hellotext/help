Conecta Facebook Messenger cuando los clientes usan tu página de Facebook para consultar sobre productos, compras o soporte. Hellotext puede llevar las conversaciones elegibles de la página al Inbox para que tu equipo, las rutas y los playbooks compatibles respondan con contexto compartido.

Messenger en Hellotext está asociado a una página de Facebook. Es independiente de las conversaciones personales de Messenger y de la integración de Instagram.

## Para qué sirve mejor Facebook Messenger

Usa Messenger para:

- Consultas sobre productos y soporte enviadas a tu página de Facebook.
- Respuestas individuales desde el Inbox durante una conversación elegible.
- Respuestas rápidas, botones e interacciones postback compatibles.
- Rutas que envían mensajes, hacen preguntas, crean ramas o asignan una conversación activa.
- Playbooks que incluyen compatibilidad explícita con Messenger.
- Mantener el historial de conversaciones de la página disponible para el equipo en Hellotext.

Seguir una página no hace que un cliente quede disponible automáticamente en Messenger. El cliente primero debe crear una interacción elegible con la página para que Hellotext pueda responder mediante esa identidad asociada a la página.

## Conoce el alcance actual de la automatización

Messenger no tiene actualmente la misma cobertura de producto que WhatsApp o Instagram DM:

- No es una opción de envío en el creador de campañas.
- No está disponible actualmente en **Canales de entrada** para un agente de IA personalizado.
- Las rutas y los playbooks pueden usar Messenger solamente cuando ese flujo específico sea compatible.

No asumas que un playbook es compatible con Messenger porque funciona en otro canal. Revisa los canales que expone ese playbook y prueba el flujo completo de Messenger antes del lanzamiento.

## Antes de conectar Messenger

Confirma que:

- Tu negocio tenga la página de Facebook a la que quieres que escriban los clientes.
- Tengas una cuenta de Facebook con acceso de administrador a Meta Business Suite de la empresa y a la página.
- Puedas autorizar los permisos que Hellotext solicita para mensajería y webhooks de la página.
- La página no esté conectada a otro negocio de Hellotext.
- Tu equipo sepa quién debería recibir y responder las conversaciones de Messenger en el Inbox.

Hellotext actualmente conecta una página de Facebook por negocio de Hellotext. Una página de Facebook también puede estar conectada a un solo negocio de Hellotext a la vez.

Facebook Messenger e Instagram son integraciones separadas en Hellotext. Conectar una no conecta la otra.

## Conecta tu página de Facebook

1. En Hellotext, ve a **Configuración → Integraciones**.
2. Busca **Messenger** entre las integraciones de comunicación y selecciónala.
3. Revisa y confirma los requisitos de conexión.
4. Selecciona **Iniciar sesión con Facebook**.
5. Inicia sesión con la cuenta de Facebook que tiene acceso a la cuenta de Meta Business y a la página correctas.
6. Selecciona la página correcta y autoriza los permisos solicitados.
7. Vuelve a Hellotext y confirma que la página aparezca conectada.
8. Desde una cuenta personal de Facebook, envía un mensaje de prueba a la página y confirma que llegue al Inbox.

Si Hellotext indica que la página pertenece a otro negocio, elimínala de ese negocio de Hellotext antes de volver a intentarlo.

## Cómo empiezan las conversaciones de Messenger

Un cliente inicia una conversación elegible enviando un mensaje a la página de Facebook conectada o usando una interacción compatible de Messenger. Después, Hellotext:

1. Recibe la identidad de Messenger asociada a la página y el contenido compatible del mensaje.
2. Encuentra o crea el perfil del cliente correspondiente.
3. Agrega esa identidad de Messenger al perfil del cliente.
4. Abre o actualiza la conversación privada en el Inbox.
5. Deja la conversación disponible para el equipo, la ruta o el playbook compatible que la gestiona.

La identidad está asociada a la página de Facebook conectada. No es un identificador general de Facebook que pueda reutilizarse con otra página.

Los mensajes enviados directamente como la página conectada también pueden sincronizarse con la conversación de Hellotext. Esto mantiene el historial del Inbox alineado con la actividad compatible enviada desde Messenger o las herramientas de página de Meta.

## Entiende la ventana de mensajería

Meta aplica una ventana estándar de mensajería de 24 horas después de que el cliente escribe a la página. Cada nuevo mensaje elegible del cliente vuelve a abrir la ventana. Meta controla la elegibilidad final de la entrega incluso cuando la conversación sigue visible en Hellotext.

Hellotext no ofrece actualmente un flujo de campañas o plantillas utilitarias aprobadas para reiniciar una conversación cerrada de Messenger. Cuando la ventana estándar ya no está disponible, espera a que el cliente vuelva a escribir o continúa por otro canal solo cuando ese cliente sea elegible allí.

No uses otro canal para evitar las reglas de consentimiento o una conversación cerrada de Messenger. Cada destino debe cumplir sus propias reglas de disponibilidad y suscripción.

## Mensajes e interacciones compatibles con Hellotext

Hellotext puede procesar actividad compatible de Messenger, como:

- Mensajes de texto de hasta 2.000 caracteres.
- Imágenes, GIF, audios, videos y documentos PDF compatibles.
- Mensajes de voz y stickers.
- Respuestas a mensajes anteriores.
- Respuestas rápidas e interacciones de botones postback.
- Botones y tarjetas de productos creadas por playbooks o flujos de mensajes compatibles.
- Actividad de entrega, lectura, edición y reacciones cuando Meta la proporciona.

Los comentarios públicos de Facebook, las publicaciones de la página y las conversaciones enviadas a un perfil personal de Facebook no son conversaciones normales de Messenger para la página conectada en Hellotext. Prueba el punto de entrada exacto que planeas ofrecer a los clientes.

## Gestiona conversaciones de Messenger en el Inbox

Las conversaciones de Messenger usan el mismo modelo de responsables del Inbox que los demás canales compatibles. Tu equipo puede:

- Responder desde una conversación elegible de Messenger.
- Asignar o reasignar la conversación a una persona o equipo.
- Agregar contexto interno sin enviarlo al cliente.
- Aplicar reglas de respuesta para Messenger cuando el plan admite reglas específicas por canal.
- Cerrar la conversación cuando no se necesita otra acción.
- Continuar el trabajo cuando llega un nuevo mensaje elegible del cliente.

El contenido disponible en WhatsApp, Instagram o Webchat puede no tener la misma presentación o compatibilidad en Messenger. Revisa y prueba la versión de Messenger de los adjuntos, botones y tarjetas de productos que planeas usar.

Sigue leyendo: [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %}), [Asigna conversaciones]({% link _team/assigning-conversations.md %}) y [Tiempos y reglas de respuesta]({% link _team/understanding-response-times.md %}).

## Usa rutas y playbooks compatibles

Las rutas pueden usar Messenger mientras el cliente, la página y la conversación sigan siendo elegibles. Prueba pasos de mensaje y pregunta, ramas, respuestas y pasos de Asignación, incluyendo qué debería ocurrir cuando se cierre la ventana de Messenger o la integración deje de estar disponible.

Algunos playbooks pueden considerar Messenger cuando el cliente ya tiene una identidad disponible asociada a la página y ese playbook incluye compatibilidad con Messenger. El playbook igualmente evalúa la disponibilidad del canal, la compatibilidad del mensaje y la elegibilidad del proveedor antes de enviar.

Los agentes de IA personalizados no muestran actualmente Messenger en su selector de canales de entrada. No prometas atención con IA para una conversación de Messenger salvo que el playbook o la ruta exacta que configuraste sea compatible y lo hayas verificado de punta a punta.

Sigue leyendo: [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %}) y [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Perfiles del cliente y consentimiento

Una conversación entrante de Messenger puede agregar una identidad de Messenger asociada a la página al perfil del cliente. Esa identidad es específica de la página de Facebook conectada y no debería tratarse como número de teléfono, suscripción de WhatsApp o permiso para enviar marketing por otro canal.

Si el mismo cliente existe bajo otro perfil, revisa los datos antes de combinar los perfiles. Conserva la conversación, identificadores, propiedades e historial de compras correctos.

Respeta las solicitudes de baja y bloqueo. Que un cliente escriba a la página no otorga permiso ilimitado para futuros mensajes salientes.

Sigue leyendo: [Perfiles de clientes]({% link _audience/customer-profiles.md %}) y [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Precios y uso

Los mensajes de Facebook Messenger se incluyen en el cálculo de mensajes que no son SMS de Hellotext. El importe variable se convierte en el cargo de Hellotext solo cuando es mayor que el mínimo del plan, la tarifa por performance y el importe de SMS del período de facturación.

Revisa [Política de uso justo de mensajes]({% link _billing/fair-use-message-policy.md %}) para consultar la tarifa publicada vigente y el cálculo.

## Vuelve a autorizar o reemplaza la conexión

Messenger puede dejar de recibir o enviar mensajes si cambia el acceso a la página, se eliminan permisos, la página se desconecta de la cuenta de Meta Business o Meta invalida la autorización.

Primero confirma que la cuenta de Facebook todavía tenga acceso de administrador a la cuenta de Meta Business y a la página correctas. Si Hellotext debe volver a ser autorizado:

1. Ve a **Configuración → Integraciones**.
2. Busca la página conectada de Messenger.
3. Elimina la integración de Messenger.
4. Vuelve a seleccionar **Messenger** y repite el inicio de sesión con Facebook.
5. Selecciona la misma página y autoriza los permisos solicitados.
6. Envía un nuevo mensaje de prueba desde una cuenta personal de Facebook.

Eliminar la integración deshabilita su canal de Messenger. Confirma que tienes acceso a la página correcta antes de eliminarla y contacta a soporte cuando no esté claro cuál es el proceso de recuperación adecuado.

## Soluciona un mensaje de Messenger faltante o fallido

Si un mensaje entrante no aparece:

- Confirma que la página de Facebook correcta esté conectada en Hellotext.
- Envía un mensaje privado a la página desde una cuenta personal de Facebook.
- Revisa que la interacción sea un mensaje de Messenger y no un comentario público, publicación de la página, mensaje a un perfil personal o DM de Instagram.
- Confirma que la cuenta de Facebook y Hellotext todavía tengan los permisos requeridos de la página.
- Revisa si el perfil del cliente o la conversación están bloqueados.

Si una respuesta no se envía:

- Confirma que el cliente haya escrito a la página dentro de la ventana estándar de mensajería.
- Revisa que la integración y el canal de Messenger estén activos.
- Revisa el motivo exacto del error antes de reintentar.
- Confirma que el texto, tipo de adjunto y tamaño del adjunto sean compatibles con Messenger.
- Evita reintentos repetidos cuando Meta haya rechazado la página, el destino o estado de la conversación.

Consulta [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) para usar el checklist compartido de entrega.

## Checklist para el primer lanzamiento de Messenger

Antes de depender de Facebook Messenger, confirma que:

1. La página de Facebook correcta esté conectada al negocio de Hellotext correcto.
2. Un mensaje de prueba a la página cree o actualice el perfil del cliente correcto.
3. La conversación aparezca en el Inbox con la identidad de Messenger correcta.
4. La conversación llegue a la persona, equipo, ruta o playbook compatible esperados.
5. El texto, adjuntos, respuestas, botones y tarjetas de productos que planeas usar hayan sido probados.
6. La Asignación llegue a la persona o equipo correcto.
7. Tu equipo entienda la ventana de 24 horas y el proceso para volver a autorizar.

## Guías relacionadas

- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Fundamentos de Instagram DM]({% link _numbers/instagram-dm-fundamentals.md %})
- [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
- [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
