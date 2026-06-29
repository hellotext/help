El seguimiento de eventos convierte el comportamiento de tus clientes en señales que Hellotext puede usar en perfiles de cliente, segmentos, atribución, playbooks y el Inbox. Las señales pueden venir de tu eCommerce, tienda física, backend propio, formularios, conversaciones o cualquier otra fuente importante para tu negocio.

Esas señales ayudan a Hellotext a decidir cuándo activar un playbook, actualizar un segmento, enriquecer un perfil de cliente, asistir a un agente o atribuir ingresos a la acción correcta.

Para el concepto general del producto, empieza por [Qué son las señales]({% link _journeys/what-are-signals.md %}).

Si los eventos no aparecen donde esperas, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) para revisar identidad, nombres de acciones, integraciones, disparadores y reportes.

## Comprendiendo las acciones

Las acciones son las actividades genéricas que realizan tus clientes.

Están agrupadas por su tipo de acción y separadas por un punto.

Por ejemplo:

### Acciones del carrito

* `cart.abandoned` Un carro fue abandonado.
* `cart.added` Se agregó un artículo al carrito.
* `cart.removed` Se eliminó un artículo del carrito.

### Acciones de pedidos

* `order.placed` Se ha realizado el pedido.
* `order.confirmed` Confirmaste el pedido.
* `order.cancelled` El pedido ha sido cancelado por ti o tu cliente.
* `order.shipped` El pedido ha sido enviado a tu cliente.
* `order.delivered` El pedido ha sido entregado a tu cliente.

### Acciones del producto

* `product.purchased` Se ha comprado un producto.
* `product.viewed` Se ha visto una página de producto.

### Acciones de cupones

* `coupon.redeemed` Un cliente canjeó un cupón.

### Acciones de reembolso

* `refund.requested` Un cliente solicitó un reembolso.
* `refund.received` Realizaste un reembolso a su cliente.

### Acciones de vistas de página

* `page.viewed` Una página fue vista por un cliente.

### Acciones de la aplicación

* `app.install` Se instaló una aplicación.
* `app.remove` Se eliminó una aplicación.
* `app.spent` Un cliente gastó en una aplicación.

### Acciones de formulario

* `form.completed` El cliente completó un formulario.

### Acciones personalizadas

Es posible crear tus propias acciones definidas directamente usando la API. Por ejemplo:

* `formulario_de_registro.completado`
* `tienda_fisica.pago`
* `evento.asistio`

Obtén más información en **[Referencia de API para acciones](https://www.hellotext.com/api#actions)**.

## Comprendiendo los eventos

Un evento es el objeto que crea una relación entre una acción y un perfil de cliente en un momento determinado.

Se crea cuando rastreas una acción de un cliente y pasa a formar parte del historial de señales que Hellotext puede usar después.

## Maneras de rastrear eventos

* Usando una de las integraciones como Mercado Libre.
* Utilizando la librería de Javascript.
* Mediante la API.

## Seguimiento con integraciones

### Mercado Libre

Si vendes en Mercado Libre, puedes rastrear las compras de tus clientes automáticamente.

Simplemente conecta tu cuenta de Mercado Libre en pocos clics y comenzarás a rastrear los siguientes eventos de inmediato:

* `order.confirmed` Has confirmado el pedido.
* `order.shipped` El pedido ha sido enviado a tu cliente.
* `order.cancelled` El pedido ha sido cancelado por ti o tu cliente.
* `refund.requested` Un cliente solicitó un reembolso.
* `refund.received` Realizaste un reembolso a su cliente.

## Seguimiento de eventos programáticamente

### Seguimiento con Javascript

Para realizar un seguimiento de los eventos del lado del cliente, puedes usar la librería de Javascript **[Hellotext.js](https://github.com/hellotext/hellotext.js)**.

Consulta el repositorio de Github en **[hellotext/hellotext.js](https://github.com/hellotext/hellotext.js)** para ver las últimas instrucciones de instalación y configuración.

### Seguimiento mediante la API

Obtén más información en **[Referencia de API para seguimiento](https://www.hellotext.com/api#tracking)**.
