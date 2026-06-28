Los links de Hellotext son links con tracking creados con la herramienta de links del editor.
Pueden insertarse en tus mensajes y usarse para recolectar analítica de campañas, rutas, playbooks, conversaciones del Inbox y otros envíos.

Los links se crean usando la herramienta de link del editor. Esta herramienta te permite agregar un link con tracking dentro de tu mensaje.
La herramienta de link tiene el siguiente icono <img style='display: inline;'  src="{{site.url}}/images/icons/link.svg">
y se encuentra en la barra de herramientas del editor.

Los links tienen la siguiente estructura: `hello.link/XXXXXX` donde `XXXXXX` es el identificador único del link.

Cuando alguien hace clic, Hellotext redirige al cliente a la URL especificada al crear el link y adjunta un identificador `hellotext_session`
a la URL. Este identificador se usa para identificar la sesión y puede usarse para rastrear acciones realizadas por el cliente como señales.
Puedes ver nuestra <a class="active" href='https://github.com/hellotext/hellotext.js'>librería de JavaScript</a> para ayudarte con eventos relacionados al tracking.
