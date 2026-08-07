Los links de Hellotext son links con tracking creados con la herramienta de links del editor.
Pueden insertarse en tus mensajes y usarse para recolectar analítica de campañas, rutas, playbooks, conversaciones del Inbox y otros envíos.

Los links se crean usando la herramienta de link del editor. Esta herramienta te permite agregar un link con tracking dentro de tu mensaje.
La herramienta de link tiene el siguiente icono <img style='display: inline;'  src="{{site.url}}/images/icons/link.svg">
y se encuentra en la barra de herramientas del editor.

Los links tienen la siguiente estructura: `hello.link/XXXXXX` donde `XXXXXX` es el identificador único del link.

Cuando alguien hace clic, Hellotext redirige al cliente a la URL especificada al crear el link y adjunta un identificador `hello_session`
a la URL. Este identificador se usa para identificar la sesión y puede usarse para rastrear acciones realizadas por el cliente como señales.
Puedes ver nuestra <a class="active" href='https://github.com/hellotext/hellotext.js'>librería de JavaScript</a> para ayudarte con eventos relacionados al tracking.

Un clic elegible en un link con tracking es evidencia activa de atribución y normalmente abre una ventana de atribución de siete días desde el clic. Los links con tracking no son la única evidencia que Hellotext puede usar: una entrega elegible u otras señales pasivas pueden aplicar dentro de la ventana predeterminada de 24 horas.

Lee [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer la precedencia de fuentes, las ventanas de atribución y ejemplos.

## Guías relacionadas

- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
