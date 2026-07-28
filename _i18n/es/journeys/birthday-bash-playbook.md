Usa esta guía cuando tienes fechas de cumpleaños en los perfiles del cliente y quieres que Hellotext salude automáticamente en el día correcto con un mensaje o cupón aprobado.

Celebra su Cumpleaños es un playbook basado en una señal del perfil del cliente. Cuando Hellotext detecta que el cumpleaños de un perfil coincide con el día actual, puede iniciar el playbook y enviar un mensaje de cumpleaños por un canal elegible.

No es un agente autónomo de IA ni una campaña manual. Es un playbook preconstruido para un momento anual claro: saludar al cliente en su cumpleaños usando la fecha guardada en su perfil.

La disponibilidad puede variar según cuenta, plan, canales conectados y estado de despliegue.

## Qué hace Celebra su Cumpleaños

Celebra su Cumpleaños ayuda a convertir un dato del perfil en un momento de relación con el cliente.

Puede:

- Detectar perfiles del cliente cuyo cumpleaños coincide con el día y mes actuales.
- Crear un evento de cumpleaños para iniciar el playbook cuando está activo.
- Enviar un mensaje de cumpleaños con tono celebratorio.
- Incluir un cupón, regalo o incentivo aprobado cuando la configuración de oferta lo permite.
- Personalizar el mensaje con datos del perfil del cliente, como nombre o cumpleaños, si están disponibles.
- Omitir perfiles cuando falta la fecha de cumpleaños, falta consentimiento, el canal no está listo o el perfil no puede ser alcanzado.

El comportamiento exacto puede variar según cuenta, canal, plantillas, configuración de cupones y estado de despliegue.

## Cuándo usarlo

Usa Celebra su Cumpleaños cuando tu negocio quiere reconocer una fecha personal y ya tiene el dato necesario para hacerlo de forma confiable.

Encaja bien cuando:

- Los perfiles del cliente tienen cumpleaños con día y mes.
- El cumpleaños fue recopilado con consentimiento y una expectativa clara.
- El mensaje se siente natural para la marca.
- El negocio quiere ofrecer un saludo, beneficio o cupón especial sin crear una campaña manual cada día.
- Tu equipo quiere sumar un momento de retención que no dependa de inactividad o carrito.

No lo uses para reactivar clientes que están fríos. Para eso usa [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) o [Último Intento]({% link _journeys/sunset-saver-playbook.md %}) según el tiempo de inactividad.

Tampoco lo uses como sustituto de campañas estacionales o aniversarios de compra. Para una fecha comercial usa campañas; para aniversarios de relación o compra usa [Sorpresa de Aniversario]({% link _journeys/anniversary-surprise-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de habilitar Celebra su Cumpleaños, confirma que la señal de cumpleaños es confiable.

Revisa que:

- Los perfiles del cliente tengan una propiedad de cumpleaños.
- El cumpleaños incluya al menos día y mes.
- Los datos de cumpleaños se hayan importado, sincronizado o recopilado correctamente.
- La audiencia que quieres alcanzar tenga consentimiento para el canal.
- El canal, remitente o cuenta de WhatsApp esté listo.
- El mensaje o plantilla de cumpleaños esté aprobado si el canal lo requiere.
- Si vas a incluir un cupón o regalo, la regla de oferta esté aprobada y funcione antes del lanzamiento.
- La audiencia excluya perfiles que no deberían recibir mensajes promocionales.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Si importas perfiles, revisa [Importa perfiles del cliente]({% link _audience/import-customer-profiles.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después del lanzamiento, usa los reportes automáticos para revisar envíos, clicks, compras, ingresos atribuidos, respuestas, bajas y mensajes omitidos.

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Celebra su Cumpleaños**.

Las opciones disponibles pueden variar, pero normalmente revisas:

- **Canales de salida:** dónde Hellotext puede enviar el saludo.
- **Audiencia:** qué perfiles pueden recibir el playbook.
- **Mensaje:** el texto de cumpleaños y las variables que usará.
- **Cupón u oferta:** el cupón, regalo o incentivo aprobado que se incluirá si corresponde.
- **Respuestas en Inbox:** cómo debería revisar tu equipo las respuestas si el cliente contesta.

No hace falta crear una campaña manual para cada fecha. El playbook depende de la señal de cumpleaños del perfil y se ejecuta cuando el cumpleaños coincide con el día actual.

Si necesitas una secuencia con pasos, condiciones o ramas propias, usa una ruta personalizada. Si necesitas un agente conversacional a medida, usa [Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

## Cómo elige Hellotext el momento

Celebra su Cumpleaños parte del evento de cumpleaños del perfil del cliente.

Hellotext puede usar señales como:

- Día y mes del cumpleaños guardado en el perfil.
- Si el perfil pertenece a la audiencia configurada.
- Si el perfil tiene consentimiento y puede recibir mensajes en el canal.
- Si el canal, remitente, plantilla y cupón están listos.
- Si reglas de frecuencia, consentimiento u horarios silenciosos permiten el envío.

El año de nacimiento puede existir en el perfil, pero el disparador de cumpleaños necesita principalmente día y mes para saber cuándo saludar.

Para el modelo general de decisión, mira [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Cómo funciona con playbooks cercanos

Usa el tipo de momento para decidir qué playbook debería actuar.

| Momento del cliente | Mejor opción |
| --- | --- |
| Es el cumpleaños del cliente | Celebra su Cumpleaños |
| Es aniversario de compra o relación | [Sorpresa de Aniversario]({% link _journeys/anniversary-surprise-playbook.md %}) |
| El cliente empieza a enfriarse | [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) |
| El cliente lleva alrededor de 3 meses sin actividad | [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) |
| El cliente lleva alrededor de 12 meses sin actividad o sin reactivarse | [Último Intento]({% link _journeys/sunset-saver-playbook.md %}) |
| Quieres hacer un anuncio con fecha comercial | [Campañas y broadcasts]({% link _campaigns/campaigns-overview.md %}) |

Celebra su Cumpleaños puede convivir con otros playbooks porque su señal es una fecha del perfil. Aun así, evita que el cliente reciba varios mensajes promocionales en el mismo momento si otro playbook activo encaja mejor.

## Cómo probarlo

Prueba con perfiles del cliente controlados antes de habilitarlo para una audiencia amplia.

Usa perfiles del cliente de prueba que tengan consentimiento de canal, luego:

- Agrega un cumpleaños con día y mes al perfil de prueba.
- Confirma que la propiedad de cumpleaños aparece correctamente en el perfil.
- Confirma que el perfil pertenece a la audiencia del playbook.
- Revisa el mensaje, variables, cupón y links.
- Prueba un perfil cuyo cumpleaños coincide con hoy.
- Prueba un perfil con cumpleaños en otro día, que no debería entrar.
- Prueba un perfil sin consentimiento o sin canal alcanzable.
- Responde al mensaje de prueba y confirma que llega al Inbox o al responsable correcto si corresponde.

Si importas cumpleaños desde una tienda, CRM o archivo, confirma que el formato de fecha se interpreta bien antes de lanzar.

## Por qué puede no enviar

Que Celebra su Cumpleaños esté habilitado no significa que todos los perfiles reciban un mensaje.

El playbook puede omitir o esperar cuando:

- El perfil no tiene cumpleaños.
- El cumpleaños no tiene día o mes.
- La fecha no coincide con el día actual.
- El perfil no pertenece a la audiencia configurada.
- El cliente no tiene consentimiento o no es elegible para el canal.
- El canal, remitente, plantilla, cupón o link no está listo.
- Reglas de frecuencia, consentimiento u horarios silenciosos impiden el envío.
- Otro playbook activo encaja mejor para ese momento.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué perfiles generaron eventos de cumpleaños.
- Qué mensajes se enviaron, omitieron, recibieron clicks, recibieron respuestas o generaron compras.
- Si el cupón, link o regalo funcionó correctamente.
- Si el tono se sintió natural para la marca.
- Si hubo bajas, respuestas negativas o mensajes fallidos.
- Si Celebra su Cumpleaños se superpone con campañas, reactivación u otros playbooks de retención.

Ajusta una cosa por vez: audiencia, canal, mensaje, cupón, timing permitido o camino de derivación.

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
- [Playbook Sorpresa de Aniversario]({% link _journeys/anniversary-surprise-playbook.md %})
- [Playbook Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %})
- [Playbook Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %})
- [Playbook Último Intento]({% link _journeys/sunset-saver-playbook.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
