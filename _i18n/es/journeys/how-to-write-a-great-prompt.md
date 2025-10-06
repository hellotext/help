En Hellotext, cada Agente de IA comienza con un ingrediente único y sencillo: el prompt.

El prompt define la personalidad, el tono, el propósito y los límites del agente.

Es lo que transforma una automatización abstracta en una verdadera voz de marca, capaz de vender, asistir o cautivar a los clientes como si fuera una persona de tu propio equipo.

Escribir un gran prompt no tiene tanto que ver con la técnica sino mas bien con la claridad y la intención. Cuanto mejor definas quién es el agente, cómo debe hablar y qué no debe hacer nunca, más fielmente representará a tu marca.

En este artículo:

* **[Qué pueden hacer los agentes por defecto](#what-agents-can-do-by-default)**
* **[La anatomía de un buen prompt](#the-anatomy-of-a-good-prompt)**

  * **[Identidad](#identity)**
  * **[Tono](#tone)**
  * **[Contexto](#context)**
  * **[Comportamiento y límites](#behavior-and-boundaries)**
* **[Enriquecer el prompt con conocimiento y reglas](#enriching-the-prompt-with-knowledge-and-rules)**
* **[Un ejemplo de prompt modelo](#a-model-prompt-example)**
* **[Buenas prácticas](#best-practices)**
* **[Cómo Hellotext usa tu prompt](#how-hellotext-uses-your-prompt)**
* **[Reflexión final](#final-reflection)**

## Qué pueden hacer los agentes por defecto

<img src="images/journeys/es/ai-agent-prompt.jpg" alt="" width="768" />

Cada agente en Hellotext puede realizar una amplia gama de acciones de forma automática. Puede leer el catálogo de productos y el inventario en tiempo real, recomendar artículos, verificar existencias y guiar a los clientes durante sus decisiones de compra.

También puede buscar en URLs o documentos que adjuntes —como una sección de preguntas frecuentes, una guía de políticas o un manual de producto—, de modo que siempre responda con información verificada en lugar de adivinar.

Los agentes pueden recopilar y guardar cualquier propiedad de perfil de cliente que elijas, desde el nombre y la ciudad hasta la talla o los intereses preferidos. También pueden decidir cuándo escalar una conversación a un humano, siguiendo las reglas que definas en el Editor de Rutas.

Y, lo más importante, cada mensaje que envían pasa por los controles de privacidad y tono de Hellotext, garantizando una voz de marca coherente y el cumplimiento normativo en todos los canales.

## La anatomía de un buen prompt

Un buen prompt tiene cuatro partes principales: identidad, tono, contexto y comportamiento.

### Identidad

Comienza describiendo quién es el agente y qué papel cumple en tu marca. Asígnale un nombre si lo deseas. Haz que suene como alguien en quien el cliente confiaría de manera natural.

> Ejemplo:
>
> Eres **Astra**, la estilista digital de la marca *Lumina Atelier*. Tu función es recibir a cada visitante con amabilidad, ayudarle a encontrar las prendas adecuadas para su estilo y estado de ánimo, y responder con precisión y elegancia.

Esta introducción le indica al sistema cómo encarnar la marca. Es breve, humana y específica.

### Tono

Define cómo debe sonar el agente. Elige la voz que refleje la cultura de tu marca: serena y elegante, juvenil y cercana, profesional y precisa.

Descríbela con oraciones completas, no con listas. Por ejemplo:

> “Astra habla con un tono seguro y reflexivo. Escribe frases claras y concisas, con un ritmo amable. Nunca exagera ni presiona. Su lenguaje es cálido e inteligente, como el de una asesora de tienda en la que se puede confiar.”

El tono es uno de los elementos más poderosos de un prompt. Determina si tus clientes se sienten atendidos o gestionados por una máquina.

### Contexto

Aquí, proporciona al agente la información sobre la marca y los productos que necesita para entender el mundo desde el que habla. Incluye los valores de tu marca, los materiales y cualquier información objetiva que determine cómo debe responder.

> Lumina Atelier es una marca contemporánea de moda femenina que diseña prendas modulares y atemporales elaboradas con algodón orgánico y mezclas de viscosa suave. Cada pieza se diseña en Lisboa y se produce localmente. Comodidad, durabilidad y elegancia discreta definen la marca.

Esta información le da al agente un punto de referencia para fundamentar sus recomendaciones y asegurar que nunca invente detalles.

### Comportamiento y límites

Termina estableciendo qué puede y qué no puede hacer el agente. Piensa en esto como su código de conducta.

Indica cuándo debe pedir más información, cuándo debe detenerse y cuándo debe escalar a un humano.

> Astra debe saludar siempre al visitante por su nombre, si está disponible, y hacer una pregunta por vez para entender la ocasión o la preferencia.
>
> Puede recomendar hasta tres productos por mensaje, cada uno con una razón clara y su enlace correspondiente.
>
> Nunca debe hacer suposiciones sobre el inventario, los tiempos de entrega o los precios.
>
> Si una pregunta requiere confirmación del equipo —por ejemplo, sobre envíos internacionales o pedidos personalizados—, no debe inventar una respuesta. En su lugar, debe explicar que un especialista lo confirmará y pedir los datos de contacto para hacer seguimiento.

Esta estructura le da al agente suficiente libertad para sonar natural, pero la disciplina necesaria para seguir siendo confiable.

## Enriquecer el prompt con conocimiento y reglas

Una vez que hayas definido el tono y el comportamiento, puedes ampliar las capacidades del agente conectándolo con tu conocimiento existente.

Adjunta cualquier documento relevante, como guías de producto, políticas o manuales. El agente los usará como fuentes autorizadas.

También puedes agregar URLs, como la página de “Preguntas frecuentes” o “Sobre nosotros”, para anclar sus respuestas en contenido actualizado y verificable.

Si quieres que el agente recopile o actualice datos de perfil durante las conversaciones, especifícalo en el prompt. Por ejemplo:
“Cada vez que un cliente mencione su ciudad o talla, guarda esa información automáticamente en su perfil.”

También puedes darle instrucciones sobre cómo manejar las derivaciones:
“Si el cliente expresa insatisfacción o menciona un reembolso, escala el caso al equipo humano ‘Devoluciones’.”

Detrás de escena, el Supervisor de Hellotext enruta estas intenciones —ya sean recomendaciones de producto, preguntas de soporte o actualizaciones de perfil— hacia los agentes correspondientes definidos en tu espacio de trabajo.

## Un ejemplo de prompt modelo

Aquí tienes un ejemplo completo y claro que puedes adaptar para tu propia marca.

> **Ejemplo de prompt – Lumina Atelier**
>
> Eres **Astra**, la estilista digital de *Lumina Atelier*, una marca contemporánea de moda femenina que crea prendas modulares y atemporales para mujeres modernas.
>
> Tu misión es guiar a cada visitante con calidez y claridad, ayudarle a descubrir las prendas que mejor se adapten a sus necesidades y responder con precisión.
>
> Habla con un tono seguro e inteligente —sereno, reflexivo y elegante— usando frases claras y naturales. Evita el argot o la exageración.
>
> Puedes acceder al catálogo completo de productos y a la información de inventario, para recomendar artículos que se ajusten a las preferencias de la clienta.
>
> También puedes consultar los siguientes recursos: luminaatelier.com, el PDF de preguntas frecuentes y la Guía de Envíos y Devoluciones.
> Si no estás seguro de algún dato, nunca adivines. Indica que confirmarás la información con un miembro del equipo y pide nombre y contacto para hacer seguimiento.
>
> Guarda automáticamente el nombre, la ciudad y las tallas preferidas del cliente para futuras interacciones.
>
> Escala cualquier consulta compleja sobre inventario, ventas al por mayor o colaboraciones especiales al equipo humano “Atención al Cliente”.

Este prompt es simple pero completo: define la voz, el propósito, el alcance y los límites. Está escrito en el mismo tono natural que experimentarán los clientes.

## Buenas prácticas

Al escribir tu propio prompt, céntrate en la claridad y la moderación. Un buen agente no necesita páginas de filosofía de marca, sino una brújula.

Describe lo que el agente debe priorizar, no cada frase que debería decir. Deja que la IA de Hellotext se adapte de forma dinámica según la conversación y los datos disponibles.

Usa un lenguaje preciso. Evita los eslóganes publicitarios. Asegúrate de que cada instrucción sea práctica.

Y recuerda: el prompt no es estático. Revisa las conversaciones de tus agentes desde la Bandeja de entrada, observa cómo responden los clientes y ajusta el texto hasta que el tono refleje perfectamente tu marca.

## Cómo Hellotext usa tu prompt

Cuando una conversación comienza, el Supervisor de Hellotext interpreta la intención detrás de cada mensaje —ya sea una consulta sobre pedidos, una recomendación de producto o una pregunta de soporte— y la dirige al agente adecuado.

Cada respuesta pasa por varios servicios antes de llegar al cliente.

Tu prompt es la base sobre la que operan todos estos sistemas. Define cómo la inteligencia, la automatización y la personalidad de tu marca se unen en una experiencia coherente.

## Reflexión final

Piensa en el prompt de tu agente como en el brief creativo de una persona que estás a punto de contratar: alguien que hablará con miles de tus clientes.

Sé específico sobre lo que representa, cómo debe expresarse y dónde terminan sus conocimientos.

Unas pocas líneas bien escritas pueden definir una voz inconfundible, que trabaje sin descanso con calidez, precisión y coherencia.
