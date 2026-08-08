Conecta tu cuenta de vendedor de Mercado Libre para llevar a Hellotext las ventas del marketplace, la actividad de los clientes, las conversaciones posventa y las notas de las órdenes.

Mercado Libre funciona como integración de datos de comercio y como canal de mensajería asociado a cada operación. Está pensado para comunicaciones relacionadas con una orden de Mercado Libre, no para campañas ni mensajes sin relación con una compra.

La integración está disponible actualmente para negocios de Colombia y Uruguay.

## Qué hace la integración

Después de conectar una cuenta, Hellotext puede:

- Registrar las ventas de Mercado Libre y mantener sincronizada la actividad posterior de las órdenes.
- Agregar información de la orden, productos, monto, entrega, pago, reclamos, reembolsos y estados cuando Mercado Libre la proporciona.
- Crear o actualizar perfiles de clientes con una identidad de Mercado Libre y los datos del comprador disponibles en la venta.
- Llevar los mensajes posventa y archivos compatibles al Inbox.
- Sincronizar notas privadas del vendedor con la orden correspondiente de Mercado Libre.
- Usar la actividad elegible de las órdenes como señales para segmentos, playbooks, rutas, reportes y atribución.

Mercado Libre no proporciona los mismos datos del comprador en todas las órdenes. Un perfil del cliente puede incluir el nombre de usuario de Mercado Libre, nombre, email o teléfono cuando estén disponibles, pero no debes esperar que todos los perfiles contengan todos esos campos.

Conectar Mercado Libre no realiza una importación histórica completa de todos los clientes del marketplace. Hellotext crea y actualiza perfiles de clientes a partir de las ventas y la actividad de compradores disponibles para la integración.

## Antes de conectar

Confirma que:

- Puedes iniciar sesión en la cuenta de vendedor de Mercado Libre que quieres conectar.
- La cuenta de vendedor no está conectada a otro negocio de Hellotext.
- El país de tu negocio en Hellotext es Colombia o Uruguay.
- Tu suscripción de Hellotext está activa para que la actividad de órdenes y mensajes siga sincronizándose.
- Sabes qué equipo gestionará las conversaciones de Mercado Libre en el Inbox.

## Conecta tu cuenta de Mercado Libre

1. En Hellotext, ve a **Configuración**.
2. Selecciona **Integraciones** y luego **Explorar integraciones**.
3. Busca **Mercado Libre** y selecciona **Integra Mercado Libre con Hellotext**.
4. Inicia sesión en la cuenta de vendedor de Mercado Libre que quieres conectar.
5. Revisa los accesos solicitados y autoriza a Hellotext.
6. Vuelve a Hellotext y selecciona **Finalizar**.

Hellotext comienza a recibir ventas y actividad de compradores de la cuenta conectada; no importa la base histórica completa de clientes del vendedor. En algunos casos, las órdenes, mensajes o notas nuevas pueden tardar hasta una hora en aparecer debido a demoras de sincronización de Mercado Libre.

## Cómo funcionan las conversaciones de Mercado Libre

Cada conversación de Mercado Libre está asociada a una orden o paquete específico. No es una identidad de chat de uso general a la que se pueda escribir por fuera de una venta.

Mercado Libre decide si un vendedor puede iniciar o continuar una conversación según el estado de la operación y de la conversación. Por ejemplo, el envío puede no estar disponible porque:

- El comprador debe escribir primero para esa operación.
- El vendedor alcanzó un límite de comunicaciones iniciadas por vendedores.
- El estado del pago o del fulfillment no permite mensajes.
- La orden fue cancelada o reembolsada.
- El comprador bloqueó la conversación.
- Hay un reclamo o una mediación activa.
- Mercado Libre aplicó una restricción de tiempo o de tienda invitada.

Cuando Mercado Libre exige que el comprador inicie la conversación, Hellotext espera ese primer mensaje y permite que tu equipo responda cuando la conversación queda disponible. Hellotext también deja de ofrecer una orden como ruta saliente de Mercado Libre 30 días después de su última interacción. Mercado Libre puede cerrarla o restringirla antes.

Cambiar el texto del mensaje no elimina una restricción de la orden. Revisa [por qué un mensaje no se envió]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}) antes de reintentar.

## Gestiona mensajes en el Inbox

Cuando un comprador escribe por Mercado Libre, Hellotext agrega el mensaje a la conversación de ese cliente en el Inbox. Tu equipo puede asignar la conversación, responder y cerrarla con el mismo flujo de trabajo que usa para otros canales compatibles.

Si el cliente tiene más de una orden elegible de Mercado Libre, elige la orden relacionada con la respuesta. Hellotext envía el mensaje por la conversación posventa de esa orden.

Mercado Libre modera el contenido de los mensajes. No incluyas datos personales, lenguaje ofensivo, links a redes sociales ni links de Mercado Pago. Los archivos compatibles se envían mediante Mercado Libre y siguen sujetos a sus reglas de formato, tamaño, moderación y disponibilidad de la conversación.

Para organizar el trabajo del equipo, lee [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %}).

## Agrega notas a una orden de Mercado Libre

Una nota es diferente de un mensaje:

- Un **mensaje** se envía al comprador dentro de la conversación posventa.
- Una **nota** es privada para tu equipo y también se agrega a la orden seleccionada en Mercado Libre. No se envía al comprador.

Cuando crees una nota desde la conversación de un cliente, selecciona la orden de Mercado Libre a la que pertenece. Las notas nuevas y las eliminaciones se sincronizan entre Hellotext y la orden seleccionada de Mercado Libre.

## Usa Mercado Libre en rutas, playbooks y la API

Una orden elegible de Mercado Libre puede ser usada por una ruta o un playbook cuando el flujo contiene la actividad de esa orden y Mercado Libre permite la conversación. Hellotext no usa Mercado Libre solamente porque el perfil del cliente tenga un nombre de usuario del marketplace.

La misma restricción se aplica a los mensajes creados con la API: seleccionar `mercadolibre` no evita el estado de la orden ni las reglas de conversación de Mercado Libre. Lee [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %}) para ver el formato de la solicitud.

Mercado Libre no está disponible como destino de campañas.

## Verifica la integración

Después de conectar:

1. Espera que una nueva venta de Mercado Libre aparezca en Hellotext.
2. Abre el perfil del cliente y confirma que la orden y la identidad de Mercado Libre estén presentes.
3. Comprueba que un mensaje real del comprador aparezca en el Inbox cuando sea recibido.
4. En una conversación elegible, responde desde Hellotext y confirma que el mensaje aparezca en Mercado Libre.
5. Agrega una nota privada a la orden y confirma que aparezca en Mercado Libre sin enviarse al comprador.

Antes de lanzar una ruta o playbook basado en actividad de Mercado Libre, sigue también la guía para [verificar tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Reconecta o elimina la integración

Si Hellotext informa que Mercado Libre necesita volver a autenticarse, ve a **Configuración > Integraciones**, elimina la integración afectada y conecta nuevamente la misma cuenta de vendedor.

Eliminar la integración detiene la sincronización de nuevas órdenes, mensajes y notas, y evita nuevos envíos por Mercado Libre. Los perfiles de clientes y las conversaciones existentes siguen disponibles como referencia en Hellotext.

## Soluciona problemas de sincronización

Si falta una orden, mensaje o nota:

1. Espera hasta una hora para que la actividad más reciente se sincronice.
2. Confirma que la integración de Mercado Libre siga activa en **Configuración > Integraciones**.
3. Comprueba que tu suscripción de Hellotext esté activa.
4. Abre la venta en Mercado Libre y confirma que la actividad faltante pertenece a la cuenta de vendedor conectada.
5. Reconecta la cuenta si Hellotext muestra una advertencia de autenticación.

Si la integración está activa y la actividad todavía no aparece, contacta al soporte de Hellotext con el ID de la orden de Mercado Libre y la hora aproximada del evento faltante.

## Costos de mensajes

Los mensajes de Mercado Libre están incluidos en el cálculo de fair use para mensajes que no son SMS. Lee la [política de fair use de mensajes]({% link _billing/fair-use-message-policy.md %}) para conocer las reglas de facturación.

## Guías relacionadas

- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Por qué un mensaje no se envió]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
- [Envía mensajes con la API]({% link _developers/send-messages-with-api.md %})
