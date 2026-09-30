Los links con tracking permiten conectar un clic con el mensaje que lo originó, el perfil del cliente, una sesión, los reportes y la actividad que ocurre después en tu sitio.

Hellotext puede crear estos links en mensajes de campañas, rutas, misiones e Inbox. Para que el contexto continúe después de la redirección, el sitio de destino debe conservar la sesión y registrar explícitamente la actividad posterior.

## Qué hace Hellotext cuando el cliente hace clic

En el editor, usa **Insertar enlace corto**, el control con el icono de eslabones de la barra inferior. Pega el destino completo en **Crear un enlace corto** y selecciona **Agregar enlace corto**. Escribir una URL como texto no equivale a insertarla con esta herramienta.

El siguiente borrador real de **Configuración → Plantillas**, modo **Mensaje** con vista SMS, permite reconocer el control. Su URL todavía es texto: no se creó un link, no se guardó la plantilla ni se envió el mensaje.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de Mensaje con borrador ficticio de devolución y control Insertar enlace corto en la barra inferior; URL todavía como texto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/send-messages-with-api/editor-es-mobile.png 2x" width="668" height="760" />
        <img src="/images/developers/send-messages-with-api/editor-es.png" srcset="/images/developers/send-messages-with-api/editor-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="708" loading="lazy" decoding="async" alt="Editor real de Mensaje con borrador ficticio de devolución y control Insertar enlace corto en la barra inferior; URL todavía como texto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador sin guardar en Configuración → Plantillas, modo Mensaje con vista SMS. La URL es texto sin convertir en un link personalizado; no se creó un enlace ni se envió un mensaje.</figcaption>
</figure>

El editor crea un enlace reutilizable del negocio. Cuando Hellotext prepara el mensaje para un destinatario, genera el link personalizado y su sesión, con una dirección como `hello.link/XXXXXX` o el dominio personalizado verificado del negocio. Abrir el enlace del editor o una preview no demuestra que exista un clic de ese destinatario: esas direcciones pueden redirigir en modo preview, sin el contexto del mensaje enviado.

Cuando el cliente abre el link personalizado, Hellotext:

1. Redirige a la URL original con `hello_session` y los parámetros UTM aplicables.
2. Encola el registro del clic; la redirección puede terminar antes de que se procese.
3. Al procesar un clic admitido, registra `short_link.clicked` para el perfil y mensaje correspondientes, conserva sus referencias de origen y actualiza los contadores y reportes disponibles.

Hellotext filtra previews que identifica como bots, tanto en la redirección como al procesar la solicitud. Esto no identifica infaliblemente cada persona: un clic registrado representa una interacción con el link, no una identidad comprobada, una compra ni una conversión garantizada.

No envíes `short_link.clicked` manualmente desde tu integración. Hellotext lo crea al procesar el clic; duplicarlo desde el sitio alteraría la actividad y sus contadores.

## Parámetros que recibe el sitio de destino

La URL redirigida puede verse así; los valores son ilustrativos:

```text
https://shop.example.com/products/everyday-sneakers?hello_session=SESSION_ID&utm_source=hellotext&utm_medium=sms&utm_campaign=campana_ejemplo
```

Los parámetros tienen funciones diferentes:

- `hello_session` contiene el ID de la sesión asociada con el link personalizado. No es un token privado de API ni una autorización para enviar mensajes.
- `utm_source` identifica el origen del tráfico; normalmente su valor es `hellotext`.
- `utm_medium` identifica la tecnología del mensaje, como `sms`, cuando está disponible.
- `utm_campaign` usa el token UTM configurado de la campaña o ruta, o el código de la misión. No presupongas que es el ID público del objeto de API; puede faltar cuando ese origen no corresponde.

El parámetro vigente es `hello_session`. No uses ni busques `hellotext_session`.

Hellotext conserva el fragmento y los demás parámetros del destino. Si ya existe una clave UTM que Hellotext genera, su valor generado reemplaza el anterior; evita destinos que ya tengan un `hello_session` o claves duplicadas. No elimines estos parámetros en una redirección intermedia ni sustituyas el ID por uno de otra persona.

## Cómo continúa la sesión en el sitio

En el [SDK publicado de Hellotext.js](https://github.com/hellotext/hellotext.js), versión `2.6.0`, la sesión se obtiene primero de `hello_session` en la URL, luego de una sesión proporcionada en la configuración y luego de la cookie. Si no hay ninguna y `autoGenerateSession` está habilitado, se genera otra sesión.

Inicializa la librería antes de que tu router o código de la tienda elimine los parámetros. `initialize()` es asíncrono: espera a que termine. El ejemplo supone que Hellotext.js ya está cargado y usa el **ID público del negocio**, sin un token privado:

```javascript
(async () => {
  const redirectedSession = new URL(window.location.href)
    .searchParams.get("hello_session");

  await Hellotext.initialize("HELLOTEXT_BUSINESS_ID");
  console.log({ redirectedSession, session: Hellotext.session });

  const response = await Hellotext.track("page.viewed");
  if (response.failed) {
    console.error(await response.json());
  }
})().catch((error) => {
  console.error(error);
});
```

Cuando llega `hello_session`, compara ese valor con `Hellotext.session` después de inicializar. El SDK conserva la sesión mediante una cookie cuando el navegador permite escribirla e intenta confirmar su recepción al servidor. Ver un ID local no demuestra que esa confirmación o un evento ya se hayan procesado. Si el almacenamiento está bloqueado, comprueba de nuevo la continuidad al navegar o recargar.

Hellotext.js **no registra automáticamente `page.viewed` al inicializar**. Haz una llamada explícita por vista real. En una aplicación de una sola página, inicializa una vez y, después de cada navegación que quieras medir, usa una sola llamada a `Hellotext.track("page.viewed", { url: window.location.href })`; evita duplicarla con otra integración. Si la página representa un producto, registra también `product.viewed` con el producto correspondiente. La URL por sí sola no aporta todos los datos del catálogo.

Consulta [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}) para conocer el ciclo de sesión e identidad, y contrasta los ejemplos con la versión del SDK que utilizas.

## Contexto según el origen del mensaje

El mismo mecanismo conserva diferentes referencias según dónde se creó el mensaje:

- **Campaña:** campaña, broadcast y mensaje del destinatario.
- **Ruta:** ruta, paso y mensaje que se ejecutó.
- **Misión:** misión y mensaje generado para el destinatario.
- **Inbox:** perfil y mensaje de la conversación, aunque no haya un reporte de campaña o automatización.

Estos datos se conservan en Hellotext; no todos se transmiten como parámetros independientes en la URL. Un `utm_campaign` por sí solo no sustituye la sesión ni prueba que un mensaje sea elegible para atribución.

No reutilices manualmente el link personalizado de un mensaje para otros clientes o envíos. Si alguien lo reenvía, conserva el contexto del destinatario original; no permite asumir que quien lo abrió sea esa misma persona. Agrega el destino mediante la herramienta del editor y deja que Hellotext prepare el contexto de cada mensaje.

## Cómo se conectan los eventos posteriores

El clic permite continuar una sesión que ya puede haberse creado al preparar el mensaje. Para entender qué ocurrió después, registra las acciones relevantes:

- Tu sitio llama a Hellotext.js explícitamente para navegación, vistas de productos y cambios del carrito que no registre ya otra integración.
- Tu backend registra pedidos, pagos, cancelaciones, envíos y entregas con datos fiables de tu sistema.
- Cuando se conoce al cliente, la sesión debe estar asociada con el perfil correcto dentro del mismo negocio. No la reasignes basándote sólo en una URL reenviada.

Si el checkout ocurre en otro dominio o aplicación, conserva el ID de `Hellotext.session` en el contexto de tu checkout y entrégalo a tu backend antes de perderlo. Una cookie no se comparte automáticamente entre dominios diferentes. Registrar el perfil sin la sesión no conserva por sí solo toda la navegación anterior, y enviar ambos IDs no crea automáticamente una asociación válida si no existía.

Incluye el momento original del evento cuando lo registres con retraso, usando el formato admitido por tu endpoint. Distingue `received` de un evento procesado y de una venta atribuida. Ni el clic ni la sesión otorgan consentimiento para comunicaciones.

No envíes el mismo evento desde Hellotext.js y desde el backend ni repitas inmediatamente una solicitud cuyo resultado sea incierto. Consulta [Seguimiento de eventos]({% link _developers/tracking-events.md %}) y [Seguimiento de origen externo]({% link _developers/external-tracking.md %}).

## Clics, reportes y atribución

Los clics procesados pueden aparecer en la actividad del perfil y en reportes de campañas, rutas o misiones cuando estén disponibles. El contador del link incluye clics repetidos admitidos; no equivale a personas únicas. Las métricas de clic único por mensaje tampoco demuestran cuántas personas distintas abrieron una URL reenviada. Una redirección correcta no garantiza un contador actualizado inmediatamente.

Un clic elegible puede aportar evidencia activa de atribución dentro de la ventana predeterminada de siete días desde el clic. Una entrega elegible puede aportar evidencia pasiva dentro de la ventana predeterminada de 24 horas. Estas ventanas se pueden configurar por negocio; no representan la caducidad automática del link o de su cookie.

Hellotext también evalúa:

- Que el cliente, el negocio y el pedido estén identificados correctamente.
- Que el clic corresponda a un mensaje entregado a ese cliente y ocurra después de la entrega.
- Que el origen sea utilizable y, para una campaña, ya haya comenzado cuando ocurre la compra.
- Que el clic preceda a la compra y que ésta esté dentro de la ventana aplicable, usando los tiempos originales aunque se procese después.
- Que no exista otra fuente válida con mayor precedencia.

Conservar `hello_session` ayuda a conectar el contexto, pero no garantiza que toda actividad posterior reciba ese origen ni que toda compra sea atribuida. Consulta [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer las ventanas, la precedencia y los ejemplos completos.

## Verifica la implementación

En un entorno de pruebas autorizado, usa un perfil y un mensaje reconocibles, con el canal y consentimiento correspondientes:

1. Inserta el destino con la herramienta del editor y distingue el enlace del borrador del link personalizado del mensaje del destinatario.
2. Si realizas un envío de prueba autorizado, abre el link de ese mensaje; una preview del editor no prueba el mismo flujo.
3. Confirma que las redirecciones intermedias conserven `hello_session` y los UTM esperados, sin duplicar o sobrescribir la sesión.
4. Espera a `initialize()` y compara `Hellotext.session` con el ID recibido; registra `page.viewed` explícitamente una vez.
5. Comprueba la actividad del perfil después del procesamiento y distingue clics totales de métricas únicas.
6. Revisa el reporte del origen cuando esté disponible, con el período y canal correctos.
7. Registra sólo la actividad necesaria para la prueba y verifica el objeto, cliente, sesión y tiempo originales; comprueba por separado su atribución.
8. Confirma que otra integración no haya registrado la misma actividad ni un `short_link.clicked` manual adicional.

## Soluciona problemas comunes

- **El clic aparece, pero la actividad posterior no:** conserva `hello_session` hasta inicializar, espera a la librería y verifica las llamadas explícitas de tracking y su procesamiento.
- **La sesión cambia al llegar al sitio:** revisa redirects, claves duplicadas, dominios, almacenamiento bloqueado y el orden de inicialización. No confundas un ID local con una asociación de perfil confirmada.
- **La vista de página aparece sin producto:** registra `product.viewed` con el producto correspondiente.
- **El clic no aparece en el reporte:** comprueba que abriste el link personalizado del mensaje correcto, no el enlace del borrador o una preview; considera el filtro de bots, el procesamiento y el período del reporte.
- **La compra no se atribuye:** revisa identidad, negocio, pedido, entrega, tiempos originales, ventana y precedencia. Un UTM o una sesión presente no bastan por sí solos.

Si faltan señales, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Dominio personalizado para links cortos]({% link _integrations/custom-domain-for-short-links.md %})
