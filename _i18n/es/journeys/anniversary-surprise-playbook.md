Usa esta guía cuando quieres celebrar el aniversario de la primera compra del cliente y Hellotext conserva señales válidas para reconocer esa compra.

Sorpresa de Aniversario usa el aniversario de la primera compra registrada. Requiere que la señal de aniversario conserve su vínculo válido con la primera compra y su objeto de origen. Una fecha de creación del perfil, suscripción, membresía o propiedad personalizada no reemplaza esa compra.

No es un saludo de cumpleaños, una campaña estacional ni una reactivación de clientes inactivos. Es una misión para un momento anual de relación: celebrar que el cliente cumple otro ciclo con la marca.

La disponibilidad puede variar según cuenta, plan, fuentes de datos conectadas y estado de despliegue. Si la tarjeta aparece como a pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Sorpresa de Aniversario

Sorpresa de Aniversario puede convertir el aniversario de la primera compra en un mensaje de retención.

Puede:

- Usar el historial válido de primera compra del cliente como fuente del aniversario.
- Evaluar la señal de aniversario y su vínculo con la primera compra en la fecha correspondiente de la zona horaria del negocio.
- Enviar un mensaje de celebración con tono de agradecimiento o reconocimiento.
- Incluir un cupón aprobado o una oferta existente del eCommerce cuando el mensaje lo necesita.
- Personalizar el mensaje con datos del perfil del cliente, historial de compra o contexto de relación cuando esos datos están disponibles.
- Omitir perfiles cuando falta la fecha de aniversario, falta consentimiento, el canal no está listo o el perfil no puede ser alcanzado.

La configuración exacta puede variar según cuenta, tienda conectada, canal, plantillas, datos históricos y estado de despliegue.

## Cuándo usarla

Usa Sorpresa de Aniversario cuando tu marca quiere reconocer una relación existente, no cuando quieres empujar una compra sin contexto.

Encaja bien cuando:

- Tienes una primera compra registrada de forma confiable y vinculada al cliente.
- Celebrar el aniversario de esa primera compra tiene sentido para tu marca.
- El mensaje puede sentirse agradecido, personal y útil.
- El negocio quiere ofrecer un saludo o cupón aprobado sin crear campañas manuales.
- Tu equipo quiere sumar un momento de retención que no dependa de inactividad, carrito o cumpleaños.

Para cumpleaños personales, usa [Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %}). Para clientes que están fríos, usa [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) o [Último Intento]({% link _journeys/sunset-saver-playbook.md %}). Para fechas comerciales como feriados, lanzamientos o promociones puntuales, usa [Campañas]({% link _campaigns/campaigns-overview.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Sorpresa de Aniversario, confirma la calidad y procedencia de la primera compra registrada.

Revisa que:

- La primera compra conserve un evento válido de orden confirmada o producto comprado, su fecha y su objeto de origen.
- La señal de aniversario esté vinculada a esa primera compra y al mismo cliente.
- La fecha sea precisa y el aniversario coincida con el día correspondiente en la zona horaria del negocio.
- Los perfiles del cliente tengan identificadores confiables y consentimiento de canal.
- La audiencia que quieres alcanzar sea identificable y elegible.
- El canal, remitente o cuenta de WhatsApp esté listo.
- El mensaje o plantilla esté aprobado si el canal lo requiere.
- Si vas a incluir un cupón u oferta del eCommerce, esté aprobado y funcione antes del lanzamiento.
- El historial de compra y sus identificadores estén sincronizados; una propiedad de fecha aislada no crea el vínculo requerido.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Si importas perfiles, revisa [Importa perfiles del cliente]({% link _audience/import-customer-profiles.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, respuestas, bajas y mensajes omitidos.

## Qué puedes configurar

Abre **Misiones**, haz click en **Explorar misiones** y elige **Sorpresa de Aniversario**.

Las opciones disponibles pueden variar, pero revisa:

- **Datos de primera compra:** verifica el historial del que depende la misión; no asumas que existe un selector genérico de fechas.
- **Audiencia:** qué perfiles pueden recibir la misión.
- **Canales de salida:** dónde Hellotext puede enviar el mensaje.
- **Mensaje:** el texto de aniversario y las variables que usará.
- **Cupón u oferta:** el cupón aprobado o la oferta existente del eCommerce que se incluirá si corresponde.
- **Respuestas en Inbox:** cómo debería revisar tu equipo las respuestas si el cliente contesta.

La fuente verificada es la primera compra registrada. Importar una fecha al perfil o escribir otra fuente en instrucciones no cambia ese contrato.

Si necesitas una secuencia con pasos, condiciones o ramas propias, usa una ruta personalizada. Si necesitas un agente conversacional a medida, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

## Cómo elige Hellotext el momento

Sorpresa de Aniversario requiere una señal válida del aniversario de la primera compra.

Hellotext puede usar señales como:

- Primera compra registrada, con evento y objeto de origen conservados.
- Señal de aniversario cuyo año, fecha y vínculo coincidan con esa primera compra.
- Que esa compra siga siendo la primera registrada para el cliente.
- Si el perfil pertenece a la audiencia configurada.
- Si el perfil tiene consentimiento y puede recibir mensajes en el canal.
- Si el canal, remitente, plantilla y cupón están listos.
- Si reglas de frecuencia, consentimiento u horarios silenciosos permiten el envío.

Una señal válida de aniversario también debe pasar las comprobaciones de envío. Si termina el día del aniversario en la zona del negocio o cambia el historial de primera compra, la oportunidad puede dejar de ser válida.

Para el modelo general de decisión, mira [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con misiones cercanas

Usa el tipo de fecha o señal para decidir qué misión debería actuar.

| Momento del cliente | Mejor opción |
| --- | --- |
| Es el cumpleaños del cliente | [Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %}) |
| Es el aniversario elegible de la primera compra registrada | Sorpresa de Aniversario |
| El cliente empieza a enfriarse | [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) |
| El cliente cumple los criterios de la etapa de inactividad prolongada | [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) |
| El cliente cumple los criterios de riesgo de abandono | [Último Intento]({% link _journeys/sunset-saver-playbook.md %}) |
| Tienes una fecha comercial o lanzamiento puntual | [Campañas]({% link _campaigns/campaigns-overview.md %}) |

Sorpresa de Aniversario puede convivir con otras misiones cuando cada una responde a un momento distinto. Aun así, evita que el cliente reciba varios mensajes promocionales en el mismo momento si otra misión activa encaja mejor.

## Cómo probarla

Prueba con perfiles del cliente controlados antes de habilitarla para una audiencia amplia.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Confirma que la primera compra registrada sea la fuente de aniversario.
- Identifica un historial de primera compra válido y la señal de aniversario vinculada a él; una fecha añadida al perfil no basta.
- Confirma que la fecha aparece correctamente en Hellotext.
- Confirma que el perfil pertenece a la audiencia de la misión.
- Revisa el mensaje, variables, cupón y links.
- Prueba un perfil cuyo aniversario coincide con el momento esperado.
- Prueba un perfil con una fecha que no debería entrar todavía.
- Prueba un perfil sin consentimiento o sin canal alcanzable.
- Responde al mensaje de prueba y confirma que llega al Inbox o al responsable correcto si corresponde.

Si sincronizas historial desde una tienda o fuente propia, confirma fechas, identificadores y vínculo con el objeto de compra. Importar perfiles no demuestra que existan esos eventos.

## Por qué puede no enviar

Que la misión Sorpresa de Aniversario esté habilitada no significa que todos los perfiles reciban un mensaje.

La misión puede omitir o esperar cuando:

- No existe una señal válida de aniversario de primera compra.
- Falta el evento de primera compra, su objeto de origen o el vínculo con el cliente.
- La fecha no coincide con el aniversario en la zona del negocio, el día terminó o cambió el historial de primera compra.
- El perfil no pertenece a la audiencia configurada.
- El cliente no tiene consentimiento o no es elegible para el canal.
- El canal, remitente, plantilla, cupón o link no está listo.
- Reglas de frecuencia, consentimiento u horarios silenciosos impiden el envío.
- Otra misión activa encaja mejor para ese momento.

Para un diagnóstico paso a paso, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué perfiles generaron momentos de aniversario.
- Qué primera compra y señal de aniversario produjeron esos momentos.
- Qué mensajes se enviaron, omitieron, recibieron clicks, recibieron respuestas o generaron compras.
- Si el cupón o link funcionó correctamente.
- Si el tono se sintió agradecido y natural para la marca.
- Si hubo bajas, respuestas negativas o mensajes fallidos.
- Si Sorpresa de Aniversario se superpone con cumpleaños, campañas, reactivación u otras misiones de retención.

Revisa primero la calidad del historial de primera compra. Ajusta una cosa por vez: audiencia, canal, mensaje o cupón.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Importa perfiles del cliente]({% link _audience/import-customer-profiles.md %})
- [Personaliza mensajes con etiquetas]({% link _audience/personalization-tags.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Misión Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %})
- [Misión Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %})
- [Misión Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %})
- [Misión Último Intento]({% link _journeys/sunset-saver-playbook.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
