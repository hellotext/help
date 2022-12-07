A veces, es posible que desees realizar un seguimiento de los eventos que ocurrieron fuera del navegador del visitante. Por ejemplo, realizar un seguimiento de los eventos en el lado del servidor de tu sistema o en algún momento en que el cliente no esté presente.

Puedes rastrear eventos enviando una solicitud 'POST' directamente a la API y pasando el identificador de perfil o el identificador de sesión.

Los siguientes ejemplos usan la librería [**HTTParty**](https://github.com/jnunemaker/httparty) de Ruby. Esto puede variar según el lenguaje de programación, pero la naturaleza de la solicitud sigue siendo la misma.

Al realizar una petición a la API, asegúrate de autenticarte configurando el encabezado "Authorization" con el token como el ejemplo a continuación. Puedes crear un token de autorización desde la sección de tokens en la configuración comercial.

### Seguimiento por perfil

Puedes realizar seguimientos de eventos directamente a los perfiles simplemente especificando el identificador del perfil al rastrear el evento. Si el perfil no existe en Hellotext, primero debes crearlo. Recomendamos leer la [**referencia de la API para crear un perfil**](https://www.hellotext.com/api#create_a_profile).

```ruby
HTTParty.post "https://api.hellotext.com/v1/attribution/events", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    action: "product.purchased",
    product_id: "vxqQJ3Yg",
    profile_id: "PROFILE_ID"
  }.to_json
```

Reemplaza `PROFILE_ID` con el identificador de perfil de tu cliente.

Si la solicitud se realizó correctamente, la API debería responder con un código de estado HTTP de `201` y una respuesta JSON similar a esta:

```json
{
  "state": "ok"
}
```

### Seguimiento por sesión

Esto es perfectamente posible capturando el identificador de sesión y guardándolo en tu sistema para usarlo más tarde al rastrear un evento.

Para obtener la sesión actual, simplemente llama a `Hellotext.session`:

```javascript
Hellotext.session
// Returns c7a42761-f34d-41a2-b078-6a8172690350
```

Realiza la siguiente solicitud a la API:

```ruby
HTTParty.post "https://api.hellotext.com/v1/attribution/events", 
  headers: { 
    "Authorization" => "Bearer ALK_eSMRuwJ2Al...",
    "Content-Type" => "application/json"
  },
  body: { 
    action: "product.purchased",
    product_id: "vxqQJ3Yg",
    session_id: "HELLOTEXT_SESSION_ID"
  }.to_json
```

Reemplaza `HELLOTEXT_SESSION_ID` con el identificador de sesión.

Si la solicitud se realizó correctamente, la API debería responder con un código de estado HTTP de `201` y una respuesta JSON similar a esta:


```json
{
  "state": "ok"
}
```