Usa una ruta cuando quieres un flujo de clientes paso a paso con un disparador claro, esperas, mensajes, condiciones, ramas y derivaciones.

Una ruta es un tipo de playbook. No todos los playbooks son rutas.

Algunos playbooks son más autónomos: por ejemplo, un recomendador de productos, soporte post-compra o un agente de preguntas frecuentes pueden leer señales, entender intención y decidir qué hacer en la conversación. Esos playbooks pueden usar agentes de IA o lógica de decisión en lugar de una ruta fija.

## Cuándo usar una ruta

Usa una ruta cuando la secuencia debería ser predecible y quieres controlar el camino.

Buenos casos para una ruta:

- Dar la bienvenida a un nuevo suscriptor.
- Ejecutar una ruta simple de carrito abandonado.
- Enviar un seguimiento después de una compra.
- Esperar una cantidad específica de tiempo antes de un segundo mensaje.
- Ramificar según si el cliente hizo clic, respondió, compró o cumplió una condición.
- Derivar a una persona después de un paso específico.

Un carrito abandonado puede existir de más de una forma: como una plantilla de ruta simple con pasos fijos, o como un playbook con IA que decide de forma más dinámica usando señales y contexto del cliente.

## Cuándo usar otro tipo de playbook

Usa un playbook más autónomo o un agente de IA cuando la experiencia necesita decidir en tiempo real.

Ejemplos:

- Recomendar productos desde un catálogo.
- Responder preguntas frecuentes.
- Entender el mensaje de un cliente y elegir la siguiente respuesta.
- Decidir qué oferta, producto, canal o momento es mejor para cada cliente.
- Coordinarse con otros playbooks para no saturar a los clientes.

Sigue leyendo: [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %}).

## Cómo funcionan las rutas

Una ruta empieza cuando un cliente coincide con un disparador. Ese disparador puede venir de una herramienta de captura, la integración de tu tienda, una campaña, un evento personalizado o una conversación.

Después del disparador, Hellotext mueve al cliente por la ruta que definiste. La ruta puede enviar un mensaje, esperar un tiempo, revisar una condición, ramificar, aplicar un cupón o derivar la conversación a una persona.

La diferencia importante es que la ruta la diseñas tú. Hellotext sigue la ruta y sus condiciones; no es lo mismo que un playbook autónomo decidiendo toda la misión por sí solo.

## Empieza desde una plantilla de ruta

Usa una plantilla de ruta cuando quieres lanzar rápidamente un flujo paso a paso probado.

Para crear una, ve al área de automatización en Hellotext, elige una plantilla de ruta, revisa el disparador y los pasos, y ajusta el texto, tiempos, canal, condiciones y reglas de derivación antes de publicar.

Si ninguna plantilla se ajusta a lo que necesitas, crea una [ruta personalizada]({% link _journeys/custom-journey.md %}).

## Revisa antes de publicar

Antes de publicar, verifica que:

- El disparador coincida con el comportamiento al que quieres reaccionar.
- Los pasos de la ruta ocurran en el orden que esperas.
- Los tiempos de espera sean razonables para el cliente.
- El canal esté conectado y listo.
- La audiencia y reglas de consentimiento sean correctas.
- Los mensajes suenen como tu marca.
- Los links, cupones y etiquetas de personalización funcionen.
- Cualquier derivación a un equipo humano sea clara.

Haz clic en **Guardar cambios** mientras trabajas. La ruta permanece inactiva hasta que la publiques.

Cuando esté lista, haz clic en **Publicar**. Para detenerla más adelante, desactívala.

## Próximos pasos

Si tu flujo necesita un agente de IA, revisa [cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).
