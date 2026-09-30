Formulario de Sitio Web te permite recopilar datos de contacto y otra información del perfil del cliente mediante un formulario integrado en una página de tu sitio.

Es una misión de captura, no una misión agéntica ni una ruta. El formulario crea o actualiza un perfil del cliente. De forma opcional, puedes asignar un cupón y conectar la captura con una ruta de bienvenida o seguimiento.

## Cuándo usar Formulario de Sitio Web

Usa Formulario de Sitio Web cuando quieras:

- Integrar un formulario de suscripción o perfil dentro de una página existente.
- Recopilar teléfono, email, nombre o propiedades personalizadas del perfil del cliente.
- Compartir una versión del formulario alojada por Hellotext sin crear primero una página.
- Entregar un cupón opcional después de completar el formulario.
- Iniciar una ruta de bienvenida o seguimiento después de la captura.

Usa un [Popup de Sitio Web]({% link _captures/website-popup.md %}) cuando la experiencia deba abrirse sobre la página o comenzar desde un botón flotante. Usa un [Enlace Compartible]({% link _captures/shareable-link.md %}) cuando la suscripción deba abrir SMS o WhatsApp con un mensaje previamente completado.

## Antes de comenzar

Define dónde aparecerá el formulario y qué información necesitas al momento de la suscripción. Un teléfono o email suele ser suficiente para establecer un perfil del cliente útil. Solicita propiedades adicionales solo cuando tengan un propósito claro.

También confirma:

- Qué propiedades estándar o personalizadas del perfil debe recopilar el formulario.
- Qué campos son obligatorios.
- Qué valor u oferta comunica la página.
- Si se debe asignar un cupón después del envío.
- Si se debe iniciar una ruta al completar el formulario.
- Quién puede instalar el código generado si vas a integrar el formulario.
- Que el aviso de consentimiento describa correctamente los mensajes que la persona acepta recibir.

Para conocer los requisitos de elegibilidad y consentimiento, consulta [A quién puedes enviar mensajes]({% link _audience/consent-and-subscriber-status.md %}).

## Crear el formulario

1. Abre **Misiones** y haz clic en **Explorar misiones**.
2. Busca el grupo **Captura** y elige **Formulario de Sitio Web**.
3. Asigna un nombre que identifique la ubicación o el propósito del formulario.
4. Edita el encabezado y el contenido de apoyo.
5. Agrega y configura los campos del perfil del cliente que necesites.
6. Edita el botón de envío y el aviso de consentimiento.
7. Haz clic en **Guardar & Continuar**.
8. Asigna un cupón y una ruta, u omite este paso opcional.
9. Elige entre compartir el enlace alojado o integrar el formulario en tu sitio.

Usa un nombre diferente para cada ubicación cuando necesites comparar resultados, por ejemplo `Footer del newsletter` o `Página de consultas mayoristas`.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Formulario de Sitio Web en el catálogo de misiones">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 834px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/capture-overview/desktop-form-es.png 2x" width="800" height="480" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/es/catalog-desktop-row.png" srcset="/images/captures/forms/es/catalog-desktop-row.png 2x" style="width: auto; margin: 0 auto;" width="1632" height="480" loading="lazy" decoding="async" alt="Formulario de Sitio Web en el catálogo de escritorio, junto a Popup de Sitio Web; en pantallas estrechas se muestra solo la tarjeta del formulario." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Cuadrícula de escritorio del catálogo ficticio; la vista estrecha conserva la tarjeta de Formulario de Sitio Web a un tamaño legible.</figcaption>
</figure>

## Configurar el contenido y los campos

El editor permite configurar cuatro partes.

### Encabezado

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Vista previa de un formulario ficticio con título, teléfono, botón y aviso SMS">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 490px; width: fit-content; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/preview.png" srcset="/images/captures/forms/ui-refresh/es/preview.png 2x" width="944" height="780" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Formulario ficticio con encabezado Recibe novedades de Editorial Demo, campo Teléfono, botón Suscribirme y aviso de consentimiento para SMS." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">La vista previa reúne las cuatro partes del formulario. El aviso de SMS coincide con el teléfono solicitado.</figcaption>
</figure>

El encabezado contiene el título y el contenido de apoyo que aparecen antes de los campos. Úsalo para explicar por qué conviene completar el formulario y qué sucederá después.

### Campos

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Configuración del campo Teléfono en el editor de formularios">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 894px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/forms/ui-refresh/es/fields-mobile.png 2x" width="712" height="632" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/fields.png" srcset="/images/captures/forms/ui-refresh/es/fields.png 2x" width="1752" height="1028" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel de un campo Teléfono ficticio con tipo, etiqueta, marcador de posición y control Requerido." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selecciona un campo en la vista previa para ajustar su tipo, etiqueta, marcador de posición y obligatoriedad.</figcaption>
</figure>

Los campos pueden usar información estándar como nombre, apellido, teléfono y email, además de las propiedades personalizadas compatibles que ya existan en los perfiles del cliente. Usa una etiqueta y un placeholder claros para cada campo, y márcalo como obligatorio solo cuando el formulario no pueda cumplir su propósito sin esa información.

Mantén el formulario enfocado. Un formulario corto es más fácil de completar desde un teléfono y permite enriquecer el perfil más adelante mediante conversaciones, compras u otras misiones de captura.

### Botón

El botón envía el formulario. Usa una etiqueta de acción breve que deje claro el resultado, como **Suscribirme**, **Recibir novedades** o **Enviar**.

### Aviso

El aviso aparece después del botón y puede contener el consentimiento, la privacidad u otra información de apoyo. Confirma que coincida con los canales y tipos de mensajes que la persona acepta recibir.

Revisa el texto precargado antes de guardar: adapta la mención del canal a los campos que solicita este formulario. Si pides un teléfono, un aviso que solo habla de emails no describe esa suscripción.

## Asignar un cupón y una ruta

La asignación de cupón y ruta es opcional.

Asigna un cupón solo cuando la página prometa un descuento por completar el formulario. Confirma que la oferta y sus condiciones coincidan con lo que la persona ve antes de enviarlo.

Asigna una ruta cuando la nueva persona suscrita deba entrar en un flujo de bienvenida o seguimiento. Comprueba que otra captura o integración no inicie ya la misma ruta para esta suscripción.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selectores opcionales de cupón y ruta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 421px; width: fit-content; margin: 0 auto;">
      <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/optional.png" srcset="/images/captures/forms/ui-refresh/es/optional.png 2x" width="806" height="456" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Paso opcional de un formulario ficticio con selectores de cupón y ruta sin asignar." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Ambas asignaciones son opcionales; este borrador ficticio no activa cupón ni ruta.</figcaption>
</figure>

## Publicar el formulario

Después de guardar, Hellotext ofrece dos maneras de usar el formulario.

### Compartir el enlace alojado

Copia el enlace generado cuando quieras que Hellotext aloje el formulario. Ábrelo en una pestaña nueva y prueba el envío completo antes de compartirlo con clientes.

### Integrarlo en tu sitio

Usa el HTML generado cuando el formulario deba aparecer dentro de una de tus páginas.

1. Confirma que el sitio esté conectado mediante una integración de eCommerce compatible o que tenga instalado [Hellotext.js](https://github.com/hellotext/hellotext.js).
2. Copia el código generado exactamente como lo proporciona Hellotext.
3. Pégalo dentro del cuerpo de la página donde debe aparecer.
4. Aplica los estilos de tu sitio sin eliminar ni cambiar los atributos generados del formulario.

El código contiene el identificador que Hellotext utiliza para cargar la definición del formulario. Copia siempre el snippet actual desde el producto en lugar de reconstruirlo a partir de un ejemplo de esta guía.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Código HTML generado para integrar el formulario">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 568px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/forms/ui-refresh/es/embed-mobile.png 2x" width="904" height="432" />
        <img class="ht-editorial-visual__image" src="/images/captures/forms/ui-refresh/es/embed.png" srcset="/images/captures/forms/ui-refresh/es/embed.png 2x" width="1100" height="1084" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tarjeta de integración que muestra el HTML generado para el formulario ficticio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">El snippet incluye el identificador del formulario y las partes que Hellotext completa al cargarlo en tu página.</figcaption>
</figure>

## Cómo funciona la verificación

Cuando un envío incluye un teléfono o email nuevo, Hellotext puede enviar un enlace de verificación a ese destino. Esto protege la información existente del perfil y ayuda a evitar que alguien envíe los datos de contacto de otra persona.

Es posible que visitantes ya identificados no tengan que repetir la verificación cuando el teléfono o email enviado coincida con su perfil del cliente. Una vez verificados los identificadores, Hellotext puede asociar la información de forma segura con un perfil existente y combinar perfiles coincidentes cuando sea necesario.

## Probar antes de compartir

Prueba la experiencia completa con datos de cliente a los que puedas acceder de forma segura.

Confirma que:

- El enlace alojado se abre o el formulario integrado carga en la página prevista.
- El encabezado, los campos, el botón y el aviso se leen correctamente en computadoras y teléfonos.
- Los campos obligatorios impiden envíos incompletos y explican qué falta.
- El teléfono, el email y las propiedades personalizadas llegan al perfil del cliente correcto.
- Los mensajes de verificación llegan a los teléfonos o emails nuevos.
- El cupón asignado se entrega cuando hay uno configurado.
- La ruta asignada comienza una sola vez después de completar el formulario.
- Los estilos de la página no ocultan errores, etiquetas, el botón ni el aviso de consentimiento.

Después de completar el formulario, el mismo navegador puede recordar que ya fue enviado. Usa una ventana privada cuando necesites repetir una prueba desde cero.

## Si el formulario no carga

Revisa estos puntos en orden:

1. Confirma que el código generado esté presente en la página.
2. Confirma que la integración de eCommerce conectada o Hellotext.js cargue correctamente.
3. Compara el código integrado con el snippet actual que muestra Hellotext.
4. Revisa si los estilos o scripts del sitio ocultan o reemplazan el formulario.
5. Prueba el enlace alojado para diferenciar un problema de configuración de uno de instalación.
6. Prueba en una ventana privada.

Al reportar un problema, incluye el nombre del formulario, la URL probada, el dispositivo, la hora aproximada y si el formulario no cargó o falló después del envío.

## Eventos de JavaScript

Los desarrolladores pueden escuchar estos eventos de Hellotext.js:

- `forms:collected`: se emite después de que Hellotext carga las definiciones de los formularios encontrados en la página.
- `form:completed`: se emite después de enviar correctamente un formulario.

Usa el contenido del evento provisto por la versión instalada de Hellotext.js en lugar de depender de una estructura no documentada.

## Guías relacionadas

- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Popup de Sitio Web]({% link _captures/website-popup.md %})
- [Enlaces Compartibles]({% link _captures/shareable-link.md %})
- [A quién puedes enviar mensajes]({% link _audience/consent-and-subscriber-status.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
