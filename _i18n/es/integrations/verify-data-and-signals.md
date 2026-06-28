Usa este checklist después de conectar una tienda, sitio web, canal de mensajería, herramienta de captura o fuente de tracking personalizado.

El objetivo es confirmar que Hellotext puede ver el perfil de cliente correcto, recibir las señales correctas y usarlas de forma segura antes de lanzar playbooks, rutas, campañas o reportes que dependen de esos datos.

## Haz una prueba completa

Empieza con un cliente de prueba o un grupo interno pequeño.

1. Crea o identifica un perfil de cliente que puedas reconocer.
2. Suscríbete por la captura o canal que planeas usar.
3. Genera una actividad real, como una vista de producto, actualización de carrito, orden, envío de formulario, respuesta o evento personalizado.
4. Abre el perfil del cliente en Hellotext.
5. Confirma que el perfil, canal, consentimiento, evento, producto, orden e historial de mensajes se vean correctos.
6. Envía un mensaje de prueba si el canal está listo.
7. Haz click en cualquier link con tracking y responde el mensaje.
8. Confirma que el click, la respuesta y el contexto de la conversación aparezcan donde tu equipo espera verlos.

Si esta prueba pequeña no se ve bien, corrige la configuración antes de activar un playbook o campaña amplia.

## Perfiles de cliente

Revisa que Hellotext pueda identificar correctamente al cliente.

Busca:

- Nombre, teléfono, email o el identificador que envía tu integración.
- Estado de suscripción o consentimiento para el canal que planeas usar.
- Propiedades del perfil que usan segmentos, personalización o playbooks.
- Pertenencia a listas o segmentos si el cliente debería entrar en una audiencia específica.
- Perfiles duplicados que deberían unirse antes de lanzar.

Si un cliente aparece más de una vez, revisa qué identificador envía cada fuente. Los playbooks y reportes son más sólidos cuando la actividad llega al mismo perfil de cliente.

## Datos de comercio

Para integraciones de comercio, confirma que estén presentes los datos que necesita tu primer playbook.

Revisa:

- Órdenes recientes y estado de las órdenes.
- Actividad de carrito o checkout si planeas recuperar carritos abandonados.
- Nombres, imágenes, precios, variantes, stock o datos del catálogo si las recomendaciones dependen de ellos.
- Moneda, totales, cupones, devoluciones y estado de envío si afectan reportes o seguimiento.
- Fuente de marketplace o tienda si vendes por más de un canal.

No necesitas todos los campos posibles de comercio antes de lanzar. Sí necesitas los campos que usará el primer playbook, ruta, segmento o reporte.

## Eventos y señales

Confirma que la actividad crea la señal que esperas.

Para cada señal importante, revisa:

- El nombre de la acción es correcto, como `product.viewed`, `cart.abandoned`, `order.placed` o una acción personalizada.
- El evento aparece en el perfil de cliente correcto.
- La hora coincide con el momento en que ocurrió la actividad.
- El evento incluye los datos de producto, orden, carrito, formulario o propiedades personalizadas que necesita el playbook.
- La señal es lo suficientemente reciente para tu disparador, audiencia o reporte.

Si usas tracking personalizado, mantén consistentes los nombres de acciones. Pequeñas diferencias de nombre pueden crear señales separadas que no coinciden con el disparador que querías usar.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## Canales y consentimiento

Una señal puede estar disponible aunque Hellotext no debería enviar un mensaje.

Antes de lanzar, confirma:

- El canal que planeas usar está conectado.
- El remitente, cuenta de WhatsApp o código corto está disponible para el negocio.
- El cliente está suscrito o es elegible para ese canal.
- El tipo de mensaje, plantilla o reglas de conversación encajan con el canal.
- Los horarios silenciosos, límites de frecuencia y expectativas de baja están claros.
- Las respuestas llegarán al Inbox o a la persona responsable de la conversación.

Esto es especialmente importante cuando un playbook puede elegir el siguiente paso automáticamente.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Capturas y seguimiento

Si tu primer lanzamiento depende de una captura, prueba exactamente el camino que usará un cliente.

Revisa:

- El código QR, link compartible, formulario, popup u opt-in de checkout abre correctamente.
- El cliente queda suscrito al canal esperado.
- La fuente, etiquetas, campos o datos de cupón quedan registrados si los necesitas después.
- El mensaje de bienvenida, ruta o playbook asignado a la captura es el correcto.
- El cliente puede responder y tu equipo puede ver la conversación.

## Reportes y atribución

Si vas a medir el primer lanzamiento, confirma el camino de medición antes de enviar de forma amplia.

Revisa:

- Los links tienen tracking cuando esperas que lo tengan.
- Los clicks aparecen en el perfil de cliente o reporte.
- Las órdenes o conversiones posteriores a un mensaje pueden conectarse con la campaña, ruta, playbook o conversación cuando aplican las reglas de atribución.
- La actividad de prueba es fácil de reconocer para que tu equipo no la confunda con performance real.

Sigue leyendo: [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %}).

## Antes de lanzar un playbook

Revisa el playbook, ruta o campaña específica que estás por publicar.

Confirma:

- La señal disparadora existe.
- La audiencia contiene los clientes que esperas.
- El canal está listo y los clientes elegibles pueden recibir mensajes.
- El mensaje, prompt, oferta, productos y links están correctos.
- Las condiciones de detención y reglas de derivación están claras.
- Los reportes o métricas de éxito están definidos.

Empieza con una audiencia pequeña, revisa los primeros resultados y amplía después de que los datos se vean confiables.

## Si falta algo

Las causas comunes incluyen:

- Está conectada la tienda, marketplace, cuenta de Meta Business o negocio de Hellotext incorrecto.
- Las claves de API, tokens, configuración del plugin o permisos están vencidos o incompletos.
- El dominio de la tienda, script de checkout o script de tracking está instalado en el lugar incorrecto.
- La integración todavía no terminó la primera sincronización.
- El identificador de cliente que envía una fuente no coincide con el identificador que envía otra.
- El nombre de la acción del evento o propiedad personalizada no coincide con el disparador o regla del segmento.
- El cliente no está suscrito o no es elegible para el canal que quieres usar.

Corrige primero el dato faltante y luego repite la misma prueba completa.

## Guías relacionadas

- [Resumen de configuración]({% link _integrations/setup-overview.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Elige tu primer playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
