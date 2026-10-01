Usa esta guía para decidir qué conectar primero cuando estás configurando Hellotext.

La configuración funciona mejor cuando conectas las fuentes de datos antes de lanzar capturas, misiones, rutas o campañas. Así puedes comprobar los perfiles, objetos y señales que aporta tu integración antes de usarlos. La conexión por sí sola no garantiza importar todo el historial, registrar cada actividad ni atribuir una venta: depende de los datos y eventos compatibles, la identidad del cliente y las reglas de atribución.

## Orden de configuración recomendado

### 1. Confirma tus accesos

Antes de empezar, confirma que tienes los permisos que exige cada integración en la tienda, marketplace o cuenta de Meta correspondiente, y en el negocio de Hellotext. Acceder a un negocio no significa que puedas modificar sus integraciones.

En **Configuración > General**, revisa el nombre y el **ID del negocio** antes de autorizar una conexión. La siguiente cabecera pertenece al negocio ficticio llamado **Enterprise**, con ID público **4ONLdN32**; su nombre no indica el plan contratado. Este ID identifica el negocio y puede usarse en Hellotext.js, pero no reemplaza un token privado de API ni los permisos de administrador.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cabecera real de General con negocio ficticio Enterprise, ID público 4ONLdN32 y Editar negocio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Cabecera real de General con negocio ficticio Enterprise, ID público 4ONLdN32 y Editar negocio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fuente aprobada de identidad del negocio; no muestra una autorización externa ni un cambio de propietario.</figcaption>
</figure>

Para integraciones de eCommerce, ten a mano las claves de API, tokens o acceso al plugin que pide la guía de esa plataforma. No compartas secretos en capturas ni los pegues en código público del sitio. Para WhatsApp, confirma que puedes recibir SMS o llamadas en el número que quieres conectar.

Si debe cambiar el propietario del negocio, completa esa tarea de acceso antes de hacer cambios más amplios de configuración. Sigue leyendo: [Transfiere la propiedad del negocio]({% link _integrations/transferring-ownership.md %}).

### 2. Conecta tu plataforma de eCommerce

Conecta la plataforma donde viven tus clientes, productos, carritos, órdenes y actividad de compra.

Elige la guía que corresponde a tu tienda:

- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta Wix]({% link _integrations/connect-wix.md %})
- [Conecta WooCommerce]({% link _integrations/connect-woo.md %})
- [Conecta VTEX]({% link _integrations/connect-vtex.md %})
- [Conecta Mercado Libre]({% link _integrations/connect-mercado-libre.md %})

Después de conectar, elige un registro conocido de la fuente y comprueba sus datos en Hellotext antes de crear misiones, rutas o campañas basadas en ellos. Revisa por separado el perfil, el objeto y el evento real: un pedido guardado no confirma que se haya registrado una compra ni que se atribuya una venta. El alcance y el procesamiento inicial varían según la plataforma.

Para revisar un pedido, ve a **Configuración > Objetos > Órdenes** y abre **Editar**. Compara referencia, origen, importe y moneda con la fuente. Esta demostración conserva **Pedido #1001**, referencia **ORDER-1001**, origen **custom_store** e importe **USD 89.90**, en borrador y sin eventos. El campo **ID de la orden** muestra la referencia, distinta del ID público de la API. **Entregar** es una modalidad de entrega, no un estado de envío.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de pedido ficticio con referencia ORDER-1001, origen custom_store e importe USD 89.90.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Editor real de pedido ficticio con referencia ORDER-1001, origen custom_store e importe USD 89.90." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Pedido existente en borrador y sin eventos, no una importación, compra, entrega o atribución confirmada.</figcaption>
</figure>

También confirma qué productos, variantes, precios, imágenes, URLs y disponibilidades admite tu conector y cuáles necesita la primera misión. Ver un producto o su precio no demuestra stock actual ni publicación en Meta. Si falta un dato necesario, resuélvelo en la fuente compatible antes del lanzamiento.

Sigue leyendo:

- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})

### 3. Conecta los canales de mensajería que vas a usar

Conecta WhatsApp antes de crear capturas, misiones, rutas o campañas de WhatsApp. Comprueba el número y negocio correctos, los permisos del destinatario para el canal y tipo de mensaje, y la versión activa aprobada de la plantilla cuando sea necesaria. Un borrador o una conexión visible no confirma aprobación ni entrega.

Si vendes por WhatsApp, conecta primero tu plataforma de eCommerce y después conecta tu catálogo de productos a WhatsApp.

Conecta Instagram cuando los clientes deban poder iniciar conversaciones por mensaje directo que lleguen a tu Inbox, misiones, rutas o agentes de IA. Instagram usa su propio inicio de sesión directo y es una integración separada de Facebook Messenger.

Conecta Messenger cuando los clientes deban poder escribir a tu página de Facebook y llegar a tu Inbox, rutas o misiones compatibles. Messenger usa el inicio de sesión de Facebook y requiere acceso a la página y cuenta de Meta Business correctas.

Para enviar correos desde el dominio de tu negocio, confirma que tu plan tenga habilitado el canal de correo, agrega un remitente y publica sus registros DNS de verificación. Comprueba que el remitente esté activo después de verificarse; agregarlo o publicar DNS no garantiza entrega ni permiso para escribir a cada destinatario.

Sigue leyendo:

- [Conecta WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Conecta Instagram DM]({% link _integrations/connect-instagram-dm.md %})
- [Fundamentos de Instagram DM]({% link _numbers/instagram-dm-fundamentals.md %})
- [Conecta Facebook Messenger]({% link _integrations/connect-facebook-messenger.md %})
- [Fundamentos de Facebook Messenger]({% link _numbers/facebook-messenger-fundamentals.md %})
- [Configura el envío de correos]({% link _integrations/set-up-email-sending.md %})

Para Push, separa **recoger suscripciones** de **enviar notificaciones**. Un canal activo configurado para el origen del sitio permite recoger y gestionar suscripciones en cualquier plan; el envío requiere Pro o Enterprise y está sujeto a la disponibilidad y límites de la plataforma. Si falta el canal, confirma con soporte cómo habilitarlo: la creación de un canal personalizado en la interfaz puede estar limitada por el plan.

Shopify y VTEX ofrecen instalación mediante sus integraciones; completa la instalación en el sitio publicado y comprueba que la app o píxel esté actualizado. Las tiendas personalizadas usan Hellotext.js y un worker compatible en el mismo origen HTTPS. La preparación del navegador, el permiso del visitante y la confirmación de la suscripción son comprobaciones distintas. Sigue [Configura las notificaciones push]({% link _integrations/setup-push-notifications.md %}) para elegir la ruta de instalación; para una tienda personalizada usa los contratos actuales de [Configura Push con Hellotext.js]({% link _developers/setup-push-with-hellotext-js.md %}). La guía general de Push aún conserva redacción de planes anterior: aplica aquí la distinción entre recogida y envío.

### 4. Agrega herramientas de captura y checkout

Cuando tu fuente de datos y canal de mensajería estén listos, agrega las herramientas de captura que usarán tus clientes. Define qué dato pides, el canal y propósito del permiso, y dónde se instalará la captura. Tener un teléfono o un perfil Suscrito no demuestra permiso para cualquier mensaje o canal.

Empieza por los lugares donde tus clientes ya interactúan con tu marca: tu sitio, checkout, packaging, tienda, anuncios, perfiles sociales o eventos.

En **Captura > Formularios**, revisa la vista previa antes de instalar. Este formulario ficticio muestra un campo de teléfono y un aviso específico para SMS, con cabecera centrada. Sigue en borrador, sin respuestas registradas, cupón ni ruta asignada; no demuestra que esté activo en un sitio ni que alguien se haya suscrito. Comprueba además la instalación, el estado de la captura y su funcionamiento en el entorno autorizado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Vista previa real de formulario ficticio con teléfono y consentimiento para SMS.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 490px; margin: 0 auto;">
      <img src="/images/captures/forms/ui-refresh/es/preview.png" srcset="/images/captures/forms/ui-refresh/es/preview.png 2x" style="width: auto; margin: 0 auto;" width="944" height="780" loading="lazy" decoding="async" alt="Vista previa real de formulario ficticio con teléfono y consentimiento para SMS." />
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario existente en borrador, sin respuestas registradas ni ruta; misma fuente completa usada en escritorio y móvil.</figcaption>
</figure>

Sigue leyendo: [Resumen de herramientas de captura]({% link _captures/capture-overview.md %}).

### 5. Verifica la configuración antes de lanzar

Antes de enviar mensajes de forma masiva, prepara una validación autorizada en un entorno aislado y con destinos de prueba permitidos. Define qué acciones podrían crear eventos, compras, cobros, entregas o mensajes y mantén las automatizaciones inactivas hasta aprobar ese alcance. Si no tienes un entorno seguro, deja pendiente la prueba que lo requiere.

- Usa un perfil ficticio coherente y confirma que aparece en **Audiencia** del negocio previsto; su alcance y suscripción no sustituyen el permiso por canal.
- Compara un registro conocido y los eventos compatibles con la fuente: cliente o sesión correctamente asociados, referencia e IDs, origen, fecha, importe y moneda cuando correspondan. Distingue una prueba de una venta real.
- En una tienda personalizada, espera la inicialización de Hellotext.js y registra `page.viewed` explícitamente una vez por vista real. Una llamada duplicada altera los datos.
- Comprueba la actividad real en el perfil correcto después del procesamiento. Una respuesta `received` no garantiza que se haya registrado el evento o producido sus efectos.
- Revisa primero plantilla, personalización, URL final, baja y manejo de respuestas. Realiza una prueba de entrega sólo cuando esté autorizada, con permiso y destinos aislados; un borrador o una solicitud aceptada no prueban recepción.
- Comprueba la captura y, para Push, permiso y suscripción del navegador por separado. Confirma responsables y capacidad para responder antes de activar misiones, rutas o campañas.

Para un checklist más completo, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Checklist de solución de problemas

Si una integración no se comporta como esperas, revisa primero lo básico:

- La cuenta conectada es la tienda, sitio, marketplace o cuenta de Meta Business correcta.
- El negocio de Hellotext es el correcto.
- Las claves de API, tokens, configuración del plugin o permisos de la app siguen vigentes.
- Los dominios de la tienda y scripts de checkout corresponden a la tienda activa.
- El navegador permite ventanas emergentes y redirecciones de autorización durante la configuración de canales.
- La integración terminó sus pasos de instalación y está procesando los datos compatibles. Compara un registro conocido y su fecha en vez de esperar un plazo universal. Si hay una escritura con respuesta incierta, revisa el registro antes de repetirla. No elimines y reconectes una integración que funciona sin investigar la causa.

Si la configuración sigue sin verse bien, contacta a soporte con nombre e ID público del negocio, integración, dominio, paso, fecha y zona horaria, referencia del registro y aviso exacto. Describe lo esperado y lo observado; oculta tokens privados, contraseñas y datos de clientes en logs o capturas.
