Usa esta guía cuando quieres medir si los clientes recomendarían tu marca después de recibir un pedido.

Pulso NPS es una misión de feedback de relación. Después de un evento de pedido entregado, programa una pregunta de recomendación de 1 a 10 y guarda el primer puntaje válido como promotor, pasivo o detractor.

No es una solicitud de reseña de producto ni una encuesta de satisfacción de soporte. Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) para reseñas de productos después de la entrega. Usa [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) para satisfacción después de una conversación resuelta de soporte, Inbox, IA o misión.

## Qué hace Pulso NPS

Pulso NPS ayuda a medir lealtad a nivel de relación.

Puede:

- Enviar una pregunta NPS después de un evento de pedido entregado reconocido por Hellotext.
- Preguntar qué tan probable es que el cliente recomiende la marca en una escala de 1 a 10.
- Aceptar respuestas rápidas cuando el canal las soporta, o un número escrito.
- Clasificar la respuesta como promotor, pasivo o detractor.
- Guardar el primer puntaje válido y su grupo.
- Evitar solicitudes NPS duplicadas para el mismo evento de entrega.
- Aplicar un intervalo de 90 días entre solicitudes NPS elegibles para el mismo cliente.

El objetivo es entender la lealtad hacia la marca después de que el cliente tuvo suficiente experiencia para evaluar el pedido, la entrega y la relación general.

## Cuándo usarla

Usa Pulso NPS cuando:

- Quieres medir lealtad o probabilidad de recomendación.
- Tienes señales confiables de pedido entregado.
- Quieres una señal simple de relación de 1 a 10, no una reseña de producto.
- Tu equipo quiere dar seguimiento a detractores.

Funciona mejor después de que el cliente recibió el pedido y tuvo un poco de tiempo para formarse una opinión.

## Cómo convive con otros feedbacks

Pulso NPS no reemplaza las demás misiones de feedback. Puedes tener [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}), [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) y Pulso NPS activos al mismo tiempo.

Un mismo evento de pedido entregado puede programar Pulso NPS y Generador de Reseñas por separado si ambas misiones están activas. Cada una aplica sus propias reglas de elegibilidad y envío.

Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) cuando necesitas calificaciones por producto y reseñas escritas.

Usa [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) cuando la pregunta es si una conversación de soporte, Inbox, IA o misión fue útil.

Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando el cliente está preguntando dónde está un pedido.

Usa el Inbox directamente cuando el cliente ya está molesto, pide ayuda o reporta un problema que no debería esperar un flujo de encuesta.

## Qué necesita antes de lanzarla

Antes de habilitar Pulso NPS, confirma:

- Las señales de pedido entregado son confiables y llegan a Hellotext.
- El perfil de cliente tiene un canal de mensajería elegible y consentimiento.
- Tu equipo tiene un proceso independiente para atender puntajes bajos.
- Las reseñas de producto y la satisfacción de soporte se manejan con sus propias misiones cuando haga falta.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Edita el mensaje NPS

Abre **Misiones**, haz clic en **Explorar misiones** y elige **Pulso NPS**.

<!-- nps-visual:header:start -->
La cabecera incluye el control para habilitar la misión. En móvil, el nombre se oculta y se conserva la pestaña **Configuración**. El ejemplo muestra la misión apagada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-nps-figure="header" aria-label="Cabecera del editor con la misión apagada; el nombre se oculta en la vista móvil. Cuenta ficticia.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 918px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/birthday-bash/header-es-mobile.png 2x" width="860" height="234" />
        <img class="ht-editorial-visual__image" src="/images/journeys/nps-pulse/header-es-desktop.png" srcset="/images/journeys/nps-pulse/header-es-desktop.png 2x" width="1800" height="194" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Cabecera del editor con la misión apagada; el nombre se oculta en la vista móvil. Cuenta ficticia." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Cabecera del editor con la misión apagada; el nombre se oculta en la vista móvil. Cuenta ficticia.</figcaption>
</figure>
<!-- nps-visual:header:end -->

<!-- nps-visual:cards:start -->
En **Configuración** encontrarás **Canales de salida**, **Mensaje de NPS** y **Audiencia**. La captura de escritorio muestra las tres tarjetas; la móvil muestra las dos primeras.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-nps-figure="cards" aria-label="Tarjetas Canales de salida, Mensaje de NPS y Audiencia; en móvil se muestran las dos primeras.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/nps-pulse/cards-es-mobile.png 2x" width="844" height="872" />
        <img class="ht-editorial-visual__image" src="/images/journeys/nps-pulse/cards-es-desktop.png" srcset="/images/journeys/nps-pulse/cards-es-desktop.png 2x" width="1256" height="1024" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tarjetas Canales de salida, Mensaje de NPS y Audiencia; en móvil se muestran las dos primeras." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Tarjetas Canales de salida, Mensaje de NPS y Audiencia; en móvil se muestran las dos primeras.</figcaption>
</figure>
<!-- nps-visual:cards:end -->

Abre **Mensaje de NPS** para editar la pregunta principal que reciben los clientes después de la entrega.

La pregunta por defecto es:

En una escala del 1 al 10, ¿qué tan probable es que nos recomiendes a un amigo o colega?

<!-- nps-visual:message:start -->
El formulario dice «cuando termina una conversación», pero Pulso NPS se programa a partir de un evento de pedido entregado. Cerrar una conversación no es el disparador de esta misión.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-nps-figure="message" aria-label="Pregunta NPS predeterminada y diez botones fijos del 10 al 1, sin seleccionar, en el editor de una cuenta ficticia.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/nps-pulse/message-es-mobile.png 2x" width="844" height="918" />
        <img class="ht-editorial-visual__image" src="/images/journeys/nps-pulse/message-es-desktop.png" srcset="/images/journeys/nps-pulse/message-es-desktop.png 2x" width="1256" height="894" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Pregunta NPS predeterminada y diez botones fijos del 10 al 1, sin seleccionar, en el editor de una cuenta ficticia." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Pregunta NPS predeterminada y diez botones fijos del 10 al 1, sin seleccionar, en el editor de una cuenta ficticia.</figcaption>
</figure>
<!-- nps-visual:message:end -->

Mantén la pregunta enfocada en recomendación. Si agregas demasiado contexto, los clientes pueden responder sobre una sola interacción de soporte o un solo producto en lugar de la relación general.

Puedes editar el texto de la pregunta. Los botones de puntaje del 1 al 10 son fijos.

<!-- nps-visual:channel:start -->
En **Canales de salida**, la opción automática conserva el texto **Todos los canales de entrada**. Esa selección no garantiza que un cliente tenga un canal elegible ni consentimiento para recibir la pregunta. **Selección manual** permite elegir canales específicos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-nps-figure="channel" aria-label="Canales de salida con la opción automática seleccionada y Selección manual disponible. Se conserva el texto nativo de canales de entrada.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/replenishment-driver/channel-es-mobile.png 2x" width="844" height="1252" />
        <img class="ht-editorial-visual__image" src="/images/journeys/replenishment-driver/channel-es-desktop.png" srcset="/images/journeys/replenishment-driver/channel-es-desktop.png 2x" width="1256" height="1028" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Canales de salida con la opción automática seleccionada y Selección manual disponible. Se conserva el texto nativo de canales de entrada." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Canales de salida con la opción automática seleccionada y Selección manual disponible. Se conserva el texto nativo de canales de entrada.</figcaption>
</figure>
<!-- nps-visual:channel:end -->

<!-- nps-visual:audience:start -->
En **Audiencia**, revisa a quién se aplicará la misión. El ejemplo mantiene **Toda la audiencia**; cada perfil todavía necesita una señal de entrega y elegibilidad de canal.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-nps-figure="audience" aria-label="Selector de audiencia con Toda la audiencia y el campo Agrega audiencias en una cuenta ficticia.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/birthday-bash/audience-es-mobile.png 2x" width="844" height="572" />
        <img class="ht-editorial-visual__image" src="/images/journeys/birthday-bash/audience-es-desktop.png" srcset="/images/journeys/birthday-bash/audience-es-desktop.png 2x" width="1256" height="456" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Selector de audiencia con Toda la audiencia y el campo Agrega audiencias en una cuenta ficticia." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selector de audiencia con Toda la audiencia y el campo Agrega audiencias en una cuenta ficticia.</figcaption>
</figure>
<!-- nps-visual:audience:end -->

## Entiende timing y elegibilidad

Pulso NPS se activa con un evento de pedido entregado, no con la compra. Si una integración informa la entrega de un envío, debe hacerlo mediante ese evento para activar la misión.

La programación parte de siete días después de la fecha del evento. La optimización del horario y el espaciado de mensajes pueden elegir un momento posterior.

Si no llega el evento de entrega, no se programa la pregunta. Un evento ya procesado no genera otra pregunta. Un nuevo intento puede omitirse cuando:

- Otro intento NPS para el cliente ocupa el intervalo de 90 días.
- El cliente queda fuera de la audiencia configurada.
- El cliente no es elegible para el canal.
- Consentimiento, política del canal, límites de envío u otras reglas de envío bloquean el mensaje.

Si un intento se omite, revisa la señal de entrega, la audiencia y la elegibilidad del canal antes de cambiar la misión.

## Entiende el puntaje

NPS usa una respuesta de 1 a 10.

Hellotext clasifica el puntaje así:

| Puntaje | Grupo |
| --- | --- |
| 9–10 | Promotor |
| 7–8 | Pasivo |
| 1–6 | Detractor |

El grupo describe el puntaje; por sí solo no explica el motivo de la respuesta.

Solo se guarda como puntaje NPS un número entero del 1 al 10, sin texto adicional. Pulso NPS no envía una petición automática para corregir una respuesta inválida.

## Qué ocurre después de la respuesta

La primera respuesta válida queda asociada al intento NPS con su puntaje y grupo. Las respuestas posteriores no sustituyen ese puntaje.

La misión no envía una segunda pregunta ni vincula una explicación escrita posterior como motivo del puntaje.

## Da seguimiento a detractores

Un puntaje de 1 a 6 se clasifica como detractor. Pulso NPS no crea por sí solo un caso de recuperación ni inicia una derivación específica al Inbox. Organiza por separado quién revisará esos puntajes y cómo hará el seguimiento.

## Entiende los datos NPS disponibles

La misión guarda el puntaje y el grupo en su registro interno. La vista actual de Misiones muestra métricas generales de desempeño, pero no incluye un reporte NPS con puntaje general, tasa de respuesta o distribución de grupos.

Como definición, el puntaje NPS es el porcentaje de promotores menos el porcentaje de detractores entre las respuestas válidas. Ese cálculo no aparece como indicador en la vista actual de Misiones.

## Cómo probarla

Prueba con escenarios realistas de pedidos entregados antes de habilitar Pulso NPS ampliamente.

Prueba:

- Un pedido entregado que debería recibir NPS.
- Un pedido sin evento reconocido de entrega que no debería activar Pulso NPS.
- Un puntaje promotor de 9 a 10.
- Un puntaje pasivo de 7 a 8.
- Un puntaje detractor de 1 a 6.
- Un número escrito en lugar de una respuesta rápida.
- Una respuesta inválida.
- Un cliente que no es elegible para el canal de mensajería elegido.

En un entorno de prueba, confirma que la pregunta se programa solo cuando corresponde, los puntajes válidos se guardan con el grupo correcto y una respuesta inválida no activa una segunda pregunta NPS.

## Qué revisar después del lanzamiento

Durante los primeros días, comprueba:

- Que la señal de pedido entregado llegue con la fecha esperada.
- Que la audiencia, el canal y el consentimiento permitan los envíos previstos.
- Que no se programe más de un intento para el mismo evento ni se repita la solicitud durante el intervalo de 90 días.
- Que tu equipo tenga un proceso independiente para atender respuestas con puntajes bajos.

Ajusta una cosa por vez: texto del mensaje, calidad de datos de entrega, preparación del canal o responsable del seguimiento de detractores.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
