Conecta Fenicio para incorporar datos de clientes, productos y órdenes a Hellotext y relacionarlos con la actividad de tu tienda.

Completa tres comprobaciones distintas: los datos de la cuenta guardados en Hellotext, el acceso a la API autorizado por Fenicio y el seguimiento instalado en la tienda publicada. Que el asistente diga **Cuenta conectada** o que desaparezca la etiqueta pendiente no demuestra que toda la importación terminó ni que el sitio registra actividad.

## Qué sincroniza la integración

La integración procesa lo que la tienda devuelve y lo que el seguimiento registra:

- **Perfiles:** nombre, email, teléfono válido, género y datos de documento disponibles. La identidad de Fenicio ayuda a encontrar el perfil; email o teléfono también pueden relacionarlo con uno existente. Revisa coincidencias antes de tratarlo como un cliente nuevo.
- **Historia de clientes, opcional:** la importación actual obtiene compradores de las órdenes disponibles en la API de Fenicio. No equivale necesariamente a todos los usuarios registrados en la tienda. Omitirla no impide que órdenes o identificaciones posteriores creen o actualicen perfiles.
- **Catálogo:** productos y presentaciones de Fenicio, representadas como variantes en Hellotext, con referencias, precios, moneda, imágenes, categorías y disponibilidad recibidas. El precio no es stock. La disponibilidad importada depende del stock de la presentación; las consultas de disponibilidad pueden volver a consultar Fenicio y dependen de su respuesta.
- **Órdenes y señales:** según el estado recibido, Hellotext puede registrar orden creada, confirmada, enviada, entregada o cancelada. La modalidad de entrega es un dato distinto. Un estado final importado no reconstruye necesariamente todos los pasos intermedios.
- **Navegación:** requiere el código de seguimiento instalado y configurado, separado de la importación por API. Las señales pueden alimentar segmentos, misiones, rutas, reportes y atribución cuando cumplen sus reglas; ver un objeto no prueba que se registró una compra o una venta atribuida.

Importar un comprador o recibir un email/teléfono no acredita permiso para enviarle mensajes. Revisa el consentimiento para cada canal, destino y tipo de mensaje; **No confirmado** o **Suscrito** y el alcance del perfil son estados diferentes de ese permiso. Los perfiles nuevos de la importación Fenicio no reciben una garantía de suscripción comercial por haber comprado.

## Antes de conectar

Confirma que:

- Eres **Dueño** o **Administrador** del negocio correcto en Hellotext y tienes una suscripción válida.
- Tienes el dominio público de la tienda y el **ID del negocio que Fenicio asignó a esa tienda**. Solicítalo a Fenicio si no lo conoces.
- Puedes coordinar con soporte de Fenicio la autorización de acceso y la instalación del seguimiento en el sitio publicado.
- Decidiste el alcance de la importación histórica y cómo revisarás coincidencias y permiso de contacto.

El campo **ID del negocio** del formulario de Fenicio pide la referencia de Fenicio. Es distinto del **ID público de Hellotext** para el seguimiento y de un token privado de API. No crees ni pegues un token de Hellotext en ese campo o en el sitio público.

Puedes encontrar el ID público de Hellotext en **Configuración > General**, junto al nombre del negocio. La figura muestra el negocio ficticio **Enterprise**, ID público **4ONLdN32**; ese nombre no indica el plan contratado y este encabezado no demuestra una conexión a Fenicio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Encabezado real de General con nombre ficticio Enterprise e ID público de Hellotext 4ONLdN32.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Encabezado real de General con nombre ficticio Enterprise e ID público de Hellotext 4ONLdN32." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fuente de interfaz aprobada; el estado ficticio se explica en el texto anterior.</figcaption>
</figure>

## Conecta tu cuenta de Fenicio

La siguiente figura muestra los dos campos reales con **shop.example.test** e ID **1234567890**, datos ficticios sin guardar. No representan una tienda conectada.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Campos reales Dominio e ID del negocio de Fenicio con valores ficticios sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 550px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/integrations/connect-fenicio/account-es-mobile.png 2x" width="764" height="408" />
        <img src="/images/integrations/connect-fenicio/account-es.png" srcset="/images/integrations/connect-fenicio/account-es.png 2x" style="width: auto; margin: 0 auto;" width="1064" height="408" loading="lazy" decoding="async" alt="Campos reales Dominio e ID del negocio de Fenicio con valores ficticios sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fuente de interfaz aprobada; el estado ficticio se explica en el texto anterior.</figcaption>
</figure>

1. En Hellotext, ve a **Configuración > Integraciones > Explorar integraciones** y abre **Fenicio**.
2. Ingresa el **Dominio**, sin una ruta de producto o checkout, y el **ID del negocio de Fenicio** de esa misma tienda.
3. Revisa los datos antes de seleccionar **Siguiente**. Este paso comprueba que el dominio responde y, si supera la validación, guarda la cuenta y su integración en Hellotext. No autoriza la API ni instala el seguimiento.
4. Elige **Sí, importar mis clientes existentes a Hellotext** o **No ahora. Lo haré más tarde**, y avanza. Esta elección guarda la configuración y deja la cuenta pendiente; aceptar la importación no significa que los perfiles ya se hayan procesado.
5. Lee **Cuenta conectada**, completa la salida del asistente y continúa con la autorización a Fenicio. El encabezado describe el registro inicial, no una validación completa del sitio.

Si lo omitiste, la opción de importar clientes puede estar disponible después de activar la integración. Si aceptaste la importación pero faltan perfiles, revisa su resultado con soporte antes de repetirla: la opción marcada como importada no prueba que cada fila terminó correctamente.

## Solicita la autorización a Fenicio

Después de guardar la configuración:

1. Solicita a soporte de Hellotext los datos actuales de acceso que Fenicio debe autorizar, incluida la IP de origen si requiere una lista de permitidos. Usa esa confirmación actual para tu tienda.
2. Abre un ticket con soporte de Fenicio con el dominio y el ID de Fenicio. Pide autorización para consultar catálogo y órdenes, y la instalación del seguimiento de Hellotext en el sitio publicado.
3. Confirma que el seguimiento usa el ID público del negocio correcto de Hellotext. Si el equipo instala Hellotext.js **2.6.0**, debe esperar la inicialización asíncrona y registrar explícitamente una vista por cada navegación real con `page.viewed`, evitando duplicar la primera vista. Sigue [Seguimiento de eventos]({% link _developers/tracking-events.md %}) para ese contrato.
4. Espera la confirmación de Fenicio y vuelve a **Configuración > Integraciones**. Abre el menú de la cuenta pendiente y selecciona **Verificar integración**.
5. Comprueba el resultado y los registros importados por separado. La verificación consulta la API de órdenes; si responde correctamente, activa la cuenta e inicia el trabajo de importación. No comprueba que el código del sitio esté instalado ni que se haya registrado una visita.

### Modelo de correo para Fenicio

Completa este modelo con los datos confirmados. Revisa los destinatarios y envíalo por el canal de soporte autorizado de tu tienda:

> **Asunto:** Autorización de la integración entre Fenicio y Hellotext
>
> Hola, equipo de soporte de Fenicio:
>
> Necesitamos autorizar la integración de nuestra tienda con Hellotext. Por favor:
>
> - Habiliten el acceso de Hellotext al catálogo y las órdenes con los datos actuales de autorización confirmados por Hellotext: `[DATOS DE ACCESO / IP CONFIRMADA, SI CORRESPONDE]`.
> - Instalen y configuren el seguimiento de Hellotext en el sitio publicado para el ID público de Hellotext `[ID PÚBLICO DE HELLOTEXT]` y confirmen la versión instalada.
>
> **Datos de la tienda:**
>
> - Dominio: `[DOMINIO DE LA TIENDA]`
> - ID del negocio en Fenicio: `[ID DEL NEGOCIO EN FENICIO]`
>
> Por favor, confirmen el acceso a la API y la instalación del seguimiento por separado.
>
> Muchas gracias,
>
> `[NOMBRE]`

Al activarse la cuenta se programa la importación de productos y órdenes; el historial de compradores depende de la opción elegida. Los trabajos y las consultas periódicas dependen de las colas, la suscripción y la respuesta de Fenicio. No hay un plazo garantizado de unos minutos para cada registro o cambio. Comprueba avance, errores y datos concretos antes de lanzar una automatización.

## Verifica los datos sincronizados

Empieza con registros existentes que conozcas en Fenicio, sin crear compras para llenar un reporte:

**1. Perfil:** compara la identidad de Fenicio, datos de contacto y documento con el comprador de origen. Revisa el perfil que ya existía y sus permisos; una asociación no garantiza que todo el historial de navegación se le haya atribuido.

**2. Producto/presentación:** en **Configuración > Objetos > Productos**, abre **Editar** y compara nombre, referencia, origen, SKU, precio y moneda con Fenicio. El producto padre usa su código y las presentaciones usan su SKU de Fenicio; conserva esa diferencia al buscar una variante. Revisa también imágenes y disponibilidad de la presentación que necesitas.

La figura de identidad muestra **Agenda semanal**, referencia **PRODUCT-GUIDE-1001**, SKU **GUIDE-PLANNER** y origen **custom_store**, en borrador y sin eventos. Ilustra dónde inspeccionar los campos del editor; no es un producto importado de Fenicio ni prueba stock actual o publicación del catálogo. El control monetario llamado **Cantidad** en este editor es un importe, no unidades disponibles.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real del producto ficticio Agenda semanal con referencia, SKU y origen custom_store.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/products-and-inventory-with-api/identity-es-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-es.png" srcset="/images/developers/products-and-inventory-with-api/identity-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Editor real del producto ficticio Agenda semanal con referencia, SKU y origen custom_store." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fuente de interfaz aprobada; el estado ficticio se explica en el texto anterior.</figcaption>
</figure>

**3. Orden:** en **Configuración > Objetos > Pedidos**, abre **Editar** y contrasta referencia, artículos, cantidades, importes, moneda y modalidad con la orden de origen. El ID de la orden en Fenicio y su número visible pueden ser distintos. Busca la señal correspondiente en la actividad del perfil; no deduzcas envío, entrega o atribución sólo por los datos del pedido.

El ejemplo siguiente es **Pedido #1001**, referencia **ORDER-1001**, origen **custom_store**, **USD 89.90**, en borrador y sin eventos. **Order ID** muestra la referencia del objeto, no el ID público de Hellotext. **Deliver** indica modalidad de entrega, no que se haya enviado. Este pedido ficticio se reutiliza para mostrar el lugar de inspección y no demuestra sincronización con Fenicio.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real del pedido ficticio ORDER-1001, origen custom_store e importe USD 89.90.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Editor real del pedido ficticio ORDER-1001, origen custom_store e importe USD 89.90." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Fuente de interfaz aprobada; el estado ficticio se explica en el texto anterior.</figcaption>
</figure>


**4. Seguimiento:** después de confirmar la instalación en el sitio publicado, verifica sesión, negocio y actividad real de un recorrido autorizado. Una respuesta de aceptación de un evento no garantiza procesamiento, asociación al perfil ni efectos en una misión o reporte.

**5. Validación aislada:** si falta comprobar un flujo, acuerda una prueba en un entorno y cuenta ficticios autorizados, con datos separados de ventas reales y sin mensajes a clientes. Registra origen, hora, identidad y resultado esperado. Revisa permisos, canal y versión activa aprobada de plantilla antes de habilitar cualquier envío; un borrador no es una prueba entregada.

Antes de habilitar misiones o rutas basadas en estos datos, sigue la guía para [verificar tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Soluciona problemas de conexión

- **No se verifica el dominio:** confirma el dominio y la referencia de la misma tienda, HTTPS y disponibilidad con Fenicio. El primer paso comprueba el sitio, no el acceso a la API. Corrige un dato inválido antes de repetirlo.
- **La cuenta sigue pendiente:** confirma con Fenicio el acceso a su API y con Hellotext los datos actuales de autorización. **Verificar integración** puede activar la cuenta y programar importaciones; revisa primero el estado si una llamada anterior quedó incierta. La instalación de seguimiento no sustituye el acceso a la API.
- **Cuenta activa, perfiles ausentes:** revisa si aceptaste el historial, si los compradores están en las órdenes que Fenicio expone y si el proceso tiene errores. Busca también perfiles existentes relacionados por identidad/email/teléfono. No desconectes ni reimportes a ciegas.
- **Producto, variante u orden faltante:** compara referencias y origen, confirma que el registro pertenece a la tienda y que la API lo devuelve, y revisa avance/errores. Una línea de servicio o envío sin SKU de producto no equivale a un artículo de catálogo. El editor y una respuesta anterior pueden mostrar datos distintos de los últimos datos de origen.
- **Stock o estado distinto:** distingue precio, disponibilidad de una presentación, cantidad de un artículo y estado de entrega. Las consultas dependen de Fenicio; una cuenta activa no garantiza una copia completa e inmediata de todo cambio.
- **Falta navegación o atribución:** revisa con Fenicio el código publicado, ID público de Hellotext, versión, vista explícita, sesión e identidad elegible. La consulta de órdenes no diagnostica el seguimiento. Conserva el origen, la fecha y las ventanas del reporte; un clic no es una compra atribuida.

Ante una falla transitoria de lectura, usa esperas limitadas; no repitas continuamente errores de datos o permisos. Si no conoces el resultado de una acción que pudo guardar o activar algo, consulta el estado antes de repetirla. Contacta a soporte de Hellotext con dominio, ID de Fenicio, ID público de Hellotext, referencia/origen del registro, hora y zona horaria, paso y error. Comparte capturas recortadas sin tokens, contraseñas ni datos personales innecesarios.

## Guías relacionadas

- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
