Cuando conectas tu tienda VTEX a Infobip con nuestra aplicación Exchange, puedes:

- Sincronizar los datos de tus clientes en Perfiles para que puedas contactarlos fácilmente por WhatsApp o SMS.
- Instalar el píxel de Hellotext que rastrea la actividad de los clientes en tu sitio web y envía los datos a Hellotext para una mejor medición de ROI y KPI, ayudándote a entender el rendimiento de tus campañas.

### Lo que necesitarás

- Una cuenta de Hellotext.
- URI base de la API (por ejemplo: `https://hellotext.myvtex.com/` o `hellotext`)
- Una cuenta de VTEX
- Una clave de aplicación y un token de aplicación de VTEX

### Configurar la autenticación

#### Claves de aplicación de VTEX

La página Mis Claves en VTEX muestra todas las claves de aplicaciones internas. Para acceder a esta página, ve a **Configuración de la cuenta** > haz clic en **Claves de API**, y luego en **Generar clave**.

<img src="images/integrations/vtex/en/installation.png" alt="" width="768" />

#### Generar una nueva clave de aplicación

Las claves de aplicación permiten que el sistema externo acceda a tu cuenta, por lo que tu cuenta de VTEX debe tener este rol: License Manager / Control de acceso a Servicios / Guardar usuario.

1. Haz clic en el botón Generar nueva.
2. En el campo Etiqueta, ingresa el propósito de la clave de aplicación. Esto te ayudará a identificar fácilmente la clave de Hellotext si tienes otras claves de API internas.
3. Agrega **Roles** haciendo clic en ellos para otorgar privilegios de administrador a la clave de API.
4. Haz clic en Generar.
5. Verás un enlace generado al token. Copia la URL y pégala en el navegador para obtener la clave y el token de aplicación.
6. Copia la Clave y el Token de Aplicación y guárdalos en un lugar seguro. Solo se muestran una vez.

#### Agregar las credenciales en Hellotext

1. Inicia sesión en Hellotext y ve a la cuenta de negocio en la que deseas integrar la tienda VTEX.
2. Ve a Configuración > Integraciones y haz clic en Nueva integración.
3. Elige VTEX en la lista de integraciones disponibles.

Sigue el asistente para configurar tu cuenta. Asegúrate de copiar y pegar la App Key y el App Token.

#### Configuración de Dominio

En este paso, se te pedirá elegir el dominio principal de la tienda para tu aplicación cuando tengas múltiples dominios conectados a tu cuenta de VTEX. Asegúrate de seleccionar exactamente el dominio donde está alojado tu catálogo.

Basado en el dominio que elijas, Hellotext construirá las URLs de Productos y SKUs para los Agentes de IA.

#### Instalación del Pixel

En este paso, se te pedirá instalar el pixel de Hellotext en tu cuenta de VTEX. Instalar el pixel desbloqueará verdaderos insights de comportamiento sobre lo que hacen tus clientes en el sitio web, incluyendo:

- Vistas de página
- Vistas de productos
- Modificaciones del carrito (agregados o eliminaciones)
- Realización de pedidos

<a name="affiliate"></a>

#### Configuración de Afiliado

En este paso, se te pedirá configurar Hellotext como un afiliado en tu cuenta de VTEX.
Esto permite a Hellotext recibir notificaciones en tiempo real sobre cambios en tu catálogo, incluyendo cambios de precio, inventario o productos añadidos o eliminados de la tienda, ayudando a mantener las recomendaciones precisas y actualizadas.

1. Ve a tu panel de administración en VTEX, por ejemplo: `shop.myvtex.com/admin`. Reemplaza `shop` con el nombre de tu cuenta VTEX.
2. En el menú lateral izquierdo, desplázate hacia abajo hasta **Store Settings** > **Orders** y haz clic en **Settings**.
3. En la página de configuración de Orders, junto a la pestaña **General**, haz clic en **Affiliates**.
4. Haz clic en el botón **New Affiliate** en la parte superior derecha de la página.

Completa el formulario de Afiliado con la siguiente información:

- Nombre: **Hellotext**
- ID: Cualquier identificador de tu elección. VTEX limita los identificadores a 3 caracteres. Esto te ayudará a identificar rápidamente Hellotext si tienes varios afiliados.
- Canal de venta: Selecciona el canal de ventas del cual quieres que Hellotext reciba notificaciones. Escribe `1`, que es tu canal principal.
- Nota: Si tienes catálogos en múltiples canales de venta, debes repetir este proceso para todos los canales activos donde esté tu catálogo.
- Email: Escribe **[support@hellotext.com](mailto:support@hellotext.com)**
- Search Endpoint: Este se te mostrará en el Setup Wizard.

Una vez completado, haz clic en Guardar.

Para más información, consulta la configuración de afiliados en VTEX:
[https://help.vtex.com/docs/tutorials/configuring-affiliates](https://help.vtex.com/docs/tutorials/configuring-affiliates)
