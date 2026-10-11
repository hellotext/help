Usa una ruta personalizada cuando una misión de tipo ruta no coincide con el flujo que necesitas.

Una ruta personalizada te da un lienzo en blanco. Tú eliges el disparador, agregas los pasos, defines los tiempos y decides cuándo los clientes deben continuar, ramificarse, recibir un mensaje o salir de la ruta.

## Selecciona un disparador

El disparador es la acción del cliente que inicia la ruta.

Para seleccionarlo:

1. Abre el inicio del flujo.
2. Elige la acción que debería iniciar la ruta.
3. Confirma el disparador.

El disparador puede ser un evento estándar, como una suscripción, actualización de carrito, vista de producto, compra o mensaje. También puede ser un evento personalizado si tu cuenta lo registra.

<!-- journeys-workflow:custom-trigger-selected:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-trigger-selected" aria-label="Elige el disparador de la ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-trigger-selected-es-mobile.png 4x" width="1560" height="3376" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-trigger-selected-es-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-trigger-selected-es-desktop.png 4x" width="2304" height="3040" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel Inicio de ruta con Visitó un producto elegido y los botones Confirmar y Cancelar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El panel muestra Visitó un producto elegido antes de pulsar Confirmar.</figcaption>
</figure>
<!-- journeys-workflow:custom-trigger-selected:end -->

## Agrega pasos

Las rutas avanzan en secuencia de un paso al siguiente.

Para agregar un paso, arrástralo al lugar del flujo donde debería ocurrir.

<!-- journeys-workflow:custom-canvas-start:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-canvas-start" aria-label="Conexiones iniciales de la ruta ficticia guardada">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 458px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-canvas-start-es-mobile-v3.png 4x" width="1560" height="3280" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-canvas-start-es-desktop-v2.png" srcset="/images/editorial/journeys-workflow-20261010/custom-canvas-start-es-desktop-v2.png 4x" width="1760" height="3200" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fragmento guardado de la ruta ficticia: Visitó un producto, espera de 2 horas y condición con las ramas Edad más que 18 y Demás." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo ficticio guardado: Visitó un producto conecta con una espera de dos horas y una condición con las ramas Edad más que 18 y Demás.</figcaption>
</figure>
<!-- journeys-workflow:custom-canvas-start:end -->

Tipos de pasos comunes:

### Enviar un mensaje

Usa este paso para enviar un mensaje al cliente.

Los mensajes pueden incluir links cortos, etiquetas, cupones e información de producto cuando el disparador incluye contexto de producto.

<!-- journeys-workflow:custom-message-sms:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-message-sms" aria-label="Ejemplo de mensaje con SMS seleccionado">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-message-sms-es-mobile.png 4x" width="1560" height="2600" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-message-sms-es-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-message-sms-es-desktop.png 4x" width="2304" height="2560" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Editor de Enviar un mensaje con un saludo ficticio de Vista Studio y SMS seleccionado entre las opciones de canal." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo ficticio de un mensaje de Vista Studio con SMS seleccionado.</figcaption>
</figure>
<!-- journeys-workflow:custom-message-sms:end -->

### Condición

Usa una condición cuando el flujo debería dividirse según datos o comportamiento del cliente.

Por ejemplo, puedes enviar por un camino a clientes que compraron y por otro a clientes que no compraron.

El siguiente ejemplo usa la edad como condición para una rama.

<!-- journeys-workflow:custom-condition-age:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-condition-age" aria-label="Ejemplo de condición por edad">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-condition-age-es-mobile.png 4x" width="1560" height="2440" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-condition-age-es-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-condition-age-es-desktop.png 4x" width="2304" height="2320" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel Condición con una regla de Edad, Más que, 18 y la opción de no esperar hasta que se cumpla una condición." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo de una rama con Edad, Más que y 18, sin espera adicional en la condición.</figcaption>
</figure>
<!-- journeys-workflow:custom-condition-age:end -->

### Esperar

Usa un paso de espera para pausar el flujo antes de la siguiente acción.

Por ejemplo, puedes esperar dos horas antes de enviar un recordatorio de carrito abandonado.

<!-- journeys-workflow:custom-wait-two-hours:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-wait-two-hours" aria-label="Espera de dos horas">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-wait-two-hours-es-mobile-compact.png 4x" width="1560" height="1040" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-wait-two-hours-es-desktop-compact.png" srcset="/images/editorial/journeys-workflow-20261010/custom-wait-two-hours-es-desktop-compact.png 4x" width="2304" height="920" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel Esperar con el valor 2 y la unidad Horas." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo de configuración de Esperar con un intervalo de 2 horas.</figcaption>
</figure>
<!-- journeys-workflow:custom-wait-two-hours:end -->

### Derivación humana

Configura un paso de asignación cuando una persona o equipo deba tomar la conversación. La asignación no detiene la ruta por sí sola: después continúa al siguiente paso. Si el flujo debe terminar tras derivar, revisa la conexión al final y su configuración. La opción **Regresar a la ruta de IA** controla qué ocurre al terminar; no selecciona a una persona o equipo.

Esto es especialmente importante para preguntas de soporte, reembolsos, preguntas complejas de producto o clientes insatisfechos.

<!-- journeys-workflow:custom-assignment-sofia:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-assignment-sofia" aria-label="Ejemplo de asignación a Sofía">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-assignment-sofia-es-mobile.png 4x" width="1560" height="1360" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-assignment-sofia-es-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-assignment-sofia-es-desktop.png 4x" width="2304" height="1200" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel Asignación con la opción Asignar conversación a Sofía, una integrante ficticia del equipo." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ejemplo de asignación de la conversación a Sofía, una integrante ficticia del equipo.</figcaption>
</figure>
<!-- journeys-workflow:custom-assignment-sofia:end -->

<!-- journeys-workflow:custom-canvas-end:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-canvas-end" aria-label="Conexiones de la asignación y el final de ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 458px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-canvas-end-es-mobile-v3.png 4x" width="1560" height="3760" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-canvas-end-es-desktop-v2.png" srcset="/images/editorial/journeys-workflow-20261010/custom-canvas-end-es-desktop-v2.png 4x" width="1760" height="3760" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Fragmento del ejemplo ficticio con el mensaje conectado a Asignación a Sofía y después a Fin de ruta; la rama Demás también llega al final." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El mensaje se conecta con la asignación a Sofía y después con Fin de ruta; la rama Demás también llega al final.</figcaption>
</figure>
<!-- journeys-workflow:custom-canvas-end:end -->

El final se configura por separado en **Fin de ruta**.

<!-- journeys-workflow:custom-end-policy:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-end-policy" aria-label="Configuración del final de la ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 594px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-end-policy-es-mobile.png 4x" width="1560" height="880" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-end-policy-es-desktop-v2.png" srcset="/images/editorial/journeys-workflow-20261010/custom-end-policy-es-desktop-v2.png 4x" width="2304" height="860" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel Fin de ruta con el interruptor Regresar a la ruta de IA desactivado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">En este ejemplo, Regresar a la ruta de IA está desactivado en Fin de ruta.</figcaption>
</figure>
<!-- journeys-workflow:custom-end-policy:end -->

## Guarda y publica

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

Cuando esté lista, haz clic en **Publicar**.

<!-- journeys-workflow:custom-active:start -->
<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-journey-figure="custom-active" aria-label="Ruta ficticia publicada en Activas">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 432px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/editorial/journeys-workflow-20261010/custom-active-es-mobile.png 4x" width="1560" height="1028" />
        <img class="ht-editorial-visual__image" src="/images/editorial/journeys-workflow-20261010/custom-active-es-desktop.png" srcset="/images/editorial/journeys-workflow-20261010/custom-active-es-desktop.png 4x" width="1656" height="952" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Listado de rutas con Activas seleccionado y la ruta ficticia con su disparador Visitó un producto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La ruta ficticia aparece en Activas después de publicarla.</figcaption>
</figure>
<!-- journeys-workflow:custom-active:end -->

Para dejar una ruta activa en estado inactivo, haz clic en **Desactivar**.
