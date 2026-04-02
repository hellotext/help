Enviar mensajes por SMS usando la API de Hellotext es una forma simple de integrar recordatorios, confirmaciones o notificaciones desde tu propio sistema.

## Antes de empezar

Para enviar SMS por la API necesitas:

* Tener una cuenta y un negocio creados en Hellotext.
* Crear un token de autorización desde *Settings* -> *Autorizaciones*.
* Tener saldo disponible para SMS en tu negocio.

Si todavía no tienes saldo habilitado para SMS, ponte en contacto con nuestro equipo para activarlo.

## Crear el token de autorización

Una vez dentro de tu negocio, ve a *Settings* -> *Autorizaciones*.

Haz clic en *Crear nuevo token*, asígnale un nombre que te permita identificar la integración y copia el valor generado. Lo usarás en el header `Authorization` de cada request:

```text
Authorization: Bearer TU_TOKEN
```

## Enviar un SMS

Para enviar un mensaje, realiza un `POST` a `https://api.hellotext.com/v1/messages`.

Envía estos campos en el cuerpo del request:

* `body`: contenido del mensaje.
* `destination`: número de destino en formato internacional, por ejemplo `+573176655211`.
* `technology`: tecnología del envío. Para SMS usa `sms`.

### Ejemplo con cURL

```bash
curl -X POST "https://api.hellotext.com/v1/messages" \
  -H "Authorization: Bearer TU_TOKEN" \
  -F "body=Hola, este es un SMS enviado desde la API de Hellotext." \
  -F "destination=+573176655211" \
  -F "technology=sms"
```

Si la solicitud fue aceptada, la API responderá con un JSON similar a este:

```json
{
  "status": "received"
}
```

### Ejemplo en Postman

Si prefieres probarlo en Postman, configura:

* Método: `POST`
* URL: `https://api.hellotext.com/v1/messages`
* Header: `Authorization: Bearer TU_TOKEN`
* Body: `form-data`

Luego agrega estos campos al body. Por ejemplo:

* `body`: `Hola, este es un SMS enviado desde Postman.`
* `destination`: `+573176655211`
* `technology`: `sms`

También puedes usar este header como ejemplo:

* Header `Authorization`: `Bearer TU_TOKEN`

## Tarifas, longitud y encoding

Las tarifas de envío dependen de tu configuración y del destino. Puedes consultar más información en la sección de [precios](https://www.hellotext.com/precios).

Por defecto, los SMS usan encoding `GSM-7 Latin` y cada mensaje tiene un límite de `160` caracteres.

Si excedes ese límite, Hellotext concatena automáticamente el contenido en un mensaje adicional y el costo se cobra como dos SMS.

Si el texto incluye caracteres no compatibles con `GSM-7`, por ejemplo emojis, Hellotext intentará utilizar encoding `UCS-2` automáticamente. Esta modalidad está disponible en Colombia.

Cuando el mensaje usa `UCS-2`, el largo máximo se reduce a `80` caracteres por mensaje.

## Agregar shortlinks dentro del mensaje

Puedes generar un enlace corto directamente dentro del texto del mensaje usando la sintaxis `{shortlink:URL}`.

Por ejemplo:

```text
Conoce más acá {shortlink:https://www.tunegocio.com}
```

Hellotext reemplazará esa instrucción por un enlace corto al momento de enviar el mensaje.

Si quieres usar tu propio dominio para enlaces cortos, consulta la guía de [dominio personalizado para enlaces cortos](/es/configurando-dominio-para-enlaces-cortos).

## Perfiles y contactos

No necesitas crear un perfil previamente para hacer un envío puntual a un número usando `destination`.

Sin embargo, si además quieres mantener el historial del contacto, segmentar audiencias o reutilizar esos datos en campañas y automatizaciones, puedes:

* Importar tu base de contactos desde la interfaz de Hellotext.
* Crear perfiles programáticamente con la [referencia de la API para crear perfiles](https://www.hellotext.com/api#create_a_profile).
