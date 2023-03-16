Los Enlaces de Hellotext son enlaces especiales que son creados en el elemento de Enlaces del Editor.
Estos son enlaces especiales que pueden ser incrustados en tus mensajes y pueden ser usados para recolectar información analítica sobre tus Campañas y Rutas.

Los Enlaces son creados usando el elemento de Enlace en el Editor. El elemento de Enlace es un elemento especial que te permite crear un enlace que puede ser incrustado en tu mensaje.
El elemento de Enlace tiene el siguiente icono <img style='display: inline;'  src="{{site.url}}/images/icons/link.svg">
y se encuentra en la barra de herramientas del Editor.

Los Enlaces titnen la siguiente estructura: `hello.link/XXXXXX` donde `XXXXXX` es el identificador único del enlace.

Cuando estos enlaces son clickeados. Redireccionamos al usuario a la URL especificada cuando se creó el Enlace y adjuntaremos un identificador `hello_session`
a la URL. Este identificador es usado para identificar al usuario y puede ser usado para rastrear las acciones realizadas por el usuario.
Puedes ver nuestra <a class="active" href='https://github.com/hellotext/hellotext.js'>Libreria de JavaScript</a> que te ayudas con eventos relacionados al rastreo.
