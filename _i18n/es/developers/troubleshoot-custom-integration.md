Usa esta guía cuando una integración propia con la API o Hellotext.js devuelva errores, cree registros duplicados o envíe eventos que no aparezcan donde esperas.

Comienza con un cliente fácil de reconocer y una sola request. Confirma cada nivel antes de probar una importación completa o habilitar playbooks.

## 1. Confirma el token de la API y el negocio

Prueba el token desde el backend:

```bash
curl --request GET \
  --url https://api.hellotext.com/v1/profiles?limit=1 \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN"
```

Comprueba que:

- El header use `Authorization: Bearer TOKEN`.
- El token no haya sido revocado.
- Pertenezca al negocio de Hellotext esperado.
- Esté cargado únicamente en el entorno del backend.
- El negocio tenga acceso a la operación solicitada de la API.

Nunca pegues el token en código del navegador, capturas de pantalla, tickets o logs de la aplicación.

## 2. Lee el código HTTP antes del cuerpo de la respuesta

Hellotext utiliza códigos HTTP estándar. Maneja cada categoría de forma diferente:

| Código | Significado | Qué hacer |
| --- | --- | --- |
| `400` | La request está mal formada o falta un parámetro obligatorio. | Compara el cuerpo y el tipo de contenido con la referencia de la API. |
| `401` | El token falta, es inválido o fue revocado. | Reemplaza o corrige el token; no reintentes sin cambios. |
| `403` | El negocio o token no puede realizar la operación, normalmente porque el acceso a la API no está disponible para el estado actual del plan. | Revisa el acceso del negocio y el estado de la suscripción. |
| `404` | No se encontró el recurso, la acción o el identificador dentro de ese negocio. | Confirma el ID y que pertenezca al mismo negocio que el token. |
| `422` | La request llegó al endpoint, pero uno o más valores no pasaron la validación. | Lee todos los errores devueltos y corrige el parámetro indicado. |
| `500`, `502`, `503`, `504` | Hellotext o un servicio relacionado tuvo un problema temporal. | Reintenta de forma segura con espera progresiva. |

Las respuestas de validación incluyen un objeto `error` o una colección `errors` con campos como `type`, `message` y `parameter`. No tomes decisiones solamente a partir del mensaje en inglés; conserva en tus logs el código y el tipo estructurado de error.

Consulta [Errores de la API](https://www.hellotext.com/api#errors).

## 3. Reduce la request al ejemplo válido más pequeño

Cuando falla un payload grande:

1. Conserva el mismo endpoint y credenciales.
2. Envía únicamente los campos obligatorios documentados.
3. Confirma que la request mínima funcione.
4. Vuelve a agregar los campos opcionales un grupo a la vez.
5. Compara el primer campo que falla con su contrato en la API.

Causas frecuentes de `422`:

- Falta un nombre obligatorio o una modalidad de entrega.
- Se envió un valor no compatible para una opción enumerada.
- El ID de un producto, pedido, cupón, acción, propiedad o perfil del cliente pertenece a otro negocio.
- Hay una referencia, código o SKU único duplicado.
- Se asignó una propiedad personalizada antes de crear su definición.
- Se envió `currency` sin `amount` en un evento.
- `tracked_at` tiene un valor inválido.

## 4. Separa la creación de recursos del tracking de eventos

Un recurso y un evento responden preguntas diferentes:

- Un producto, pedido, cupón u objeto personalizado describe **qué elemento** participó en la actividad.
- Un evento describe **qué ocurrió, a qué cliente y cuándo**.

Si el pedido existe, pero no aparece una compra en el perfil del cliente, revisa la request del evento. Si el evento falla porque no encuentra su objeto, revisa primero la sincronización del recurso.

Para los eventos, confirma:

- El nombre de la acción es exacto y existe para el negocio.
- `profile` o `session` se resuelve correctamente.
- `object` pertenece al tipo de recurso esperado.
- `tracked_at` representa la fecha original del evento.
- `amount` y `currency` están presentes cuando envías un valor monetario.

## 5. Interpreta correctamente un evento recibido

Una request válida de tracking responde con HTTP `200`:

```json
{
  "status": "received"
}
```

Esto confirma que se recibió para su procesamiento, no que todos los perfiles, segmentos, playbooks y reportes relacionados se hayan actualizado inmediatamente.

Si el evento todavía no aparece después de un intervalo razonable de procesamiento:

1. Confirma que el token y el perfil del cliente pertenezcan al mismo negocio.
2. Confirma que coincidan la acción y el tipo de objeto.
3. Revisa si el evento se envió con un `tracked_at` antiguo.
4. Comprueba que una integración nativa no haya creado ya el mismo evento.
5. Revisa la actividad del perfil del cliente antes de mirar resultados de playbooks o reportes.

Usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) para las comprobaciones en el producto después de validar la request de la API.

## 6. Encuentra la causa de registros duplicados

Los duplicados normalmente comienzan cuando la identidad cambia entre requests.

Para perfiles de clientes:

- Guarda el ID del perfil devuelto por Hellotext.
- Normaliza teléfonos y emails antes de sincronizarlos.
- Actualiza el perfil existente del cliente en lugar de crear uno en cada job.

Para productos y pedidos:

- Mantén `source` constante.
- Mantén `reference` constante.
- Conserva SKU estables y únicos cuando los utilices.
- Guarda el ID devuelto por Hellotext.
- Evita que implementaciones separadas del navegador y el backend creen objetos paralelos.

Para eventos:

- Asigna un ID interno estable a cada evento del origen.
- Conserva un registro de salida o entrega en tu propio sistema.
- No vuelvas a enviar una request que ya respondió con `status: received`.
- Deduplica notificaciones repetidas del sistema de origen antes de llamar a Hellotext.

## 7. Reintenta sin crear duplicados inciertos

El comportamiento seguro depende del resultado:

- No reintentes sin cambios respuestas `400`, `401`, `403`, `404` o `422`.
- Reintenta fallas temporales de red y errores `5xx` con espera progresiva y una cantidad máxima de intentos.
- Agrega una demora aleatoria cuando varios workers puedan reintentar al mismo tiempo.
- Deja de reintentar errores permanentes de validación y envíalos a una cola de revisión.

Un timeout tiene un resultado incierto: el servidor podría haber completado la request antes de que terminara la conexión. Antes de repetir un `POST` de creación, reconcilia el ID de Hellotext almacenado, la referencia del origen o los resultados recientes de la API.

La API no expone un parámetro general de idempotencia. Tu integración debe conservar su propio identificador del evento de origen y estado de entrega.

## 8. Registra suficiente contexto sin exponer secretos

Para cada llamada a la API, conserva:

- Método y ruta del endpoint.
- Código HTTP.
- Tipo estructurado de error y parámetro.
- ID del registro o evento en el sistema de origen.
- ID del recurso en Hellotext cuando lo conozcas.
- Hora de inicio y duración de la request.
- Número de intento.

Oculta:

- Tokens de autorización.
- Números de teléfono y emails completos.
- Contenido de mensajes cuando incluya datos del cliente.
- Cuerpos completos de requests con información personal o de pagos.

## 9. Ejecuta un diagnóstico de principio a fin

Usa esta secuencia para aislar el nivel que falla:

1. Autentica con una request de un solo perfil.
2. Crea o recupera un perfil del cliente.
3. Crea o recupera un producto.
4. Registra una vista de ese producto para el perfil del cliente.
5. Crea un pedido con el mismo producto.
6. Registra un evento real del pedido.
7. Confirma el evento en el perfil del cliente.
8. Recién entonces revisa segmentos, playbooks y reportes.

Cuando identifiques el primer paso que falla, corrígelo antes de continuar. Los niveles posteriores no pueden compensar un recurso o evento inválido.

## 10. Contacta a Hellotext con un ejemplo reproducible

Si la request documentada sigue fallando, incluye:

- Identificador del negocio o workspace de Hellotext.
- Endpoint y método HTTP.
- Fecha, hora y zona horaria de la request.
- Código HTTP y cuerpo de respuesta sin datos sensibles.
- Referencia del origen e ID del recurso de Hellotext, sin datos sensibles.
- Si el error es constante o intermitente.
- El payload mínimo que reproduce el problema, sin el token ni datos personales innecesarios.

Consulta [Contacta al soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}).

## Guías relacionadas

- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Sincroniza productos y entiende la disponibilidad de inventario]({% link _developers/products-and-inventory-with-api.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Crea y registra cupones con la API]({% link _developers/coupons-with-api.md %})
- [Seguimiento de origen externo]({% link _developers/external-tracking.md %})
