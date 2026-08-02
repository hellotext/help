Usa esta guía cuando quieres celebrar aniversarios de compra o relación con clientes, y Hellotext tiene una fecha confiable para saber cuándo corresponde enviar el mensaje.

Sorpresa de Aniversario es un playbook basado en una fecha del cliente o de su historial. Puede ayudar a reconocer momentos como el aniversario de una primera compra, el aniversario de relación con el negocio o una fecha personalizada, según la fuente de datos disponible en tu cuenta.

No es un saludo de cumpleaños, una campaña estacional ni una reactivación de clientes inactivos. Es un playbook para un momento anual de relación: celebrar que el cliente cumple otro ciclo con la marca.

La disponibilidad puede variar según cuenta, plan, fuentes de datos conectadas y estado de despliegue. Si la tarjeta aparece como a pedido o deshabilitada, confirma disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Qué hace Sorpresa de Aniversario

Sorpresa de Aniversario ayuda a convertir una fecha relevante del cliente en un mensaje de retención.

Puede:

- Usar una fuente de aniversario, como primera compra, creación del perfil, fecha de suscripción o una fecha personalizada, cuando esté disponible.
- Detectar cuándo el cliente llega a un aniversario según esa fuente.
- Enviar un mensaje de celebración con tono de agradecimiento o reconocimiento.
- Incluir un cupón aprobado o una oferta existente del eCommerce cuando el mensaje lo necesita.
- Personalizar el mensaje con datos del perfil del cliente, historial de compra o contexto de relación cuando esos datos están disponibles.
- Omitir perfiles cuando falta la fecha de aniversario, falta consentimiento, el canal no está listo o el perfil no puede ser alcanzado.

La configuración exacta puede variar según cuenta, tienda conectada, canal, plantillas, datos históricos y estado de despliegue.

## Cuándo usarlo

Usa Sorpresa de Aniversario cuando tu marca quiere reconocer una relación existente, no cuando quieres empujar una compra sin contexto.

Encaja bien cuando:

- Tienes una fecha confiable que representa la relación del cliente con el negocio.
- El aniversario tiene sentido para tu marca: primera compra, primer opt-in, creación del perfil, membresía o una fecha custom.
- El mensaje puede sentirse agradecido, personal y útil.
- El negocio quiere ofrecer un saludo o cupón aprobado sin crear campañas manuales.
- Tu equipo quiere sumar un momento de retención que no dependa de inactividad, carrito o cumpleaños.

Para cumpleaños personales, usa [Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %}). Para clientes que están fríos, usa [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) o [Último Intento]({% link _journeys/sunset-saver-playbook.md %}). Para fechas comerciales como feriados, lanzamientos o promociones puntuales, usa [Campañas]({% link _campaigns/campaigns-overview.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Sorpresa de Aniversario, confirma cuál será la fuente de aniversario.

Revisa que:

- La fuente de aniversario esté clara: primera compra, creación del perfil, opt-in, membresía o fecha personalizada.
- La fecha exista para los perfiles que quieres alcanzar.
- La fecha tenga suficiente precisión para calcular el aniversario.
- Los perfiles del cliente tengan identificadores confiables y consentimiento de canal.
- La audiencia que quieres alcanzar sea identificable y elegible.
- El canal, remitente o cuenta de WhatsApp esté listo.
- El mensaje o plantilla esté aprobado si el canal lo requiere.
- Si vas a incluir un cupón u oferta del eCommerce, esté aprobado y funcione antes del lanzamiento.
- Los datos de compra, perfil o propiedades personalizadas estén sincronizados si el aniversario depende de ellos.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Si importas perfiles o fechas personalizadas, revisa [Importa perfiles del cliente]({% link _audience/import-customer-profiles.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, respuestas, bajas y mensajes omitidos.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Sorpresa de Aniversario**.

Las opciones disponibles pueden variar, pero revisa:

- **Fuente de aniversario:** qué fecha inicia el playbook si la cuenta expone ese control.
- **Audiencia:** qué perfiles pueden recibir el playbook.
- **Canales de salida:** dónde Hellotext puede enviar el mensaje.
- **Mensaje:** el texto de aniversario y las variables que usará.
- **Cupón u oferta:** el cupón aprobado o la oferta existente del eCommerce que se incluirá si corresponde.
- **Respuestas en Inbox:** cómo debería revisar tu equipo las respuestas si el cliente contesta.

No asumas que todas las cuentas tienen la misma fuente de aniversario. Si el control no aparece, confirma con tu equipo de Hellotext qué fecha está usando el playbook antes de lanzar.

Si necesitas una secuencia con pasos, condiciones o ramas propias, usa una ruta personalizada. Si necesitas un agente conversacional a medida, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

## Cómo elige Hellotext el momento

Sorpresa de Aniversario debería partir de una fecha confiable, no de una campaña amplia.

Hellotext puede usar señales como:

- Fecha de primera compra, si el aniversario se basa en compra.
- Fecha de creación, suscripción, opt-in o membresía, si el aniversario se basa en relación.
- Una propiedad de fecha personalizada, si tu equipo la usa como aniversario.
- Si el perfil pertenece a la audiencia configurada.
- Si el perfil tiene consentimiento y puede recibir mensajes en el canal.
- Si el canal, remitente, plantilla y cupón están listos.
- Si reglas de frecuencia, consentimiento u horarios silenciosos permiten el envío.

El punto más importante es que tu equipo sepa qué fecha representa el aniversario. Dos negocios pueden usar fuentes distintas y aun así llamar al playbook Sorpresa de Aniversario.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el tipo de fecha o señal para decidir qué playbook debería actuar.

| Momento del cliente | Mejor opción |
| --- | --- |
| Es el cumpleaños del cliente | [Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %}) |
| Es aniversario de compra, relación, membresía o fecha personalizada | Sorpresa de Aniversario |
| El cliente empieza a enfriarse | [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) |
| El cliente lleva alrededor de 3 meses sin actividad | [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) |
| El cliente lleva alrededor de 12 meses sin actividad o sin reactivarse | [Último Intento]({% link _journeys/sunset-saver-playbook.md %}) |
| Tienes una fecha comercial o lanzamiento puntual | [Campañas]({% link _campaigns/campaigns-overview.md %}) |

Sorpresa de Aniversario puede convivir con otros playbooks cuando cada uno responde a un momento distinto. Aun así, evita que el cliente reciba varios mensajes promocionales en el mismo momento si otro playbook activo encaja mejor.

## Cómo probarlo

Prueba con perfiles del cliente controlados antes de habilitarlo para una audiencia amplia.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Confirma cuál es la fuente de aniversario que usará el playbook.
- Agrega o identifica una fecha de aniversario en el perfil o historial de compra.
- Confirma que la fecha aparece correctamente en Hellotext.
- Confirma que el perfil pertenece a la audiencia del playbook.
- Revisa el mensaje, variables, cupón y links.
- Prueba un perfil cuyo aniversario coincide con el momento esperado.
- Prueba un perfil con una fecha que no debería entrar todavía.
- Prueba un perfil sin consentimiento o sin canal alcanzable.
- Responde al mensaje de prueba y confirma que llega al Inbox o al responsable correcto si corresponde.

Si importas fechas desde una tienda, CRM o archivo, confirma que el formato se interpreta bien antes de lanzar.

## Por qué puede no enviar

Que Sorpresa de Aniversario esté habilitado no significa que todos los perfiles reciban un mensaje.

El playbook puede omitir o esperar cuando:

- No hay una fuente de aniversario configurada o disponible.
- El perfil no tiene la fecha necesaria.
- La fecha no coincide con el momento de aniversario esperado.
- El perfil no pertenece a la audiencia configurada.
- El cliente no tiene consentimiento o no es elegible para el canal.
- El canal, remitente, plantilla, cupón o link no está listo.
- Reglas de frecuencia, consentimiento u horarios silenciosos impiden el envío.
- Otro playbook activo encaja mejor para ese momento.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué perfiles generaron momentos de aniversario.
- Qué fuente de aniversario produjo esos momentos.
- Qué mensajes se enviaron, omitieron, recibieron clicks, recibieron respuestas o generaron compras.
- Si el cupón o link funcionó correctamente.
- Si el tono se sintió agradecido y natural para la marca.
- Si hubo bajas, respuestas negativas o mensajes fallidos.
- Si Sorpresa de Aniversario se superpone con cumpleaños, campañas, reactivación u otros playbooks de retención.

Ajusta una cosa por vez: fuente de aniversario, audiencia, canal, mensaje o cupón.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Elige tu primer playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Importa perfiles del cliente]({% link _audience/import-customer-profiles.md %})
- [Personaliza mensajes con etiquetas]({% link _audience/personalization-tags.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Playbook Celebra su Cumpleaños]({% link _journeys/birthday-bash-playbook.md %})
- [Playbook Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %})
- [Playbook Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %})
- [Playbook Último Intento]({% link _journeys/sunset-saver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
