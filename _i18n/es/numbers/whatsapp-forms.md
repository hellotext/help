Pedirle sus datos a un cliente por chat lleva una cadena de mensajes: una pregunta, una respuesta y mucha espera entre una y otra. Muchos clientes dejan de responder a mitad de camino.

Un **formulario de WhatsApp** pide todo de una vez. Tu mensaje lleva un botón. El cliente lo toca, se abre un formulario corto dentro de WhatsApp, lo completa y lo envía. Nunca sale del chat, y sus respuestas quedan guardadas en su perfil en Hellotext.

Esta guía explica cómo ayuda el formulario, cómo agregar uno a una campaña o a una ruta y a dónde van las respuestas.

## Cómo ayuda a tu negocio

- **Completa los perfiles de tus clientes.** Pide una sola vez un cumpleaños, un correo o un género, y úsalo después en segmentos, personalización y campañas de cumpleaños.
- **Menos ida y vuelta.** Un toque y un formulario reemplazan una conversación de varias preguntas. Tu equipo no tiene que perseguir cada respuesta.
- **Respuestas listas para usar.** Cada respuesta se guarda en la propiedad correcta del contacto: un correo como correo, una fecha como fecha. Nadie la copia a mano desde un chat.
- **El cliente se queda en WhatsApp.** No hay una página web que abrir ni una cuenta en la que entrar. El formulario es parte de la conversación en la que ya está.

## Qué ve tu cliente

Tu cliente recibe tu mensaje como siempre. Debajo del texto, después de los demás botones, hay un botón que dice **Completar formulario**, o el texto que hayas elegido.

Al tocarlo se abre un formulario dentro de WhatsApp, con un campo por cada dato que pediste, en el orden que elegiste. El cliente lo completa y lo envía, y el chat muestra que el formulario fue enviado.

Los textos propios del formulario, como su título y su botón de envío, se escriben en el idioma de tu negocio.

## Antes de empezar

- **WhatsApp está conectado.** El formulario es una función de WhatsApp. Consulta [Fundamentos del canal de WhatsApp]({% link _numbers/whatsapp-channel-fundamentals.md %}).
- **El mensaje puede salir por WhatsApp.** En una campaña, la herramienta aparece cuando la campaña se envía por WhatsApp, solo o junto con SMS. En una ruta, la herramienta está siempre en la barra de un paso **Enviar un mensaje**, y queda deshabilitada mientras WhatsApp no sea uno de los canales del paso. Los clientes que reciben el mensaje por otro canal reciben el texto sin el formulario.
- **Las propiedades que quieres completar existen.** Un formulario puede pedir el nombre del contacto y propiedades de tu negocio, como el cumpleaños o una propiedad personalizada que hayas creado. Consulta [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %}).
- **Meta acepta tu negocio para formularios.** Meta solo publica formularios de negocios que ha verificado y que mantienen una buena calidad de mensajería. El mensaje también pasa por la aprobación de Meta, como cualquier plantilla de WhatsApp.

## Agrega un formulario a una campaña

1. Crea o abre una campaña y ve al paso donde escribes el mensaje. Consulta [Crea una campaña]({% link _campaigns/creating-a-campaign.md %}).
2. En la barra de herramientas del editor, haz clic en el icono del formulario <img style='display: inline;'  src="{{site.url}}/images/icons/editor/note-alt.svg">. Al pasar el cursor sobre él se lee **Agregar formulario de WhatsApp**.
3. Haz clic en **Agregar propiedades a recopilar** y elige lo que quieres pedir. Cada propiedad que eliges aparece como una etiqueta.
4. Arrastra las etiquetas para ordenarlas. El formulario hace sus preguntas en ese orden. Para quitar una, pasa el cursor sobre su etiqueta y haz clic en la ✕.
5. Para cambiar lo que dice el botón, edita **Texto del botón**. Empieza como **Completar formulario** y puede tener hasta 25 caracteres.
6. Cierra la herramienta. Ahora el botón del formulario aparece como último botón debajo de tu mensaje, y como último botón en la vista previa del teléfono. Haz clic en él para volver a abrir la herramienta.
7. Termina la campaña y envíala como siempre.

Para quitar el formulario de la campaña, quita todas sus etiquetas.

## Agrega un formulario a una ruta

Un formulario funciona igual en un mensaje que envía una ruta. Consulta [Ruta personalizada]({% link _journeys/custom-journey.md %}).

1. Abre la ruta y agrega o abre un paso **Enviar un mensaje**.
2. En **Canales de envío**, asegúrate de que WhatsApp sea uno de los canales que el paso puede usar. Con **Cualquier canal disponible**, WhatsApp cuenta cuando tu negocio lo tiene conectado.
3. Haz clic en el icono del formulario <img style='display: inline;'  src="{{site.url}}/images/icons/editor/note-alt.svg">, elige las propiedades, ordénalas y define el texto del botón, igual que en una campaña.
4. Guarda el paso.

La herramienta de formulario siempre está visible en este paso, pero queda deshabilitada mientras WhatsApp no esté entre los canales del paso. Si quitas WhatsApp de un paso que tiene un formulario, el botón del formulario sale del mensaje. Vuelve a seleccionar WhatsApp antes de guardar y el formulario que elegiste regresa.

Los pasos **Hacer una pregunta** no tienen la herramienta de formulario.

## Qué puede pedir un formulario

| Tú eliges | Tu cliente recibe |
| --- | --- |
| **Nombre** | Un campo de texto. La respuesta pasa a ser el nombre del contacto. |
| **Teléfono** | Un campo de número de teléfono. |
| **E-mail** | Un campo de correo electrónico. |
| **Negocio** o una propiedad de **Texto** | Un campo de texto corto. |
| Una propiedad de **Texto largo** | Un cuadro de texto más grande. |
| Una propiedad de **Número** | Un campo numérico. |
| **Cumpleaños** | Un selector de fecha. |
| **Género** | Una elección entre Hombre, Mujer y Otro. |
| Una propiedad de **Checkbox** | Una casilla para marcar. |

Las propiedades de otros tipos, como Fecha, URL, Etiquetas, Listas o Dirección, no se pueden pedir en un formulario, por eso la herramienta no las ofrece.

## A dónde van las respuestas

**Al contacto.** Cada respuesta se guarda en su propiedad en cuanto el cliente envía el formulario. Si el contacto ya tenía un valor ahí, la nueva respuesta lo reemplaza. La respuesta del nombre reemplaza el nombre del contacto.

**Al Inbox.** El envío aparece en la conversación del cliente como un mensaje **Formulario enviado** que muestra cada respuesta, para que tu equipo vea lo que se envió y pueda responder. Consulta [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %}).

Completar un formulario no suscribe al contacto ni cambia su consentimiento. Consulta [Consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Para tener en cuenta

- **Un formulario por mensaje.** Su botón siempre es el último.
- **Texto del botón.** Tú eliges lo que dice el botón, hasta 25 caracteres. Si lo dejas vacío, dice **Completar formulario**. Los emojis se quitan.
- **Las preguntas son obligatorias.** El cliente tiene que responder todas las preguntas para enviar el formulario, salvo el cumpleaños y las casillas.
- **Hasta cinco casillas.** WhatsApp permite cinco propiedades de Checkbox en un formulario.
- **Usa nombres de propiedad cortos.** El nombre de la propiedad es la etiqueta de su pregunta, y WhatsApp limita la etiqueta de un campo de texto a 20 caracteres. Los nombres más largos se cortan.
- **Campañas y rutas.** La herramienta de formulario está disponible en campañas y en el paso **Enviar un mensaje** de una ruta. Los pasos **Hacer una pregunta**, los playbooks y las respuestas del Inbox no la tienen.

## Guías relacionadas

- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Ruta personalizada]({% link _journeys/custom-journey.md %})
- [Propiedades y eventos personalizados]({% link _audience/custom-properties-and-events.md %})
- [Consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Comparte una ubicación]({% link _numbers/share-a-location.md %})
