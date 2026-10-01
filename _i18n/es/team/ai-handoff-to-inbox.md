Usa la derivación para pasar la responsabilidad de una conversación a una persona o equipo cuando el cliente necesita ayuda humana. Revisa tanto el responsable como el estado de la conversación: recibirla, asignarla y abrirla son acciones distintas.

La derivación puede venir desde una misión, una ruta, un step de agente de IA o un agente personalizado. Lo importante es decidir a dónde se mueve la responsabilidad cuando la automatización no puede resolver la conversación de forma segura.

## Cómo funciona la derivación

Hay cuatro configuraciones comunes que participan en ese camino. La disponibilidad depende de la misión, el flujo y la cuenta; una instrucción en el prompt no habilita por sí sola una herramienta de derivación desactivada.

### Derivación en misiones

Las misiones de venta, soporte y las misiones personalizadas pueden tener una configuración de **Derivación**. Úsala para elegir quién debería intervenir cuando el agente necesita ayuda, como una persona o un equipo.

Activa el control que permite derivar y revisa su destinatario. Usa esta opción cuando el agente puede resolver la mayoría de las consultas, pero necesita pasar un caso a una persona. La derivación puede dejar la IA en modo silencioso o Copilot según el flujo; no garantiza que toda automatización quede detenida para siempre.

La figura reutiliza el formulario de Recolector de Propiedades: **Atención demo** es un equipo ficticio seleccionado en un borrador sin guardar. Muestra el control y su destino, no una conversación derivada. Otras misiones pueden ofrecer opciones diferentes.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Derivación habilitada y equipo ficticio Atención demo seleccionado en un borrador sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 593px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" style="width: auto; margin: 0 auto;" width="1150" height="660" loading="lazy" decoding="async" alt="Derivación habilitada y equipo ficticio Atención demo seleccionado en un borrador sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Derivación habilitada y equipo ficticio Atención demo seleccionado en un borrador sin guardar.</figcaption>
</figure>

### Step de Assignment en rutas

Las rutas pueden usar un step de **Assignment**, llamado **Asignación** en la interfaz en español. Su menú ofrece **Abrir conversación**, **Cerrar conversación**, **Asignar conversación**, **Agregar etiqueta** y **Eliminar etiqueta**. Elegir una etiqueta no asigna un responsable.

La figura muestra el menú completo de un paso nuevo sin guardar, sin acción elegida ni conversación modificada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Menú del paso Asignación con las cinco acciones y Guardar deshabilitado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-es-mobile.png 2x" width="778" height="1300" />
        <img src="/images/team/ai-handoff-to-inbox/assignment-es.png" srcset="/images/team/ai-handoff-to-inbox/assignment-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="1300" loading="lazy" decoding="async" alt="Menú del paso Asignación con las cinco acciones y Guardar deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Menú del paso Asignación con las cinco acciones y Guardar deshabilitado.</figcaption>
</figure>

Usa este paso cuando la derivación debería suceder en un punto específico de la ruta, por ejemplo después de una condición, una respuesta del cliente o una rama que identifica un caso sensible o de alto valor. Selecciona la acción y luego la persona o equipo existente.

En este segundo borrador, **Asignar conversación a Lucía** identifica a una compañera ficticia. No se guardó el paso ni la ruta; no hay una conversación asignada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Acción Asignar conversación a Lucía en un paso ficticio sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/target-es-mobile.png 2x" width="778" height="840" />
        <img src="/images/team/ai-handoff-to-inbox/target-es.png" srcset="/images/team/ai-handoff-to-inbox/target-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="840" loading="lazy" decoding="async" alt="Acción Asignar conversación a Lucía en un paso ficticio sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Acción Asignar conversación a Lucía en un paso ficticio sin guardar.</figcaption>
</figure>

**Asignar no abre necesariamente la conversación.** Si ya estaba cerrada puede seguir cerrada; si el paso necesita crear una conversación para asignarla, la crea de forma privada y cerrada. Cuando el proceso requiere atención en el Inbox abierto, configura también la acción de abrir y verifica el orden de las acciones. Una acción de cierre puede omitirse si una persona respondió desde que el paso empezó a esperar; eso no cancela automáticamente las otras acciones o pasos.

### Step de AI agent en una ruta

Si está disponible para tu cuenta, una ruta puede incluir un step de **AI agent**, llamado **Agente de IA**. **Ver misiones** permite elegir una misión activa; **Enrutamiento de IA** (**AI Routing**) puede elegir entre las misiones activas que admiten ese contexto, canal y audiencia. No asegura que cualquier misión guardada sea candidata.

Revisa si el agente debe enviar el primer mensaje o esperar al cliente, y cuánto tiempo debe esperar sin respuesta. El borrador de la figura no tiene misión elegida, conserva **Enviar el primer mensaje** y muestra una espera de **6 horas**. No está guardado ni generó o envió un mensaje; esas seis horas no son un compromiso de respuesta del equipo ni la ventana del canal.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Agente de IA sin misión seleccionada, opciones de inicio y espera de seis horas; borrador sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/agent-settings-es-mobile.png 2x" width="778" height="1500" />
        <img src="/images/team/ai-handoff-to-inbox/agent-settings-es.png" srcset="/images/team/ai-handoff-to-inbox/agent-settings-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="1500" loading="lazy" decoding="async" alt="Agente de IA sin misión seleccionada, opciones de inicio y espera de seis horas; borrador sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Agente de IA sin misión seleccionada, opciones de inicio y espera de seis horas; borrador sin guardar.</figcaption>
</figure>

Si no hay misiones activas disponibles, el selector muestra este aviso. El recorte enfocado conserva el texto y **Explorar misiones** del formulario real. No se activó una misión para llenar la lista.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Aviso del selector: no hay misiones activas disponibles, con botón Explorar misiones.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 457px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/agent-empty-es-mobile.png 2x" width="650" height="292" />
        <img src="/images/team/ai-handoff-to-inbox/agent-empty-es.png" srcset="/images/team/ai-handoff-to-inbox/agent-empty-es.png 2x" style="width: auto; margin: 0 auto;" width="878" height="252" loading="lazy" decoding="async" alt="Aviso del selector: no hay misiones activas disponibles, con botón Explorar misiones." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Aviso del selector: no hay misiones activas disponibles, con botón Explorar misiones.</figcaption>
</figure>

El paso tiene salidas de resuelto y no resuelto. La falta de una respuesta o de una misión admisible también puede llevarlo a no resuelto. Esa salida no deriva por sí sola: conecta un paso de Asignación con el responsable y el estado de atención necesarios. Revisa ambas ramas y cómo continúa o termina la ruta.

### Misiones personalizadas e intenciones

Las misiones personalizadas pueden definir **Intenciones**: frases que describen la necesidad que deberían atender. Hellotext clasifica el mensaje con su contexto y las misiones elegibles; no es una regla de coincidencia exacta de palabras.

La figura muestra **Quiero consultar una devolución.** escrita en el campo de un agente nuevo. Es una frase ficticia sin agregar ni guardar: no se pulsó **Nueva intención** ni se activó o ejecutó el agente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo Intenciones con la frase ficticia Quiero consultar una devolución, sin agregar ni guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 646px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-es-mobile.png 2x" width="764" height="592" />
        <img src="/images/team/ai-handoff-to-inbox/intents-es.png" srcset="/images/team/ai-handoff-to-inbox/intents-es.png 2x" style="width: auto; margin: 0 auto;" width="1256" height="520" loading="lazy" decoding="async" alt="Campo Intenciones con la frase ficticia Quiero consultar una devolución, sin agregar ni guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Campo Intenciones con la frase ficticia Quiero consultar una devolución, sin agregar ni guardar.</figcaption>
</figure>

Esto te permite crear varios [agentes personalizados]({% link _journeys/custom-agent-playbook.md %}) para distintos trabajos. Por ejemplo, un agente puede recomendar productos, otro puede responder preguntas de soporte y [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) puede manejar consultas de estado de órdenes. Cada agente puede resolver la conversación, enviarla a otra misión mediante el Supervisor o derivarla a la persona o equipo configurado.

## Cuándo Hellotext debería derivar

Define reglas de derivación antes de lanzar una misión o ruta.

Momentos comunes para derivar incluyen:

- El cliente pide hablar con una persona.
- El cliente está enojado, frustrado o insatisfecho.
- El cliente reporta un producto defectuoso, dañado, equivocado o faltante.
- La solicitud está fuera del propósito de la misión actual.
- La IA no está segura o no puede verificar la respuesta.
- El cliente pregunta por devoluciones, cambios, cancelaciones, pagos, acceso a cuenta o una excepción especial.
- El cliente está listo para comprar pero necesita una acción comercial humana.
- Hellotext no encuentra otra misión activa que debería manejar la consulta.
- El mismo problema se repite y la conversación no avanza.

Si una respuesta incorrecta puede crear riesgo operativo, legal, financiero o de marca, deriva en lugar de seguir automáticamente.

## Qué configurar antes de lanzar

Antes de que los clientes lleguen al flujo, revisa el camino de derivación que aplica a tu configuración.

Para misiones:

- Habilita la derivación y elige una persona o equipo con acceso al Inbox.
- Confirma que el prompt del agente explique cuándo debería derivar.
- Confirma qué puede decir antes de derivar y qué hará si no logra asignar. Un equipo sin capacidad puede dejar el caso pendiente en ese equipo y sin responsable individual; no se redistribuye automáticamente a otro equipo. Un equipo sin miembros asignables es un fallo distinto.
- Si no eliges un destino, revisa la selección automática y el caso sin personas disponibles: la conversación puede quedar sin asignar esperando que alguien esté en línea. No presupongas un responsable de respaldo garantizado.
- Comprueba presencia, capacidad, horarios y el proceso de atención fuera de horario. Estar asignado no confirma que alguien leyó el caso, y los horarios no se aplican igual a todos los flujos.

Para rutas:

- Agrega un step de Assignment donde la ruta debería asignar la conversación.
- Elige cada acción y su orden; confirma que el caso quede abierto si requiere atención, además de tener responsable.
- Si un step de AI agent tiene una rama de no resuelto, conecta esa rama con un step de Assignment y verifica sus condiciones de entrada, inicio y espera.

Para [agentes personalizados]({% link _journeys/custom-agent-playbook.md %}):

- Define las intenciones que deberían activar cada agente.
- Elige los canales entrantes donde el agente debería responder.
- Configura la derivación para la persona o equipo que debería intervenir.
- Prueba qué sucede cuando ninguna misión activa puede resolver la consulta.

Sigue leyendo: [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Qué debería mostrar el Inbox

Cuando una conversación llega al Inbox, la persona del equipo debería entender qué pasó sin releer todo desde el comienzo.

Una derivación útil debería dejar claro:

- Por qué se derivó la conversación.
- Qué misión, intención, ruta o step de IA la manejó primero.
- Qué quiere el cliente.
- Qué dijo o hizo el agente.
- Qué producto, carrito, pedido, política o dato del perfil del cliente importa.
- Si el cliente espera soporte, ayuda de venta o seguimiento operativo.
- Quién se hace cargo de la próxima respuesta.
- Si la situación es urgente.

Esta lista es una revisión recomendada; no todos esos datos aparecen automáticamente ni de inmediato. El historial o resumen puede actualizarse en segundo plano. Comprueba el objeto y cliente correctos antes de usar un pedido, carrito o dato del perfil como contexto del caso.

Cuanto más específico sea el contexto comprobado, más fácil será responder de forma natural. Abrir, cerrar o asignar en el Inbox no reinicia la ventana de respuesta de WhatsApp. Revisa las reglas del canal en [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %}).

## Prueba el camino de derivación

Antes de salir en vivo, prueba cada camino de derivación del que dependes.

Usa un entorno aislado con datos y destinatarios autorizados para la prueba. Una figura de un borrador no demuestra una derivación ejecutada. Antes de lanzar, confirma con evidencia del flujo real que:

1. Una misión deriva a la persona o equipo esperado.
2. Un step de Assignment en una ruta asigna, abre, cierra o etiqueta la conversación correctamente.
3. Un step de AI agent envía las conversaciones no resueltas al step de Assignment correcto.
4. Las intenciones personalizadas activan el agente esperado.
5. AI Routing elige una misión activa apropiada.
6. Una consulta sin misión activa admisible sigue el camino previsto; revisa también ausencia de personas disponibles y equipo sin capacidad, incluidos los casos que quedan pendientes o sin asignar.
7. La persona tiene suficiente contexto para responder sin pedirle al cliente que repita todo.

Si la persona tiene que adivinar por qué llegó la conversación, mejora la regla de derivación, prompt, intención o camino de asignación antes de lanzar.

## Qué debería hacer el equipo después de la derivación

Cuando una persona toma la conversación:

- Lee el último mensaje del cliente y el contexto de automatización.
- Revisa el perfil del cliente, pedido, carrito o información de producto antes de responder.
- Evita repetir preguntas que el agente ya hizo.
- Deja claro que ahora está ayudando una persona.
- Asigna o reasigna la conversación si el responsable no es el correcto.
- Cierra la conversación cuando no requiera más acción y comprueba los seguimientos configurados. Cerrar en el Inbox no equivale a que la IA haya resuelto el caso ni cancela todos los trabajos pendientes; una misión de satisfacción puede depender de ese cierre si está habilitada y se cumplen sus condiciones.

La participación del equipo no elimina automáticamente la atribución. Su efecto depende del camino de atribución y de la evidencia disponible. La evidencia de una campaña puede seguir siendo elegible cuando participa una persona; un checkout ajeno a una campaña y bajo responsabilidad de una persona puede bloquear la atribución; y Recomendador de Productos usa su propia evaluación del responsable comercial. Otras misiones y rutas no usan automáticamente esa misma evaluación.

Sigue leyendo: [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Revisa la calidad de derivaciones

Después de lanzar, revisa las derivaciones regularmente.

Busca:

- Conversaciones que se derivaron demasiado tarde.
- Conversaciones que se derivaron demasiado pronto.
- Intenciones que activan el agente incorrecto.
- AI Routing eligiendo la misión incorrecta.
- Responsables de derivación faltantes o poco claros.
- Clientes repitiendo información.
- Conversaciones sin asignar, pendientes en un equipo o cerradas que deberían estar abiertas, esperando demasiado.
- Preguntas similares que podrían convertirse en mejores prompts, documentos cargados, intenciones o ramas de ruta.

Usa lo aprendido para ajustar el prompt, intenciones, reglas de misión, ramas de ruta, responsables del equipo o proceso de respuesta.

## Guías relacionadas

- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Equipos y capacidad del Inbox]({% link _team/teams-and-inbox-capacity.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
