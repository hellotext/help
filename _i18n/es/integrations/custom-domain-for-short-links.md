## Enlaces Cortos

<div class="note">
  El dominio personalizado de enlaces cortos forma parte de <i>Marca Blanca</i> y requiere que tu suscripción incluya esta función. Consulta nuestros <a href="https://www.hellotext.com/precios" class="active" target="_blank">precios</a> y confirma la disponibilidad para tu negocio.
</div>

Hellotext usa enlaces cortos para redirigir a un destino y registrar clics vinculados al mensaje correspondiente. Por defecto, su dirección tiene el formato `hello.link/XXXXXX`. Un alias cambia el dominio visible, por ejemplo, a `go.example.com/XXXXXX`; conserva el código del enlace y el destino configurado.

Usar un dominio reconocible puede ayudar a identificar tu marca. No garantiza confianza, permiso para enviar, identidad del visitante ni una venta atribuida. El contexto del mensaje, las señales elegibles y las ventanas de atribución siguen teniendo sus propias reglas. Consulta [Enlaces de seguimiento en campañas, rutas y misiones]({% link _analytics-reporting-attribution/tracked-links.md %}).

Elige un dominio o subdominio que controles y puedas mantener a largo plazo. Un subdominio dedicado, como `go.example.com`, evita reemplazar el dominio donde funciona tu tienda o correo. Los dominios de ejemplo de esta guía son ficticios.

## Configurar el alias en Hellotext

Debes ser **Dueño** o **Administrador**, tener el correo de tu cuenta verificado y una suscripción con dominios personalizados habilitados. Si el campo está deshabilitado, revisa la suscripción con el dueño o soporte antes de continuar.

En **Configuración > General**, confirma el negocio y selecciona **Editar negocio**. El encabezado muestra el negocio ficticio **Enterprise**, ID público **4ONLdN32**; ese nombre no indica el plan contratado. El ID público identifica el negocio y no se escribe en el campo del dominio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Encabezado real de General con negocio ficticio Enterprise, ID público y entrada Editar negocio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Encabezado real de General con negocio ficticio Enterprise, ID público y entrada Editar negocio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; el estado se explica en el texto anterior.</figcaption>
</figure>

En **Dominio para enlaces cortos**, escribe únicamente el nombre completo, por ejemplo, `go.example.com`: sin `https://`, puerto, ruta, espacios ni el código `/XXXXXX`. El dominio debe pertenecer a tu negocio y no estar reservado como alias de otro negocio en Hellotext. Es distinto de **Dominios autorizados**, que limita dónde se cargan capturas como Webchat, popups y formularios.

La figura muestra el campo real con **go.example.test**, un borrador ficticio sin guardar. No hay un dominio conectado, DNS configurado ni verificación completada en esta demostración.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campo real Dominio para enlaces cortos con go.example.test ficticio sin guardar; no acredita DNS ni verificación.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 419px; margin: 0 auto;">
      <picture>
        <img src="/images/integrations/custom-domain-for-short-links/domain-es.png" srcset="/images/integrations/custom-domain-for-short-links/domain-es.png 2x" style="width: auto; margin: 0 auto;" width="802" height="348" loading="lazy" decoding="async" alt="Campo real Dominio para enlaces cortos con go.example.test ficticio sin guardar; no acredita DNS ni verificación." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios; el estado se explica en el texto anterior.</figcaption>
</figure>

Revisa el nombre y selecciona **Guardar** cuando estés listo para configurar ese dominio real. Guardarlo inicia la configuración pendiente; no publica registros DNS ni demuestra que HTTPS o los enlaces funcionan. Completa la configuración siguiente y verifica el resultado antes de usarlo en mensajes.

## Configurar un subdominio

En el proveedor que administra el DNS activo de tu dominio, configura el subdominio dedicado hacia `hello.link`. La tabla muestra una configuración de ejemplo:

| Campo DNS | Valor de ejemplo |
| --- | --- |
| Tipo | `CNAME` |
| Nombre o host | `go`, o `go.example.com` si el proveedor exige el nombre completo |
| Destino o valor | `hello.link` |

El valor DNS no lleva `https://` ni una ruta. Comprueba que el proveedor no agregue el dominio dos veces y que no haya otro CNAME, A o AAAA incompatible con el mismo nombre. No sustituyas registros de la tienda o correo por este ejemplo.

El proveedor determina cómo ingresar el nombre, TTL y opciones de proxy. Sigue su documentación; por ejemplo, [crear registros de subdominio en Cloudflare](https://developers.cloudflare.com/dns/manage-dns-records/how-to/create-subdomain/). DNS y HTTPS son comprobaciones distintas: confirma con soporte de Hellotext que el dominio personalizado puede atender solicitudes HTTPS con un certificado válido, antes de enviarlo a clientes.

## Configurar un dominio apex

Un dominio raíz o apex, como `example.com`, requiere una opción compatible de tu proveedor. Puede llamarse **ALIAS**, **ANAME** o **CNAME flattening**; estos mecanismos no son intercambiables en todos los servicios. No crees un CNAME ordinario en el apex ni asumas que cualquier ALIAS acepta `hello.link` como destino.

Consulta la documentación del proveedor y confirma con soporte la configuración para Hellotext. [Cloudflare explica su CNAME flattening](https://developers.cloudflare.com/dns/cname-flattening/); [Route 53 limita los destinos de sus registros alias](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html). Si tu proveedor no admite el destino necesario, usa un subdominio dedicado.

No reemplaces el apex de tu tienda sin planificar el efecto sobre el sitio y otros servicios. Publicar DNS no configura por sí solo el certificado HTTPS. La propagación depende del proveedor, TTL y cachés; puede tardar horas y no tiene un plazo universal de 24 horas.

## <a id='verification' href='#verification' class='navigator'>Proceso de Verificación</a>

Hellotext programa revisiones de los alias pendientes cada **5 minutos** y vuelve a revisar los verificados **diariamente**. Son tareas en cola: no garantizan una actualización exactamente cinco minutos después de guardar.

La comprobación hace una solicitud **HTTPS** al dominio configurado, en la ruta de verificación de Hellotext, y considera positiva una respuesta **HTTP 200**. No es un ping de red ni una confirmación independiente de todos los registros DNS o destinos de enlaces. La continuidad HTTPS de los enlaces requiere su propia validación.

Vuelve a **Configuración > General**. Cuando hay un alias guardado, el encabezado muestra **Dominio de enlaces cortos** y el indicador informa **Verificación pendiente** o **Verificado** al consultarlo. La figura anterior no muestra esos estados porque su dominio nunca se guardó.

Los enlaces cortos nuevos usan el alias cuando está verificado; mientras no lo esté, usan `hello.link`. Cambiar el dominio borra su verificación y requiere otra revisión. Una revisión posterior fallida también puede retirar el estado verificado.

Si continúa pendiente, comprueba el nombre guardado, DNS activo, conflictos de registros y acceso HTTPS. Evita reglas que envíen todas las rutas a una página de inicio, un login o un desafío. Contacta a soporte con negocio, dominio, proveedor, estado y hora del cambio con zona horaria; no compartas contraseñas ni claves DNS.

Antes de usarlo en un envío, valida un enlace de prueba autorizado con datos aislados y confirma el destino final esperado. Abrir un enlace de mensaje puede registrar un clic y afectar reportes: no uses enlaces de clientes para comprobar la configuración. El estado **Verificado** no prueba entrega de mensajes, consentimiento ni atribución.

## Notas sobre cómo cambiar el alias

Planifica el cambio antes de guardar un dominio nuevo o vaciar el campo. Los enlaces ya incluidos en mensajes conservan su dirección anterior; actualizar el alias no reescribe lo que recibieron los clientes. Los enlaces nuevos vuelven a `hello.link` mientras el nuevo alias no esté verificado.

Mantén la propiedad y HTTPS del dominio anterior. Coordina con quien administra su servidor una redirección a `https://hello.link` que **conserve la ruta completa y los parámetros**: por ejemplo, el código `/XXXXXX` debe seguir llegando al mismo código. No redirijas todos los enlaces a la página inicial ni asumas que mantener únicamente el CNAME anterior será suficiente después del cambio.

Comprueba por separado la continuidad de enlaces antiguos y la configuración nueva con pruebas autorizadas aisladas. Hellotext no configura automáticamente el servidor ni las redirecciones de tu dominio anterior. Si no puedes mantenerlos, coordina la transición con soporte antes de retirar el alias. Para preparar el negocio, consulta [Configura tu negocio]({% link _getting-started/setting-up-your-business.md %}).
