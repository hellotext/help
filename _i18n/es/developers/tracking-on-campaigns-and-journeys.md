Los links con tracking permiten conectar un clic con el mensaje que lo originó, el perfil del cliente, una sesión, los reportes y la actividad que ocurre después en tu sitio.

Hellotext puede crear estos links en mensajes de campañas, rutas, playbooks e Inbox. Para que el contexto continúe después de la redirección, el sitio de destino debe conservar la sesión y registrar correctamente la actividad posterior.

## Qué hace Hellotext cuando el cliente hace clic

Cuando agregas un link con la herramienta del editor, Hellotext genera una URL corta como `hello.link/XXXXXX` o usa el dominio personalizado configurado por el negocio.

Cuando el cliente hace clic, Hellotext:

1. Registra la acción `short_link.clicked` para el perfil del cliente y el mensaje correspondiente.
2. Actualiza la cantidad de clics del link y los reportes disponibles.
3. Conserva el contexto de la campaña, broadcast, ruta, paso o playbook que originó el mensaje.
4. Redirige al cliente a la URL original.
5. Agrega una sesión y parámetros UTM a la URL de destino.

Hellotext filtra las previews que identifica como bots para que no se contabilicen como clics de clientes. Aun así, un clic registrado representa una interacción, no una compra ni una conversión garantizada.

No envíes `short_link.clicked` manualmente desde tu integración. Hellotext lo crea cuando procesa el clic del link.

## Parámetros que recibe el sitio de destino

La URL redirigida puede verse así:

```text
https://shop.example.com/products/everyday-sneakers?hello_session=SESSION_ID&utm_source=hellotext&utm_medium=sms&utm_campaign=CAMPAIGN_ID
```

Los parámetros tienen funciones diferentes:

- `hello_session` conserva la sesión asociada con el link y permite conectar actividad posterior.
- `utm_source` identifica el origen del tráfico; normalmente su valor es `hellotext`.
- `utm_medium` identifica el canal cuando está disponible.
- `utm_campaign` identifica la campaña, ruta o playbook cuando corresponde.

El parámetro vigente es `hello_session`. No uses ni busques `hellotext_session`.

Si la URL original ya contiene parámetros, Hellotext los conserva y agrega los suyos. No elimines `hello_session` ni los parámetros UTM en una redirección intermedia.

## Cómo continúa la sesión en el sitio

Hellotext.js lee `hello_session` desde la URL, conserva la sesión en el navegador y la incluye en la actividad posterior.

Inicializa Hellotext.js antes de que tu router o código de la tienda elimine los parámetros de la URL. En una aplicación de una sola página, conserva el query string durante la carga inicial.

Puedes comprobar la sesión después de inicializar la librería:

```javascript
if (Hellotext.isInitialized) {
  console.log(Hellotext.session)
}
```

Hellotext.js registra automáticamente `page.viewed` con la URL actual. Si la página representa un producto, registra también `product.viewed` e incluye explícitamente el producto. La URL por sí sola no aporta toda la información del catálogo.

Consulta [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}) para conocer el ciclo completo de la sesión y la identidad.

## Contexto según el origen del mensaje

El mismo mecanismo conserva diferentes referencias según dónde se creó el mensaje:

- **Campaña:** el clic se relaciona con la campaña, el broadcast y el mensaje enviado.
- **Ruta:** el clic se relaciona con la ruta, el paso y el mensaje que se ejecutó.
- **Playbook:** el clic se relaciona con el playbook y el mensaje generado o enviado.
- **Inbox:** el clic queda en la actividad del cliente y la conversación, aunque no tenga un reporte de campaña o automatización.

No reutilices manualmente el link personalizado de un mensaje para otros clientes o envíos. Agrega el destino mediante la herramienta de links del editor y permite que Hellotext genere el contexto correcto para cada mensaje.

## Cómo se conectan los eventos posteriores

Un clic es solo el inicio de la sesión. Para entender qué ocurrió después, el sitio o backend debe registrar las acciones relevantes:

- Hellotext.js registra navegación, vistas de productos y cambios del carrito.
- Tu backend registra pedidos, pagos, cancelaciones, envíos y entregas confiables.
- Cuando se conoce al cliente, la sesión debe asociarse con el perfil del cliente correcto.

Si el checkout ocurre en otro dominio o aplicación, envía el ID de `Hellotext.session` a tu backend antes de perder el contexto. Después puedes registrar el pedido con el perfil del cliente o la sesión correspondiente.

No envíes el mismo evento desde Hellotext.js y desde el backend. Consulta [Seguimiento de eventos]({% link _developers/tracking-events.md %}) y [Seguimiento de origen externo]({% link _developers/external-tracking.md %}).

## Clics, reportes y atribución

Los clics pueden aparecer en la actividad del perfil del cliente y en reportes de campañas, rutas o playbooks cuando ese reporte está disponible.

Un clic elegible puede aportar evidencia activa de atribución y normalmente abre una ventana de siete días desde el clic. Una entrega elegible u otra señal pasiva puede aplicar dentro de la ventana predeterminada de 24 horas. Estas ventanas pueden configurarse por cuenta.

El clic no garantiza que una compra se atribuya a ese origen. Hellotext también evalúa:

- Que el cliente y el pedido estén identificados correctamente.
- Que la compra ocurra dentro de la ventana aplicable.
- Que la campaña, ruta, playbook o entrega sean elegibles.
- Que no exista otra fuente válida con mayor precedencia.

Consulta [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer las ventanas, la precedencia y los ejemplos completos.

## Verifica la implementación

Prueba con un perfil del cliente y un mensaje reconocibles:

1. Crea un link con tracking mediante el editor.
2. Envía el mensaje de prueba y abre el link como lo haría el cliente.
3. Confirma que la URL de destino incluya `hello_session` y los parámetros UTM esperados.
4. Verifica que `Hellotext.session` coincida con la sesión recibida.
5. Confirma que el clic aparezca en la actividad del perfil del cliente.
6. Revisa el reporte de la campaña, ruta o playbook cuando esté disponible.
7. Registra una vista de producto, carrito o pedido de prueba y confirma que conserve el cliente y el origen correctos.
8. Comprueba que la misma actividad no se haya registrado dos veces.

## Soluciona problemas comunes

- **El clic aparece, pero la actividad posterior no:** confirma que el sitio conserve `hello_session` hasta que Hellotext.js se inicialice.
- **La sesión cambia al llegar al sitio:** revisa redirects, dominios, cookies y el orden de inicialización de Hellotext.js.
- **La vista de página aparece sin producto:** registra `product.viewed` con el producto correspondiente.
- **El clic no aparece en el reporte:** verifica que el link haya sido creado en el mensaje correcto y que no haya sido una preview detectada como bot.
- **La compra no se atribuye:** revisa identidad, pedido, fecha, ventana y precedencia de fuentes.

Si faltan señales, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Dominio personalizado para links cortos]({% link _integrations/custom-domain-for-short-links.md %})
