Usa esta guía cuando un playbook de captura no aparece en el producto, no carga para el cliente, no registra la información enviada o no inicia la acción configurada después de la captura.

Todos los playbooks de captura se encuentran en **Playbooks > Explorar playbooks**, dentro del grupo **Capturas**. Incluyen experiencias distintas: Popup de Sitio Web, Formulario de Sitio Web, Widget de Webchat, códigos QR, links compartibles, opt-in en checkout e interacciones con IA como Impulsor de Suscriptores y Recolector de Propiedades.

## Identifica dónde se detuvo

Antes de cambiar la configuración, reproduce el problema y ubícalo en una de estas etapas:

| Etapa | Qué observas |
| --- | --- |
| **Disponibilidad** | El playbook no aparece en **Explorar playbooks** o figura como **A solicitud**. |
| **Carga** | La captura existe, pero no aparece en el sitio, checkout o canal esperado. |
| **Interacción** | La captura aparece, pero no abre, no avanza o no permite enviar. |
| **Verificación** | El cliente envió sus datos, pero todavía debe verificar un teléfono o email nuevo. |
| **Perfil del cliente** | La interacción terminó, pero la información no aparece en el perfil esperado. |
| **Acción posterior** | El perfil se actualizó, pero no llegó un cupón, no comenzó una ruta o no se envió un mensaje. |

Esta separación evita reinstalar una captura cuando el problema está en una verificación pendiente o en una acción posterior.

## Si el playbook no está disponible

1. Abre **Playbooks** y haz clic en **Explorar playbooks**.
2. Busca el grupo **Capturas**.
3. Confirma que el playbook esté disponible para tu negocio y plan.
4. Si aparece como **A solicitud**, deshabilitado o todavía no está disponible, consulta con tu equipo de Hellotext antes de preparar la instalación.

Después de configurarlo, confirma que se haya guardado y habilitado. Los popups y formularios que se publican en un sitio también deben completar su paso de instalación o publicación.

## Si un popup o Webchat no aparece

Revisa en este orden:

1. Confirma que el playbook esté habilitado y que la versión más reciente se haya guardado.
2. Confirma que la integración compatible, el plugin o Hellotext.js cargue en la página real.
3. Si la instalación es manual, compara el código que se ejecuta en el sitio con el código actual generado por Hellotext.
4. Revisa el dominio y la URL exactos donde debería aparecer.
5. Confirma que la configuración incluya el dispositivo que estás usando.
6. Revisa si la experiencia se abre automáticamente, después de una demora o solamente al hacer click en un lanzador, burbuja o teaser.
7. Prueba en una ventana privada y en un teléfono real para separar el estado de una sesión anterior de un problema de instalación.
8. Revisa si estilos, banners de consentimiento u otros elementos del sitio ocultan la captura.

Para el teaser de Impulsor de Suscriptores, tanto **Widget de Webchat** como **Impulsor de Suscriptores** deben estar habilitados. El webchat es la entrada visible y el otro playbook maneja la invitación de suscripción con IA.

## Si un formulario no carga

Primero prueba el link alojado del mismo formulario.

- Si el link alojado funciona, revisa la instalación, el contenedor y los estilos o scripts de la página donde integraste el formulario.
- Si tampoco funciona el link alojado, revisa la configuración, los campos requeridos y el estado del formulario en Hellotext.

Para un formulario integrado, confirma que el snippet actual esté presente y que la integración de eCommerce o Hellotext.js cargue correctamente. Un desarrollador también puede observar `forms:collected` para confirmar que la librería encontró las definiciones y `form:completed` para confirmar que el proceso terminó, incluida la verificación requerida.

## Si un código QR o link no registra la suscripción

Escanea o abre la versión final desde un teléfono y confirma que use el número, canal, mensaje y referencia esperados.

Abrir el código QR o link no completa la suscripción. El cliente debe enviar el mensaje prellenado desde SMS o WhatsApp. Hellotext registra la captura y actualiza el perfil del cliente después de recibir ese mensaje.

Si el mensaje no sale del teléfono o no llega a Hellotext, revisa el canal y el número antes de cambiar la captura.

## Si el opt-in de checkout no registra al cliente

Confirma que:

- la integración de eCommerce esté conectada y sincronizando pedidos y perfiles de clientes;
- la opción de consentimiento esté visible en el checkout publicado;
- el cliente haya seleccionado la opción correspondiente; y
- revises el consentimiento del canal correcto en el perfil del cliente.

Crear un perfil a partir de una compra no significa que el cliente haya aceptado mensajes de marketing. El estado de suscripción depende del consentimiento que completó en el checkout.

## Si los datos no aparecen en el perfil del cliente

1. Repite la prueba con un teléfono o email que puedas revisar de forma segura.
2. Completa todos los campos obligatorios.
3. Si Hellotext envía una verificación a un teléfono o email nuevo, complétala. El proceso todavía no terminó mientras esa verificación esté pendiente.
4. Busca el perfil del cliente por cada identificador enviado. Hellotext puede actualizar un perfil existente o combinar perfiles coincidentes en lugar de crear uno nuevo.
5. Revisa que las propiedades personalizadas usadas por la captura todavía existan y correspondan con los campos configurados.
6. Confirma que el consentimiento se haya solicitado para el canal que estás revisando.

El mismo navegador puede recordar una captura completada. Usa una ventana privada cuando necesites repetir el recorrido desde cero.

## Si falló lo que debía pasar después

Una captura completada y una acción posterior son etapas diferentes.

- Si el perfil del cliente se actualizó pero no llegó un cupón o mensaje, revisa [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %}).
- Si debía comenzar una ruta, confirma que la ruta esté habilitada y revisa su actividad.
- Si debía abrirse una conversación de Webchat, confirma que el mensaje llegue al Inbox y revisa la asignación correspondiente.
- Si Impulsor de Suscriptores no intervino, confirma que la conversación haya empezado desde Webchat o por iniciativa del cliente en WhatsApp y que el playbook esté habilitado.

No uses la entrega de un mensaje como única prueba de que la captura falló. Primero confirma si el perfil y el consentimiento se actualizaron.

## Qué incluir al pedir ayuda

Incluye:

- negocio y nombre de la captura;
- tipo de captura;
- URL, dominio o ubicación probada;
- dispositivo y navegador;
- fecha y hora aproximadas con zona horaria;
- etapa exacta donde se detuvo;
- identificador del perfil del cliente usado para la prueba;
- captura de pantalla o grabación breve; y
- errores visibles en la consola o solicitudes de red fallidas, si tienes acceso técnico.

No incluyas códigos de verificación, tokens, contraseñas ni datos reales de pago.

## Guías relacionadas

- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Popup de Sitio Web]({% link _captures/website-popup.md %})
- [Formulario de Sitio Web]({% link _captures/forms.md %})
- [Playbook Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Playbook Impulsor de Suscriptores]({% link _captures/subscriber-booster-playbook.md %})
- [A quién puedes enviar mensajes]({% link _audience/consent-and-subscriber-status.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
