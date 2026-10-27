Usa esta guía cuando los clientes mostraron interés por un producto no disponible y quieres que Hellotext les notifique automáticamente cuando ese producto o variante vuelve a estar disponible.

Vuelta a Stock es una misión autónoma de conversión. Cruza señales de inventario con los perfiles del cliente que mostraron interés, verifica que la oportunidad siga vigente y envía una alerta relevante a esas personas sin que tu equipo tenga que revisar listas, cruzar stock o crear campañas manuales.

Su valor está en simplificar la operación: Hellotext comunica la reposición a clientes con señales de interés por ese producto, con el contexto necesario para volver a comprar. Ese interés puede provenir de una lista de deseos, una búsqueda del producto específico registrada como interés, una visita al producto o un carrito; no siempre implica que el cliente haya pedido expresamente un aviso.

No es una ruta ni una campaña amplia de reposición. Es una misión preconstruida con su propia configuración.

Este ejemplo ilustrativo muestra cómo podría presentarse una alerta de la tienda ficticia Luma. El mensaje ayuda a revisar el producto y su disponibilidad; no implica una reserva de unidades ni que se haya enviado una notificación.

{% include editorial/es/custom-1d37399b8498476e.html %}

## Qué hace Vuelta a Stock

Vuelta a Stock ayuda a convertir demanda que quedó bloqueada por inventario.

Puede:

- Empezar cuando Hellotext recibe una señal de vuelta a stock o disponibilidad para un producto o variante.
- Usar señales de interés admitidas para el mismo producto, como una lista de deseos, un carrito, una visita al producto o interés inferido registrado. Si recoges solicitudes de aviso en un formulario, verifica cómo se registran esas señales en Hellotext.
- Enviar una notificación con contexto de producto y link de producto cuando el cliente puede ser alcanzado.
- Revisar si el producto o variante sigue disponible antes de que salga el mensaje.
- Detenerse cuando el producto vuelve a no estar disponible, el cliente ya compró, el cliente no puede ser alcanzado o no hace falta más seguimiento.
- Permitir que tu equipo revise y edite la configuración de la misión antes de habilitarla.

La configuración exacta puede variar según cuenta, tienda conectada y estado de despliegue. Revisa la misión generada antes de habilitarla en lugar de asumir que todos los negocios tienen las mismas opciones.

## Cuándo usarla

Usa Vuelta a Stock cuando el cliente quería un producto específico pero el inventario bloqueó la compra.

Encaja bien cuando:

- Los clientes se suman a una lista de espera o piden aviso cuando un producto vuelve.
- Un talle, color, variante o SKU específico no estaba disponible y vuelve a estar vendible.
- Tu tienda o fuente de datos puede enviar actualizaciones confiables de stock por producto o variante.
- Links, imágenes, precios y disponibilidad de producto están lo suficientemente actualizados para enviar rápido.
- Quieres una alerta directa de reposición, no un mensaje amplio de merchandising.

Usa una campaña cuando quieres anunciar una reposición una sola vez a una audiencia seleccionada, incluso si esos clientes no pidieron aviso por ese producto.

Usa [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) cuando el cliente vio un producto disponible pero no compró. Usa [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando el cliente agregó el producto al carrito o checkout. Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) cuando el cliente necesita ayuda para elegir alternativas o productos relacionados.

## Qué necesita antes del lanzamiento

Antes de habilitar la misión, confirma las señales de inventario y cliente de las que depende.

Revisa que:

- Tu tienda, ERP, catálogo o fuente de inventario envíe cambios de stock o disponibilidad a Hellotext.
- Identificadores de producto y variante coincidan con la señal de interés, lista de espera o aviso de reposición.
- Los estados sin stock y vuelta a stock sean confiables al nivel sobre el que vas a escribir.
- Nombres, imágenes, precios, stock y links de producto estén actualizados.
- Los perfiles del cliente con señales de interés estén suscritos, identificables y alcanzables.
- El canal esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Señales de compra u orden estén disponibles si la misión debería evitar escribir a clientes que ya compraron.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}). Para tracking personalizado, usa [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

Después de habilitar la misión, revisa la actividad de los perfiles de prueba, los mensajes y las señales de compra disponibles. Vuelta a Stock todavía no tiene un panel de reporte propio; no presupongas que todas esas métricas estarán reunidas en un único reporte.

## Cómo configurarla

Ve a **Misiones**, haz click en **Explorar misiones** y elige **Vuelta a Stock**.

Revisa las tarjetas de la misión antes de habilitarla:

- **Canales de salida:** usa la selección automática o elige los canales permitidos. Esta configuración no conecta un canal ni reemplaza el consentimiento del cliente.
- **Audiencia:** incluye o excluye los grupos de clientes que podrán participar.
- **Descuentos:** define si la misión puede usar ofertas de la tienda, incentivos de IA, un cupón configurado o ninguna estrategia de descuentos.
- **Tono:** selecciona hasta tres tonos para orientar la voz del mensaje.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-overview" aria-label="Tarjetas de configuración de Vuelta a Stock">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 674px); width: fit-content; margin: 0 auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-overview-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-overview-es-desktop.png 4x" width="2624" height="2564" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tarjetas de configuración de Vuelta a Stock" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. La configuración reúne Canales de salida, Audiencia, Descuentos y Tono. Abre la tarjeta que quieras revisar.</figcaption>
</figure>

Para revisar los grupos disponibles, abre **Audiencia** y haz clic en **Agrega audiencias**.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-audience" aria-label="Selector de audiencias con la lista de grupos abierta">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 674px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/back-in-stock-pounce/bis-audience-es-mobile.png 4x" width="1688" height="3868" />
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-audience-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-audience-es-desktop.png 4x" width="2624" height="3652" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Selector de audiencias con la lista de grupos abierta" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Abre Agrega audiencias para revisar los grupos disponibles. La selección actual y el alcance estimado aparecen en el mismo panel.</figcaption>
</figure>

En **Descuentos**, la estrategia combinada permite usar ofertas de la tienda e incentivos de IA dentro del límite elegido. También puedes usar solo ofertas de la tienda, solo incentivos de IA o un cupón creado en Hellotext. **Sin estrategia de descuentos** evita que se ofrezcan incentivos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-discounts" aria-label="Estrategia combinada de descuentos con un límite del diez por ciento">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 674px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/back-in-stock-pounce/bis-discounts-es-mobile.png 4x" width="1720" height="2632" />
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-discounts-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-discounts-es-desktop.png 4x" width="2624" height="2104" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Estrategia combinada de descuentos con un límite del diez por ciento" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. La estrategia combinada del ejemplo tiene seleccionado un límite del 10 %. El botón de ajustes abre las promociones de la tienda.</figcaption>
</figure>

En una estrategia que use ofertas de la tienda, abre el botón de ajustes **Configurar promociones de tienda** para revisar las promociones importadas. El panel muestra su estado y sus fechas; los horarios de la tienda siguen vigentes.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-store-promotions" aria-label="Panel de promociones de la tienda con estados y fechas">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 590px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/back-in-stock-pounce/bis-store-promotions-es-mobile.png 4x" width="1656" height="4108" />
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-store-promotions-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-store-promotions-es-desktop.png 4x" width="2288" height="3684" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Panel de promociones de la tienda con estados y fechas" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Revisa el estado, los días y las fechas de cada promoción. El interruptor de la misión y el estado de la promoción en la tienda son datos distintos.</figcaption>
</figure>

En **Tono**, puedes seleccionar hasta tres opciones para orientar la voz del mensaje.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-tone" aria-label="Opciones de tono del mensaje">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 754px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/back-in-stock-pounce/bis-tone-es-mobile.png 4x" width="1720" height="2880" />
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-tone-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-tone-es-desktop.png 4x" width="2944" height="2152" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Opciones de tono del mensaje" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Selecciona hasta tres tonos para orientar el mensaje. La vista móvil muestra el detalle de las seis opciones.</figcaption>
</figure>

Revisa el resultado en **Playground**: comprueba el nombre y la imagen del producto, el mensaje y su acción hacia la página del producto. Una vista previa ayuda a revisar el contenido; no confirma un envío ni reserva unidades.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-whatsapp-1" aria-label="Vista previa nativa de WhatsApp en Playground">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 406px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/back-in-stock-pounce/bis-whatsapp-1-es-mobile.png 4x" width="1552" height="3264" />
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-whatsapp-1-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-whatsapp-1-es-desktop.png 4x" width="1552" height="3264" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Vista previa nativa de WhatsApp en Playground" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. En Playground, revisa el producto, el texto y la acción Ver producto. Los puntos permiten recorrer las variantes; esta vista previa no confirma un envío.</figcaption>
</figure>

Hellotext maneja automáticamente la señal de vuelta a stock, la coincidencia con el interés del cliente, el momento del envío, la nueva revisión de disponibilidad y la comprobación de compra. Vuelta a Stock no requiere un prompt, intenciones, pasos de ruta, esperas ni condiciones de salida.

## Cómo funciona con misiones cercanas

Usa la señal del cliente para decidir quién debería ser dueño del momento.

| Momento del cliente | Mejor opción |
| --- | --- |
| El cliente pidió aviso por un producto no disponible | Vuelta a Stock |
| El cliente vio un producto disponible pero no agregó al carrito | [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) |
| El cliente agregó productos al carrito o checkout y se fue | [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) |
| El cliente necesita ayuda para elegir un producto o alternativa | [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) |
| El negocio quiere anunciar una reposición una vez a una audiencia seleccionada | Campaña |

Vuelta a Stock puede convivir con recuperación de navegación y recuperación de carrito cuando la propiedad está clara. Vuelta a Stock maneja el momento de producto no disponible; navegación y carrito manejan productos disponibles que el cliente no compró.

## Cómo probarla

Prueba con un caso pequeño y realista antes de habilitarla ampliamente.

Usa un perfil del cliente de prueba que tenga consentimiento de canal, luego:

- Crea o identifica un producto o variante que no esté disponible.
- Registra una señal de interés admitida para ese perfil y producto, como agregarlo a una lista de deseos. Si usas un formulario de aviso, confirma qué señal registra su integración.
- Cuando la señal sea un evento, revisa la actividad registrada para confirmar que corresponde al perfil del cliente y al producto correctos. El interés inferido no siempre tiene un evento visible en esa actividad.
- Envía o simula la actualización de stock o disponibilidad que vuelve vendible el producto.
- Confirma que la misión detecte esa actualización y cree una oportunidad elegible de vuelta a stock.
- Confirma que el mensaje use el producto, variante, imagen, precio y link correctos.
- Confirma que la misión no envíe si el producto vuelve a quedar sin stock.
- Confirma que la misión no envíe si el cliente de prueba ya compró el producto.
- Envía una respuesta y confirma que llegue al Inbox si tu equipo debería manejar respuestas.
- Revisa ejemplos enviados, omitidos, fallidos, clickeados y convertidos después del lanzamiento.

Para comprobar las señales registradas, revisa la actividad del perfil y confirma el producto y la fecha. Los eventos de interés y reposición por sí solos no acreditan que se haya enviado un mensaje.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" data-bis-figure="bis-contact-activity" aria-label="Actividad registrada del producto en el perfil">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: min(100%, 448px); width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/journeys/back-in-stock-pounce/bis-contact-activity-es-mobile.png 4x" width="1720" height="848" />
        <img class="ht-editorial-visual__image" src="/images/journeys/back-in-stock-pounce/bis-contact-activity-es-desktop.png" srcset="/images/journeys/back-in-stock-pounce/bis-contact-activity-es-desktop.png 4x" width="1488" height="800" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Actividad del perfil con interés y reposición del mismo producto" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. La actividad muestra el interés y la reposición del mismo producto, con sus fechas relativas. Estos eventos no prueban que se haya enviado un mensaje.</figcaption>
</figure>

Si el tracking es personalizado, confirma que identificadores de producto, identificadores de variante, estado de stock, timestamps e identificadores del cliente coincidan con lo que Hellotext espera.

## Por qué puede no enviar

Habilitar la misión no garantiza que cada reposición produzca un mensaje.

La misión puede no enviar cuando:

- La señal de stock o disponibilidad no llegó.
- Falta una señal de interés admitida para ese producto o quedó fuera de la ventana que evalúa la misión.
- Los identificadores de producto o variante no coinciden entre la actualización de stock y la señal del cliente.
- El producto sigue no disponible, está oculto, archivado, no tiene precio o no tiene un link usable.
- El cliente ya compró el producto.
- El perfil no puede ser alcanzado en el canal elegido.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- El canal, remitente, plantilla de WhatsApp o formato del mensaje no está listo.
- Horarios silenciosos, límites de frecuencia u otra regla de envío demoran o bloquean el mensaje.
- Otra misión o campaña ya está manejando el mismo momento del cliente.

Para un diagnóstico paso a paso, usa [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué productos o variantes crearon entradas de vuelta a stock.
- Cuántos perfiles del cliente entraron en la misión.
- Cuántos mensajes se enviaron, omitieron, fallaron, recibieron clicks o convirtieron.
- Si los productos seguían disponibles cuando los clientes hicieron click.
- Si links, imágenes, precios y variantes fueron correctos.
- Respuestas, bajas y preguntas de soporte.
- Compras, ingresos atribuidos y oportunidades omitidas.
- Si la misión se superpone con campañas, Recuperación de Navegación, recuperación de carrito o Recomendador Inteligente.

Ajusta una cosa por vez entre las tarjetas de la misión: canales de salida, audiencia, descuentos o tono. Revisa la vista previa después de los cambios.

## Guías relacionadas

- [Biblioteca de misiones por objetivo]({% link _journeys/playbook-library-by-mission.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Cómo habilitar una misión]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar una misión de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Cómo decide Hellotext si una misión puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona una misión que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Misión Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %})
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
