Tiempo de respuesta ayuda a tu equipo a entender qué tan rápido reciben respuesta los clientes y qué conversaciones necesitan atención primero.

Las reglas de respuesta definen los tiempos que Hellotext usa para decidir si una espera está al día, en riesgo, demorada o vencida.

La salud de respuesta está separada del ciclo de la conversación. Una conversación asignada o sin asignar puede necesitar atención mientras permanece abierta. Sigue leyendo: [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %}).

> Las reglas de respuesta están disponibles en los planes Pro y Enterprise.

## Qué son las reglas de respuesta

Una regla de respuesta define dos tiempos:

- Primera respuesta a nuevas conversaciones: tiempo máximo para responder el primer mensaje de un cliente en una conversación nueva.
- Respuestas posteriores: tiempo máximo para responder después de que el cliente envía un nuevo mensaje en una conversación ya activa.

Hellotext usa estos tiempos para mostrar la salud de respuesta en conversaciones, equipos, colaboradores y reportes. Son objetivos internos de atención: no prometen una entrega, una resolución ni disponibilidad continua del equipo.

La figura muestra la **Política de respuesta predeterminada** de una cuenta ficticia, con **5 minutos** para ambas fases. Son valores existentes de esta demostración, no una recomendación universal; el formulario se abrió sin cambiar ni guardar nada. El encabezado y los dos campos aparecen completos; el pie de guardado se omite.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Política de respuesta predeterminada real, con dos objetivos existentes de 5 minutos en una cuenta ficticia; sin cambios ni guardado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 504px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/default-es-mobile.png 2x" width="824" height="844" />
        <img src="/images/team/understanding-response-times/default-es.png" srcset="/images/team/understanding-response-times/default-es.png 2x" style="width: auto; margin: 0 auto;" width="972" height="820" loading="lazy" decoding="async" alt="Política de respuesta predeterminada real, con dos objetivos existentes de 5 minutos en una cuenta ficticia; sin cambios ni guardado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Política de respuesta predeterminada real, con dos objetivos existentes de 5 minutos en una cuenta ficticia; sin cambios ni guardado.</figcaption>
</figure>

## Cómo funcionan

Cuando un cliente envía un mensaje que requiere atención, Hellotext inicia un temporizador de respuesta.

La primera espera de un nuevo período de conversación usa **Primera respuesta a nuevas conversaciones**. Los siguientes turnos del cliente usan **Respuestas posteriores**. La fase depende del período de conversación que abrió el mensaje, no de si esa persona recibió alguna respuesta en toda su historia. Un mensaje clasificado como respuesta automática o como actividad que no abre una obligación de respuesta puede no iniciar un temporizador.

Mientras una fase tiene un temporizador activo, otros mensajes del cliente no lo reinician: forman parte de esa misma espera. No interpretes cada mensaje como un nuevo plazo completo.

Una respuesta de atención registrada puede cerrar la espera: un mensaje de una persona, una misión, una ruta o un agente de IA que el sistema reconoce como respuesta de atención. Una reacción de un colaborador a un mensaje recibido también puede contar. El registro usa el momento en que se creó la respuesta, con actualización en segundo plano; no espera el acuse de entrega del proveedor. Cumplir este objetivo no demuestra que el cliente leyó el mensaje.

Si la respuesta llega dentro del límite, el objetivo se cumple. Si llega después, se registra cuándo se respondió y se conserva el incumplimiento; responder tarde no borra el resultado anterior.

Cuando la IA deriva a una persona, puede existir además una espera de **respuesta humana** desde la derivación, con el objetivo de Respuestas posteriores. Esa obligación necesita un mensaje o una reacción humana: otra respuesta de IA o automatización no la satisface.

Las notas internas, borradores, campañas y actividad interna del sistema no cuentan como respuestas. Cerrar o posponer una conversación tampoco equivale a responder ni cancela por sí solo su espera SLA. Asignación, lectura, atención y respuesta son estados distintos.

## Horario comercial

Los tiempos de respuesta respetan el Horario comercial configurado.

Si un cliente escribe durante el horario abierto, el tiempo empieza a contar en ese momento. Si escribe fuera del horario comercial, el tiempo empieza a contar cuando el negocio vuelve a abrir.

Si un límite cruza un período cerrado, el tiempo restante continúa contando cuando el negocio vuelve a abrir. El calendario usa la **zona horaria del negocio**. Si no hay ningún día abierto configurado, el cálculo recurre al tiempo continuo; marcar toda la semana como cerrada no suspende indefinidamente los objetivos.

Ejemplo conceptual: con apertura de 09:00 a 18:00 y un objetivo de 10 minutos, un mensaje del viernes a las 17:57 consume 3 minutos ese día y los 7 restantes el lunes desde las 09:00, si el fin de semana está cerrado. No es un resultado de una conversación capturada.

La cuenta ficticia de la figura tiene lunes a viernes de **9am a 6pm** y sábado y domingo **Cerrado**. Son horarios existentes de la demostración, consultados sin editar. La lista completa permite reconocer los siete días y la pestaña **Horario comercial**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Horario comercial real de cuenta ficticia: lunes a viernes de 9am a 6pm, sábado y domingo Cerrado; siete filas completas, sin editar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/hours-es-mobile.png 2x" width="828" height="1608" />
        <img src="/images/team/understanding-response-times/hours-es.png" srcset="/images/team/understanding-response-times/hours-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="1784" loading="lazy" decoding="async" alt="Horario comercial real de cuenta ficticia: lunes a viernes de 9am a 6pm, sábado y domingo Cerrado; siete filas completas, sin editar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Horario comercial real de cuenta ficticia: lunes a viernes de 9am a 6pm, sábado y domingo Cerrado; siete filas completas, sin editar.</figcaption>
</figure>

Al abrir **Lunes**, el formulario muestra **Abierto**, **Abre a las 09:00** y **Cierra a las 18:00**. No se tocó el interruptor, se eligieron horas ni se guardó. Configura cada día abierto con una hora de cierre posterior a la apertura en ese mismo día; el formulario no representa un turno que cruza medianoche. Se muestra el encabezado y los controles completos, sin el pie de guardado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Formulario real Lunes con Abierto activado y horas existentes 09:00–18:00 en cuenta ficticia; sin cambios ni guardado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 504px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/weekday-es-mobile.png 2x" width="824" height="840" />
        <img src="/images/team/understanding-response-times/weekday-es.png" srcset="/images/team/understanding-response-times/weekday-es.png 2x" style="width: auto; margin: 0 auto;" width="972" height="840" loading="lazy" decoding="async" alt="Formulario real Lunes con Abierto activado y horas existentes 09:00–18:00 en cuenta ficticia; sin cambios ni guardado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario real Lunes con Abierto activado y horas existentes 09:00–18:00 en cuenta ficticia; sin cambios ni guardado.</figcaption>
</figure>

## Política predeterminada y reglas por canal

Cada negocio tiene una Política de respuesta predeterminada. Esta política se usa cuando no existe una regla específica para el canal de la conversación.

En planes Pro y Enterprise, puedes crear reglas de respuesta por canal, por ejemplo WhatsApp, SMS, [Webchat]({% link _captures/webchat-widget-playbook.md %}), Instagram o Messenger. Si existe una regla para el canal, Hellotext usa esa regla. Si no, usa la Política de respuesta predeterminada.

Los cambios a una regla de respuesta aplican a nuevos temporizadores. Las conversaciones que ya tenían un temporizador activo conservan el límite que tenían cuando se inició. Los objetivos son minutos enteros positivos y la regla específica se selecciona por tecnología; no es una política separada por número, destinatario o colaborador.

El selector real de una **Nueva regla de respuesta** ofrece **WhatsApp, SMS, Webchat, Instagram y Messenger**. La figura enfoca las cinco opciones del menú abierto; no se eligió ninguna ni se creó una regla. Mostrar WhatsApp en el menú no conecta un número ni modifica su ventana de servicio o permisos de envío.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Menú real de Tecnología en una nueva regla sin guardar: WhatsApp, SMS, Webchat, Instagram y Messenger; ninguna tecnología seleccionada.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 463px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/technology-es-mobile.png 2x" width="742" height="464" />
        <img src="/images/team/understanding-response-times/technology-es.png" srcset="/images/team/understanding-response-times/technology-es.png 2x" style="width: auto; margin: 0 auto;" width="890" height="464" loading="lazy" decoding="async" alt="Menú real de Tecnología en una nueva regla sin guardar: WhatsApp, SMS, Webchat, Instagram y Messenger; ninguna tecnología seleccionada." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Menú real de Tecnología en una nueva regla sin guardar: WhatsApp, SMS, Webchat, Instagram y Messenger; ninguna tecnología seleccionada.</figcaption>
</figure>

## Estados en conversaciones

En la lista de conversaciones, Hellotext puede mostrar indicadores de respuesta para ayudar a priorizar el trabajo.

Los estados son:

- **Respuesta en riesgo:** un temporizador activo consumió al menos el 70 % de su objetivo según el horario comercial.
- **Respuesta demorada:** el límite ya pasó, pero el temporizador aún está registrado como activo.
- **Respuesta vencida:** el incumplimiento ya está registrado y todavía no tiene una respuesta asociada.

Demorada y vencida no son dos períodos de gracia con duraciones distintas. El registro en segundo plano puede cambiar la etiqueta después del vencimiento; el momento de una respuesta sigue determinando si el objetivo se cumplió. **Asignación en riesgo** o **Asignación demorada** describen otra espera: la cola para asignar a un miembro de un equipo.

Estos indicadores ayudan al equipo a priorizar las conversaciones que necesitan una respuesta más rápida.

## Estados en Equipo y colaboradores

En las vistas de Equipo y colaboradores, Hellotext muestra indicadores de salud de respuesta cuando la función está disponible.

Los estados son:

- Respuesta al día
- Respuesta en riesgo
- Respuesta demorada
- Respuesta vencida

En Equipo, Hellotext considera las conversaciones vinculadas por un intervalo de equipo abierto o pendientes de asignación a ese equipo. En colaboradores, considera las conversaciones asignadas a cada persona; los miembros excluidos de capacidad no muestran estas etiquetas.

La etiqueta de equipo también puede advertir por la antigüedad de su cola pendiente: **15 minutos** de horario comercial producen riesgo y **30 minutos** demora, aunque no haya un objetivo de respuesta incumplido. Un indicador de capacidad llena mide otro aspecto. Estas señales agregadas requieren revisar la causa, no asumir que una persona respondió tarde.

Estos estados no crean reglas separadas por equipo o colaborador. Las reglas se configuran a nivel general o por canal. Las vistas de Equipo y colaboradores muestran cómo se están cumpliendo.

## Reportes

En reportes, los supervisores pueden revisar la presión operativa por colaborador o por equipo.

El reporte de Presión operativa muestra información como conversaciones sin respuesta, mayor espera, riesgo de respuesta, utilización, concurrencia y burn.

Los estados de riesgo son:

- Seguro
- En riesgo
- Inminente

Esto ayuda a detectar cuándo un equipo o colaborador está acumulando conversaciones que podrían afectar los tiempos de respuesta. **Sin respuesta, Mayor espera y Riesgo SLA** leen obligaciones actuales sin resolver; **Utilización y Concurrente** usan el período seleccionado y **Burn** combina ambas bases. Cambiar las fechas no convierte la cola actual en una historia de ese período.

Riesgo SLA del reporte usa el avance entre el inicio y el límite registrado, con tiempo de reloj: **En riesgo** desde 70 % y **Inminente** al consumir el plazo completo. No uses esa columna como copia exacta de la alerta de conversación, que aplica el calendario comercial a su umbral de riesgo.

La tabla reutilizada es una captura histórica ficticia del **11 al 24 de septiembre de 2026**. Ventas demo muestra **1** sin respuesta, **11 h 45 min** de mayor espera y **Inminente** en español (**11 h 48 min** en inglés, capturado después); Atención demo muestra **0**, **0 min** y **Seguro**. Utilización y Concurrente del período son **42 % / 1,7** y **43 % / 1,4** respectivamente. Burn muestra **Observación** y **Normal**. Son estados independientes al momento de capturar, no resultados de las reglas u horarios de las otras figuras.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tabla real Presión operativa con dos equipos ficticios y período histórico 11–24 septiembre 2026; obligaciones actuales al capturar distintas de las estadísticas del período.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 1253px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/workload-capacity-report-guide/operational-pressure-team-es.png 2x" width="2470" height="950" />
        <img src="/images/analytics-reporting-attribution/workload-capacity-report-guide/operational-pressure-team-es.png" srcset="/images/analytics-reporting-attribution/workload-capacity-report-guide/operational-pressure-team-es.png 2x" style="width: auto; margin: 0 auto;" width="2470" height="950" loading="lazy" decoding="async" alt="Tabla real Presión operativa con dos equipos ficticios y período histórico 11–24 septiembre 2026; obligaciones actuales al capturar distintas de las estadísticas del período." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Tabla real Presión operativa con dos equipos ficticios y período histórico 11–24 septiembre 2026; obligaciones actuales al capturar distintas de las estadísticas del período.</figcaption>
</figure>

## Cómo configurar reglas de respuesta

1. Ve a Ajustes.
2. Selecciona **Tiempo de respuesta** en la navegación de Ajustes; aparece junto a **Equipo** como una sección propia.
3. Comprueba que estás en el negocio correcto.
4. Abre la pestaña Reglas de respuesta.
5. Edita la Política de respuesta predeterminada o crea una regla por canal.
6. Configura Primera respuesta a nuevas conversaciones.
7. Configura Respuestas posteriores.
8. Guarda los cambios.

Para configurar cuándo debe contar el tiempo, usa la pestaña **Horario comercial** en la misma sección. Gestionar estas opciones requiere permisos de Dueño, Administrador o Manager y una cuenta con las funciones correspondientes.

La figura muestra una regla nueva **sin guardar**: **Tecnología** no está seleccionada y los dos campos están vacíos. El **60** gris es un placeholder, no un objetivo guardado ni un valor inicial efectivo. Debes elegir una tecnología y escribir ambos tiempos antes de guardar una regla real. No se creó una regla, conversación ni mensaje para esta guía. El pie de guardado se omite de la figura.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Formulario real Nueva regla de respuesta sin guardar: Tecnología no seleccionada y ambos tiempos vacíos; 60 es el placeholder.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 504px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-response-times/channel-es-mobile.png 2x" width="824" height="1098" />
        <img src="/images/team/understanding-response-times/channel-es.png" srcset="/images/team/understanding-response-times/channel-es.png 2x" style="width: auto; margin: 0 auto;" width="972" height="1018" loading="lazy" decoding="async" alt="Formulario real Nueva regla de respuesta sin guardar: Tecnología no seleccionada y ambos tiempos vacíos; 60 es el placeholder." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario real Nueva regla de respuesta sin guardar: Tecnología no seleccionada y ambos tiempos vacíos; 60 es el placeholder.</figcaption>
</figure>

## Plan necesario

Para usar reglas de respuesta necesitas un plan Pro o Enterprise.

Si tu negocio no tiene la función incluida, un usuario con acceso a Ajustes puede abrir la página de Tiempo de respuesta y ver una opción para actualizar el plan, en lugar de los controles para crear reglas. Esta pantalla de acceso no demuestra que los registros históricos o las esperas existentes se hayan borrado o cancelado.

En planes que no incluyen esta función, los indicadores de salud de respuesta no se muestran en conversaciones, equipos ni colaboradores.

## Buenas prácticas

Usa la Política de respuesta predeterminada como expectativa general para todo el negocio.

Crea reglas de respuesta por canal cuando algunos canales necesiten tiempos distintos. Por ejemplo, es posible que quieras responder conversaciones de WhatsApp más rápido que canales similares al email.

Mantén actualizado el Horario comercial para que los tiempos reflejen cuándo tu equipo realmente está disponible.

Revisa conversaciones, equipos, colaboradores y reportes regularmente para detectar demoras antes de que afecten la experiencia del cliente.

## Guías relacionadas

- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Ciclo de una conversación en el Inbox]({% link _team/conversation-lifecycle.md %})
