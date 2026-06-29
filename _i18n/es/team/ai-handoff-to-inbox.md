Usa la derivación cuando Hellotext debería dejar de manejar una conversación automáticamente y llevarla al Inbox de una persona o equipo.

La derivación puede venir desde un playbook, una ruta, un step de agente de IA o un agente personalizado. Lo importante es decidir a dónde se mueve la responsabilidad cuando la automatización no puede resolver la conversación de forma segura.

## Cómo funciona la derivación

Hay cuatro formas comunes de enviar una conversación a una persona o equipo.

### Derivación en playbooks

Los playbooks de venta, soporte y los playbooks personalizados pueden tener una configuración de **Derivación**. Úsala para elegir quién debería intervenir cuando el agente necesita ayuda, como una persona o un equipo.

Usa Derivación cuando el agente puede resolver la mayoría de las conversaciones por su cuenta, pero debería detenerse y asignar la conversación cuando el cliente necesita ayuda humana.

### Step de Assignment en rutas

Las rutas pueden usar un step de **Assignment**. Este step puede abrir una conversación, cerrarla, asignarla a una persona o equipo, agregar un tag o quitar un tag.

Usa un step de Assignment cuando la derivación debería suceder en un punto específico de la ruta, por ejemplo después de una condición, después de una respuesta del cliente o después de una rama que identifica un caso sensible o de alto valor.

### Step de AI agent en una ruta

Una ruta puede incluir un step de **AI agent**. En ese step puedes elegir un playbook específico o usar **AI Routing**, que permite que Hellotext elija el mejor playbook activo para la conversación.

El step de AI agent tiene salidas de resuelto y no resuelto. Si la IA no puede resolver la conversación, agrega un step de Assignment en la rama de no resuelto para que la conversación vaya a la persona o equipo correcto.

### Playbooks personalizados e intenciones

Los playbooks personalizados pueden definir **Intenciones**. Una intención es una frase o necesidad que activa un agente cuando se detecta en el mensaje de un cliente.

Esto te permite crear varios agentes para distintos trabajos. Por ejemplo, un agente puede recomendar productos, otro puede responder preguntas de soporte y otro puede manejar consultas de órdenes. Cada agente puede resolver la conversación, enviarla a otro playbook mediante el Supervisor o derivarla a la persona o equipo configurado.

## Cuándo Hellotext debería derivar

Define reglas de derivación antes de lanzar un playbook o ruta.

Momentos comunes para derivar incluyen:

- El cliente pide hablar con una persona.
- El cliente está enojado, frustrado o insatisfecho.
- El cliente reporta un producto defectuoso, dañado, equivocado o faltante.
- La solicitud está fuera del propósito del playbook actual.
- La IA no está segura o no puede verificar la respuesta.
- El cliente pregunta por devoluciones, cambios, cancelaciones, pagos, acceso a cuenta o una excepción especial.
- El cliente está listo para comprar pero necesita una acción comercial humana.
- Hellotext no encuentra otro playbook activo que debería manejar la consulta.
- El mismo problema se repite y la conversación no avanza.

Si una respuesta incorrecta puede crear riesgo operativo, legal, financiero o de marca, deriva en lugar de seguir automáticamente.

## Qué configurar antes de lanzar

Antes de que los clientes lleguen al flujo, revisa el camino de derivación que aplica a tu configuración.

Para playbooks:

- Elige la persona o equipo en la configuración de Derivación.
- Confirma que el prompt del agente explique cuándo debería derivar.
- Confirma que el agente sepa qué decir antes de derivar.

Para rutas:

- Agrega un step de Assignment donde la ruta debería asignar la conversación.
- Elige si el step debería abrir, cerrar, asignar, etiquetar o quitar un tag de la conversación.
- Si un step de AI agent tiene una rama de no resuelto, conecta esa rama con un step de Assignment.

Para agentes personalizados:

- Define las intenciones que deberían activar cada agente.
- Elige los canales entrantes donde el agente debería responder.
- Configura la derivación para la persona o equipo que debería intervenir.
- Prueba qué sucede cuando ningún playbook activo puede resolver la consulta.

Sigue leyendo: [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Qué debería mostrar el Inbox

Cuando una conversación llega al Inbox, la persona del equipo debería entender qué pasó sin releer todo desde el comienzo.

Una derivación útil debería dejar claro:

- Por qué se derivó la conversación.
- Qué playbook, intención, ruta o step de IA la manejó primero.
- Qué quiere el cliente.
- Qué dijo o hizo el agente.
- Qué producto, carrito, orden, política o dato del perfil del cliente importa.
- Si el cliente espera soporte, ayuda de venta o seguimiento operativo.
- Quién se hace cargo de la próxima respuesta.
- Si la situación es urgente.

Cuanto más específico sea el contexto, más fácil será responder de forma natural.

## Prueba el camino de derivación

Antes de salir en vivo, prueba cada camino de derivación del que dependes.

Usa un perfil del cliente de prueba y confirma que:

1. Un playbook deriva a la persona o equipo esperado.
2. Un step de Assignment en una ruta asigna, abre, cierra o etiqueta la conversación correctamente.
3. Un step de AI agent envía las conversaciones no resueltas al step de Assignment correcto.
4. Las intenciones personalizadas activan el agente esperado.
5. AI Routing elige un playbook activo apropiado.
6. Una consulta sin playbook activo que coincida llega al responsable de fallback.
7. La persona tiene suficiente contexto para responder sin pedirle al cliente que repita todo.

Si la persona tiene que adivinar por qué llegó la conversación, mejora la regla de derivación, prompt, intención o camino de asignación antes de lanzar.

## Qué debería hacer el equipo después de la derivación

Cuando una persona toma la conversación:

- Lee el último mensaje del cliente y el contexto de automatización.
- Revisa el perfil del cliente, orden, carrito o información de producto antes de responder.
- Evita repetir preguntas que el agente ya hizo.
- Deja claro que ahora está ayudando una persona.
- Asigna o reasigna la conversación si el ownership es incorrecto.
- Cierra la conversación cuando no requiera más acción.

Si la persona realiza una acción comercial, como enviar un cupón, link de producto, link de checkout o recomendación, eso puede afectar la atribución.

Sigue leyendo: [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

## Revisa la calidad de derivaciones

Después de lanzar, revisa las derivaciones regularmente.

Busca:

- Conversaciones que se derivaron demasiado tarde.
- Conversaciones que se derivaron demasiado pronto.
- Intenciones que activan el agente incorrecto.
- AI Routing eligiendo el playbook incorrecto.
- Responsables de derivación faltantes o poco claros.
- Clientes repitiendo información.
- Conversaciones sin asignar esperando demasiado.
- Preguntas similares que podrían convertirse en mejores prompts, documentos cargados, intenciones o ramas de ruta.

Usa lo aprendido para ajustar el prompt, intenciones, reglas de playbook, ramas de ruta, ownership del equipo o proceso de respuesta.

## Guías relacionadas

- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Asigna conversaciones]({% link _team/assigning-conversations.md %})
- [Tiempo de respuesta y reglas de respuesta]({% link _team/understanding-response-times.md %})
- [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
