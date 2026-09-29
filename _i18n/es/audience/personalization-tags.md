Las etiquetas de personalización insertan datos del cliente en un mensaje cuando Hellotext lo envía. Permiten que un mismo mensaje salude a cada cliente por su nombre o incluya otro valor disponible para ese cliente y contexto.

Estas etiquetas son variables que se usan dentro del contenido del mensaje. Son diferentes de los tags del perfil, las listas o los segmentos que organizan una audiencia.

## Dónde puedes usarlas

El editor de mensajes aparece en campañas, rutas, misiones, Inbox y otras partes de Hellotext. Cuando ese editor admite personalización, su barra de herramientas incluye el botón **Insertar etiquetas** con un icono de llaves.

Abre el selector para ver las etiquetas de perfil y propiedades personalizadas que ofrece ese editor. Es más confiable que escribirlas de memoria porque las opciones pueden depender de las propiedades de tu negocio. Las etiquetas contextuales de productos, carritos u otros objetos dependen del flujo y no necesariamente aparecen en ese selector.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Selector de etiquetas del editor de mensajes">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 800px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/audience/personalization-tags/selector-es-mobile.png" width="1020" height="780" />
        <img class="ht-editorial-visual__image" src="/images/audience/personalization-tags/selector-es.png" width="1600" height="1360" loading="lazy" decoding="async" alt="Editor de mensajes con el botón de llaves y el selector Etiquetas abierto; muestra name, email y la propiedad ficticia Nivel de fidelidad." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español de una cuenta aislada con datos ficticios; el borrador no se envió.</figcaption>
</figure>

## Inserta una etiqueta

1. Coloca el cursor donde debe aparecer el valor personalizado.
2. Selecciona **Insertar etiquetas** en el editor de mensajes.
3. Elige el dato del cliente o propiedad que quieres insertar.
4. Previsualiza o prueba el mensaje con perfiles que tengan y no tengan ese valor.

Hellotext inserta la etiqueta entre llaves. Por ejemplo:

```text
Hola {name},
elegimos algo para ti.
```

Cuando el mensaje se prepara para una cliente llamada Ana, Hellotext reemplaza `{name}` por `Ana`.

Algunas etiquetas comunes del cliente son:

- `{name}` para el nombre.
- `{full_name}` para el nombre completo.
- `{last_name}` para el apellido.
- `{birthday}` para el cumpleaños.
- `{phone}`, `{email}` o `{address}` para el valor correspondiente del perfil.

El selector también puede incluir propiedades personalizadas compatibles configuradas para tu negocio.

## Agrega un valor alternativo

Si el perfil de cliente no contiene el dato solicitado, Hellotext elimina la etiqueta válida del mensaje entregado. Esto puede dejar un espacio extraño en la frase.

En etiquetas de perfil o propiedades personalizadas, agrega un valor alternativo después de una barra vertical para que el mensaje siga siendo natural:

```text
Hola {name|cliente},
elegimos algo para ti.
```

Hellotext usa el nombre cuando está disponible y `cliente` cuando falta.

Elige un valor alternativo que funcione con la frase completa. Una palabra neutral como `{name|cliente}` suele ser más segura que asumir un nombre, tratamiento o atributo.

## Usa propiedades del perfil de cliente

El selector puede mostrar propiedades personalizadas disponibles para tu negocio. Una propiedad llamada `Nivel de fidelidad` puede insertarse así:

```text
{Nivel de fidelidad|sin asignar}
```

Coloca la etiqueta dentro de una frase que también funcione con el valor alternativo. Usa el nombre de propiedad que muestra el selector. Cuando varias propiedades personalizadas comparten el mismo tipo, darles nombres claros evita ambigüedades y permite identificar la etiqueta correcta.

Los nombres de propiedades no pueden comenzar con un número ni contener llaves. Si cambias el nombre de una propiedad usada en mensajes existentes, revisa esos mensajes antes de volver a enviarlos.

## Usa etiquetas contextuales solo donde estén disponibles

Algunas misiones, rutas y automatizaciones pueden aportar datos de un producto, carrito, pedido, formulario, reembolso u otro objeto del negocio. Sus etiquetas usan un formato de objeto y propiedad, por ejemplo:

```text
{product.url}
```

Las etiquetas contextuales solo se resuelven cuando el flujo del mensaje tiene el objeto y valor correspondientes. Una etiqueta de producto que funciona dentro de una misión basada en productos puede no funcionar en una campaña que no tiene un producto seleccionado.

Usa solo etiquetas contextuales compatibles con ese flujo y comprueba que el objeto exista antes del envío. Si reutilizas el contenido del mensaje en otro lugar, prueba otra vez esos valores: el selector de etiquetas de perfil no confirma que un token contextual vaya a resolverse allí. No apliques automáticamente el valor alternativo con barra vertical a tokens contextuales como `{product.url}`.

## Previsualiza y prueba antes de enviar

Antes de lanzar un mensaje con personalización:

- Prueba perfiles con datos completos e incompletos.
- Confirma que cada valor opcional de perfil tenga una alternativa natural.
- Revisa espacios y puntuación alrededor de las etiquetas.
- Verifica que las etiquetas contextuales tengan el producto, carrito, pedido u objeto que necesitan.
- Revisa los links después del reemplazo, especialmente los de checkout o producto.
- Haz una prueba pequeña antes de usar una audiencia grande.

Si una etiqueta queda visible en la vista previa o mensaje entregado, comprueba que sus llaves estén completas. Para una etiqueta de perfil, revisa su nombre en el selector y los datos del cliente; para una contextual, confirma que ese flujo admita el token y disponga del objeto y valor necesarios.

## Guías relacionadas

- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
