Aprende a crear campañas de mensajes de texto dirigidas a tu audiencia con comunicaciones y promociones que generen más ingresos y atención hacia tu marca.

Las campañas de mensajes de texto son una de las formas más efectivas de captar la atención de tus clientes, con mensajes cortos y cautivadores que la mayoría de tus destinatarios leerán casi de inmediato.

Son especialmente efectivos para aumentar las ventas o generar anticipación. Las posibilidades que brindan los mensajes de texto para desbloquear nuevas oportunidades de ingresos sean prácticamente infinitas, en especial cuando forman parte de la estrategia habitual de comunicación y promoción de tu negocio.

Para crear una nueva campaña, visite la sección *Campañas* y haga clic en el botón *Nueva campaña* cerca de la parte superior derecha de la página.

## Seleccionar una audiencia

Las campañas pueden llegar a toda tu base de suscriptores simplemente manteniendo la selección *Todas las Audiencias*.

En el lado derecho de la página se puede ver una estimación del total de suscriptores a los que llegará esta campaña.

Llegar a todos tus suscriptores puede no ser siempre deseable. Por lo general, una campaña es más efectiva cuando su mensaje se dirige a un grupo demográfico en particular.

Es una buena práctica crear diferentes campañas dirigidas a audiencias específicas. Si ya estás utilizando Listas o Segmentos, puedes incluirlos como audiencias seleccionándolos en el menú desplegable *Todas las Audiencias*.

Puedes incluir múltiples Listas y Segmentos en tu selección haciendo clic en el botón <img src="/images/icons/add.svg" class="avatar-icon bg-blush" width="25" /> a la derecha del desplegable.

El total agregado de suscriptores a alcanzar será visible en el lado derecho de la página.

Más información sobre **[Listas y segmentos](/lists-and-segments)**

### Excluyendo audiencias

Es posible excluir ciertas audiencias seleccionándolas primero y luego haciendo clic en la etiqueta *Incluir*.

Para que una audiencia permanezca excluida, su etiqueta debe decir *Excluir*.

## Redactar su mensaje

Tómate tu tiempo para pensar en un buen mensaje. Imagínate a ti mismo como el destinatario. ¿Cómo te sentirías al recibir este mensaje de texto?

Por lo general, los mensajes cortos y efectivos funcionan mejor que aquellos más largos. Tu campaña se enviará en formato SMS. Los SMS tienen un límite de 160 caracteres. Si incluyes caracteres que originalmente no se admiten en la especificación GSM-7 (como acentos y emojis), se realizará una conversión de codificación a UCS-2 y la longitud total por mensaje SMS se reducirá a 80 caracteres.

Si tu mensaje excede este límite, se requerirá un SMS adicional. Siempre que sea posible, tratamos de fusionar diferentes SMS en un solo mensaje y, cuando esto no sea posible, el mensaje se enviará en mensajes SMS separados.

Un contador con los caracteres de SMS restantes y la cantidad de mensajes SMS que esta campaña consumirá por suscriptor siempre está disponible en el área inferior derecha de la redacción.

Una vista previa del mensaje está disponible en el lado derecho de la página. Puede ayudar a darte una idea de cómo se vería el mensaje cuando se divide en diferentes SMS.

### Agregar un enlace corto

Esta característica crea una versión más corta de cualquier URL en un formato simple que se parece a *hello.link/abcdef*.

Siempre recomendamos usar esta herramienta para acortar la URL que llevará a los visitantes a tu sitio, promoción o producto.

Los beneficios de acortar enlaces son dobles: mantiene tu mensaje más corto logrando más caracteres adicionales para el mensaje.

También realiza un seguimiento de quién de tus suscriptores hizo clic en el enlace corto y todas las acciones sucesivas realizadas, como saber quién realizó una compra o completó una determinada acción.

Para que esto funcione, debes haber instalado previamente el rastreador *Hellotext.js* o haber creado tu propia implementación para procesar la sesión y rastrear los eventos usando la API.

### Agregar etiquetas

Haz que tus mensajes sean más personales haciendo referencia a las propiedades del suscriptor. Por ejemplo, mostrar su nombre usando la etiqueta _{name}_. El mensaje entregado reemplazará la etiqueta con el nombre del suscriptor.

Puedes encontrar etiquetas para todas sus propiedades de contacto, como:

* *{name}*
* *{last_name}*
* *{phone}*
* *{birthdate}*
* Todas las propiedades personalizadas también tienen una etiqueta coincidente que sigue la misma convención de nomenclatura de etiquetas: por ejemplo, si la propiedad se llama _Mi propiedad_, una etiqueta para hacer referencia a esta propiedad estará disponible automáticamente con el nombre _ {mi_propiedad}_

### Establecer un valor predeterminado

Es probable que no todos tus suscriptores tengan un valor en la propiedad de la etiqueta que deseas usar. Por ejemplo, es posible que no todos los destinatarios de tu campaña tengan un nombre asociado. Dependiendo de cómo elabores tu mensaje, esto puede hacer que el mensaje se lea extraño si no se muestra ningún valor.

Para resolver esto, puedes pasar un valor predeterminado dentro de tu etiqueta separado por el caracter de separación o *pipe* en inglés como _ {name|cliente}_.

Si tu mensaje es por ejemplo:

* *Estimado **{name&#124;cliente}**, tenemos una oferta especial...*

Para un suscriptor sin su nombre se enviará como:

* *Estimado **cliente**, tenemos una oferta especial...*

### Agregar cupones

Puedes hacer referencia a cupones ya creados. Hacer referencia a los cupones en lugar de escribirlos manualmente te brinda mejores informes y comprensión del impacto que tuvieron en los resultados de tu campaña.

### Elegir remitente

Los mensajes se envían utilizando las mejores rutas posibles. Hellotext lo gestiona automáticamente, así que no tienes que preocuparte de esto.

Aún así, puedes especificar cualquiera de los números de teléfono que tengas asociado como el remitente, incluido cualquier código corto que puedas haber asociado.

## Programar y entregar

Puedes enviar tu campaña de inmediato o programarla para enviarla en el futuro en un día y hora en particular.

### Revisión editorial

Ten en cuenta que si tu campaña se dirige a más de 100 suscriptores, estará sujeta a una revisión editorial rápida antes de que se entregue.

Durante el horario de oficinas, esto es bastante rápido y generalmente toma menos de 10 minutos.

Al aprobarse tu campaña, esta continuará su curso hasta la entrega. No necesitas hacer nada de tu parte durante el proceso de aprobación a menos que haya una solicitud para ajustar la campaña, en cuyo caso, después de realizar un nuevo cambio, se marcará nuevamente para revisión.