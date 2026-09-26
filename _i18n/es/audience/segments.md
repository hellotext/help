Los segmentos son grupos dinámicos de perfiles de cliente. Hellotext incluye un perfil mientras cumple las condiciones del segmento y actualiza la pertenencia cuando cambian los datos del perfil y la actividad rastreada.

Usa un segmento cuando puedas describir una audiencia mediante una regla, como clientes que compraron recientemente, suscriptores de un país determinado o perfiles que pertenecen a una lista seleccionada y cumplen otra condición.

Si necesitas conservar un grupo seleccionado de forma explícita, usa una lista. Sigue leyendo: [Listas vs. segmentos]({% link _audience/lists-and-segments.md %}).

## Antes de crear un segmento

Define la pregunta que debe responder el segmento y confirma que Hellotext recibe los datos necesarios para responderla.

Por ejemplo, antes de crear un segmento de clientes interesados en una categoría de productos, revisa qué campo usa tu plataforma de eCommerce conectada. Según la integración, el valor útil puede estar en una categoría, colección, etiqueta o propiedad personalizada.

También conviene identificar algunos perfiles de cliente que deberían coincidir y otros que no. Puedes usarlos para revisar el resultado después de guardar.

## Crea un segmento

1. Ve a **Audiencia**.
2. Selecciona el botón **+** cerca de la esquina inferior derecha.
3. Selecciona **Nuevo Segmento**.
4. Reemplaza el título predeterminado por un nombre claro para el segmento.
5. Selecciona **Elige una condición** y elige **Actividad del cliente** o **Características del cliente**.

En el menú del botón **+**, **Nuevo Segmento** aparece debajo de **Importar Clientes**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Menú para crear un segmento">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 280px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/segments/audience-menu-es.png" width="586" height="598" loading="lazy" decoding="async" alt="Menú del botón más en Audiencia con la opción Nuevo Segmento resaltada, debajo de Importar Clientes." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Captura de la interfaz real en español; el menú está abierto y no muestra datos de clientes.</figcaption>
</figure>

En el editor, **Elige una condición** ofrece estos dos tipos de criterio:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tipos de condición de un segmento nuevo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 550px; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/audience/segments/condition-chooser-es.png" width="1144" height="760" loading="lazy" decoding="async" alt="Editor Nuevo Segmento con Elige una condición abierto y las opciones Actividad del cliente y Características del cliente." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Captura de la interfaz real en español con un segmento de demostración sin guardar.</figcaption>
</figure>

Usa un nombre que describa la regla en lugar de una campaña temporal. Por ejemplo, `Compró calzado en los últimos 30 días` será más fácil de entender después que `Audiencia agosto`.

## Elige un tipo de condición

### Actividad del cliente

Usa condiciones de actividad para acciones que ocurrieron o no ocurrieron. Según los datos conectados al negocio, la actividad disponible puede incluir:

* Actividad de suscripción y enlaces cortos.
* Mensajes entregados o recibidos.
* Vistas de producto, actividad del carrito, compras y reembolsos.
* Actividad en páginas.
* Acciones personalizadas rastreadas.

Elige si la actividad **ocurrió** o **no ocurrió**. Cuando la condición ofrece un período, define hasta cuánto tiempo atrás debería evaluar Hellotext la actividad. Las condiciones de producto y página pueden mostrar filtros adicionales para limitar la regla a los productos, categorías, colecciones, etiquetas, URLs u otros campos disponibles que correspondan.

### Características del cliente

Usa condiciones de características para lo que se conoce actualmente sobre un perfil de cliente. Las condiciones disponibles pueden incluir:

* Propiedades estándar y personalizadas del perfil.
* Pertenencia a listas.
* Estado de suscripción.
* Propensión de compra cuando está disponible.
* País, ubicación e información del dispositivo.
* Canal de mensajería conectado.

Elige si el perfil debería cumplir o no cumplir la condición seleccionada y completa el valor requerido por esa propiedad o filtro.

## Combina condiciones con Y y O

El creador de segmentos agrupa las condiciones de dos maneras:

* **O** agrega otra alternativa dentro del mismo bloque. Un perfil puede cumplir cualquiera de las condiciones de ese bloque.
* **Y** agrega otro bloque. Un perfil también debe cumplir ese bloque para entrar al segmento.

En este ejemplo, el primer bloque incluye a clientes que se suscribieron **o** enviaron un mensaje. El bloque siguiente agrega **y** una característica: tener más de 18 años. La regla completa exige cumplir ese segundo bloque y al menos una de las dos actividades.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Ejemplo de condiciones O e Y en el editor de segmentos">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 550px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/segments/rule-logic-es-mobile.png" width="640" height="1160" />
        <img class="ht-editorial-visual__image" src="/images/audience/segments/rule-logic-es.png" width="1144" height="1250" loading="lazy" decoding="async" alt="Bloque Actividad del cliente con Se suscribió O Cliente envió un mensaje; debajo, Y conecta un bloque Características del cliente con Edad más que 18." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Captura de la interfaz real en español con condiciones de demostración en un segmento sin guardar.</figcaption>
</figure>

Lee la regla completa antes de guardar. Una condición **Y** u **O** mal ubicada puede hacer que el segmento sea mucho más amplio o más reducido de lo esperado.

## Guarda y revisa el resultado

Selecciona **Guardar** cuando el nombre y las condiciones estén listos.

Hellotext calcula los perfiles que cumplen las reglas. Mientras realiza ese trabajo, el segmento puede indicar que se está actualizando. Los eventos nuevos y cambios en los perfiles también pueden iniciar actualizaciones posteriores, por lo que los resultados pueden demorar un momento en aparecer.

Después de guardar:

* Revisa la cantidad total de perfiles.
* Abre varios perfiles incluidos y confirma por qué cumplen las reglas.
* Revisa algunos perfiles que esperabas encontrar pero no aparecen.
* Confirma que los períodos, inclusiones, exclusiones y campos de producto significan lo que esperabas.
* Revisa por separado la elegibilidad de suscripción antes de usar el segmento para enviar mensajes.

Un segmento organiza perfiles; no suscribe clientes ni anula una baja.

## Edita un segmento

En **Audiencia**, busca el segmento en el grupo **Segmentos** y usa su botón de edición. Puedes cambiar el nombre, agregar o eliminar condiciones o modificar sus valores.

Después de guardar cambios en las reglas, Hellotext vuelve a calcular la pertenencia. Revisa nuevamente la cantidad de perfiles antes de usar el segmento actualizado en una campaña.

## Elimina un segmento

Abre el editor del segmento y selecciona el botón de la papelera. Eliminar un segmento elimina el segmento, no los perfiles de cliente que contenía.

Si una campaña en borrador usa el segmento, Hellotext te pide confirmación porque eliminarlo también quita esa referencia de audiencia del borrador.

## Si el resultado no parece correcto

Revisa estas causas frecuentes:

* La propiedad o actividad necesaria no está llegando a Hellotext.
* El período seleccionado es demasiado corto o demasiado amplio.
* Un bloque **Y** debería ser una alternativa **O**, o al revés.
* Una condición excluye perfiles en lugar de incluirlos.
* La información del producto está en otro campo para la integración conectada.
* El segmento todavía se está recalculando.

Prueba con perfiles de cliente conocidos antes de depender de un segmento nuevo o modificado de manera importante.

## Guías relacionadas

* [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
* [Entiende los perfiles de cliente]({% link _audience/customer-profiles.md %})
* [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
* [Crea y gestiona listas]({% link _audience/lists.md %})
* [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
* [Eventos de seguimiento]({% link _developers/tracking-events.md %})
