Usa esta guía cuando una misión no se comportó como esperabas.

Empieza con un perfil del cliente, una misión y un momento específico. Los problemas amplios son mucho más fáciles de diagnosticar después de explicar un ejemplo concreto.

Si primero quieres entender el modelo general de decisión, lee [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %}).

## Antes de cambiar algo

Reúne los datos primero:

- El nombre y tipo de misión.
- El perfil del cliente que esperabas que entrara o recibiera un mensaje.
- La hora aproximada en que ocurrió la señal, mensaje o paso de ruta.
- La señal, intención, audiencia, disparador de ruta o mensaje del cliente que esperabas que iniciara la misión.
- El canal que esperabas que Hellotext usara.
- Qué pasó realmente: nada, una demora, otro canal, una derivación u otra misión.
- Cambios recientes en integraciones, tracking, configuración de canales, prompts, intenciones, conocimiento, ofertas o derivación.

No edites el prompt, intenciones, ruta o canales hasta saber qué parte del camino falló.

Distingue señal registrada, admisión, trabajo en cola, mensaje creado, envío y entrega. Una señal o conversación existente por sí sola no demuestra que la misión se haya disparado. Si el resultado de una acción anterior es incierto, reconcilia su estado antes de repetirla; no reenvíes, reintentes ni generes otra señal para diagnosticar sin autorización y control del destino.

## 1. Identifica el tipo de misión

Distintas misiones fallan en distintos lugares.

| Tipo de misión | Qué suele iniciarla | Qué revisar primero |
| --- | --- | --- |
| Misión activa de venta | Una señal de comercio o comportamiento | Señal, audiencia, elegibilidad del cliente, frecuencia, timing, datos de producto. |
| Misión reactiva de atención | Un mensaje entrante del cliente | Canal de entrada, intención/alcance, conocimiento, reglas de derivación. |
| Agente personalizado | Una intención configurada o decisión de routing | Intenciones, canales de entrada, solapamiento con otros agentes, destino de derivación. |
| Ruta | Un disparador y condiciones de ruta | Disparador, esperas, condiciones, ramas, asignaciones, estado de detención/finalización. |
| Misión tipo campaña | Una audiencia seleccionada y configuración de envío | Audiencia, preparación del canal, consentimiento, programación, validez del mensaje. |

Si se está usando el tipo de misión incorrecto, el síntoma puede parecer un bug cuando en realidad hay una diferencia entre la misión y la configuración.

Comprueba el tipo concreto y sus requisitos de plan, función, rol, cuota, datos y herramientas. Una misión no obtiene consulta de pedidos, inventario, cancelación, reembolso o una conexión externa por tener un prompt, un archivo o una URL. Las reglas proactivas, la selección reactiva y las rutas no comparten todos los controles ni límites.

## 2. Confirma que la misión esté habilitada

Abre **Misiones** y revisa el estado de la misión.

Revisa por separado el estado guardado de la misión y, cuando corresponda, el de su flujo. Deshabilitar afecta la admisión de nueva actividad; no prueba que todo trabajo ya en cola, procesamiento o solicitud a un proveedor se haya cancelado. No la habilites como prueba: primero confirma señales, canales, conocimiento y derivación. En una ruta, guardar cambios de una ruta ya activa no la convierte automáticamente en borrador.

También confirma que estás mirando la versión correcta. Algunas misiones pueden existir una sola vez para el negocio. [Agentes personalizados]({% link _journeys/custom-agent-playbook.md %}) y misiones personalizadas pueden tener varias versiones con nombres similares.

## 3. Si la misión no se disparó

Usa esta sección cuando no hay evidencia de que la misión haya empezado.

Revisa:

- La señal esperada existe en el perfil del cliente.
- La señal corresponde a la fuente, negocio, perfil u objeto y período requeridos por ese tipo; revisa cuándo se instaló la integración o captura y cuándo se registró y procesó la actividad.
- El nombre y propiedades de la señal coinciden con lo que espera la misión.
- El perfil del cliente coincide con la audiencia de la misión.
- La misión está activa en el mismo negocio donde ocurrió la actividad.
- El disparador, condición o rama de la ruta coincide con el perfil.
- El mensaje entrante del cliente coincide con la intención o alcance de atención.
- La selección contextual, una ruta ya en cola, la pausa de IA o la prioridad de otra misión no explican lo observado; revisa su evidencia concreta.

Si la señal no aparece en el perfil del cliente, detente acá y usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

En **Acciones**, compara el nombre exacto con la señal esperada. La definición ficticia **appointment.booked / Cita reservada** está guardada y no tiene ocurrencias; definir una acción no registra un evento ni inicia una ruta.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Definición ficticia appointment.booked en Acciones">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-actions/catalog-es-mobile.png 2x" width="764" height="346" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-actions/catalog-es.png" srcset="/images/developers/custom-actions/catalog-es.png 2x" width="1752" height="838" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Definición ficticia appointment.booked en Acciones" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Definición independiente con cero ocurrencias; no es un evento ni una ruta disparada.</figcaption>
</figure>

Para un Agente Personalizado, compara **Intenciones** con la solicitud y su contexto. La frase ficticia **Quiero consultar una devolución.** está en un borrador sin agregar, guardar ni clasificar. Una intención no funciona como una palabra clave exacta ni demuestra que un agente activo haya sido elegido.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Frase de devolución sin agregar en Intenciones">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-es-mobile.png 2x" width="764" height="592" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-es.png" srcset="/images/team/ai-handoff-to-inbox/intents-es.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Frase de devolución sin agregar en Intenciones" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador Custom independiente; ninguna clasificación ni conversación ejecutada.</figcaption>
</figure>

## 4. Si la misión se disparó pero no envió

Usa esta sección después de distinguir una señal existente de evidencia de admisión o ejecución. Si no hay mensaje creado, revisa la decisión del flujo; si hay uno, identifica su estado y el canal antes de atribuir el problema a entrega.

Revisa:

- Hay permiso para ese destino, canal y tipo de mensaje; Suscrito, alcanzable y elegible son comprobaciones distintas.
- El perfil no está bloqueado.
- El perfil tiene teléfono, WhatsApp, Instagram, Webchat u otra identidad requerida alcanzable.
- El canal está conectado, activo y disponible para ese cliente.
- El formato del mensaje funciona en el canal seleccionado.
- Los límites de frecuencia propios del tipo y, si participa, la presión de contacto proactiva permiten la propuesta; no apliques un límite universal a todos los flujos.
- Los controles de compras del tipo concreto permiten continuar: pueden usar el producto exacto, una familia, un pedido confirmado u otra población y ventana. No todas las misiones excluyen cualquier compra reciente.
- El envío no fue bloqueado por horarios silenciosos, horario nocturno o reglas de timing.
- La misión pudo construir un mensaje, producto, link, botón, plantilla o candidato de ruta válido.

Si consentimiento o contactabilidad no están claros, usa [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %}).

Este perfil ficticio de **Camila Torres** muestra **Sin confirmar**, un email de ejemplo y ningún teléfono. Los campos localizan qué revisar; no verifican identidad, consentimiento, integración, elegibilidad, envío ni entrega. La vista estrecha es un foco de la captura de escritorio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Camila Torres Sin confirmar con email ficticio y sin teléfono">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 473px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/customer-profiles/profile-fields-es-mobile.png 2x" width="700" height="1330" />
        <img class="ht-editorial-visual__image" src="/images/audience/customer-profiles/profile-fields-es.png" srcset="/images/audience/customer-profiles/profile-fields-es.png 2x" width="910" height="1330" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Camila Torres Sin confirmar con email ficticio y sin teléfono" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Perfil ficticio independiente; no prueba identidad, consentimiento o entrega.</figcaption>
</figure>

## 5. Si la misión esperó

Una demora no siempre es una falla.

Algunas misiones esperan porque:

- La ruta tiene un paso de espera.
- Aplican horarios silenciosos u horario nocturno.
- El calendario del negocio o la zona horaria del destino cambia la ventana aplicable, según el flujo y las reglas del canal.
- La planificación del tipo conserva una propuesta pendiente, una espera por evidencia o capacidad, o una ventana de envío; no promete el mejor horario histórico ni una hora exacta de entrega.
- Una ventana de conversación o respuesta no está disponible en este momento.
- Un mensaje anterior ya generó presión de contacto.

Revisa los pasos de la ruta, configuración de horarios del negocio y timeline del cliente antes de cambiar la misión.

En rutas, distingue una espera programada, una condición que espera un evento válido y un paso que termina en lugar de posponer. El calendario de respuesta del Inbox controla atención; no es un horario de envío ni un SLA universal de misiones. Una espera, una omisión y un candidato expirado requieren diagnósticos diferentes.

## 6. Si la misión usó otro canal

Algunas misiones pueden elegir entre canales disponibles.

Revisa:

- Qué canales de salida permite la misión.
- Si el canal esperado está activo.
- Si el perfil del cliente es alcanzable en el canal esperado.
- Si el formato del mensaje, botones, medios, plantilla o ventana de conversación puede funcionar en ese canal.
- Si el flujo usó la identidad de entrada, una ruta específica o su prioridad de canales. Eso no demuestra menor costo, mejor retorno ni entrega.

Para comportamiento específico de WhatsApp, usa [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %}).

Distingue entrada y salida. **Canales de Entrada** del Recolector de Propiedades muestra **Todos los canales de entrada** y la opción manual en un borrador ficticio independiente sin guardar. Sirve para reconocer el filtro de entrada; no muestra un selector de salida, una conexión, permiso ni un mensaje entregado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Opciones de Canales de Entrada en Recolector de Propiedades">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/channels-es-mobile.png 2x" width="780" height="1520" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/channels-es.png" srcset="/images/captures/property-collector/channels-es.png 2x" width="1150" height="1180" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Opciones de Canales de Entrada en Recolector de Propiedades" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador independiente; no representa canales de salida ni una entrega.</figcaption>
</figure>

## 7. Si la misión derivó

Una derivación puede ser el resultado correcto.

Revisa si:

- La misión tiene configuración de **Derivación**.
- Una ruta llegó a un paso de asignación.
- El camino no resuelto de un paso de IA llegó a una asignación explícita; no supongas derivación automática en toda ruta.
- Un agente personalizado coincidió con una intención pero llegó a sus límites.
- El cliente pidió una persona, solicitó una operación fuera del alcance disponible o la situación requiere el protocolo de derivación aplicable. Frustración, un saludo o una búsqueda fallida por sí solos no prueban una derivación automática.
- El Supervisor no encontró otra misión activa para manejar la solicitud.
- La persona o equipo destino es correcto.

Si la derivación fue inesperada, revisa prompt, conocimiento, alcance, intenciones y destino de derivación. Para más detalle, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

**Derivación** muestra **Atención demo**, un equipo de destino, en este borrador ficticio del Recolector de Propiedades sin guardar. Una solicitud de derivación, la elección del equipo, un dueño asignado y una respuesta humana son estados distintos. Revisa pertenencia, capacidad, horario y protocolo; cerrar o posponer no responde, y la pausa de IA depende del protocolo aplicable.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Atención demo como equipo de destino en Derivación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Atención demo como equipo de destino en Derivación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario independiente sin guardar, asignar ni responder.</figcaption>
</figure>

En una ruta, **Asignación** ofrece cinco acciones en este formulario ficticio nuevo independiente sin guardar. Revisa cuál alcanzó la ejecución y en qué orden; esta figura no muestra una topología construida, un disparador confirmado ni una conversación derivada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cinco acciones del paso Asignación de ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 521px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/assignment-es-mobile.png 2x" width="778" height="1300" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/assignment-es.png" srcset="/images/team/ai-handoff-to-inbox/assignment-es.png 2x" width="1006" height="1300" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Cinco acciones del paso Asignación de ruta" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Componente nuevo independiente; sin topología, guardado ni ejecución.</figcaption>
</figure>

## 8. Si el agente respondió distinto a lo esperado

Si la misión envió o respondió, pero el contenido estuvo mal, normalmente no es un problema de disparador.

Revisa:

- El prompt dice qué controla el agente y qué queda fuera de alcance.
- Los documentos de conocimiento están actualizados y no se contradicen.
- El tipo tiene acceso a los datos y herramientas concretos para esa solicitud; información aportada por el cliente no verifica identidad, pedido ni estado operativo en una integración.
- Tono y configuración de ofertas coinciden con el objetivo del negocio.
- Si hay Playground disponible, sus pruebas autorizadas y sus límites se revisaron. Una simulación puede guardar mensajes o eventos y llamar a proveedores de IA; no confirma identidad, permiso, elegibilidad ni entrega real.
- La respuesta esperada pertenece a esta misión, no a otra misión o a otro equipo.

Para cambios más seguros, usa [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

En **Prompt** de Agente Personalizado, comprueba las instrucciones guardadas de la versión correcta. Este formulario ficticio está vacío: el texto gris es un placeholder, sin instrucciones guardadas ni respuesta generada. Escribir una instrucción no agrega herramientas, integraciones o permiso.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Prompt vacío de Agente Personalizado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Prompt vacío de Agente Personalizado" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Placeholder nativo; ninguna instrucción guardada ni respuesta de IA.</figcaption>
</figure>

En **Conocimiento**, distingue elegir un documento, guardarlo y que esté procesado y disponible para consulta. El área de **Conocimiento** está vacía en este borrador Custom independiente: no hay archivo elegido, subido o listo. No interpretes guardar como confirmación de que el proveedor o índice de búsqueda terminó.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Conocimiento de Custom sin archivo elegido">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Conocimiento de Custom sin archivo elegido" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Área vacía; ningún archivo elegido, guardado, subido o consultado.</figcaption>
</figure>

## 9. Revisa reportes y un timeline real

Usa reportes para entender patrones, pero usa un perfil del cliente real para diagnosticar.

Revisa:

- Timeline del perfil del cliente.
- Historial de conversación en Inbox.
- El reporte registrado para ese tipo, si existe, o las vistas de rendimiento e ingresos pertinentes; no todas las misiones tienen un reporte dedicado.
- Actividad de campañas o rutas que pudo contactar al mismo perfil.
- Estado de entrega del canal.
- Actividad reciente de integración o tracking.
- Destino y dueño de la derivación.

Si muchos clientes muestran el mismo síntoma, corrige la causa compartida: integración, tracking, preparación del canal, audiencia, timing, frecuencia, prompt o configuración de derivación.

Compara el mismo negocio, población, período, zona horaria y denominador. Resolución, recopilación, derivación, envío, entrega, devolución y venta atribuida son resultados distintos; un reporte agregado no demuestra qué pasó con un cliente. Conserva la evidencia del intento original y no uses una nueva ejecución como sustituto de su diagnóstico.

## Mapa rápido de síntomas

| Síntoma | Primer lugar donde mirar |
| --- | --- |
| Ningún cliente entró | Señal, audiencia, disparador, estado activo o condición de ruta. |
| La señal existe pero no envía | Consentimiento, contactabilidad, preparación del canal, frecuencia, timing o compra reciente. |
| El mensaje se envió más tarde | Espera o condición, ventana del canal, zona aplicable y planificación específica. |
| Se usó otro canal | Disponibilidad del canal, alcance del cliente, formato del mensaje o prioridad de canal. |
| La conversación fue al Inbox | Configuración de derivación, paso de asignación, camino no resuelto de IA o routing del Supervisor. |
| El agente respondió mal | Prompt guardado, conocimiento listo, alcance/herramientas, evidencia de la prueba autorizada o dueño equivocado. |
| Los reportes se ven bajos | Rango de fechas, atribución, sincronización de eventos, entrega del canal o intentos omitidos/derivados. |

## Guías relacionadas

- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [A quién puedo escribirle]({% link _audience/consent-and-subscriber-status.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
