Después de enviar una campaña o activar una ruta, querrás conocer sus resultados: cómo se comprometieron y comportaron los clientes. E idealmente, también desearás mantener esta información de tal manera que pueda reutilizarse en futuras campañas de marketing.

Afortunadamente, este es exactamente el propósito detrás del uso de Campañas y la buena noticia es que es fácil de implementar.

## Enlaces cortos y Sesiones

Un enlace corto es simplemente una forma de reducir la longitud de una URL a algo parecido a `hello.link/3lsnvh`.

Esto te ayuda a superar el límite de 160 caracteres de los mensajes de texto, dejando más espacio para el mensaje. Los cortos también se sienten más atractivos.

Puedes compartir enlaces cortos en tus mensajes en Campañas y Rutas.

Cuando los clientes hacen clic en un enlace corto, son redirigidos a la URL original. Hellotext adjunta un parámetro GET a la URL original llamado `hellotext_session` que contiene un identificador de sesión generado de forma única con cada clic.

Cada vez que un cliente haga clic en un enlace corto, se creará un evento y aparecerá en las actividades de su perfil. Los clics también se agregan a los informes de la campaña o viaje.

## Primeros pasos de seguimiento

Si tu sitio funciona con alguna de las plataformas que ya ofrecemos soporte de integración, puedes conectarlo para comenzar a rastrear eventos automáticamente.

Si tu integración aún no es compatible o si tienes tu propia implementación personalizada, puedes comenzar a rastrear eventos instalando la librería [**Hellotext.js**](https://github.com/hellotext/hellotext.js).

### Configura la librería en tu sitio

Comienza instalando la librería.

```bash
npm install @hellotext/hellotext
```

Importa la librería en tu aplicación.

```javascript
import Hellotext from "@hellotext/hellotext";
```

Inicializa la librería pasando el identificador público `HELLOTEXT_BUSINESS_ID` que representa la empresa.

Puedes encontrarlo en la página de configuración de la empresa.

```javascript
Hellotext.initialize("HELLOTEXT_BUSINESS_ID");
```

## Seguimiento de eventos del lado del cliente

El seguimiento de eventos es sencillo y quizás el ejemplo más simple es el seguimiento de una vista de página:

```javascript
Hellotext.track("page.visited");
```

Consulta la [**documentación de uso de la biblioteca**](https://github.com/hellotext/hellotext.js#usage) para obtener una referencia completa sobre todas las acciones y atributos disponibles.

## Seguimiento de eventos del lado del servidor

A veces, es posible que desees realizar un seguimiento de los eventos que ocurrieron fuera del navegador, por ejemplo, es posible que desees realizar un seguimiento de los eventos directamente en el lado del servidor de tu sistema, o en un momento en el que el cliente no esté presente.

Esto es posible capturando el identificador de sesión y almacenándolo en tu sistema para usarlo más tarde cuando quieras rastrear un evento asociado a esta sesión.

Para obtener la sesión actual, simplemente llama a `Hellotext.session`:

```javascript
Hellotext.session
// Returns bBJn9vR15yPaYkWmR2QK0jopMeNxrA6l
```

Luego puedes rastrear eventos enviando una solicitud `POST` directamente a la API.

Más información sobre [**Seguimiento externo**](/seguimiento-externo)