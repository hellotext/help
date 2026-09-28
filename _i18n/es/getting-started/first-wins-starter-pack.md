Usa este pack inicial cuando quieres obtener valor temprano sin activar demasiados flujos al mismo tiempo.

El objetivo es planificar algunos logros enfocados, lanzar el primero, aprender del comportamiento real de clientes y ampliar solo después de que tus datos, canales y proceso del equipo estén funcionando.

La disponibilidad exacta de misiones puede depender de tu plan, configuración de cuenta, país, canales y fuentes de datos. Usa la misión, ruta, captura o campaña disponible que más se acerque en tu cuenta.

## Planifica de 3 a 5 logros

Elige de 3 a 5 logros como lista de próximos pasos, pero lanza uno primero. No actives todas las misiones al mismo tiempo.

Planifica una secuencia que pueda cubrir el recorrido completo del cliente:

1. Crecer la audiencia.
2. Recuperar intención perdida.
3. Convertir o recomendar.
4. Reducir carga de soporte.
5. Recopilar feedback o enviar una campaña enfocada cuando tengas un momento claro.

Al avanzar de uno en uno, obtienes señales más limpias y es más fácil entender qué funcionó antes de ampliar.

## 1. Crece tu audiencia alcanzable

Empieza aquí si todavía no tienes suficientes clientes suscritos.

Usa primero un camino de captura:

- Código QR para tiendas, eventos, packaging o material impreso.
- Link compartible para redes sociales, anuncios, email y landing pages.
- Formulario web o popup para visitantes que ya están en tu sitio.
- [Widget de Webchat]({% link _captures/webchat-widget-playbook.md %}) para visitantes que quieren hacer preguntas desde el sitio.
- Opt-in de checkout cuando los clientes ya están comprando.

Logro esperado: más perfiles de cliente alcanzables y consentimiento más limpio para futuras misiones y campañas.

## 2. Recupera carritos abandonados

Empieza aquí si los abandonos detectados generan un evento `cart.abandoned` vinculado al perfil de cliente correcto.

Usa [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) cuando quieres recordatorios fijos con una espera y condición de compra configurables. Usa [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) cuando quieres que Hellotext prepare un recordatorio saliente según el carrito, los productos y el perfil, y compruebe si puede enviarlo. Si el mensaje invita a responder, prepara por separado la atención de Inbox.

Logro esperado: recuperar intención de compra que ya existe en lugar de intentar crear demanda desde cero.

Sigue leyendo: [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}), [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) y [Carrito abandonado: plantilla de ruta vs misión con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## 3. Convierte nuevos compradores o recomienda productos

Empieza aquí cuando tienes señales de producto, navegación, suscripción o compra.

Opciones útiles pueden incluir:

- Consulta la disponibilidad de [Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %}) para nuevos suscriptores que todavía no compraron.
- [Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}) para clientes que vieron productos pero no agregaron al carrito.
- [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) para responder preguntas entrantes sobre productos cuando el catálogo y el inventario son confiables.
- [Completa el Look]({% link _journeys/complete-the-look-playbook.md %}) para pedidos confirmados cuyos productos tienen ítems que combinan claramente.
- [Impulsor de Ventas Cruzadas]({% link _journeys/cross-sell-driver-playbook.md %}) o [Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %}) cuando tienes suficiente historial de pedidos.
- [Reactivación Suave]({% link _journeys/soft-reactivation-playbook.md %}) cuando clientes existentes empiezan a enfriarse, pero todavía no están completamente inactivos.

Logro esperado: mover clientes de interés a compra, recompra o pedidos de mayor valor.

## 4. Reduce carga de soporte

Empieza aquí si tu equipo responde las mismas preguntas repetidamente.

Opciones útiles pueden incluir:

- [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) para preguntas frecuentes.
- [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) cuando los clientes preguntan seguido dónde está su pedido.
- [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) cuando tu política es lo suficientemente clara para automatizar partes de la conversación.
- [Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %}) cuando las solicitudes de cancelación son frecuentes y tus reglas están claras.
- Asignación y reglas de respuesta en Inbox cuando las personas todavía necesitan hacerse cargo de las respuestas.

Logro esperado: respuestas más rápidas, derivaciones más claras y menos tickets repetitivos para tu equipo.

## 5. Recopila feedback o envía una campaña enfocada

Usa [Generador de Reseñas]({% link _journeys/review-builder-playbook.md %}) cuando recibes eventos confiables de pedido entregado, tienes datos de los productos y quieres recopilar calificaciones y reseñas escritas.

Usa [Pulso NPS]({% link _journeys/nps-pulse-playbook.md %}) cuando recibes eventos confiables de pedido entregado y quieres medir si los clientes recomendarían la marca después de esa experiencia.

Si también usas [Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %}), mantén separados los momentos de feedback: Generador de Reseñas es para reseñas de producto, Pulso NPS es para lealtad después de una experiencia de entrega y Pulso CSAT es para satisfacción después de conversaciones resueltas.

Logro esperado: entender qué productos y experiencias generan feedback positivo o negativo y usar esas señales para planificar mejoras y seguimiento humano.

Pulso NPS no inicia una recuperación automática por puntajes bajos ni ofrece un reporte de resultados propio en Misiones: confirma cómo revisar las respuestas y organiza el seguimiento por separado antes de lanzarlo. Calidad de servicio muestra la satisfacción CSAT agregada, no un reporte específico de Pulso CSAT.

Si tienes una audiencia clara, un mensaje y un momento de envío planificado, usa una campaña.

Si un producto no disponible vuelve a tener stock para clientes con interés registrado y elegible en ese producto, usa [Vuelta a Stock]({% link _journeys/back-in-stock-pounce.md %}) en lugar de una campaña amplia.

Si los clientes ya mostraron interés en un producto y el producto bajó de precio de forma relevante para ellos, usa [Alerta de Baja de Precio]({% link _journeys/price-drop-pouncer.md %}) en lugar de una campaña amplia de descuentos.

Buenas primeras campañas incluyen:

- Un lanzamiento de producto.
- Un anuncio de reposición.
- Una promoción estacional.
- Una venta corta.
- Un mensaje a un segmento pequeño de alta intención.

Logro esperado: aprender cómo responde tu audiencia al canal, mensaje, oferta y timing antes de enviar campañas más amplias.

## Qué evitar al principio

Evita:

- Activar varias misiones de ingresos para la misma audiencia al mismo tiempo.
- Lanzar antes de verificar perfiles de cliente, consentimiento y señales.
- Enviar campañas amplias antes de probar links, respuestas y comportamiento de baja.
- Usar agentes de IA sin reglas claras de derivación.
- Comparar resultados antes de que suficientes clientes hayan pasado por el flujo.

## Revisa después de 7 días

Después de la primera semana del primer lanzamiento, revisa las señales que ese flujo ya puede producir:

- Crecimiento de audiencia y fuentes de opt-in.
- Actividad de recuperación de carritos o conversión.
- Respuestas, derivaciones y preguntas de soporte.
- Clicks, pedidos e ingresos atribuidos.
- Mensajes fallidos, bajas o comportamiento inesperado.

No esperes necesariamente resultados de Generador de Reseñas o Pulso NPS en esta primera revisión: sus preguntas se programan para 7 días o más después de la entrega y las respuestas pueden llegar más tarde. Después decide qué ajustar, pausar o ampliar.

Sigue leyendo: [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %}).

## Guías relacionadas

- [Checklist de lanzamiento]({% link _getting-started/launch-checklist.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
- [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %})
- [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %})
- [Elige tu primera misión]({% link _journeys/choose-your-first-playbook.md %})
- [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %})
- [Misión Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Misión Impulsor de Primera Compra]({% link _journeys/first-purchase-driver-playbook.md %})
- [Misión Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Misión Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %})
- [Misión Impulsor de Recompra]({% link _journeys/replenishment-driver-playbook.md %})
- [Misión Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %})
- [Misión Generador de Reseñas]({% link _journeys/review-builder-playbook.md %})
- [Misión Pulso CSAT]({% link _journeys/csat-pulse-playbook.md %})
- [Misión Pulso NPS]({% link _journeys/nps-pulse-playbook.md %})
- [Misión Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Misión Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Misión Asistente de Cancelación de Pedidos]({% link _journeys/order-cancellation-assistant-playbook.md %})
- [Misión Widget de Webchat]({% link _captures/webchat-widget-playbook.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
