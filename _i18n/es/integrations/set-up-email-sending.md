Configura un remitente de correo para enviar mensajes desde Hellotext con una dirección del dominio de tu negocio, como `support@acme.com`.

Elegirás el nombre y la dirección del remitente, agregarás tres registros en la configuración DNS de tu dominio y esperarás a que se complete la verificación. Una vez verificado el dominio, Hellotext activa el canal de correo electrónico del remitente.

Esta guía explica la configuración en Hellotext y los cambios que debe realizar quien administra tu dominio. También muestra cómo volver a consultar las instrucciones DNS, agregar otro remitente y resolver problemas habituales de configuración.

<div class="note">
  El envío de correos está disponible en el plan Enterprise. Debes ser Dueño o Administrador del negocio en Hellotext para configurar el remitente.
</div>

## Antes de comenzar

Ten preparado lo siguiente:

- **El negocio correcto en Hellotext.** Selecciona el negocio que enviará los correos. Un dominio de envío puede pertenecer a un solo negocio de Hellotext a la vez.
- **Una suscripción activa con correo electrónico habilitado.** Si la opción Correo electrónico no está disponible, revisa tu plan con el dueño del negocio o con el soporte de Hellotext.
- **El correo de tu cuenta de Hellotext verificado.** Debes verificar la dirección que usas para iniciar sesión en Hellotext antes de configurar una integración.
- **Un dominio que tu negocio controle.** Por ejemplo, si quieres enviar desde `support@acme.com`, necesitas acceso a la configuración DNS de `acme.com`.
- **Permiso para agregar registros DNS.** Puedes hacerlo con tu propio acceso o pedir ayuda a la persona o agencia que administra tu dominio.
- **Un nombre y una dirección de correo para el remitente.** Elige datos que tus clientes puedan reconocer cuando reciban un mensaje.

Tu proveedor de DNS es el servicio que administra los registros DNS de tu dominio. Puede ser la empresa donde registraste el dominio, un servicio como Cloudflare o un proveedor que utiliza quien administra tu sitio web. Haber comprado el dominio a una empresa no significa necesariamente que esa empresa siga administrando su DNS.

Si otra persona administra el dominio, puedes completar el formulario del remitente y compartir los tres registros DNS con ella. Podrá publicarlos sin iniciar sesión en Hellotext.

### ¿Qué pasa con tu casilla de correo actual?

Tu casilla y tu proveedor de correo actuales pueden seguir funcionando mientras Hellotext envía desde la dirección de tu negocio. Los registros DNS de esta guía autorizan el envío de correos. Al agregarlos, no se importa tu casilla, no se copian tus correos anteriores ni se trasladan los mensajes entrantes desde tu proveedor actual.

No necesitas ingresar la contraseña de tu casilla para realizar esta configuración. Hellotext se encarga de registrar el dominio de envío y muestra los registros DNS que necesitas.

Mantén la configuración actual de recepción de correo. Este asistente no te pide cambiar los registros MX del dominio. Si también quieres que los correos nuevos enviados directamente a una dirección existente, como `support@acme.com`, lleguen al Inbox de Hellotext, consulta esa configuración de recepción por separado con el [soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Elige el nombre y la dirección del remitente

El formulario del remitente contiene dos campos:

| Campo | Qué ingresar | Ejemplo |
| --- | --- | --- |
| **Nombre del remitente** | El nombre que los clientes deben ver junto a la dirección de correo. Usa el nombre de tu negocio, un nombre de equipo reconocible o el nombre de una persona junto al del negocio. | `Soporte de Acme` o `Sofía de Acme` |
| **Correo del remitente** | La dirección completa desde la que quieres enviar, con un dominio que tu negocio controle. | `support@acme.com` |

Ingresa la dirección de correo completa, incluida la parte anterior a `@`. Hellotext obtiene el dominio de envío a partir de esa dirección, por lo que no hay un campo de dominio separado que debas completar.

Por ejemplo:

| Correo del remitente | Dominio que Hellotext te pedirá verificar |
| --- | --- |
| `support@acme.com` | `acme.com` |
| `sales@acme.com` | `acme.com` |
| `orders@mail.acme.com` | `mail.acme.com` |

Elige el dominio con cuidado. Una dirección que utiliza un subdominio, como `orders@mail.acme.com`, genera instrucciones de configuración para ese subdominio. Revisa el dominio que aparece en la siguiente pantalla antes de publicar sus registros.

Una dirección personal que termina en `@gmail.com`, `@outlook.com` u otro dominio compartido de un proveedor no sirve para este proceso: no puedes publicar los registros necesarios en un dominio que pertenece a ese proveedor. Usa una dirección del dominio de tu negocio.

## 1. Abre la configuración de correo electrónico

1. Inicia sesión en Hellotext y selecciona el negocio correcto.
2. Abre **Ajustes**.
3. Selecciona **Integraciones**.
4. Haz clic en **Explorar integraciones**.
5. En **Comunicación**, selecciona **Correo electrónico**.

La primera pantalla se titula **Configura tu remitente de correo**.

Si Correo electrónico aparece pero no se puede seleccionar, pide al dueño del negocio que revise si la suscripción tiene habilitado el correo electrónico. Si no puedes acceder a la configuración como integrante del equipo, pide a un Dueño o Administrador que la complete.

## 2. Agrega los datos del remitente

1. Ingresa el **Nombre del remitente**.
2. Ingresa el **Correo del remitente**.
3. Revisa que ambos campos estén bien escritos, especialmente el dominio después de `@`.
4. Haz clic en **Siguiente**.

Hellotext guarda el remitente y solicita los registros DNS de su dominio. Cuando el registro se completa correctamente, la siguiente pantalla se titula **Verifica tu dominio de envío**.

El dominio aparece en las instrucciones de esa página. Confirma que coincida con la dirección que querías usar. Si es incorrecto, selecciona **Atrás** para volver al formulario del remitente y corregir la dirección antes de continuar.

Si aparece un error en el formulario, sigue el mensaje que se muestra. Debes corregir una dirección inválida o completar el nombre del remitente antes de continuar. Los conflictos de dominio y los errores de registro se explican en la sección de solución de problemas más abajo.

## 3. Agrega los tres registros DNS

La página **Verifica tu dominio de envío** muestra tres registros DNS. Cada registro tiene un **Tipo**, un **Nombre** y un **Valor**.

Son registros DKIM. DKIM ayuda a los servicios de correo que reciben los mensajes a verificar que los envíos realizados con tu dominio estén autorizados. Publicar estos registros también permite al servicio de envío comprobar que controlas el dominio.

### Relaciona los campos de Hellotext con los de tu proveedor de DNS

Los proveedores de DNS usan distintos nombres para los mismos campos. Usa esta tabla al crear cada registro:

| En Hellotext | Nombre habitual en tu proveedor de DNS | Qué ingresar |
| --- | --- | --- |
| **Tipo** | Tipo o Tipo de registro | Elige **CNAME**. |
| **Nombre** | Nombre, Host o Nombre de host | Usa el nombre del registro que muestra Hellotext, teniendo en cuenta si tu proveedor agrega el dominio automáticamente. |
| **Valor** | Valor, Destino o Apunta a | Copia el valor completo que aparece para ese mismo registro. |

Crea cada registro por separado. Mantén juntos el nombre y el valor de cada registro; no combines los tres valores en una sola entrada.

### Publica los registros

1. Abre tu proveedor de DNS en otra pestaña del navegador e inicia sesión.
2. Selecciona el dominio cuyos registros DNS necesitas administrar.
3. Abre la sección de registros DNS.
4. Agrega un registro nuevo y elige **CNAME**.
5. Copia el **Nombre** del primer registro de Hellotext en el campo de nombre o host del proveedor.
6. Copia el **Valor** correspondiente en el campo de destino o valor del proveedor.
7. Si debes completar un campo TTL, usa el valor predeterminado o automático del proveedor, a menos que quien administra tu dominio haya indicado otro valor.
8. Guarda el registro.
9. Repite el proceso con el segundo y el tercer registro de Hellotext.
10. Revisa las entradas guardadas y confirma que los tres nombres apunten a sus valores correspondientes.

Copia los valores de tu propia página de configuración en Hellotext. Un ejemplo de otra guía, otro negocio o una configuración anterior puede no coincidir con los registros que necesita este remitente.

### Comprueba si tu proveedor agrega el dominio automáticamente

Algunos proveedores esperan el nombre completo del registro; otros agregan el dominio a lo que ingreses. Por ejemplo, un nombre que se muestra como `example-token._domainkey.acme.com` puede tener que ingresarse como `example-token._domainkey` cuando editas la zona DNS de `acme.com`.

Revisa el nombre completo resultante después de guardar. Debe coincidir con el que muestra Hellotext, sin que el dominio aparezca dos veces al final. Conserva la parte `_domainkey` y su guion bajo.

El token de este ejemplo es ilustrativo. Usa siempre el nombre real del registro que muestra Hellotext.

### Si usas Cloudflare

Configura estos registros CNAME como **Solo DNS (DNS only)**. El proxy de Cloudflare está destinado al tráfico web y no debe estar habilitado para los registros de verificación de correo. Consulta las [limitaciones del proxy de Cloudflare](https://developers.cloudflare.com/dns/proxy-status/limitations/) y sus [instrucciones para administrar registros DNS](https://developers.cloudflare.com/dns/manage-dns-records/how-to/create-dns-records/).

### Conserva tus otros registros DNS

Agrega los tres registros junto a tu configuración DNS existente. El asistente no te pide reemplazar los registros de tu sitio web, cambiar los servidores de nombres ni eliminar registros que utiliza tu proveedor de correo actual.

Si tu proveedor indica que ya existe un registro con el mismo nombre, compara su tipo y destino con las instrucciones de Hellotext. Es posible que ya exista un registro que coincida exactamente. Si el destino es distinto o no sabes para qué se usa el registro existente, consulta a quien administra tu dominio antes de reemplazarlo.

Mantén publicados los registros de Hellotext mientras uses el remitente. Siguen formando parte de la configuración de autenticación de correo del dominio después de la verificación inicial.

## 4. Termina el asistente y espera la verificación

Después de agregar los registros DNS, vuelve a Hellotext y haz clic en **Continuar**.

La página final dice **Remitente de correo agregado** y muestra la dirección del remitente. Haz clic en **Terminar** para volver a **Integraciones**.

<div class="note">
  “Remitente de correo agregado” confirma que se guardó el remitente. El dominio todavía debe verificarse antes de que puedas usarlo para enviar correos. Hacer clic en Continuar o Terminar no omite la verificación.
</div>

Los cambios de DNS tardan en estar disponibles en internet. Pueden detectarse rápidamente, pero contempla hasta 72 horas para que se propaguen los cambios DNS de verificación del dominio.

Hellotext revisa automáticamente los remitentes pendientes cada cinco minutos. Una vez verificados el dominio de envío y su configuración DKIM, Hellotext activa el canal de correo electrónico del remitente. Puedes cerrar el asistente mientras esto ocurre; no necesitas mantener la página abierta.

Si otra persona agregará los registros DNS más tarde, puedes terminar el asistente después de compartir las instrucciones. El remitente seguirá sin estar disponible para enviar hasta que se publiquen los registros y se complete la verificación.

Para usar el canal una vez activado, abre una conversación con un cliente cuyo perfil tenga una dirección de correo y busca **Correo electrónico** en el selector de destino del mensaje. Que la integración esté guardada no confirma por sí solo que el canal esté listo, y un perfil de cliente sin dirección de correo no ofrece un destino de correo electrónico.

## Vuelve a consultar las instrucciones DNS

Puedes volver a las instrucciones cuando necesites revisar los registros o compartirlos con quien administra tu dominio:

1. Ve a **Ajustes > Integraciones**.
2. Busca el remitente de correo por su nombre y dirección.
3. Abre su menú de tres puntos.
4. Selecciona **Ver instrucciones de configuración**.

Se abre la misma página **Verifica tu dominio de envío** con los registros DNS guardados. No necesitas crear otro remitente para recuperarlos.

Cuando abres las instrucciones desde la lista de integraciones, **Atrás** te devuelve a **Integraciones**.

## Edita un remitente o agrega otra dirección

### Cambia el nombre o la dirección del remitente

Ve a **Ajustes > Integraciones**, abre el menú de tres puntos del remitente y selecciona **Editar**. Actualiza los campos y haz clic en **Siguiente** para guardar.

Cambiar el nombre del remitente actualiza el nombre que se usa para ese remitente. Si cambias la parte anterior a `@` y mantienes el mismo dominio, por ejemplo, de `support@acme.com` a `sales@acme.com`, se conserva el dominio de envío.

Cambiar a otro dominio inicia la verificación del nuevo dominio. Hellotext desactiva el canal de correo electrónico existente del remitente durante ese cambio. Sigue las nuevas instrucciones DNS y espera a que se verifique el nuevo dominio antes de volver a usar ese remitente para tus envíos.

Planifica el cambio de dominio para un momento en el que puedas completar el trabajo de DNS. Si necesitas mantener disponibles ambas direcciones, agrega un remitente separado en lugar de reemplazar el actual.

### Agrega otro remitente en el mismo dominio

Puedes agregar más de una dirección de remitente en un dominio dentro del mismo negocio de Hellotext. Por ejemplo, `support@acme.com` y `sales@acme.com` pueden pertenecer al mismo negocio.

Repite **Ajustes > Integraciones > Explorar integraciones > Correo electrónico** para la dirección adicional. Usa una dirección distinta y revisa las instrucciones DNS que se generan. Si los registros necesarios ya están publicados, mantenlos y espera a que Hellotext verifique el remitente adicional.

Que el dominio ya esté verificado no significa que el nuevo remitente esté listo en el momento de guardar el formulario; Hellotext debe revisar ese remitente antes de activar su canal.

### Elimina un remitente

Desde **Ajustes > Integraciones**, abre el menú de tres puntos del remitente, selecciona **Eliminar** y confirma la eliminación en el diálogo.

Al eliminar la integración, su canal de correo electrónico se desactiva como parte del proceso de eliminación. Coordina el cambio con quienes usen ese remitente. Cuando se elimina el último remitente de un dominio, Hellotext también elimina su registro de envío; si lo agregas de nuevo más adelante, puede ser necesario publicar nuevos registros de verificación.

## Soluciona problemas de configuración de correo

### Correo electrónico no está disponible en el catálogo de integraciones

Comprueba que seleccionaste el negocio correcto y que su suscripción incluye correo electrónico. El envío de correos forma parte de Enterprise. Un Dueño o Administrador puede revisar la suscripción del negocio o contactar al soporte de Hellotext si Correo electrónico debería estar disponible.

### El dominio está conectado a otra cuenta de negocio

Hellotext muestra **Este dominio ya está conectado a otra cuenta de negocio.** cuando otro negocio ya tiene un remitente que usa ese dominio.

Usar distintas direcciones del mismo dominio no evita esta restricción: `support@acme.com` y `sales@acme.com` siguen usando `acme.com`.

Si administras ambos negocios, confirma primero cuál debe usar el dominio. Coordina la eliminación o el cambio de todos los remitentes que usen ese dominio en el negocio anterior antes de configurarlo en el negocio elegido. El dominio sigue reservado mientras ese negocio tenga otro remitente que lo use.

Si no reconoces el otro negocio o no puedes acceder, contacta al soporte de Hellotext e indica el dominio y el negocio donde quieres configurarlo. Cambiar repetidamente la parte anterior a `@` no resuelve un conflicto de propiedad del dominio.

### Hellotext no pudo registrar el dominio de envío

Si el formulario dice **No pudimos registrar tu dominio de envío. Inténtalo de nuevo.**, revisa la dirección del remitente y vuelve a intentarlo. Si saliste del asistente y el remitente ya aparece en **Integraciones**, abre **Editar** en ese remitente para continuar su configuración.

Si el error persiste, contacta al soporte con el nombre del negocio, la dirección del remitente y la hora aproximada del intento. Los cambios de DNS no pueden resolver una solicitud de registro que todavía no generó los registros necesarios.

### La página de instrucciones no muestra los registros DNS

Abre **Editar** en el remitente guardado, confirma la dirección de correo y haz clic en **Siguiente** para volver a intentar el registro. Si los tres registros siguen sin aparecer, contacta al soporte antes de agregar entradas DNS. Usa únicamente los registros que proporciona Hellotext.

### Agregaste los registros pero todavía no puedes usar correo electrónico

Revisa lo siguiente con quien administra tu DNS:

- Editaste el proveedor de DNS activo para el dominio que muestra Hellotext.
- Las tres entradas se guardaron como registros CNAME.
- Cada nombre está asociado al valor del mismo registro de Hellotext.
- Los nombres guardados coinciden con los nombres completos de Hellotext, incluida la parte `_domainkey`.
- El proveedor no agregó el dominio dos veces.
- Los valores se copiaron completos, sin agregar `https://`, espacios ni comillas.
- Los registros de Cloudflare, si corresponde, están configurados como Solo DNS.
- Estás usando las instrucciones más recientes de este remitente, especialmente si lo cambiaste o lo volviste a agregar.

Espera a que se propaguen los cambios DNS y se realice la próxima revisión de Hellotext. Si los registros son correctos y el remitente sigue sin estar disponible después del período de propagación esperado, contacta al soporte. Evita eliminar y volver a crear el remitente solo para comprobar su progreso; vuelve a abrir **Ver instrucciones de configuración**.

### Tu casilla habitual sigue recibiendo correos nuevos

Es lo esperado si no cambió la configuración de recepción de esa casilla. Verificar el dominio de envío no reenvía automáticamente a Hellotext los mensajes dirigidos directamente a la casilla de tu negocio. Contacta al soporte si necesitas ayuda para planificar esa configuración por separado.

## Información para compartir con soporte

Si tienes un problema de configuración de correo, incluye:

- El nombre del negocio en Hellotext.
- La dirección del remitente y el dominio que quieres usar.
- El mensaje de error exacto o el paso en el que no puedes avanzar.
- El nombre de tu proveedor de DNS.
- Cuándo se agregaron o modificaron por última vez los registros, con tu zona horaria.
- Una captura de las instrucciones DNS de Hellotext y de las entradas DNS guardadas correspondientes, cuando sea relevante.

Esta información ayuda al soporte a distinguir entre un problema de acceso a la cuenta, un problema de registro y una demora en la verificación DNS. Para conocer las opciones de contacto, consulta [Contacta al soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Guías relacionadas

- [Fundamentos del canal de correo electrónico]({% link _numbers/email-channel-fundamentals.md %})
- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Resumen de Inbox y conversaciones]({% link _team/inbox-overview.md %})
- [¿A quién puedo enviar mensajes? Consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Por qué no se envió un mensaje]({% link _troubleshooting-deliverability/why-a-message-did-not-send.md %})
