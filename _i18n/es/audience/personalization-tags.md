El editor de mensajes es el campo que usas al escribir un mensaje. Está presente en
varios lugares de la plataforma, como campañas, rutas, playbooks e inbox.

Proporciona funciones integradas que te permiten enriquecer mensajes con contenido dinámico, imágenes y links.

Las etiquetas son palabras reservadas que puedes usar para redactar un mensaje con contenido dinámico.
El contenido dinámico te permite escribir mensajes únicos para cada perfil de cliente. Puede usarse para insertar el nombre del perfil de cliente,
su edad, cumpleaños o cualquier otra propiedad que hayas definido para tu negocio.

### La anatomía de una etiqueta

Mencionamos que las etiquetas son palabras clave reservadas en el editor. Las etiquetas son palabras reservadas escritas entre
una llave de apertura y cierre. Por ejemplo, la etiqueta `{full_name}` se reemplazará con el
nombre completo del perfil de cliente. Las etiquetas comunes incluyen `{name}`, `{birthday}`, `{first_name}`, `{last_name}` y `{phone}`.
No estás limitado a este conjunto de etiquetas; también puedes apuntar a propiedades definidas por tu negocio.

De forma predeterminada, las propiedades se eliminan de la salida cuando el perfil de cliente no tiene el atributo.
Por ejemplo, si apuntas a una propiedad `{company}` en tu mensaje y el perfil de cliente no tiene esa propiedad,
la palabra `{company}` se eliminará del mensaje enviado a ese perfil de cliente. Si no quieres que la propiedad se elimine, usa un valor predeterminado.

Las etiquetas también pueden tener un valor predeterminado. Los valores predeterminados son útiles cuando quieres tener un fallback
en caso de que el perfil de cliente no tenga el atributo al que apuntas.
Puedes proporcionar un valor predeterminado para una etiqueta agregando una barra vertical `|` y el valor predeterminado antes de cerrar la etiqueta.
Por ejemplo, la etiqueta `{company|amigo}` se reemplazará con la propiedad de empresa asignada al perfil de cliente. Si el
perfil de cliente no tiene la propiedad, se utilizará el valor predeterminado de `amigo`.

Una etiqueta válida consta de lo siguiente

- Una llave de apertura `{`.
- Una palabra clave reservada ofrecida por Hellotext o un tipo de propiedad, es decir, "company".
- Una llave de cierre `}`
- Se pueden proporcionar valores opcionales mediante el uso de un operador de canalización `|` y el valor de reserva después de él.

### Las etiquetas y propiedades

También puedes apuntar a propiedades personalizadas de tu negocio en las etiquetas.
Puedes orientar las propiedades por su tipo, es decir, `text`, `url`, `date`, etc. O por su nombre, si el nombre está establecido.

Una lista completa de tipos de propiedades

- `age`
- `birthday`
- `company`
- `gender`
- `checkbox`
- `date`
- `text`
- `number`
- `url`

Para las propiedades `age`, `birthday`, `company` y `gender`, puedes segmentar por el tipo de propiedad, es decir, `company`, o por
el nombre de la propiedad cuando haya establecido un nombre personalizado para la propiedad.

Para las propiedades restantes, puedes segmentar por su tipo y su nombre personalizado cuando esté presente. La diferencia
para estas propiedades es que cuando tienes múltiples propiedades del mismo tipo,
apuntar con el tipo se vuelve ambiguo. Por ejemplo,
si tu empresa tiene dos propiedades de `checkbox` llamadas `has-logged-In` y `active-in-last-month`,
al orientar la propiedad por su tipo `{checkbox}`, usaremos automáticamente la primera propiedad de texto con respecto al orden definido en la página de audiencia.

**TL;DR** usa el tipo solo cuando hay una sola propiedad. Utiliza el nombre de la propiedad cuando haya varias propiedades del mismo tipo.

### Etiquetas de objeto

Hellotext incluye los tipos de objetos más comunes, adecuados para la mayoría de los sitios de comercio electrónico. Estos incluyen objetos como `app`, `product`, `cart`, `order`, `coupon`, `order` y `refund`. Además, también puedes crear tus propios objetos personalizados o modificar los existentes agregando propiedades adicionales específicas para las necesidades de tu negocio.

De manera similar a las etiquetas de perfil de cliente, también puedes apuntar a las propiedades de los objetos en tus etiquetas. El formato general de una etiqueta de objeto puede ser uno de los siguientes:

1. `{singular_name.property_name}`
2. `{singular_name.property_kind}`
3. `{singular_name.property_id}`

El Nombre Singular es el nombre del objeto autogenerado cuando creas un nuevo Objeto.

Por ejemplo, dado un objeto personalizado llamado Appointment (Cita), que consta de dos propiedades: `Booked At` (Reservado en) y `Room` (Sala), puedes apuntar a los valores mediante:

- `{appointment.Booked At}`
- `{appointment.Room}`

Cuando Hellotext detecta estas etiquetas, obtiene el valor asociado del objeto y reemplaza la etiqueta con el valor encontrado.


### Reglas de Nomenclatura {#rules}

Por defecto, Hellotext genera nombres de propiedades basados en el tipo de propiedad. Sin embargo, eres libre de modificar el nombre a algo que tenga sentido para tu negocio.
Al nombrar propiedades, debes seguir estas reglas:

- Las propiedades no pueden comenzar con un número. Por ejemplo, `1 Nombre` no es un nombre de propiedad válido.
- Las propiedades no pueden contener llaves. Por ejemplo, `{nombre}` no es un nombre de propiedad válido.
