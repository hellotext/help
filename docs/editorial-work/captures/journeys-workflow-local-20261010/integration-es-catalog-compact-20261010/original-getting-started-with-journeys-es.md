Usa una ruta cuando quieres un flujo de clientes paso a paso con un disparador claro, esperas, mensajes, condiciones, ramas y derivaciones.

Una ruta es un tipo de misión. No todas las misiones son rutas.

Algunas misiones son más autónomas: por ejemplo, [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}), [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}), [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}), [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) o [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) pueden leer señales, entender intención y decidir qué hacer en la conversación. Esas misiones pueden usar agentes de IA o lógica de decisión en lugar de una ruta fija.

## Cuándo usar una ruta

Usa una ruta cuando la secuencia debería ser predecible y quieres controlar el camino.

Buenos casos para una ruta:

- Dar la bienvenida a un nuevo suscriptor.
- Ejecutar una ruta simple de carrito abandonado.
- Enviar un seguimiento después de una compra.
- Esperar una cantidad específica de tiempo antes de un segundo mensaje.
- Ramificar según si el cliente hizo clic, respondió, compró o cumplió una condición.
- Derivar a una persona después de un paso específico.

Un carrito abandonado puede existir de más de una forma: como [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) con pasos fijos, o como una misión con IA que decide de forma más dinámica usando señales y contexto del cliente.

<!-- journeys-entry:catalog-route-vs-agent:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="catalog-route-vs-agent" aria-label="Distingue las dos opciones de carrito">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1618px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-entry-20261010/catalog-route-vs-agent-es-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-entry-20261010/catalog-route-vs-agent-es-desktop.png" srcset="/images/editorial/journeys-entry-20261010/catalog-route-vs-agent-es-desktop.png 4x" width="6400" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Catálogo de Hellotext con las tarjetas Recuperador de Carritos y Recuperador de Carritos con IA." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Las dos tarjetas del catálogo permiten distinguir una ruta de carrito de la misión con IA.</figcaption>
</figure>
<!-- journeys-entry:catalog-route-vs-agent:end -->

Sigue leyendo: [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) y [Carrito abandonado: plantilla de ruta vs misión con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## Cuándo usar otro tipo de misión

Usa una misión más autónoma o un agente de IA cuando la experiencia necesita decidir en tiempo real.

Ejemplos:

- Recomendar productos desde un catálogo.
- Responder preguntas frecuentes con [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}).
- Guiar seguimiento de pedidos, cancelaciones, cambios o devoluciones con la misión post-compra correcta.
- Entender el mensaje de un cliente y elegir la siguiente respuesta.
- Decidir qué oferta, producto, canal o momento es mejor para cada cliente.
- Coordinarse con otras misiones para no saturar a los clientes.

Sigue leyendo: [Resumen de misiones y automatización]({% link _journeys/playbooks-overview.md %}).

## Cómo funcionan las rutas

Una ruta empieza cuando un cliente coincide con un disparador. Ese disparador puede venir de una herramienta de captura, la integración de tu tienda, una campaña, un evento personalizado o una conversación.

Después del disparador, Hellotext mueve al cliente por la ruta que definiste. La ruta puede enviar un mensaje, esperar un tiempo, revisar una condición, ramificar, aplicar un cupón o derivar la conversación a una persona.

La diferencia importante es que la ruta la diseñas tú. Hellotext sigue la ruta y sus condiciones; no es lo mismo que una misión autónoma decidiendo cómo cumplir el objetivo por sí sola.

## Empieza desde una plantilla de ruta

Usa una plantilla de ruta cuando quieres lanzar rápidamente un flujo paso a paso probado.

Para crear una, ve al área de automatización en Hellotext, elige una plantilla de ruta, revisa el disparador y los pasos, y ajusta el texto, tiempos, canal, condiciones y reglas de derivación antes de publicar.

<!-- journeys-workflow:template-cart-selected:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="template-cart-selected" aria-label="Fragmento inicial de una plantilla de ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 818px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/template-cart-selected-es-mobile.png 4x" width="1560" height="2200" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/template-cart-selected-es-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/template-cart-selected-es-desktop.png 4x" width="3200" height="2320" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fragmento inicial de una plantilla en el editor de rutas, con el comienzo conectado a un paso de espera de 2 horas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Inicio de la plantilla Salvador de Carrito #1, con una espera de dos horas conectada al comienzo de la ruta.</figcaption>
</figure>
<!-- journeys-workflow:template-cart-selected:end -->

Si ninguna plantilla se ajusta a lo que necesitas, crea una [ruta personalizada]({% link _journeys/custom-journey.md %}).

<!-- journeys-entry:catalog-builder-choice:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="catalog-builder-choice" aria-label="Localiza el constructor de rutas">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1618px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-entry-20261010/catalog-builder-choice-es-mobile.png 4x" width="1560" height="4000" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-entry-20261010/catalog-builder-choice-es-desktop.png" srcset="/images/editorial/journeys-entry-20261010/catalog-builder-choice-es-desktop.png 4x" width="6400" height="4000" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Catálogo de Hellotext con las opciones Creador de Rutas y Agente personalizado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Creador de Rutas es la entrada para diseñar una ruta personalizada.</figcaption>
</figure>
<!-- journeys-entry:catalog-builder-choice:end -->

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

Haz clic en **Guardar** mientras trabajas. Al guardar una ruta nueva sin publicarla, queda como borrador. Guardar cambios en una ruta ya activa no la desactiva.

<!-- journeys-workflow:custom-saved-draft:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-saved-draft" aria-label="Ruta ficticia guardada como borrador">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 432px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-saved-draft-es-mobile.png 4x" width="1560" height="1028" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-saved-draft-es-desktop-v2.png" srcset="/images/editorial/journeys-workflow-20261010/custom-saved-draft-es-desktop-v2.png 4x" width="1656" height="952" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Listado de rutas con Borradores seleccionado y la ruta ficticia guardada con el disparador Visitó un producto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La ruta ficticia guardada aparece en Borradores.</figcaption>
</figure>
<!-- journeys-workflow:custom-saved-draft:end -->

Cuando esté lista, haz clic en **Publicar**. Para dejar una ruta activa en estado inactivo, haz clic en **Desactivar**.

## Próximos pasos

Si tu flujo necesita un agente de IA, revisa [cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).
