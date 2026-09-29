La recuperación de carrito abandonado puede ser simple o dinámica.

En Hellotext, un seguimiento básico de carrito abandonado puede funcionar como una plantilla de ruta con pasos fijos. La misión Recuperador de Carritos con IA usa el contexto del carrito y del cliente para preparar un recordatorio saliente y evaluar si puede enviarlo.

Ambas opciones son válidas. Elige la versión más simple que coincida con tu objetivo, datos y preparación del equipo.

## Usa una plantilla de ruta cuando

Usa [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando quieres un flujo paso a paso predecible.

Una ruta suele ser la mejor primera opción cuando:

- Quieres una secuencia y un mensaje que puedas definir de antemano.
- Quieres configurar la espera, la condición de compra y los pasos de la ruta.
- Ya sabes qué link de checkout usar y si ofrecerás un cupón.
- Quieres revisar cada paso antes de publicar.

Por ejemplo, cuando se registra `cart.abandoned`, la ruta puede esperar, comprobar si hubo una compra y enviar un recordatorio sólo si todavía se cumplen las condiciones. Puedes añadir otros pasos si los necesitas.

## Usa una misión de carrito con IA cuando

Usa una misión con IA cuando el recordatorio saliente debería adaptarse al carrito y al cliente.

Una misión de carrito con IA encaja mejor cuando:

- El contenido del carrito, los productos y los datos del cliente varían entre casos.
- Quieres que el texto del recordatorio use ese contexto antes de enviarse.
- La elegibilidad, el momento de envío y los canales disponibles pueden variar por cliente.
- Quieres configurar el tono y, si corresponde, la estrategia de descuento.

Por ejemplo, [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) puede preparar un recordatorio según el carrito, el producto y el perfil; también puede omitir o detener el envío si el cliente no es elegible o hizo una compra pertinente. Si invitas al cliente a responder, configura por separado quién atenderá esa respuesta en Inbox: esta misión no responde preguntas ni recomienda alternativas por sí sola.

## Qué necesitan ambas opciones

Ambas opciones dependen de una configuración confiable.

Antes de lanzar cualquiera de las dos, confirma:

- La señal de carrito o checkout llega y coincide con el disparador elegido. En las configuraciones iniciales, `cart.abandoned` se registra después de detectar el abandono; salir de una página no basta por sí solo.
- La señal se asocia al perfil de cliente correcto.
- Los datos del producto y el link de checkout que usará el mensaje están actualizados.
- Hay un canal disponible y el cliente tiene consentimiento para recibir el mensaje.
- Una compra que cumple las condiciones de la ruta o la misión impide que se envíe un recordatorio innecesario.
- Los links y eventos funcionan en una prueba; si ofreces un cupón, prueba también que se aplique.

Sigue leyendo: [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Cómo elegir

Elige una **plantilla de ruta** si principalmente necesitas control, velocidad y una secuencia conocida.

Elige una **misión de carrito con IA** si principalmente necesitas redactar y enviar un recordatorio según el contexto del carrito, el cliente y el canal disponible.

Si este es tu primer lanzamiento de recuperación de carritos, empieza con la versión que tu equipo pueda probar y medir con confianza. Puedes empezar con una ruta, aprender de los primeros resultados y pasar a una misión con IA cuando las señales y los datos de producto sean confiables.

## Antes de publicar

Revisa la configuración real que estás por activar.

En ambos casos, confirma qué perfiles son elegibles, qué reglas de consentimiento y frecuencia aplican, si una compra detiene el envío según la opción elegida y qué métrica revisarás después del lanzamiento.

Si eliges la **ruta**, revisa el disparador, la espera, la condición de compra antes del mensaje, el texto, el link y cualquier cupón. Comprueba el canal disponible para ese mensaje.

Si eliges la **misión con IA**, revisa la selección de canales, el tono, la estrategia de descuento si la usas y las condiciones que permiten u omiten el envío. Si el mensaje invita a responder, comprueba que haya una atención de Inbox configurada por separado.

Si Recuperador de Carritos con IA está activo, recibe `cart.abandoned` antes que la ruta; la ruta se usa cuando esa misión no está activa. Comprueba cuál de las dos opciones debería gestionar el evento antes de habilitarlas.

## Guías relacionadas

- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
