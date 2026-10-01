Usa esta guía cuando una integración propia con la API o Hellotext.js devuelva errores, cree registros duplicados o envíe eventos que no aparezcan donde esperas.

Comienza con un cliente fácil de reconocer y una sola request. Confirma cada nivel antes de probar una importación completa o habilitar misiones. Para investigar escrituras, usa un entorno aislado autorizado, datos ficticios y flujos inactivos. Un diagnóstico no requiere enviar mensajes, suscribir contactos ni inventar compras.

## 1. Confirma el token de la API y el negocio

Prueba el token desde el backend con una consulta de lectura. El ejemplo muestra el código HTTP y limita la respuesta a un perfil; reemplaza la variable de entorno en tu servidor, sin publicar su valor:

```bash
curl --request GET \
  --url 'https://api.hellotext.com/v1/profiles?limit=1' \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --include
```

Comprueba que:

- El header use `Authorization: Bearer TOKEN` y el token siga activo.
- Pertenezca al negocio de Hellotext esperado y esté cargado únicamente en el backend.
- La suscripción permita la operación concreta que quieres realizar.
- La respuesta corresponda a ese negocio; una lista vacía con HTTP `200` también puede ser una consulta válida.

En **Configuración → Tokens de autorización**, el **Nombre del token** sirve para reconocer su uso. En este borrador ficticio, «Tienda propia · desarrollo» es un nombre legible, no la credencial que debes colocar en el header.

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

No crees otro token sólo porque una escritura falle. La lectura de perfiles puede responder `200` aunque la operación de escritura requiera una suscripción activa. Ese resultado confirma autenticación para la consulta, no todos los permisos ni el negocio elegido por tu aplicación. Hellotext.js usa el ID público del negocio; la API privada del backend usa el token de autorización. No los intercambies.

Nunca pegues el token en código del navegador, capturas de pantalla, tickets o logs de la aplicación.

## 2. Lee el código HTTP antes del cuerpo de la respuesta

Maneja el estado HTTP y después el cuerpo. Estos casos orientan el diagnóstico; la validación exacta depende del endpoint:

| Código | Diagnóstico y siguiente paso |
| --- | --- |
| `400` | Revisa sintaxis, campos obligatorios y formato del cuerpo. Compara la request con el contrato del endpoint. |
| `401` | Revisa token ausente, inválido o revocado y negocio público incorrecto en el SDK. No repitas la misma credencial sin corregirla. |
| `403` | Revisa autorización, suscripción y acceso a esa operación; una lectura anterior exitosa no los garantiza. |
| `404` | Revisa ruta, recurso, nombre de acción y pertenencia al negocio. No reemplaces el ID por uno de otro negocio. |
| `422` | Lee cada error de validación y su parámetro. Un objeto incompatible o una combinación de perfil/sesión inválida puede llegar a este estado. |
| `500`, `502`, `503`, `504` | Conserva el resultado como incierto para una escritura. Investiga y reconcilia sus posibles efectos antes de aplicar los reintentos de la sección 7. |

Las respuestas pueden incluir `error` o `errors`, con campos como `type`, `message` y `parameter`; algunas rutas anidan esos datos. No asumas una única forma ni decidas solamente por el mensaje en inglés. Guarda el código HTTP, el tipo estructurado cuando exista y un resumen sin datos sensibles. Un proxy o un fallo de servidor también puede devolver HTML o un cuerpo vacío: comprueba el tipo de contenido y maneja el fallo al interpretar JSON sin perder el estado original.

En Hellotext.js **2.6.0**, el resultado de tracking es un wrapper `Response`: revisa `response.failed` o `response.succeeded` y lee el cuerpo con `await response.json()`. En una respuesta de red, `response.data` es la respuesta de `fetch`, no el JSON ya interpretado. Un fallo de red puede rechazar la promesa; maneja ese caso por separado y conserva la incertidumbre sobre el procesamiento. La identificación repetida puede responder desde una caché local, sin nueva request.

Consulta [Errores de la API](https://www.hellotext.com/api#errors).

## 3. Reduce la request al ejemplo válido más pequeño

Cuando falla un payload grande:

1. Conserva el endpoint, negocio e identidad que investigas, con credenciales válidas en el backend.
2. Compara primero método, ruta, `Content-Type` y campos obligatorios con la referencia.
3. En un entorno autorizado, verifica el caso mínimo; si es una escritura, reconcilia su resultado antes de repetirla.
4. Vuelve a agregar los campos opcionales un grupo a la vez.
5. Compara el primer campo que falla con su contrato en la API y guarda una versión mínima sin secretos para soporte.

El tracking privado de `/v1/attribution/events` espera un cuerpo JSON con `action`; enviar datos de formulario a esa ruta no equivale al ejemplo JSON. No presupongas que todos los endpoints aceptan el mismo formato o devuelven el mismo código ante un cuerpo mal formado.

Causas frecuentes de validación fallida, aunque no todas producen siempre `422`:

- Falta un nombre obligatorio o una modalidad de entrega, o se envía una opción no compatible.
- El ID de un producto, pedido, cupón, acción, propiedad o perfil pertenece a otro negocio o al tipo de recurso equivocado.
- Una referencia o un código viola una regla de unicidad; un SKU ambiguo tampoco identifica con seguridad el producto buscado.
- Se asigna una propiedad personalizada antes de crear su definición.
- Se envía `currency` sin `amount`, o `tracked_at` no tiene un formato válido.
- Se usan un perfil y una sesión que no están asociados correctamente.

El nombre de una acción, su ID de definición y el ID de una ocurrencia son identificadores distintos. Envía en `action` el nombre de tracking exacto, no el título traducido que ves en la interfaz.

## 4. Separa la creación de recursos del tracking de eventos

Un recurso y un evento responden preguntas diferentes:

- Un producto, pedido, cupón u objeto personalizado describe **qué elemento** participó en la actividad.
- Un evento describe **qué ocurrió, a qué cliente y cuándo**.

Si el pedido existe, pero no aparece una compra en el perfil del cliente, revisa la request del evento. Si el evento falla porque no encuentra su objeto, revisa primero la sincronización del recurso. La respuesta de creación o consulta de un recurso proporciona su propio ID; `status: received` de tracking no devuelve ese ID ni un ID de evento.

Para los eventos, confirma:

- La acción es exacta, compatible con el objeto y disponible para el negocio o como acción integrada.
- `profile` contiene el ID público de un perfil del negocio, o `session` identifica la sesión correspondiente. Si incluyes ambos en tracking privado, verifica antes su asociación al mismo perfil; no fuerces una sesión de otro cliente.
- `object` identifica el recurso esperado. En un objeto personalizado, distingue la estructura `object_type` de la instancia; las acciones integradas tienen sus propios contratos.
- `tracked_at` representa la fecha original: segundos Unix o ISO 8601 con zona horaria, sin convertir milisegundos en segundos por accidente. Si se omite, no se conserva automáticamente la fecha del sistema de origen.
- El importe y la moneda son coherentes. Envía valores decimales, por ejemplo `89.90` con `USD`, y revisa cuándo el evento hereda el importe del objeto. No confundas cantidad de artículos con precio o total.

El formulario **Nuevo evento** permite reconocer esos conceptos: acción, objeto asociado y monto. La captura muestra un borrador manual de **Cita reservada**, sin guardar y con **Guardar** deshabilitado. Este formulario exige un objeto para esa acción personalizada; la API/SDK puede omitirlo según su contrato. El borrador no demuestra que una request de tracking se haya procesado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nuevo evento para Demo Caso 1 con Cita reservada seleccionada, objeto asociado requerido sin completar y Guardar deshabilitado.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 449px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-actions/manual-es-mobile.png 2x" width="778" height="1300" />
        <img src="/images/developers/custom-actions/manual-es.png" srcset="/images/developers/custom-actions/manual-es.png 2x" style="width: auto; margin: 0 auto;" width="862" height="1300" loading="lazy" decoding="async" alt="Nuevo evento para Demo Caso 1 con Cita reservada seleccionada, objeto asociado requerido sin completar y Guardar deshabilitado." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Formulario manual real sin guardar para un cliente ficticio no enviable. No hay objeto asociado ni evento registrado; el botón Guardar sigue deshabilitado.</figcaption>
</figure>

Usar `object_parameters` para crear un objeto durante tracking puede producir una escritura además del evento. Para aislar un fallo, prefiere el ID público de un objeto ya verificado cuando el contrato lo permita, y consulta [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## 5. Interpreta correctamente un evento recibido

Una request aceptada de tracking responde con HTTP `200`:

```json
{
  "status": "received"
}
```

Esto confirma recepción para procesamiento. No garantiza que se haya creado una ocurrencia, actualizado un perfil, activado una misión o cambiado un reporte. El endpoint público usado por el SDK acepta y encola el trabajo; el endpoint privado valida parte de la request y también puede delegar la creación del evento. Un fallo posterior o una regla específica de deduplicación puede impedir una nueva ocurrencia.

Si el evento todavía no aparece después de un intervalo razonable de procesamiento:

1. Confirma el negocio, ID público del perfil y sesión asociada. Una UUID o un acknowledgment local del navegador no prueban por sí solos que la sesión esté materializada y vinculada en el servidor.
2. Confirma acción, tipo de objeto y recurso existente; conserva la correspondencia entre IDs de Hellotext y del origen.
3. Revisa `tracked_at`, zona horaria, período y filtros de la vista. Un evento histórico puede quedar fuera del período que estás mirando.
4. Comprueba si la integración nativa o tu backend ya registró la misma actividad; no vuelvas a enviarla para acelerar la pantalla.
5. Revisa primero la actividad del perfil. Después, examina las condiciones de segmentos, misiones y reportes; una ocurrencia visible no implica que cumpla todos sus filtros o ventanas de atribución.

El listado de eventos usa cursor; no asumas filtros de perfil, fecha o acción que el endpoint no implementa, ni una correspondencia única sólo porque encuentres un resultado reciente. La ausencia en la primera página tampoco demuestra que la request fracasó.

Usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) para las comprobaciones en el producto después de validar la request de la API.

## 6. Encuentra la causa de registros duplicados

Revisa tanto la identidad que cambia entre requests como los emisores que registran dos veces la misma actividad.

Para perfiles de clientes:

- Guarda el ID público devuelto por Hellotext y actualiza ese perfil del negocio.
- Normaliza teléfonos con el país correcto y emails antes de sincronizarlos; no cambies una identidad real para eludir una validación.
- La creación puede reconocer un perfil por teléfono o email existentes. No la uses como una garantía general de idempotencia para cualquier payload; algunas actualizaciones de propiedades se completan en segundo plano.
- No reutilices la sesión de otra cuenta. `forget()` sólo elimina cookies de identidad y conserva la sesión y su asociación; consulta [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %}) para separar sesiones correctamente.

Para productos y pedidos:

- Mantén `source` y `reference` estables y conserva la correspondencia con el ID público de Hellotext.
- Un SKU estable puede servir para localizar productos según el endpoint, pero no es el ID público ni una garantía de unicidad en todos los orígenes.
- Usa el ID público cuando las referencias o SKU sean ambiguos. No adivines qué coincidencia eligió una búsqueda por referencia.
- Evita que el navegador, backend e integración nativa creen objetos paralelos para la misma actividad.

En el pedido ficticio siguiente, **ID de la orden** muestra la referencia `ORDER-1001`. El ID público de la API se conserva por separado; `source: custom_store` describe el origen y no cambia por cada request. El total `USD 89.90` tampoco identifica el pedido.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de un pedido ficticio ORDER-1001 con origen custom_store, total USD 89.90 y entrega Entregar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/orders-with-api/details-es-mobile.png 2x" width="778" height="914" />
        <img src="/images/developers/orders-with-api/details-es.png" srcset="/images/developers/orders-with-api/details-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="914" loading="lazy" decoding="async" alt="Editor real de un pedido ficticio ORDER-1001 con origen custom_store, total USD 89.90 y entrega Entregar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Vista real de un pedido ficticio sin eventos. «ID de la orden» muestra aquí la referencia ORDER-1001; conserva por separado el id público devuelto por la API.</figcaption>
</figure>

Para eventos:

- Asigna un ID interno estable al evento del origen y conserva un registro de salida con su resultado.
- Deduplica notificaciones repetidas antes de llamar a Hellotext. Un ID que guardas en tu sistema no se convierte automáticamente en una clave de idempotencia del API.
- No repitas una request que ya respondió `received` sólo porque todavía no ves efectos.
- La deduplicación de determinadas acciones de pedido se limita al pedido y acción retenidos; no la generalices a eventos personalizados, vistas de productos ni objetos nuevos.
- En Hellotext.js 2.6.0, espera `initialize()` y registra `page.viewed` una vez por vista real. La inicialización no lo registra automáticamente. Evita sumar el mismo registro desde varias etiquetas, una navegación SPA y el backend.

## 7. Reintenta sin crear duplicados inciertos

Clasifica el resultado antes de programar otro intento:

- No reintentes sin cambios respuestas `400`, `401`, `403`, `404` o `422`. Corrige la causa o envía el caso a una cola de revisión.
- Reintenta una lectura sólo ante fallos transitorios de red o respuestas `5xx` que admitan reintento, con espera progresiva, demora aleatoria y una cantidad máxima de intentos.
- Una escritura con timeout, desconexión o `5xx` tiene un resultado incierto: pudo completarse antes del fallo. Reconcilia primero; el código por sí solo no demuestra que no hubo efectos.
- Una respuesta `received` queda aceptada pero con procesamiento pendiente; vigila su resultado sin reenviar el mismo hecho automáticamente.

Antes de repetir un `POST`, revisa el ID almacenado, la referencia/origen y las consultas posteriores del recurso. Considera también escrituras parciales de objetos inline o trabajo encolado. Para tracking sin ID de respuesta, combina el registro de salida del origen y la actividad real; si no puedes establecer si se procesó, conserva el estado incierto y solicita revisión. No fabriques un nuevo evento para demostrar que la request anterior terminó.

La API no expone un parámetro general de idempotencia. Tu integración debe conservar su identificador de evento, intentos y estados: pendiente, aceptado, confirmado, rechazado o incierto. Estos son estados de tu registro de salida, no valores que Hellotext devuelve en todos los endpoints.

## 8. Registra suficiente contexto sin exponer secretos

Para cada llamada a la API, conserva:

- Método, ruta, versión de tu integración/SDK y tipo de contenido.
- Código HTTP, tipo estructurado de error y parámetro cuando existan; distingue fallo de red de rechazo HTTP.
- ID del registro o evento en el origen y negocio de Hellotext.
- ID público del recurso cuando lo conozcas y una correspondencia protegida con perfil/sesión, sin confundirlos con IDs internos.
- Fecha original del hecho, hora de inicio, zona horaria y duración de la request.
- Número de intento y estado de tu registro de salida; un `received` no debe anotarse como «entregado».

Oculta tokens de autorización, teléfonos y emails completos, contenido de mensajes con datos del cliente y cuerpos completos con información personal o de pagos. Un dump del navegador o servidor puede incluir headers, cookies y parámetros de sesión: comparte sólo una versión revisada y mínima, no el log completo.

## 9. Ejecuta un diagnóstico de principio a fin

Usa esta secuencia para aislar el nivel que falla en un entorno de prueba autorizado, con contactos ficticios no enviables y automatizaciones inactivas:

1. Autentica con una consulta de un perfil y confirma el negocio.
2. Recupera el perfil existente y su ID público; crea uno sólo si el escenario requiere esa escritura.
3. Recupera el producto y su ID público; compara referencia, origen y precio.
4. Comprueba la request de una vista real del producto y la identidad correspondiente, evitando emitirla de nuevo desde dos lugares.
5. Recupera el pedido de esa actividad; si el caso autoriza crearlo, verifica primero si ya existe.
6. Registra un evento real del pedido sólo cuando ese escenario esté autorizado y aún no se haya enviado. No inventes una compra ni un envío para diagnosticar otro fallo.
7. Confirma la actividad en el perfil y conserva la evidencia del resultado, incluso si sigue incierto.
8. Recién entonces revisa segmentos, misiones y reportes con sus condiciones y períodos.

Cuando identifiques el primer paso que falla, corrígelo antes de continuar. Los niveles posteriores no compensan un recurso o evento inválido. Identificación, consentimiento de marketing y habilitación de envío son verificaciones distintas; este diagnóstico no requiere cambiar las dos últimas.

## 10. Contacta a Hellotext con un ejemplo reproducible

Si la request documentada sigue fallando, incluye:

- ID del negocio o workspace de Hellotext, versión de tu integración y SDK si aplica.
- Endpoint, método HTTP y tipo de contenido.
- Fecha, hora y zona horaria de la request y del evento original.
- Código HTTP y cuerpo de respuesta sin datos sensibles, o el tipo de fallo de red.
- Referencia del origen, IDs públicos conocidos y resultado de la reconciliación, sin datos personales innecesarios.
- Si el error es constante o intermitente, cuántos intentos hubo y qué sigue incierto.
- El payload mínimo que reproduce el problema, sin token, cookies ni datos de clientes reales.

En **Configuración**, reconoce el campo **ID del negocio**. El ejemplo ficticio siguiente muestra dónde encontrar ese identificador público; no es el token privado ni el ID de un perfil o pedido.

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

Consulta [Contacta al soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Crea y registra cupones con la API]({% link _developers/coupons-with-api.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
