Conecta Fenicio para que Hellotext incorpore los perfiles de clientes, el catálogo de productos, la disponibilidad, las órdenes y la actividad de tu tienda.

La conexión tiene dos partes. Primero ingresas los datos de la tienda en Hellotext. Después, Fenicio debe autorizar el acceso de Hellotext e instalar el código de seguimiento en tu sitio. La integración no queda completamente activa hasta que Fenicio confirma ese segundo paso.

## Qué sincroniza la integración

Una vez activa, la integración permite que Hellotext:

- Cree y actualice perfiles de clientes con los datos disponibles en Fenicio, como nombre, email, teléfono, género y documento.
- Importe los clientes existentes si eliges hacerlo durante la configuración.
- Importe productos y variantes con precios, imágenes, categorías y estado de disponibilidad.
- Importe órdenes y actualice estados como confirmada, enviada, entregada o cancelada.
- Reciba actividad de la tienda mediante el código de seguimiento que instala Fenicio.
- Use esos datos como señales para segmentos, playbooks, rutas, reportes y atribución.

La importación histórica de clientes es opcional. Aunque no la selecciones, Hellotext puede crear o actualizar perfiles de clientes a partir de las nuevas órdenes y de la actividad que reciba después de activar la integración.

## Antes de conectar

Confirma que:

- Eres propietario o administrador del negocio en Hellotext.
- Tu suscripción de Hellotext está activa.
- Tienes el dominio de la tienda, por ejemplo `mitienda.com`.
- Tienes el **ID del negocio** que Fenicio asignó a tu tienda.
- Puedes abrir un ticket con el soporte de Fenicio para autorizar a Hellotext.
- Decidiste si quieres importar los clientes existentes durante la configuración.

Si no conoces el ID del negocio, solicítalo a Fenicio antes de comenzar.

## Conecta tu cuenta de Fenicio

1. En Hellotext, ve a **Configuración**.
2. Selecciona **Integraciones** y luego **Explorar integraciones**.
3. Busca **Fenicio** y abre la integración.
4. Ingresa el dominio de la tienda y el **ID del negocio**.
5. Selecciona **Continuar**.
6. Elige si quieres importar los clientes existentes de Fenicio. Puedes omitir esta importación y hacerla más adelante.
7. Finaliza la configuración inicial en Hellotext.

La integración queda pendiente mientras Fenicio autoriza el acceso.

## Solicita la autorización a Fenicio

Después de completar los pasos en Hellotext:

1. Abre un ticket con el soporte de Fenicio.
2. Solicita que autoricen el acceso de Hellotext a tu tienda.
3. Solicita que instalen el código de seguimiento de Hellotext en el sitio.
4. Espera la confirmación de Fenicio.
5. En Hellotext, vuelve a **Configuración > Integraciones**.
6. En la integración de Fenicio, selecciona **Verificar integración**.

Cuando Hellotext puede conectarse correctamente, el estado cambia a activo y comienza la importación configurada. Los productos y las órdenes se importan automáticamente; los clientes existentes se importan si aceptaste esa opción.

La importación inicial puede demorar según el tamaño del catálogo y el historial de la tienda. Las órdenes nuevas se consultan periódicamente, por lo que pueden tardar algunos minutos en aparecer.

## Verifica los datos sincronizados

Después de que la integración aparezca como activa:

1. Abre algunos perfiles de clientes y comprueba que incluyan la identidad de Fenicio y los datos esperados.
2. Revisa el catálogo y confirma que productos, variantes, precios e inventario correspondan con la tienda.
3. Busca algunas órdenes existentes y verifica sus productos, importes y estados.
4. Realiza una orden de prueba y confirma que aparezca en Hellotext después de unos minutos.
5. Navega la tienda y confirma que Hellotext reciba actividad después de que Fenicio instale el código de seguimiento.

Antes de habilitar playbooks o rutas basados en estos datos, sigue la guía para [verificar tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Soluciona problemas de conexión

Si Hellotext no puede verificar la integración:

1. Confirma que el dominio y el ID del negocio sean los de la misma tienda de Fenicio.
2. Verifica con Fenicio que el acceso de Hellotext haya sido autorizado.
3. Confirma que Fenicio haya instalado el código de seguimiento correcto.
4. Vuelve a **Configuración > Integraciones** y selecciona **Verificar integración**.

Si la integración está activa pero faltan datos:

- Espera a que termine la importación inicial.
- Da algunos minutos a las órdenes o cambios recientes para sincronizarse.
- Comprueba en Fenicio que la orden, el cliente o el producto pertenezcan a la tienda conectada.
- Para actividad de navegación faltante, confirma con Fenicio que el código de seguimiento esté instalado y activo.

Si el problema continúa, contacta al soporte de Hellotext con el dominio de la tienda, el ID del negocio y, si corresponde, el ID de una orden o producto que falte.

## Guías relacionadas

- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
