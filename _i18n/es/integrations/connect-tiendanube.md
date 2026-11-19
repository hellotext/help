Conecta tu tienda Tiendanube para incorporar a Hellotext su catálogo, sus clientes y sus órdenes, registrar lo que hacen los compradores en la tienda y en el checkout, y saber qué carritos quedaron abandonados.

La conexión se hace instalando la app de Hellotext en Tiendanube, desde Hellotext o desde la Tienda de Aplicaciones de Tiendanube. No hace falta editar el tema ni pegar código: la app instala sola sus scripts en la tienda y en el checkout.

## Qué sincroniza la integración

- **Catálogo:** todos los productos de la tienda se importan al conectar, cada variante como un producto propio dentro de su producto. Luego se actualizan solos cuando creas, editas o eliminas un producto. Un producto sin publicar o eliminado queda archivado, y una variante sin stock, si administras el stock, queda como agotada.
- **Clientes, opcional:** puedes importar los clientes que ya tienes en Tiendanube al terminar la conexión.
- **Órdenes:** cada orden nueva llega con sus productos, su total y la dirección de envío, y se asocia al cliente que la hizo por su email o teléfono. Hellotext registra también cuando la orden se paga, se envía, se entrega o se cancela, y los reembolsos totales. Las órdenes anteriores a la conexión no se importan.
- **Actividad en la tienda:** páginas vistas, productos vistos con su variante, cambios en el carrito y carrito visto.
- **Actividad en el checkout:** el inicio del checkout y la identificación del comprador cuando escribe su email. Desde ese momento, lo que navegó antes queda en su perfil.
- **Carritos abandonados:** si un comprador inicia el checkout y no compra, Hellotext registra el carrito abandonado con sus productos y el enlace para retomar la compra.

Importar un cliente o recibir su email no acredita permiso para enviarle mensajes. Revisa el consentimiento de cada canal antes de incluirlo en campañas.

## Antes de conectar

Confirma que:

- Tienes acceso a **Configuración > Integraciones** en el negocio de Hellotext que recibirá la actividad de la tienda. Un negocio se conecta con una sola tienda Tiendanube, y una tienda con un solo negocio.
- Puedes iniciar sesión en el administrador de Tiendanube de la tienda con permiso para instalar aplicaciones.
- El negocio de Hellotext tiene una suscripción activa.

## Conecta desde Hellotext

1. En Hellotext, abre **Configuración > Integraciones** y elige **Explorar integraciones**.
2. Elige **Tiendanube**. Se abre Tiendanube.
3. Si te lo pide, inicia sesión en el administrador de tu tienda. Tiendanube muestra los permisos que pide Hellotext: acepta para instalar la app.
4. Tiendanube te devuelve a Hellotext con la tienda conectada y la pregunta para importar tus clientes.

## Conecta desde la Tienda de Aplicaciones de Tiendanube

1. En la Tienda de Aplicaciones de Tiendanube, busca **Hellotext** e instálala. Acepta los permisos que pide.
2. Tiendanube te lleva a Hellotext:
   - Si ya tienes sesión iniciada en Hellotext, en **¿Dónde instalar tu tienda?** elige el negocio y luego **Instalar**, o elige **Instalar en un nuevo negocio**.
   - Si no tienes cuenta, crea tu cuenta y tu negocio. La tienda queda conectada a ese negocio.

## Importa tus clientes existentes

1. En **¿Quieres importar los clientes existentes?**, elige **Sí, importar mis clientes existentes a Hellotext** o **Ahora no. Lo haré más tarde.** y luego **Continuar**.
2. Si importas, elige las listas para los clientes nuevos y si quieres actualizar sus propiedades existentes; luego elige **Guardar e importar**.
3. La importación sigue aunque cierres la página. Al terminar verás cuántos clientes se importaron.

Cada importación crea una lista **Importación de Tienda Nube #1** (el número aumenta con cada importación) con los clientes que trajo. Si eliges **Ahora no**, puedes importarlos después desde **Configuración > Integraciones**: abre el menú de la tienda y elige **Importar Clientes**.

## Verifica que todo funcione

- **En Configuración:** la tienda aparece en **Configuración > Integraciones** con su nombre.
- **En la tienda:** abre un producto, agrégalo al carrito, inicia el checkout y escribe un email de prueba.
- **En Hellotext:** abre **Audiencia**, busca ese email y revisa su **Actividad**: allí aparecen el producto agregado, el carrito visto y el checkout iniciado. Si completas la compra, la orden aparece como **Placed order** con su número de Tiendanube unos minutos después.

Los carritos abandonados no aparecen al momento: Hellotext espera a que el comprador deje de usar el carrito o el checkout antes de registrarlo.

## Desconecta o desinstala

Para desconectar desde Hellotext, abre **Configuración > Integraciones**, abre el menú de la tienda, elige **Eliminar** y confírmalo con **Eliminar**. Hellotext deja de recibir órdenes, productos y actividad de la tienda. Los datos ya importados se conservan.

Para quitar la app de la tienda, desinstálala desde el administrador de Tiendanube, en **Mis aplicaciones**. Hellotext desconecta la tienda sola unos minutos después. Para volver a conectarla, instala la app de nuevo con cualquiera de los dos caminos de esta guía.

## Soluciona problemas

- **La tienda aparece como Suspendida.** Tiendanube suspendió la app para esa tienda, por ejemplo por falta de pago. Mientras dure, Hellotext no recibe órdenes, productos ni checkouts abandonados. Cuando Tiendanube la reactiva, Hellotext vuelve a leer el catálogo; las órdenes que cambiaron durante la suspensión no se actualizan.
- **"This business already has a Tienda Nube store connected".** El negocio ya tiene otra tienda conectada. Elimina esa conexión o conecta la nueva tienda en otro negocio.
- **"This Tienda Nube store is already connected to another Hellotext account".** La tienda está conectada a otro negocio de Hellotext. Elimina la conexión desde ese negocio antes de conectarla aquí.
- **"Could not authorize the Tienda Nube store".** Tiendanube no completó la autorización. Vuelve a elegir **Tiendanube** en **Explorar integraciones** y acepta los permisos.
- **La actividad de la tienda no aparece.** Revisa que la app siga instalada en **Mis aplicaciones** de Tiendanube y prueba en una ventana privada sin bloqueadores de anuncios. Las vistas y el carrito quedan en el perfil del comprador cuando escribe su email en el checkout.
- **Una orden tarda en aparecer.** Una orden nueva puede tardar algunos minutos en llegar. Si no aparece después de 30 minutos, comparte con soporte el número de orden y la hora.

Al pedir ayuda a soporte de Hellotext, comparte el nombre de la tienda, el número de orden o el email del comprador, la hora del problema y el mensaje exacto. No compartas contraseñas ni tokens.

## Guías relacionadas

- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Verifica tus datos y señales después de la configuración]({% link _integrations/verify-data-and-signals.md %})
- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
