Usa links con tracking en tus mensajes para medir los clics de campañas, rutas, misiones, conversaciones del Inbox y otros envíos.

Para insertar uno desde el editor de mensajes:

1. En la barra de herramientas, selecciona **Insertar enlace corto** <img style="display: inline; width: 20px; height: 20px; vertical-align: middle;" src="/images/icons/link.svg" width="20" height="20" alt="">.
2. En **Crear un enlace corto**, ingresa la URL de destino.
3. Selecciona **Agregar enlace corto**. El editor inserta el link con tracking en el mensaje.

Por defecto, el link tiene la forma `hello.link/XXXXXX`, donde `XXXXXX` es un código único de seis caracteres. Si tu negocio tiene un dominio de links verificado, Hellotext usa ese dominio con el mismo tipo de código.

Cuando alguien hace clic, Hellotext redirige al cliente a la URL de destino y agrega el parámetro `hello_session`. Ese identificador relaciona la sesión con acciones posteriores que pueden servir como señales de atribución. Consulta nuestra <a class="active" href='https://github.com/hellotext/hellotext.js'>librería de JavaScript</a> para integrar el seguimiento de eventos.

Un clic elegible en un link con tracking es evidencia activa de atribución y normalmente abre una ventana de siete días desde el clic. La entrega elegible u otras señales pasivas pueden aplicar dentro de la ventana predeterminada de 24 horas. El clic por sí solo no garantiza que Hellotext atribuya una compra posterior: también deben cumplirse las reglas de cliente, pedido, tiempo y precedencia de fuentes.

Lee [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer la precedencia de fuentes, las ventanas de atribución y ejemplos.

## Guías relacionadas

- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
