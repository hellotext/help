El Editor es la entrada que utiliza al escribir un mensaje. Esta presente en
varios lugares ocupan la plataforma, como las campañas, los rutas y la bandeja.

Proporciona un conjunto de potentes funciones integradas que le permiten enriquecer sus mensajes con contenido dinámico, imágenes y enlaces.

Las etiquetas líquidas son un conjunto de palabras reservadas que puede usar para redactar un mensaje con contenido dinámico.
El contenido dinámico le permite escribir mensajes únicos para cada perfil. Se puede usar para inyectar el nombre del perfil,
su edad, cumpleaños o cualquier otra propiedad que haya definido para su negocio.

### La anatomía de una etiqueta

Mencionamos que las etiquetas son palabras clave reservadas en el editor. Las etiquetas son palabras reservadas escritas entre
una llave de apertura y cierre. Por ejemplo, la etiqueta `{full_name}` es una etiqueta líquida que se reemplazará con la
nombre completo del perfil. Las etiquetas comunes incluyen `{name}`, `{birthday}`, `{first_name}`, `{last_name}`, `{phone`} que es
proporcionado por defecto. Pero, no está limitado a este conjunto de etiquetas, también puede apuntar a propiedades definidas por su negocio.

De forma predeterminada, las propiedades se eliminan de la salida cuando el perfil no tiene el atributo.
Por ejemplo, si está apuntando a una propiedad `{company}` en su mensaje y el perfil no tiene esa propiedad
la palabra `{company}` se eliminará del mensaje que se envía al perfil. Si no desea que se elimine la propiedad. Puede
use valores predeterminados para una etiqueta, lea a continuación para obtener más información

Las etiquetas también pueden tener un valor predeterminado, los valores predeterminados son útiles cuando desea tener un respaldo
valor en caso de que el perfil no tenga el atributo al que se dirige.
Puede proporcionar un valor predeterminado para una etiqueta agregando un carácter de barra vertical `|` y el valor predeterminado antes de cerrar la etiqueta.
Por ejemplo, la etiqueta `{company|amigo}` se reemplazará con la propiedad de la empresa asignada al perfil, y si el
perfil no tiene la propiedad, se utilizará el valor predeterminado de `amigo`.

Una etiqueta válida consta de lo siguiente

- Una llave de apertura `{`.
- Una palabra clave reservada ofrecida por Hellotext o un tipo de propiedad, es decir, "company".
- na llave de cierre `}`
- Se pueden proporcionar valores opcionales mediante el uso de un operador de canalización `|` y el valor de reserva después de él.

### Las etiquetas y properidades

Mencionamos que también puede apuntar a propiedades personalizadas en su negocio en las etiquetas.
Puede orientar las propiedades por su tipo, es decir, `text`, `url`, `date`, etc. O por su nombre, si el nombre está establecido.

A complete list of property kinds

Una lista completa de tipos de propertidades

- `age`
- `birthday`
- `company`
- `gender`
- `checkbox`
- `date`
- `text`
- `number`
- `url`

Para las propiedades `age`, `birthday`, `company` y `gender`, puede segmentar por el tipo de propiedad, es decir, `company`, o por
el nombre de la propiedad cuando haya establecido un nombre personalizado para la propiedad.

Para las propiedades restantes, puede segmentar por su tipo y su nombre personalizado cuando esté presente. La diferencia
para estas propiedades es que cuando tienes múltiples propiedades del mismo tipo,
apuntar con el tipo se vuelve ambiguo. Por ejemplo,
si su empresa tiene dos propiedades de `checkbox` llamadas `has-logged-In` y `active-in-last-month`,
al orientar la propiedad por su tipo `{checkbox}`, usaremos automáticamente la primera propiedad de texto con respecto al orden definido en la página de audiencia.

**TL;DR** use el tipo solo cuando hay una sola propiedad. Utilice el nombre de la propiedad cuando haya varias propiedades del mismo tipo.

### Etiquetas de objeto

Hellotext incluye los tipos de objetos más comunes, adecuados para la mayoría de los sitios de comercio electrónico. Estos incluyen objetos como `app`, `product`, `cart`, `order`, `coupon`, `order` y `refund`. Además, también puedes crear tus propios objetos personalizados o modificar los existentes agregando propiedades adicionales específicas para las necesidades de tu negocio.

De manera similar a las etiquetas de perfil, también puedes apuntar a las propiedades de los objetos en tus etiquetas. El formato general de una etiqueta de objeto puede ser uno de los siguientes:

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
