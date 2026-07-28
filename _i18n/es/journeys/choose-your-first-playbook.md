Tu primer playbook debería validar un objetivo de negocio claro antes de ampliar.

En Hellotext, un playbook puede ser una misión preconstruida, un agente de IA, una ruta, una campaña o una captura según el trabajo que realiza. Empieza con la opción más simple que pueda lograr el objetivo y darte aprendizaje útil.

## Antes de elegir

Confirma primero lo básico:

- Tu tienda, sitio web o fuente de datos está conectada.
- Las señales que necesita el playbook están disponibles en los perfiles de cliente.
- El canal que quieres usar, como WhatsApp o SMS, está conectado y listo.
- La audiencia tiene consentimiento claro y suficiente actividad reciente para que el lanzamiento tenga sentido.
- Alguien de tu equipo puede revisar respuestas o derivaciones.

Si la señal todavía no está disponible, configura tracking o integraciones antes de elegir un playbook que dependa de ella.

Sigue leyendo: [Qué son las señales]({% link _journeys/what-are-signals.md %}).

Para recuperación de carritos específicamente, mira [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}), [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) y [Carrito abandonado: plantilla de ruta vs playbook con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

Si quieres explorar más opciones antes de elegir, usa [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %}).

Después de elegir la primera opción para lanzar, sigue [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %}).

## Elige por primer objetivo

| Si tu primer objetivo es... | Empieza con... | Por qué |
| --- | --- | --- |
| Crecer tu audiencia alcanzable o conversaciones desde el sitio | Una captura como [Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %}), código QR, link compartible, formulario, popup o impulsor de suscriptores | Necesitas que los clientes se suscriban o inicien una conversación antes de que muchos playbooks, rutas o campañas puedan rendir bien. |
| Recuperar carritos | [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) o un playbook de carrito con IA | Usa una ruta cuando el seguimiento debería ser predecible. Usa un playbook con IA cuando la experiencia debería reaccionar al producto, intención del cliente, respuestas u objeciones. |
| Avisar cuando productos vuelven a stock | [Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}) | Úsalo cuando clientes pidieron aviso por un producto no disponible y tus señales de stock son confiables. |
| Avisar a compradores interesados por una baja de precio | [Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %}) | Úsalo cuando los cambios de precio del catálogo son confiables y Hellotext puede ver interés reciente de producto, carrito o recomendación. |
| Sugerir productos que combinan con lo que compradores eligieron o vieron | [Completa el Look]({% link _journeys/complete-the-look-playbook.md %}) | Úsalo cuando tu catálogo tiene productos que combinan, accesorios compatibles, looks, kits o rutinas claras. |
| Convertir nuevos suscriptores o visitantes que miran sin comprar | [Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}), [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) o [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) | Estos playbooks funcionan mejor cuando Hellotext puede ver señales de producto, navegación, suscripción y compra. |
| Impulsar recompra | [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}), [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}), [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}), cumpleaños o aniversario | Necesitan suficiente historial de compras o datos de perfil para que el timing y la recomendación sean útiles. |
| Recuperar clientes inactivos | [Reactivación de Inactivos]({% link _journeys/dormant-revival-playbook.md %}) o [Último Intento]({% link _journeys/sunset-saver-playbook.md %}) | Usa Reactivación de Inactivos alrededor de 3 meses sin actividad. Usa Último Intento alrededor de 12 meses sin actividad o sin reactivarse. |
| Recopilar reseñas de productos después de la entrega | [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) | Úsalo cuando los datos de entrega y producto son confiables y quieres calificaciones, reseñas escritas, seguimiento de calificaciones bajas y registros exportables. |
| Medir lealtad después de la entrega | [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) | Úsalo cuando las señales de pedido entregado son confiables y quieres una señal de recomendación de 0 a 10 a nivel relación. |
| Responder preguntas frecuentes o reducir carga de soporte | [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}), [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}), [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) o [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) | Empieza aquí cuando tu equipo responde preguntas repetidas y tienes políticas, datos de pedidos y reglas de derivación claras. |
| Medir satisfacción después de conversaciones resueltas | [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) | Úsalo cuando conversaciones de soporte, Inbox, IA o playbooks pueden cerrarse y el feedback negativo debería crear seguimiento. |
| Enviar un anuncio puntual | Una campaña o broadcast | Usa una campaña cuando el mensaje tiene una fecha o momento concreto y debe enviarse una sola vez a una audiencia seleccionada. |
| Crear un flujo a medida | Una ruta o [agente personalizado]({% link _journeys/custom-agent-playbook.md %}) | Usa esto cuando ninguna misión preconstruida encaja, o cuando necesitas pasos, condiciones, acciones o lógica de negocio específica. |

## Empieza pequeño

Elige un primer objetivo, un canal y una audiencia.

Para un primer lanzamiento, evita habilitar varios playbooks de ingresos para la misma audiencia al mismo tiempo. Si varios playbooks pueden actuar sobre el mismo cliente para el mismo tipo de momento, se vuelve más difícil entender qué funcionó, qué molestó a los clientes y qué debería cambiar.

Los playbooks de feedback son un poco distintos porque escuchan momentos diferentes. [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}), [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) y [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}) pueden convivir cuando las señales de entrega, las señales de conversación resuelta y los responsables de seguimiento están claros.

Los buenos primeros lanzamientos suelen ser acotados:

- Recuperar carritos abandonados para una audiencia elegible pequeña.
- Dar la bienvenida a nuevos suscriptores desde una sola fuente de captura.
- Responder un grupo de preguntas frecuentes con una derivación humana clara.
- Enviar una campaña a un segmento enfocado.
- Reponer o recomendar productos solo cuando los datos de compra y producto son confiables.

## Usa la herramienta más simple que encaje

Usa una **campaña** cuando ya sabes la audiencia, mensaje y momento de envío.

Usa una **ruta** cuando la experiencia debería seguir pasos conocidos: disparador, espera, mensaje, condición, rama y derivación.

Usa un **playbook con IA o agente** cuando Hellotext necesita interpretar respuestas, usar conocimiento de productos o políticas, personalizar recomendaciones, elegir entre varios siguientes pasos o decidir cuándo derivar.

Usa una **captura** cuando el trabajo principal es recopilar suscriptores, datos de clientes o conversaciones desde el sitio antes de que otro playbook pueda correr.

## Preguntas antes de lanzar

- ¿Qué resultado de negocio debería validar este primer lanzamiento?
- ¿Qué señal lo inicia?
- ¿Qué audiencia puede entrar?
- ¿Qué canal va a usar?
- ¿Qué debería detenerlo?
- ¿Cuándo debería tomar la conversación una persona?
- ¿Cómo vas a medir si funcionó?

Si alguna respuesta no está clara, acota el playbook antes de publicarlo.

Cuando las respuestas estén claras, pasa a [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %}) para configurarlo, probarlo y encenderlo con cuidado.

## Después del primer lanzamiento

Revisa los primeros resultados antes de sumar más automatización.

Mira respuestas, clicks, bajas, derivaciones, mensajes fallidos, conversión, ingresos atribuidos y si los clientes recibieron el siguiente paso que esperabas.

Después ajusta una cosa por vez: audiencia, disparador, timing, mensaje, oferta, prompt o regla de derivación. Para una lectura más profunda, usa [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %}).

## Guías relacionadas

- [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %})
- [Primeros logros recomendados]({% link _getting-started/first-wins-starter-pack.md %})
- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Playbook Widget de Webchat]({% link _journeys/webchat-widget-playbook.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %})
- [Playbook Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %})
- [Playbook Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %})
- [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Playbook Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Playbook Completa el Look]({% link _journeys/complete-the-look-playbook.md %})
- [Playbook Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Playbook Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Playbook Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Playbook Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Playbook Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Playbook Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Playbook Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Playbook Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Playbook Agente Personalizado]({% link _journeys/custom-agent-playbook.md %})
- [Carrito abandonado: plantilla de ruta vs playbook con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen de campañas y broadcasts]({% link _campaigns/campaigns-overview.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
