Hellotext puede registrar actividad antes de conocer la identidad de un visitante. Una sesión conecta esa actividad del navegador con un perfil del cliente cuando tu aplicación confirma quién es. La asociación permite recuperar actividad anónima compatible; no garantiza recuperar eventos que nunca llegaron, resolver conflictos ni atribuir todas las conversiones a un mensaje.

Distingue estos valores antes de integrar:

| Valor | Uso |
| --- | --- |
| **ID público del negocio** | Inicializa Hellotext.js en el navegador. |
| **Sesión de Hellotext** | Identificador del contexto de actividad; puede ser un UUID del navegador o el ID de una sesión existente. No autentica a tu cliente. |
| **ID público del perfil del cliente** | Lo resuelve tu backend en Hellotext para adjuntar la sesión. Es diferente del ID de tu tienda. |
| **Token privado de API** | Autoriza la request del backend para ese negocio; nunca se publica en JavaScript. |
| **Consentimiento** | Autoriza mensajes por un canal. Identificar o adjuntar una sesión no lo establece. |

Si estás conectando una tienda propia desde cero, comienza con [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %}). Los ejemplos siguientes corresponden al SDK publicado `@hellotext/hellotext` **2.6.0** y requieren que la librería ya esté cargada.

## 1. Obtén la sesión anónima

En Configuración, localiza el **ID del negocio** público que usarás como `BUSINESS_ID`:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Configuración del negocio ficticio Enterprise con ID del negocio 4ONLdN32 y Editar negocio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 886px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" style="width: auto; margin: 0 auto;" width="1736" height="404" loading="lazy" decoding="async" alt="Configuración del negocio ficticio Enterprise con ID del negocio 4ONLdN32 y Editar negocio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real de una base local aislada. El ID público pertenece solo al negocio ficticio; no es un token privado ni un ejemplo de precio Enterprise.</figcaption>
</figure>

La selección de sesión sigue este orden: `hello_session` en la URL, la opción `session` de inicialización y la cookie existente. Si falta una sesión y `autoGenerateSession` está habilitado, el SDK genera un UUID. Un link personalizado puede traer una sesión ya vinculada a su destinatario: tener un identificador no significa que la sesión sea anónima ni que pertenezca a la cuenta que acaba de iniciar sesión.

Inicializa una vez y espera la Promise antes de continuar:

```javascript
(async () => {
  await Hellotext.initialize('BUSINESS_ID')

  const sessionId = Hellotext.session
  if (!sessionId) {
    throw new Error('Hellotext session is not available')
  }

  // Use sessionId only after resolving your application's authentication state.
})().catch(error => console.error(error))
```

`Hellotext.isInitialized` indica que existe un valor de sesión; puede ser verdadero antes de que termine la Promise de inicialización. Tampoco acredita que la sesión esté guardada en el servidor.

Si necesitas observar cambios de sesión, registra este listener **antes** de llamar a `initialize()`:

```javascript
Hellotext.on('session-set', sessionId => {
  if (!sessionId) return

  // Observe the local session change; do not identify a customer here.
})
```

El evento puede emitir un valor vacío antes de generar el UUID y ocurre al escribir la cookie, no al confirmar la asociación. No reemplaza el `await` ni vuelve a emitir por registrar un listener tarde.

El SDK intenta reconocer la sesión mediante una request de acknowledgment. El valor local y la cookie de acknowledgment no prueban que el servidor la haya materializado: puede existir solo información temporal hasta procesar actividad o identificación. No registres eventos falsos para eliminar un `404`. Registra `page.viewed` explícitamente una vez por vista real si tu integración lo necesita; la inicialización no lo registra automáticamente. Aplica tu política de consentimiento antes de cargar el SDK o enviar actividad.

Consulta [Sesiones en Hellotext.js](https://github.com/hellotext/hellotext.js/blob/main/docs/sessions.md) para las opciones de la librería. Para el orden de ejecución y los límites de persistencia, utiliza las precisiones anteriores de la versión publicada.

## 2. Identifica al cliente en el momento correcto

Asocia la sesión cuando tu aplicación reconozca al cliente de forma confiable:

- Después de un login autenticado o un registro completado.
- Durante un checkout cuando el backend resuelva una identidad verificada.
- Después de comprobar que la sesión recibida corresponde al contexto actual de esa cuenta.

Un email o teléfono escrito en un campo no confirma identidad ni consentimiento. Resuelve la cuenta desde la autenticación de tu aplicación; no aceptes el perfil que el navegador elija. En una aplicación de una sola página, espera esa resolución antes de identificar o registrar eventos autenticados y evita enviar la misma actividad por navegador y backend.

## 3. Adjunta la sesión desde el backend

Para una tienda propia, utiliza el backend con un token privado del mismo negocio y una suscripción que permita acceso a API. El **Nombre del token** ayuda a reconocer su propósito; no es la credencial que debe ir en `Authorization`:

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Crear un token nuevo con Nombre del token Tienda propia · desarrollo, en un borrador sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-spacing/token-es-mobile.png 2x" width="748" height="432" />
        <img src="/images/developers/custom-store-integration/token-spacing/token-es.png" srcset="/images/developers/custom-store-integration/token-spacing/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="476" loading="lazy" decoding="async" alt="Crear un token nuevo con Nombre del token Tienda propia · desarrollo, en un borrador sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real del formulario de autorización, con un nombre ficticio sin guardar. No se creó ni expuso ningún token privado.</figcaption>
</figure>

1. Espera la inicialización y lee `Hellotext.session`.
2. Envía la sesión a tu backend en una request autenticada. Valida su relación con el navegador y la cuenta actuales; la sesión de Hellotext no sustituye la autenticación.
3. Crea o encuentra el perfil correcto y guarda la correspondencia entre el ID de tu aplicación y el **ID público de Hellotext**.
4. Confirma que la sesión exista en ese negocio y que no corresponda a otra persona.
5. Adjunta la sesión, verifica el resultado y conserva evidencia de la asociación antes de enviar eventos autenticados con ambos valores.

Si necesitas crear el perfil, usa [Crear un perfil del cliente](https://www.hellotext.com/api#create_a_profile). Crear un perfil puede guardar datos y activar flujos configurados; no equivale a consentimiento. `PROFILE_ID` debe ser el ID público de ese perfil, no su email, el ID del negocio ni el ID de Shopify.

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/sessions/HELLOTEXT_SESSION_ID \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "profile": "PROFILE_ID"
  }'
```

`HELLOTEXT_SESSION_ID` acepta el UUID del SDK o el ID de una sesión existente. Ambos recursos se buscan dentro del negocio del token. Una sesión aún inexistente responde `404`.

La implementación actual responde `200` con el objeto de sesión después de intentar adjuntarla, **incluso si rechaza cambiar su propietario**. No uses solo el HTTP como confirmación. Además, `profile` en la respuesta actual representa un identificador interno numérico del contacto o `null`; no es el ID público enviado en la request y no debes reutilizarlo como `PROFILE_ID`. Verifica la identidad mediante una correspondencia confiable y la actividad del perfil correcto, como se explica más abajo. Si no puedes confirmar esa correspondencia, trata la asociación como pendiente.

Cuando se acepta, la terminación del historial ocurre en segundo plano: vincula actividad sin perfil, procesa actividad anónima elegible y puede asociar carritos. No mueve eventos ya identificados a otra persona ni sobrescribe toda la atribución. Conserva las fechas originales; las ventanas de atribución y el origen de cada evento siguen aplicándose.

Consulta [Adjuntar una sesión](https://www.hellotext.com/api#attach_session). Esta guía precisa los límites observados en la implementación actual frente a la descripción general del endpoint.

## 4. Usa la identificación en el navegador solo cuando sea necesario

`identify()` necesita una integración de origen realmente configurada. Para Shopify, usa el ID estable de un cliente real de la tienda conectada; el primer argumento es el **ID de Shopify**, no el ID público de un perfil de Hellotext. Llama a esta función después de esperar la inicialización y confirmar la autenticación:

```javascript
async function identifyShopifyCustomer(shopifyCustomerId) {
  if (!Hellotext.session || !shopifyCustomerId) {
    throw new Error('A session and authenticated Shopify customer are required')
  }

  const response = await Hellotext.identify(String(shopifyCustomerId), {
    source: 'shopify',
  })

  if (response.failed) {
    throw new Error('Identification request was rejected')
  }

  return await response.json()
}
```

Captura también los errores de red en el código que llama a la función. El wrapper ofrece `failed`, `succeeded` y `json()`; `data` contiene la respuesta de `fetch`, no un objeto JSON ya procesado.

Una respuesta HTTP aceptada puede contener `received`: el servidor encola la identificación. No devuelve un ID de perfil ni garantiza que la tienda, el cliente o la asociación se hayan procesado. El SDK guarda la identidad local cuando recibe éxito HTTP, aunque el trabajo posterior falle. Confirma el resultado en el perfil antes de asumir que terminó.

Si sesión, cliente y datos normalizados coinciden con la identificación recordada, el SDK puede devolver `already_identified: true` sin otra request. Eso indica una coincidencia local, no una nueva comprobación del servidor. No reintentes en bucle para fabricar una confirmación. Para una tienda propia, adjunta desde el backend; inventar `source: 'custom_store'` no crea una integración compatible. No envíes un estado de suscripción sin evidencia válida de consentimiento.

## 5. Olvida la identidad al cerrar sesión

Cuando el cliente cierre sesión en tu aplicación, si utilizaste `identify()`, llama a:

```javascript
Hellotext.forget()
```

Elimina las cookies de identidad recordada, origen del usuario y huella de identificación. **Mantiene la sesión de Hellotext y su asociación previa en el servidor**: no vuelve anónima la actividad futura por sí solo, no cierra la sesión de tu aplicación y no elimina perfil, historial ni consentimiento.

Antes de registrar actividad de otra cuenta, detén el seguimiento que conserve el contexto anterior y establece una sesión separada mediante el ciclo de inicialización de tu integración. Puedes proporcionar un nuevo UUID válido con la opción `session`, pero primero evita que un `hello_session` antiguo en la URL lo sobrescriba; después espera la inicialización y verifica el ID efectivo. No generes una sesión nueva en cada vista ni reutilices un link personalizado de otra persona para iniciar la siguiente cuenta.

## 6. Maneja sesiones que ya tienen un cliente

Adjuntar nuevamente al mismo cliente no equivale a mover una sesión entre cuentas. La implementación puede fusionar un contacto anónimo con uno conocido compatible, pero rechaza sustituir un propietario conocido diferente. No utilices esa fusión como un mecanismo general para cambiar de cuenta.

Antes de considerar exitosa la asociación:

- Valida el perfil público resuelto por tu backend y el contexto de sesión recibido.
- Recuerda que el `profile` numérico de la respuesta actual no puede compararse directamente con tu ID público. `null` indica ausencia de asociación; un valor no nulo por sí solo no identifica al cliente esperado.
- Comprueba en el perfil correcto la actividad esperada después del procesamiento. Si no dispones de una correspondencia confiable o el resultado apunta a otra persona, detén los eventos autenticados y revisa el conflicto.

`forget()` no desadjunta ni corrige una sesión compartida. No reasignes el historial previo al nuevo cliente. Cuando envíes `profile` y `session` juntos al registrar un evento, ambos deben pertenecer al mismo cliente del mismo negocio; consulta [Seguimiento de origen externo]({% link _developers/external-tracking.md %}).

## 7. Verifica el flujo completo

En un entorno de prueba autorizado, con identidad y consentimiento ficticios coherentes:

1. Confirma la versión del SDK, el negocio público y la inicialización esperada.
2. Comprueba el ID efectivo, su precedencia URL/configuración/cookie y si ya existe en el servidor.
3. Registra solo actividad de prueba legítima, con sus fechas originales, sin duplicarla.
4. Autentica la cuenta en tu aplicación y resuelve su perfil público de Hellotext desde el backend.
5. Adjunta la sesión y revisa el objeto devuelto, incluyendo la limitación del identificador interno.
6. Espera el procesamiento y comprueba que la actividad anterior elegible y la posterior aparecen en el perfil correcto. Identidad, atribución y suscripción se verifican por separado.
7. Cierra sesión, ejecuta `forget()` si corresponde y valida una sesión separada antes de registrar actividad de otra cuenta.
8. Comprueba también un conflicto y un fallo de red sin mover el historial ni repetir una request de resultado incierto.

## Soluciona problemas comunes

- **Sesión `undefined`:** espera la Promise, comprueba `autoGenerateSession`, la configuración y el contexto del navegador. Un listener tardío puede perder el evento; un evento local no prueba inicialización completa.
- **`401` o `403`:** revisa el token privado, el negocio, el encabezado `Authorization` y el acceso de la suscripción a API.
- **`404`:** puede faltar una sesión materializada en ese negocio. El UUID local o el acknowledgment no garantizan que exista; revisa actividad real y procesamiento, sin crear eventos falsos.
- **HTTP `200`, pero sin asociación confirmada:** valida el perfil existente, la propiedad de la sesión y el procesamiento. No compares el identificador interno de respuesta con el público ni supongas que `received` o `already_identified` acreditan el resultado.
- **No funciona `identify()`:** confirma el origen compatible, la conexión y el ID real de la plataforma. Un nombre de origen no implementa una integración; utiliza el backend para una tienda propia.
- **Actividad de otra cuenta después del logout:** `forget()` conserva la sesión. Revisa su rotación y los parámetros de un link personalizado antes de continuar.
- **Actividad previa pendiente:** revisa colas, fechas, elegibilidad y perfil correcto. Adjuntar no recupera solicitudes nunca registradas ni garantiza atribución retroactiva.
- **Timeout o conexión interrumpida:** la operación puede haber llegado. Revisa el resultado antes de reintentar; no supongas idempotencia general ni que repetir la identificación completa el trabajo anterior.

Si continúan faltando señales, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %})
