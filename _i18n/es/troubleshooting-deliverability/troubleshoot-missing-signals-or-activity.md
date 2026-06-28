Usa esta guía cuando un evento, actualización de perfil, cambio de segmento, disparador de playbook, step de ruta o métrica de reporte no aparece donde esperabas.

Las señales pueden venir de una tienda, sitio web, herramienta de captura, canal de mensajería, API, Hellotext.js, perfil del cliente o conversación del Inbox. La forma más rápida de corregir una señal faltante es ubicar dónde se detuvo la cadena.

## Antes de empezar

Anota el síntoma exacto antes de cambiar configuración.

Recopila:

- El negocio donde ocurrió el problema.
- El perfil del cliente, email, teléfono, ID externo o usuario de prueba.
- La señal o nombre de evento esperado.
- El segmento, playbook, ruta, campaña o reporte afectado.
- El canal, tienda, integración o fuente de tracking.
- La hora aproximada en que ocurrió la actividad.
- Qué esperabas ver y qué apareció en su lugar.

Usa un perfil del cliente o un evento de prueba primero. Los problemas amplios son más fáciles de entender después de reproducir un ejemplo limpio.

## 1. Revisa primero el perfil del cliente

Abre el perfil del cliente que esperabas que se actualizara.

Revisa si:

- El perfil existe.
- El email, teléfono, ID externo o identificador de integración es correcto.
- El evento o propiedad de perfil aparece en el timeline o perfil.
- El cliente tiene el estado de suscripción o consentimiento esperado.
- El perfil pertenece al mismo negocio, tienda, canal o marketplace que estás probando.
- El cliente aparece más de una vez como perfiles duplicados.

Si la actividad existe en otro perfil del cliente, el problema normalmente está en la identificación. Revisa qué identificador envía cada fuente y si la tienda, script de tracking, llamada de API o integración usa la misma identidad del cliente.

## 2. Si el perfil falta o está desactualizado

Si el perfil del cliente no existe, o faltan datos recientes del perfil, empieza por el sistema de origen.

Revisa:

- La tienda o integración está conectada al negocio correcto de Hellotext.
- Las claves de API, tokens, configuración del plugin y permisos son válidos.
- La primera sincronización terminó.
- El cliente afectado existe en el sistema de origen.
- La integración tiene permiso para sincronizar los campos esperados.
- El email, teléfono o ID externo del cliente está presente en el sistema de origen.

Si el dato viene de una captura, prueba el QR, link compartible, formulario, popup u opt-in de checkout exacto que usó el cliente.

Sigue leyendo: [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## 3. Si falta el evento

Si el perfil existe pero la actividad no está ahí, revisa la fuente del evento.

Para integraciones:

- Confirma que la integración soporte ese evento.
- Confirma que el evento ocurrió después de conectar la integración.
- Revisa si la fuente usa otro nombre de evento o estado.
- Dale tiempo a la integración para sincronizar antes de probar de nuevo.

Para tracking con Hellotext.js o API:

- Confirma que el script o llamada de API corre en el sitio, checkout, backend o app correcto.
- Confirma que el request se envía al negocio o ambiente correcto.
- Mantén consistentes los nombres de acciones, como `product.viewed`, `cart.abandoned` u `order.placed`.
- Incluye el identificador que Hellotext necesita para asociar el evento con el perfil del cliente.
- Incluye las propiedades requeridas de producto, carrito, orden o campos personalizados cuando el playbook o reporte dependen de ellas.
- Prueba con un evento y confirma que aparece antes de enviar más tráfico.

Pequeñas diferencias en nombres de acciones o identificadores del cliente pueden crear señales separadas que no coinciden con el disparador, segmento o reporte que esperabas.

Sigue leyendo: [Seguimiento de eventos]({% link _developers/tracking-events.md %}).

## 4. Si el evento existe pero no pasa nada

Una señal puede existir sin disparar un mensaje, actualización de segmento o cambio de reporte.

Revisa la regla que debería haber usado la señal.

Para segmentos:

- El segmento usa la misma acción, propiedad, lista, tag, canal o regla de consentimiento.
- El evento es lo suficientemente reciente para cualquier regla basada en tiempo.
- El perfil del cliente es elegible para el segmento.
- El segmento se actualizó o recalculó después de la actividad.

Para playbooks o rutas:

- El disparador usa el mismo nombre de señal y propiedades.
- El playbook o ruta está activo.
- El cliente coincide con la audiencia y condiciones del disparador.
- El cliente está suscrito o es elegible para el canal.
- Límites de frecuencia, horarios silenciosos, condiciones de detención u otro playbook activo no bloquearon el siguiente paso.
- Los datos requeridos de producto, carrito, orden, canal o perfil están lo suficientemente completos para que el playbook actúe.
- El camino de fallback, no resuelto o asignación está configurado cuando la automatización no puede continuar.

Para campañas:

- El cliente estaba en la audiencia al momento del envío.
- El canal y remitente estaban disponibles.
- El cliente era elegible para ese tipo de mensaje.
- El mensaje no se omitió por consentimiento, límites, plantilla o reglas del canal.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## 5. Si reportes o atribución no se ven bien

Si la actividad ocurrió pero los reportes no muestran lo esperado, revisa el camino de medición.

Revisa:

- Si el mensaje usó links con tracking.
- Si el cliente hizo click desde el mismo perfil que luego compró o convirtió.
- Si la compra, orden, devolución, cancelación o conversión fue sincronizada.
- Si las reglas de atribución aplican para ese canal y timing.
- Si otro click comercial o acción comercial humana ocurrió antes de la compra.
- Si la actividad de prueba está filtrada, demorada o es fácil de confundir con tráfico real.
- Si estás comparando el mismo rango de fechas, canal, campaña, playbook o audiencia.

Sigue leyendo:

- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})

## Síntomas comunes

| Síntoma | Dónde revisar primero |
| --- | --- |
| Falta el perfil del cliente | Tienda, integración, captura, importación o identidad de API |
| La actividad aparece en el perfil equivocado | Email, teléfono, ID externo, perfiles duplicados o identidad enviada por la fuente |
| El evento nunca aparece | Sync de integración, Hellotext.js, request de API, nombre de acción o ambiente |
| El evento aparece pero el segmento no cambia | Reglas del segmento, ventana de tiempo, nombres de propiedades o momento de actualización |
| El playbook no empezó | Disparador, audiencia, elegibilidad del canal, consentimiento, condiciones de detención o estado activo |
| Las métricas del reporte se ven bajas | Links con tracking, rango de fechas, reglas de atribución, canal, audiencia u órdenes sincronizadas |
| El mensaje de WhatsApp/SMS no se envió | Configuración del canal, remitente, consentimiento, plantilla, límites o estado de entrega |

## Cuando contactes a soporte

Si el problema todavía no queda claro, incluye:

- Un perfil del cliente afectado.
- El evento o señal exacta que esperabas.
- El segmento, playbook, ruta, campaña o reporte afectado.
- La hora aproximada en que ocurrió la actividad.
- El sistema de origen, integración, request de API o camino de captura involucrado.
- Capturas o links que muestren qué esperabas y qué apareció en su lugar.
- Cambios recientes en integraciones, scripts de tracking, plantillas, reglas de audiencia o configuración de playbooks.

Cuanto más específico sea el ejemplo, más rápido soporte puede encontrar si el problema está en configuración, identidad, tracking, elegibilidad, reportes o atribución.

## Guías relacionadas

- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %})
