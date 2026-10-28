Conecta tu tienda Magento para incorporar a Hellotext su catálogo, sus clientes y sus órdenes, registrar lo que hacen los compradores en la tienda y mostrar tus popups, webchat y widget de WhatsApp.

La conexión tiene dos partes: instalar el módulo de Hellotext en el servidor de Magento y confirmar la tienda en Hellotext. Que la pantalla diga **Magento está conectado** confirma que Hellotext verificó la tienda y configuró el módulo; revisa después la importación de clientes y la actividad para confirmar que todo llega como esperas.

## Qué sincroniza la integración

- **Catálogo:** productos simples y configurables de la tienda, con sus variantes. Los productos de tipo bundle, agrupado, descargable o virtual no se importan.
- **Clientes, opcional:** los clientes del website conectado, con nombre, email y estado de newsletter. No se importan direcciones, teléfonos, contraseñas ni datos de pago.
- **Órdenes:** las órdenes anteriores se leen al terminar la conexión; luego llega cada orden nueva y cada cambio: confirmación al facturarla, envío cuando Magento la marca como completa, cancelación y reembolsos, también los parciales. Cada orden se asocia al cliente que la hizo.
- **Actividad en la tienda:** páginas vistas, productos vistos, cambios en el carrito, inicio del checkout y orden realizada. Un comprador que inició sesión se identifica con su ID de cliente de Magento, que Hellotext verifica con la tienda.
- **Widgets:** los popups, el webchat y el widget de WhatsApp que instales en Hellotext con la opción **Instalación automática en Magento** aparecen en la tienda sin agregar código.

Importar un cliente o recibir su email no acredita permiso para enviarle mensajes. Revisa el consentimiento de cada canal antes de incluirlo en campañas.

## Antes de conectar

Confirma que:

- Eres **Dueño** o **Administrador** del negocio de Hellotext que recibirá la actividad de la tienda. Un negocio se conecta con un solo website de Magento.
- La tienda usa **Magento Open Source 2.4** (probado en 2.4.7) con **PHP 8.2, 8.3 u 8.4**. Magento Inventory (MSI) es opcional.
- La tienda se publica en un dominio propio con **HTTPS** y certificado válido, y su API `/rest` responde desde internet. Hellotext no se conecta a direcciones IP, `localhost` ni dominios internos.
- Alguien puede ejecutar comandos en la raíz de Magento (`composer` y `bin/magento`) siguiendo el proceso habitual de cambios de la tienda: respaldo y ventana de mantenimiento en producción.
- El servidor puede hacer conexiones HTTPS salientes a Hellotext.

## Instala el módulo y vincula la tienda

1. En Hellotext, abre **Configuración > Integraciones** y elige **Explorar integraciones**.
2. Elige **Magento**. La pantalla **Conecta tu tienda Magento** muestra los comandos exactos para tu servidor.
3. Copia el bloque de comandos y ejecútalo desde la raíz de Magento:

   ```bash
   composer require hellotext/magento
   bin/magento module:enable Hellotext_Tracking
   bin/magento setup:upgrade
   bin/magento setup:di:compile
   bin/magento setup:static-content:deploy -f
   bin/magento cache:flush
   bin/magento hellotext:connect '<código de vinculación>'
   ```

   El último comando lleva el código de vinculación de tu negocio. Es de un solo uso y vence en una hora; si venció, recarga la página de Hellotext para obtener uno nuevo. No lo compartas.
4. Cuando termina, Magento responde `Store linked. Go back to Hellotext to confirm the connection.` La página de Hellotext detecta la tienda sola.

Si el módulo vino del Marketplace de Adobe Commerce, o el servidor no puede ejecutar el último comando, conecta desde Magento Admin: abre **System > Extensions > Integrations**, elige **Activate** en la integración **Hellotext**, luego **Allow**, y confirma en la ventana de Hellotext que abre Magento.

## Confirma la conexión

1. En **Confirma la conexión**, revisa que la dirección sea la de tu tienda y elige **Confirmar conexión**. Confirma solo si iniciaste la conexión tú mismo: la tienda enviará su actividad a este negocio.
2. Si el website tiene varias store views, elige la que Hellotext usará para nombres y enlaces de producto. La conexión cubre todo el website.
3. Hellotext muestra **Verificando Magento** mientras configura el módulo y verifica la tienda. La página se actualiza sola.
4. Al terminar verás **Magento está conectado**. En **Estado** aparecen la última verificación, la versión del módulo, la versión de Magento y PHP, y los productos importados.

## Importa tus clientes existentes

1. Elige **Siguiente**. En **¿Quieres importar tus clientes existentes?**, elige **Sí, importar mis clientes existentes a Hellotext** o **Ahora no. Lo haré más tarde.**
2. Si importas, en **Organiza a tus clientes** elige las listas para los clientes nuevos y si quieres actualizar sus propiedades existentes; luego inicia la importación.
3. La importación sigue aunque cierres la página. Puede tardar algunos minutos en empezar según la carga de Hellotext. Al terminar verás cuántos clientes se importaron.

Cada importación crea una lista **Magento import** con los clientes que trajo.

## Muestra tus widgets en la tienda

Con la tienda conectada, cada widget ofrece instalarse automáticamente en Magento:

- **Popup:** en el paso de instalación del popup, elige **Instalación automática en Magento** y publícalo.
- **Webchat o widget de WhatsApp:** en su configuración de instalación, elige **Instalación automática en Magento** e instálalo.

El módulo carga Hellotext.js en todas las páginas de la tienda, así que el widget aparece sin agregar código. Si instalas otro popup automáticamente, reemplaza al anterior.

## Verifica que todo funcione

- **En la tienda:** abre un producto y agrégalo al carrito. Si un comprador inicia sesión, se identifica con su cuenta de Magento.
- **En Hellotext:** abre **Audiencia**, busca al cliente y revisa su **Actividad**: allí aparecen sus órdenes con su referencia de Magento y su total, y luego su confirmación, envío, cancelación o reembolso.
- **En el servidor:** ejecuta `bin/magento hellotext:diagnose --store=<código de store view>`. Muestra la versión del módulo, la integración activa, si hay clave de instalación y Business ID configurados, el API de Hellotext y si la identificación está activa. Agrega `--ping` para comprobar que el servidor llega al API de Hellotext.

Una orden de la tienda se registra cuando el comprador llega a la página de confirmación. Si cierra el navegador antes, se registra con su siguiente cambio de estado; una orden con pago pendiente puede no aparecer hasta que cambie.

## Desconecta o desinstala

Para desconectar, abre **Configuración > Integraciones**, abre el menú de la tienda Magento, elige **Eliminar** y confírmalo con **Eliminar**. Hellotext apaga el módulo en la tienda y borra sus credenciales: la tienda deja de enviar actividad y los widgets dejan de mostrarse. Para volver a conectarla, repite la instalación con un código nuevo.

Para quitar el módulo de la tienda, ejecuta en la raíz de Magento:

```bash
bin/magento module:uninstall Hellotext_Tracking --remove-data
```

Desde la versión 1.0.2 del módulo, este comando también elimina la integración Hellotext de Magento, su token de acceso y la configuración del módulo. Con la versión 1.0.1 o anterior, elimina además la integración **Hellotext** en **System > Extensions > Integrations**.

## Soluciona problemas

- **"La URL configurada de Magento no está permitida."** La tienda debe usar un dominio público con HTTPS en el puerto 443. Corrige la URL base de Magento y conecta de nuevo.
- **"Magento no pudo ser contactado en este momento."** Revisa que la tienda responda por HTTPS y que un firewall, WAF o CDN no bloquee las solicitudes a `/rest`. Luego elige **Aplicar la configuración de nuevo** o **Verificar conexión**.
- **"Magento rechazó las credenciales de autorización."** El acceso de Hellotext se revocó en Magento. Vuelve a vincular la tienda: ejecuta el último comando de la pantalla de Magento con un código nuevo, o elige **Reauthorize** en la integración Hellotext de Magento Admin. La conexión conserva su clave de instalación.
- **El código de vinculación venció o fue rechazado.** Recarga la página de Hellotext y ejecuta el último comando nuevo.
- **La tienda no registra actividad.** Ejecuta `bin/magento hellotext:diagnose` y revisa que el Business ID esté configurado. Despliega el contenido estático y limpia la caché después de instalar o actualizar el módulo. Si usas Cookie Restriction Mode, la actividad empieza cuando el visitante acepta las cookies.
- **La importación de clientes no avanza.** Corre en segundo plano y puede esperar unos minutos en la cola. Si no termina, comparte con soporte la hora y el negocio.

Al pedir ayuda a soporte de Hellotext, comparte la salida de `bin/magento hellotext:diagnose --store=<código de store view>`, la versión de Magento y del módulo, la hora del problema y el mensaje exacto. No compartas tokens, contraseñas ni el código de vinculación.

## Guías relacionadas

- [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %})
- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Verifica tus datos y señales después de la configuración]({% link _integrations/verify-data-and-signals.md %})
- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
