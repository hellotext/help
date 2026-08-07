Hellotext puede registrar la actividad de un visitante antes de saber quién es. Hellotext.js crea o reutiliza una sesión anónima y la incluye en la actividad del navegador. Cuando el visitante se convierte en un cliente conocido, puedes asociar esa sesión con el perfil del cliente para conservar el historial completo.

La sesión, el perfil del cliente y el consentimiento son conceptos diferentes:

- La **sesión** conecta la actividad de un navegador.
- El **perfil del cliente** reúne identidad, propiedades, conversaciones y señales conocidas.
- El **consentimiento** determina si puedes enviar mensajes por un canal. Identificar al cliente no lo convierte automáticamente en suscriptor.

Si estás conectando una tienda propia desde cero, comienza con [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}).

## 1. Obtén la sesión anónima

Hellotext.js busca una sesión existente en la URL o en el navegador. Si no encuentra una y la generación automática está habilitada, crea una nueva.

Después de inicializar Hellotext.js, lee la sesión actual:

```javascript
if (Hellotext.isInitialized) {
  const sessionId = Hellotext.session
}
```

Si la librería todavía no terminó de inicializarse, `Hellotext.session` puede ser `undefined`. Puedes escuchar el momento en que la sesión queda disponible:

```javascript
Hellotext.on('session-set', sessionId => {
  console.log('Hellotext session:', sessionId)
})
```

Hellotext.js incluye la sesión automáticamente cuando registra actividad. Guarda el ID en tu backend únicamente cuando necesites asociarlo más adelante con un cliente conocido. Nunca envíes el token privado de la API al navegador.

Consulta [Sesiones en Hellotext.js](https://github.com/hellotext/hellotext.js/blob/main/docs/sessions.md) para ver las opciones vigentes de inicialización y eventos de la librería.

## 2. Identifica al cliente en el momento correcto

Asocia la sesión cuando tu aplicación ya pueda reconocer de forma confiable al cliente, por ejemplo:

- Después de que inicia sesión correctamente.
- Después de completar el registro y crear su cuenta.
- Durante el checkout, cuando el backend crea o encuentra un perfil del cliente confiable.

No identifiques a una persona solamente porque escribió un email o teléfono en un campo que todavía no fue confirmado. Tampoco marques el perfil del cliente como suscrito salvo que tengas consentimiento válido para el canal correspondiente.

En una aplicación de una sola página, espera a conocer el estado de autenticación antes de asociar la sesión. Esto evita atribuir la primera actividad del navegador al cliente equivocado.

## 3. Adjunta la sesión desde el backend

Este es el método recomendado para una tienda propia porque el backend controla la identidad y mantiene privado el token de la API.

1. Lee `Hellotext.session` en el navegador.
2. Envía el ID de la sesión a tu backend junto con la request autenticada del cliente.
3. Resuelve el cliente usando la sesión de autenticación de tu aplicación. No confíes en un ID de perfil del cliente enviado directamente por el navegador.
4. Crea o encuentra el perfil del cliente en Hellotext y conserva su ID.
5. Adjunta la sesión con el token privado de la API.

Si el perfil del cliente todavía no existe, créalo primero mediante [Crear un perfil del cliente](https://www.hellotext.com/api#create_a_profile). Crear el perfil no establece consentimiento.

Adjunta la sesión existente:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID"
  }'
```

Una request válida responde con HTTP `200` y el objeto de la sesión actualizado, incluyendo el perfil del cliente asociado. La actividad anónima anterior pasa a formar parte del historial del cliente; algunos datos pueden terminar de asociarse en segundo plano.

Consulta [Adjuntar una sesión](https://www.hellotext.com/api#attach_session) para ver el contrato completo del endpoint.

## 4. Usa la identificación en el navegador solo cuando sea necesario

Hellotext.js ofrece `identify()` para integraciones compatibles que solo pueden obtener la identidad en el navegador:

```javascript
const response = await Hellotext.identify('user_123', {
  source: 'shopify',
  email: 'ana@example.com',
  name: 'Ana Silva',
})

if (response.failed) {
  console.error(response.data)
}
```

Usa como primer argumento el identificador estable del cliente en la plataforma de origen. El valor de `source` debe corresponder a una fuente compatible con Hellotext.js. Para una tienda propia, prefiere adjuntar la sesión desde el backend; no inventes un valor de `source`.

Cuando la identificación tiene éxito, Hellotext.js conserva la identidad en el navegador y la incluye en la actividad posterior. No necesitas llamar a `identify()` en cada página si el cliente y los datos enviados no cambiaron.

No incluyas un estado de suscripción salvo que tu aplicación tenga evidencia válida del consentimiento.

## 5. Olvida la identidad al cerrar sesión

Cuando el cliente cierre sesión en tu aplicación, llama a:

```javascript
Hellotext.forget()
```

Esto elimina del navegador la identidad persistida por `identify()`, pero mantiene activa la sesión de Hellotext. No elimina el perfil del cliente, su historial ni su consentimiento, y tampoco deshace una asociación realizada previamente desde el backend.

Si varias cuentas pueden usar el mismo navegador, tu backend debe comprobar cada transición de login. No intentes mover una sesión que ya pertenece a un perfil del cliente diferente.

## 6. Maneja sesiones que ya tienen un cliente

Una sesión puede adjuntarse nuevamente al mismo perfil del cliente, pero no debe reutilizarse para otro cliente. Antes de considerar exitosa la asociación, comprueba el campo `profile` de la respuesta.

Si la sesión ya pertenece a otro perfil del cliente:

- No reasignes la actividad anterior al cliente actual.
- Detén el proceso de asociación y revisa por qué se compartió la sesión.
- Confirma que `Hellotext.forget()` se ejecute al cerrar sesión cuando uses `identify()`.
- Revisa el ciclo de sesiones de tu aplicación antes de registrar más eventos autenticados.

Cuando envías `profile` y `session` juntos al registrar un evento, ambos deben pertenecer al mismo cliente. Consulta [Seguimiento de origen externo]({% link _developers/external-tracking.md %}) para ver esa validación.

## 7. Verifica el flujo completo

Prueba con un cliente reconocible:

1. Abre la tienda sin iniciar sesión y confirma que Hellotext.js tenga una sesión.
2. Registra actividad anónima, como una vista de producto o una actualización del carrito.
3. Inicia sesión o completa el checkout.
4. Crea o encuentra el perfil del cliente correcto en Hellotext.
5. Adjunta la sesión desde el backend.
6. Confirma que la respuesta contenga el perfil del cliente esperado.
7. Verifica que la actividad anterior y los eventos nuevos aparezcan en ese perfil del cliente.
8. Cierra sesión y confirma que tu aplicación llame a `Hellotext.forget()` si usó `identify()`.

## Soluciona problemas comunes

- **La sesión es `undefined`:** espera a que Hellotext.js se inicialice o escucha `session-set`.
- **La API responde `401`:** revisa el token privado y el encabezado `Authorization`.
- **La API responde `404`:** la sesión puede no existir para ese negocio o todavía no haber sido enviada a Hellotext mediante actividad del navegador.
- **La respuesta muestra otro perfil del cliente:** trata el caso como un conflicto de identidad y no continúes registrando eventos autenticados con esa sesión.
- **La actividad anterior no aparece inmediatamente:** la asociación puede completarse en segundo plano; espera el procesamiento y vuelve a revisar.

Si continúan faltando señales, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %})
