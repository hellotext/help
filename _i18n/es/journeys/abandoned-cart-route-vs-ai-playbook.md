La recuperación de carrito abandonado puede ser simple o dinámica.

En Hellotext, un seguimiento básico de carrito abandonado puede funcionar como una plantilla de ruta con pasos fijos. Una experiencia más dinámica de recuperación puede funcionar como un playbook con IA que usa señales, contexto de producto y respuestas del cliente para decidir qué hacer después.

Ambas opciones son válidas. Elige la versión más simple que coincida con tu objetivo, datos y preparación del equipo.

## Usa una plantilla de ruta cuando

Usa una ruta cuando quieres un flujo paso a paso predecible.

Una ruta suele ser la mejor primera opción cuando:

- Quieres uno o dos recordatorios fijos después de que se abandona un carrito.
- El timing debería ser igual para la mayoría de los clientes.
- El texto, cupón, canal y condiciones de detención ya están claros.
- Quieres revisar cada paso antes de publicar.
- No necesitas que el seguimiento interprete respuestas o elija entre varios siguientes pasos.

Por ejemplo, una ruta simple puede esperar después de `cart.abandoned`, enviar un recordatorio, revisar si el cliente compró y detenerse o enviar un seguimiento más.

## Usa un playbook de carrito con IA cuando

Usa un playbook con IA cuando la recuperación de carrito debería adaptarse al cliente.

Un playbook de carrito con IA encaja mejor cuando:

- El cliente puede responder con preguntas u objeciones.
- Importan recomendaciones de producto, alternativas, talles, stock o detalles de políticas.
- El mejor siguiente paso puede cambiar según cliente, valor del carrito, producto, historial o respuesta.
- Quieres que Hellotext use más contexto antes de decidir el siguiente mensaje.
- Una persona debería tomar la conversación solo cuando hace falta ayuda.

Por ejemplo, un playbook con IA puede usar señales de carrito, producto, perfil, conversación y compra para decidir si recordar, recomendar, responder, esperar, detenerse o derivar.

## Qué necesitan ambas opciones

Ambas opciones dependen de una configuración confiable.

Antes de lanzar cualquiera de las dos, confirma:

- La actividad de carrito o checkout tiene tracking.
- El cliente puede identificarse en el perfil de cliente correcto.
- Los datos de producto y orden están disponibles si el mensaje usa detalles de producto.
- El canal está conectado y el cliente puede recibir mensajes.
- Una señal de compra u orden puede detener el seguimiento.
- Los links, cupones y eventos con tracking funcionan en una prueba.

Sigue leyendo: [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Cómo elegir

Elige una **plantilla de ruta** si principalmente necesitas control, velocidad y una secuencia conocida.

Elige un **playbook de carrito con IA** si principalmente necesitas adaptación, manejo conversacional y decisiones con más contexto.

Si este es tu primer lanzamiento de recuperación de carritos, empieza con la versión que tu equipo pueda probar y medir con confianza. Puedes empezar con una ruta, aprender de los primeros resultados y pasar a un playbook con IA cuando la calidad de señales, datos de producto y reglas de derivación estén listas.

## Antes de publicar

Revisa la configuración real que estás por activar.

Confirma:

- Qué señal inicia el flujo.
- Cuánto espera Hellotext antes del primer mensaje.
- Qué audiencia puede entrar.
- Qué canal envía el mensaje.
- Si aplican horarios silenciosos, límites de frecuencia y reglas de consentimiento.
- Qué detiene el seguimiento.
- Cuándo debería tomar la conversación una persona.
- Qué reporte o métrica vas a revisar después del lanzamiento.

No actives varios flujos de recuperación de carrito para los mismos clientes al mismo tiempo, salvo que estés probando intencionalmente cómo interactúan.

## Guías relacionadas

- [Elige tu primer playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
