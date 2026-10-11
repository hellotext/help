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

Tipos de pasos comunes:

### Enviar un mensaje

Usa este paso para enviar un mensaje al cliente.

Los mensajes pueden incluir links cortos, etiquetas, cupones e información de producto cuando el disparador incluye contexto de producto.

### Condición

Usa una condición cuando el flujo debería dividirse según datos o comportamiento del cliente.

Por ejemplo, puedes enviar por un camino a clientes que compraron y por otro a clientes que no compraron.

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

## Guarda y publica

Haz clic en **Guardar** mientras trabajas. Al guardar una ruta nueva sin publicarla, queda como borrador. Guardar cambios en una ruta ya activa no la desactiva.

Cuando esté lista, haz clic en **Publicar**. Para dejar una ruta activa en estado inactivo, haz clic en **Desactivar**.
