El prompt describe el propósito, la voz y los límites de tu agente de IA. Es una parte de su configuración: las herramientas, el conocimiento, los canales y las reglas de la misión determinan qué puede hacer realmente.

Escribir un gran prompt consiste en dar instrucciones claras y compatibles con esa configuración. Describe a quién ayuda el agente, qué información debe usar y qué hacer cuando no puede confirmar una respuesta.

Si estás escribiendo el prompt para un agente personalizado, primero define la misión, intenciones, conocimiento, canales y camino de derivación en [Misión Agente Personalizado]({% link _journeys/custom-agent-playbook.md %}).

En este artículo:

* **[Qué pueden hacer los agentes por defecto](#qué-pueden-hacer-los-agentes-por-defecto)**
* **[La anatomía de un buen prompt](#la-anatomía-de-un-buen-prompt)**
  * **[Identidad](#identidad)**
  * **[Tono](#tono)**
  * **[Contexto](#contexto)**
  * **[Comportamiento y límites](#comportamiento-y-límites)**
* **[Enriquecer el prompt con conocimiento y reglas](#enriquecer-el-prompt-con-conocimiento-y-reglas)**
* **[Un ejemplo de prompt modelo](#un-ejemplo-de-prompt-modelo)**
* **[Buenas prácticas](#buenas-prácticas)**
* **[Cómo Hellotext usa tu prompt](#cómo-hellotext-usa-tu-prompt)**
* **[Reflexión final](#reflexión-final)**

## Qué pueden hacer los agentes por defecto

Las capacidades dependen del tipo de misión, las funciones disponibles y su configuración. Escribir «consulta inventario» o «guarda la talla» no conecta una tienda, añade una herramienta ni autoriza una operación.

Cuando el agente dispone de búsqueda de productos, puede usar los datos disponibles para recomendar artículos. Comprueba la integración y la información de origen antes de prometer existencias, precios o entrega; el prompt no garantiza inventario de tienda actualizado en tiempo real.

Los documentos, la búsqueda web, la recopilación de propiedades y la derivación también necesitan sus controles y dependencias. Revisaremos cada uno más abajo. Las instrucciones y comprobaciones del sistema ayudan a delimitar el comportamiento, pero no garantizan respuestas perfectas, una voz idéntica en todos los casos ni cumplimiento normativo por sí solas.

El ejemplo muestra **Prompt del agente** en un Agente Personalizado ficticio nuevo. El campo está vacío: el texto gris es un placeholder, no un prompt guardado. No se habilitó la misión ni se ejecutó el Playground.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo de prompt vacío en un borrador ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es-mobile.png 2x" width="844" height="956" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/prompt-es.png 2x" width="1256" height="1108" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campo de prompt vacío en un borrador ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Si ese componente está disponible, redacta allí tus instrucciones. Su acceso depende del tipo de misión y las funciones de tu cuenta. **Volver** regresa a las tarjetas del editor; comprueba después el guardado final de la misión. Ver texto en el formulario no confirma que se haya guardado. Si el resultado de una acción es incierto, vuelve a leer la configuración guardada antes de repetirla.

## La anatomía de un buen prompt

Un buen prompt tiene cuatro partes principales: identidad, tono, contexto y comportamiento. Los ejemplos de esta guía usan **Astra** y **Lumina Atelier**, una agente y una marca ficticias. No describen una tienda conectada, datos reales ni respuestas generadas.

### Identidad

Describe quién es el agente y qué tarea cumple. Puedes darle un nombre, manteniendo claro que es un asistente digital de la marca.

> Eres **Astra**, la asistente digital de *Lumina Atelier*. Ayudas a las personas a conocer las prendas de la marca y a elegir opciones según sus preferencias. Responde con claridad y reconoce cuándo necesitas confirmación del equipo.

Esta introducción define un papel concreto. Evita atribuirle acceso a sistemas o autoridad para aceptar pedidos, devoluciones o acuerdos que no tenga configurados.

### Tono

Elige una voz coherente con tu marca y descríbela con instrucciones observables: longitud, vocabulario, presión comercial y uso de preguntas. Por ejemplo:

> Astra usa frases claras y breves, con un tono amable y sereno. Hace una pregunta por vez. No exagera los beneficios ni presiona para comprar. Cuando falta información, lo explica de forma directa.

Si existe la tarjeta **Tono**, alinea su selección con el texto del prompt. Permite combinar de uno a tres tonos. Este borrador independiente del Recolector de Propiedades muestra **Amigable**, **Juguetón** y **Exclusivo** seleccionados sin guardar. Es una combinación ficticia; no corresponde al ejemplo de Astra ni demuestra una respuesta generada. El tono cambia la forma de expresarse, no los hechos ni los permisos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tres tonos seleccionados sin guardar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/tone-es-mobile.png 2x" width="780" height="970" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/tone-es.png" srcset="/images/captures/property-collector/tone-es.png 2x" width="1150" height="1030" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tres tonos seleccionados sin guardar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

### Contexto

Proporciona los hechos de marca necesarios para la tarea. Separa hechos comprobados, políticas que deben consultarse y preferencias de estilo. Por ejemplo, para la marca ficticia:

> Lumina Atelier diseña prendas modulares de algodón y viscosa. Su estilo es sencillo y cómodo. Usa las fichas de producto autorizadas para describir materiales y cuidados; no extrapoles esas características a todos los artículos.

Mantén esa información actualizada. Una descripción de marca en el prompt no sustituye una ficha concreta, la política vigente ni los datos que devuelve una herramienta.

### Comportamiento y límites

Define cuándo preguntar, cuándo reconocer incertidumbre y cuándo solicitar intervención humana. Escribe límites que puedas revisar en una conversación:

> Usa el nombre del cliente si está disponible y resulta pertinente. Haz una pregunta por vez para entender la ocasión o la preferencia.
>
> Si las herramientas disponibles devuelven productos adecuados, recomienda hasta tres opciones con una razón clara y los enlaces que proporcionen. No inventes productos ni URLs.
>
> No supongas existencias, precios, plazos de entrega o condiciones de devolución. Si no puedes confirmarlos con las fuentes disponibles, indica qué falta por verificar.
>
> Si la consulta necesita al equipo humano, usa la derivación configurada cuando esté disponible. Si no puedes realizarla, explica el límite y el siguiente paso autorizado. No prometas que una persona ya recibió el caso o responderá en un plazo que no esté confirmado.

Pedir una derivación en el prompt no crea un equipo ni cambia por sí solo el dueño de una conversación. Configura y revisa ese destino por separado.

## Enriquecer el prompt con conocimiento y reglas

Conecta las instrucciones con fuentes y controles disponibles para esa misión. Un documento o una URL pueden ayudar a fundamentar una respuesta, pero no garantizan que cada dato se encuentre, sea vigente o se interprete correctamente.

Si aparece **Conocimiento**, elige documentos pertinentes y revisados. Evita versiones contradictorias y datos personales o secretos que el agente no necesita. La figura conserva el área de carga y **Elige archivos para subir** completos, sin ningún archivo elegido o subido. Elegir, guardar y tener el documento disponible para consulta son estados distintos; el procesamiento posterior puede ser asíncrono.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Área de conocimiento sin archivos elegidos">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es-mobile.png 2x" width="844" height="804" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/upload-es.png 2x" width="1256" height="732" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Área de conocimiento sin archivos elegidos" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Si aparece **Búsqueda web**, configura sitios pertinentes y comprueba las respuestas que dependen de ellos. La restricción usa dominios: no garantiza consultar una ruta, puerto o página exactos, ni convierte el sitio en una integración de tienda. En este borrador el campo está vacío; **https://www.example.com** es el placeholder nativo. No se agregó un sitio ni se ejecutó una búsqueda.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Búsqueda web vacía con placeholder nativo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es-mobile.png 2x" width="844" height="408" />
        <img class="ht-editorial-visual__image" src="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png" srcset="/images/journeys/how-to-customize-a-playbook-safely/web_search-es.png 2x" width="1256" height="384" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Búsqueda web vacía con placeholder nativo" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Para recopilar datos, configura las propiedades permitidas y explica cuándo son útiles. Las instrucciones no permiten guardar cualquier campo del perfil. Una recopilación previa de otra misión conserva su propia lista y necesita el Recolector de Propiedades configurado y habilitado para ejecutarse. Pide solo los datos pertinentes y respeta las opciones de rechazo y los límites de intentos de ese flujo.

El borrador independiente del Recolector de Propiedades muestra **Nombre** marcado **Importante** y **E Mail** opcional. No se guardó ni recopiló ningún dato. Esa prioridad no acredita identidad, consentimiento para mensajes ni permiso de envío.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre importante y correo opcional sin recopilar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 666px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/style-refresh/fields-es-mobile.png 2x" width="764" height="674" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/style-refresh/fields-es.png" srcset="/images/captures/property-collector/style-refresh/fields-es.png 2x" width="1296" height="698" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nombre importante y correo opcional sin recopilar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Una instrucción compatible podría ser: «Cuando sea pertinente para la consulta, solicita la ciudad o talla mediante las propiedades configuradas. No inventes valores ni afirmes que se guardaron sin confirmar el resultado». Antes de añadirla, comprueba que esas propiedades y la herramienta de recopilación estén disponibles en tu flujo.

Para la derivación, escribe el motivo y configura el destino real. En el ejemplo independiente, **Derivación** muestra el equipo ficticio **Atención demo** en un borrador sin guardar. Es un equipo de destino, no una misión ni una conversación asignada. No demuestra disponibilidad, capacidad, respuesta humana ni una pausa permanente de la IA.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Equipo de derivación ficticio sin asignación">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 593px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/captures/property-collector/handoff-es-mobile.png 2x" width="780" height="680" />
        <img class="ht-editorial-visual__image" src="/images/captures/property-collector/handoff-es.png" srcset="/images/captures/property-collector/handoff-es.png 2x" width="1150" height="660" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Equipo de derivación ficticio sin asignación" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

Puedes indicar: «Si una devolución requiere revisión humana, usa el destino configurado y explica qué queda por confirmar». Nombrar «Devoluciones» en el texto no crea ese equipo ni reemplaza el selector. Comprueba el protocolo y la capacidad del destino, y sigue leyendo [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Un ejemplo de prompt modelo

Este ejemplo es texto ilustrativo para adaptar. **lumina.example.test** es un dominio ficticio; los documentos, el catálogo, las propiedades y el equipo mencionados no están configurados por escribir el prompt.

> **Ejemplo de prompt – Lumina Atelier**
>
> Eres **Astra**, la asistente digital de *Lumina Atelier*, una marca ficticia de prendas modulares y atemporales.
>
> Tu misión es entender lo que busca cada visitante y ayudarle con claridad. Usa frases breves, un tono amable y sereno, y una pregunta por vez. No presiones para comprar ni exageres beneficios.
>
> Cuando estén disponibles las herramientas de catálogo, recomienda opciones basadas en los datos que devuelvan. No inventes existencias, precios, enlaces o fechas de entrega. Si falta información, explica qué necesita confirmación.
>
> Consulta los documentos autorizados y el sitio lumina.example.test únicamente si están configurados y disponibles para esta misión. Da prioridad a la política vigente que corresponda a la consulta. Si las fuentes discrepan o no resuelven la duda, no adivines.
>
> Solicita nombre, ciudad o talla solo cuando ayuden a la tarea y estén incluidos en la recopilación configurada. Respeta el rechazo del cliente y los límites del flujo. No afirmes que un valor se guardó sin confirmar su resultado, ni interpretes dar un dato como consentimiento para recibir mensajes.
>
> Si una consulta compleja necesita una persona, usa la derivación disponible al equipo configurado para ese caso. Si no puedes hacerlo, explica el siguiente paso autorizado. No prometas asignación, respuesta, descuentos o resultados que no estén confirmados.

El ejemplo define voz, propósito y límites sin atribuir capacidades inexistentes. Antes de usarlo, sustituye los datos ficticios y verifica cada dependencia de tu misión.

## Buenas prácticas

Escribe instrucciones específicas y revisables. Evita eslóganes, reglas contradictorias y listas de acciones que el agente no tiene disponibles. Conserva la versión anterior y cambia una parte por vez.

Revisa casos de información insuficiente, fuentes contradictorias, datos rechazados y solicitudes fuera del alcance. Comprueba que el agente reconoce sus límites y que el tono elegido no lo lleva a inventar hechos o compromisos.

Si usas el Playground en un entorno autorizado, recuerda que ejecuta una simulación y puede consultar herramientas o proveedores. No demuestra identidad, consentimiento, elegibilidad ni entrega a un cliente real. Esta guía no ejecutó ninguna simulación, prueba o envío.

Comprueba el guardado y revisa conversaciones a las que tengas acceso. Distingue el borrador visible de la configuración guardada y de lo que ocurrió durante una conversación. Si un resultado es incierto, reconcilia el estado antes de repetir. Para editar una misión en uso, consulta [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %}).

## Cómo Hellotext usa tu prompt

Según el tipo de misión, Hellotext considera actividad, contexto e intenciones para decidir qué flujo puede atender. Las intenciones no son una lista de palabras que siempre dispara un agente; también intervienen la disponibilidad y la elegibilidad del flujo.

La figura muestra **Intenciones** de un Agente Personalizado ficticio. **Quiero consultar una devolución.** permanece en el campo sin agregar: no se pulsó **Nueva intención**, Enter ni guardar. No es un mensaje recibido, una intención guardada ni una clasificación realizada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Frase de intención sin agregar ni clasificar">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 646px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/ai-handoff-to-inbox/intents-es-mobile.png 2x" width="764" height="592" />
        <img class="ht-editorial-visual__image" src="/images/team/ai-handoff-to-inbox/intents-es.png" srcset="/images/team/ai-handoff-to-inbox/intents-es.png 2x" width="1256" height="520" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Frase de intención sin agregar ni clasificar" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con estado ficticio independiente; no guardado ni ejecución en este lote.</figcaption>
</figure>

El agente combina las instrucciones con el contexto y las herramientas habilitadas para ese flujo. Un prompt no omite los controles de acceso, la configuración de propiedades, la preparación de un canal ni las reglas de envío.

La generación, las comprobaciones del contenido, la selección de canal y la planificación varían según el flujo. Una comprobación de contenido tampoco garantiza exactitud o cumplimiento normativo. Revisa las respuestas y los resultados reales; guardar un prompt o producir una propuesta no confirma un mensaje entregado.

## Reflexión final

Piensa en el prompt como un brief concreto: a quién ayuda el agente, cómo se expresa, qué fuentes puede usar y cuándo debe reconocer un límite.

Unas pocas instrucciones claras, compatibles con la configuración y revisadas con casos reales, te ayudan a mantener una voz coherente sin prometer capacidades o resultados que el agente no puede confirmar.
