En ocasiones, es posible que desees comenzar a realizar un seguimiento de los eventos de los nuevos visitantes que llegan a tu sitio y que no han sido identificados y por lo tanto aún no pueden asociarse en Hellotext.

Para ayudarte a realizar seguimientos de eventos en estos casos, la librería [**Hellotext.js**](https://github.com/hellotext/hellotext.js) crea un nuevo identificador de sesión para cada nuevo visitante mientras que no haya una sesión existente.

Puedes guardar este identificador de sesión y luego adjuntarlo al perfil cuando lo sepas, por ejemplo, cuando el visitante se registra o inicia sesión en el sitio.

Suponiendo que tienes [**Hellotext.js**](https://github.com/hellotext/hellotext.js) ya instalada y configurada, para obtener la sesión actual, simplemente llama al método `Hellotext.session`:

```javascript
Hellotext.session
// Returns c7a42761-f34d-41a2-b078-6a8172690350
```

Guarda este valor en tu implementación, ya que deberás devolverlo mediante la API cuando se conozca el perfil.

## Adjuntar sesión a un perfil existente

Una vez que se conoce al visitante, por ejemplo, después de que inicia sesión en su sitio, debes realizar una petición a la API para asociar la sesión no identificada a su perfil de cliente.

Una vez que se asocia la sesión, todos los eventos rastreados asociados a la sesión pasarán a formar parte del perfil del cliente.

El siguiente ejemplo usa la librería [**HTTParty**](https://github.com/jnunemaker/httparty) de Ruby. Esto puede variar según el lenguaje de programación, pero la naturaleza de la petición sigue siendo la misma.

Al realizar una petición a la API, asegúrate de autenticarte configurando el encabezado "Authorization" con el token como el ejemplo a continuación. Puedes crear un token de autorización desde la sección de tokens en la configuración comercial.

```ruby
HTTParty.post "https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    profile_id: "PROFILE_ID"
  }.to_json
```

Reemplaza `HELLOTEXT_SESSION_ID` en la URL con el identificador de sesión y `PROFILE_ID` con el identificador de perfil existente.

Si la solicitud se realizó correctamente, la API debería responder con un código de estado HTTP de `201` y una respuesta JSON similar a esta:

```json
{
  "id": "WBAkaqNz",  
  "type": "session",
  "profile_id": "MzYwlE50",
  "created_at": 1665684173,
}
```

## Adjuntar sesión al nuevo perfil

Si el perfil aún no existe en Hellotext, primero debes crearlo.

Recomendamos leer la [**referencia de la API para crear un perfil**](https://www.hellotext.com/api#create_a_profile) para aprender a especificar los atributos del cliente. Siempre recomendamos crear el perfil con tantos atributos como tengas de tu cliente.

```ruby
HTTParty.post "https://api.hellotext.com/v1/profiles", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    first_name: "John",
    last_name: "Smith"
    phone: "+59899000001"
  }.to_json
```

La respuesta devolverá el identificador del perfil.

Utilice este identificador de perfil ahora para adjuntar la sesión siguiendo las instrucciones descritas en *Adjuntar sesión a un perfil existente*.