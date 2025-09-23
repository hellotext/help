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
5. Copia el Token de Aplicación y guárdalo en un lugar seguro. Solo se muestra una vez.

#### Agregar las credenciales en Hellotext

1. Inicia sesión en Hellotext y ve a la cuenta de negocio en la que deseas integrar la tienda VTEX.
2. Ve a Configuración > Integraciones y haz clic en Nueva integración.
3. Elige VTEX en la lista de integraciones disponibles.

Sigue el asistente para configurar tu cuenta. Asegúrate de copiar y pegar la App Key y el App Token.
