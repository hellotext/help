Usa esta guía cuando quieres un seguimiento de carrito abandonado predecible, que tu equipo pueda revisar paso por paso.

Recuperador de Carritos es una plantilla de ruta. Empieza con actividad de carrito abandonado o checkout, espera, revisa si el cliente compró y envía un recordatorio fijo cuando las condiciones de la ruta todavía aplican.

No es un agente de IA. Sigue la ruta que publicas.

## Qué hace Recuperador de Carritos

Recuperador de Carritos ayuda a recuperar carritos abandonados con una secuencia simple y controlada.

Puede:

- Empezar cuando Hellotext recibe una señal de carrito abandonado o checkout.
- Esperar antes de enviar el primer recordatorio.
- Revisar si el cliente ya compró antes de enviar.
- Enviar un recordatorio con texto fijo, personalización, link de checkout y una oferta si agregas una.
- Detenerse cuando el cliente compró, una condición no coincide o la ruta no tiene más pasos para ejecutar.
- Permitir que tu equipo edite timing, mensaje, condición, canal y pasos extra antes de publicar.

La plantilla exacta puede variar según cuenta y despliegue, así que revisa la ruta que estás por publicar en lugar de asumir que todos los negocios tienen los mismos pasos.

## Cuándo usarlo

Usa Recuperador de Carritos cuando quieres control y una secuencia conocida.

Encaja bien cuando:

- Quieres uno o dos recordatorios fijos después de que se abandona un carrito.
- El timing debería ser igual para la mayoría de los clientes.
- El mensaje, link de checkout, cupón, canal y condición de detención ya están claros.
- Quieres inspeccionar cada paso antes del lanzamiento.
- No necesitas que la IA interprete respuestas, responda preguntas, recomiende alternativas o elija entre varios siguientes pasos.

Si la recuperación de carrito debería reaccionar al contexto de producto, respuestas del cliente, objeciones, recomendaciones o decisiones de derivación, usa [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}).

Si el cliente solo vio productos y nunca agregó nada al carrito o checkout, usa [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %}).

## Qué necesita antes del lanzamiento

Antes de publicar la ruta, confirma lo básico.

Revisa que:

- Tu integración de tienda o checkout esté conectada.
- La actividad de carrito abandonado o checkout aparezca en los perfiles de cliente correctos.
- El disparador de la ruta coincida con la señal que envía tu tienda.
- El canal esté conectado y listo.
- Los clientes tengan consentimiento y sean elegibles para el canal.
- Los links de checkout funcionen en una prueba.
- Cualquier cupón, descuento u oferta funcione antes de que el mensaje quede activo.
- Una señal de compra u orden pueda detener el seguimiento después de que el cliente compra.
- Los reportes estén listos para revisar entradas, envíos, clicks, compras y fallas.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Cómo configurarlo

Ve a **Playbooks**, haz click en **Explorar playbooks** y elige **Recuperador de Carritos**.

Revisa la ruta generada antes de publicarla.

Presta especial atención a:

- **Disparador:** la actividad de carrito o checkout que inicia la ruta.
- **Paso de espera:** cuánto espera Hellotext antes del recordatorio.
- **Condición de compra:** cómo la ruta revisa si el cliente ya compró.
- **Mensaje:** texto, personalización, link de checkout, cupón, remitente y canal.
- **Camino de salida:** qué pasa cuando el cliente compró o ya no coincide con la ruta.
- **Pasos extra:** cualquier segundo recordatorio, condición, asignación o etiqueta que agregue tu equipo.

Mantén simple la primera versión. Es más fácil medir un recordatorio claro que entender una ruta larga de recuperación con varias ramas.

No agregues requisitos de prompt o intenciones a esta ruta. Eso pertenece a agentes de IA o agentes personalizados, no a una ruta básica de Recuperador de Carritos.

## Cómo se diferencia de Recuperador de Carritos con IA

Recuperador de Carritos sigue la ruta que publicas.

Recuperador de Carritos con IA toma decisiones más dinámicas.

Usa Recuperador de Carritos cuando el camino debería ser predecible: esperar, revisar compra, enviar un recordatorio y luego detenerse o continuar por los pasos que definiste.

Usa Recuperador de Carritos con IA cuando Hellotext debería usar más contexto antes de decidir qué hacer después, como detalles de producto, respuestas del cliente, objeciones, recomendaciones, preparación del canal o derivación.

Para una comparación completa, mira [Carrito abandonado: plantilla de ruta vs playbook con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %}).

## Por qué puede no enviar

Publicar la ruta no garantiza que cada carrito abandonado reciba un recordatorio.

La ruta puede no enviar cuando:

- La señal de carrito abandonado no llegó.
- La actividad no está conectada a un perfil de cliente usable.
- El disparador de la ruta no coincide con el evento que envía tu tienda.
- El perfil no puede ser alcanzado en el canal elegido.
- El cliente se dio de baja, no tiene consentimiento o no es elegible.
- La condición de la ruta detecta que el cliente ya compró.
- El link de checkout, cupón o personalización no es válido.
- El canal, remitente, plantilla de WhatsApp o formato del mensaje no está listo.
- Horarios silenciosos, límites de frecuencia u otra regla de envío demoran o bloquean el mensaje.
- Otro flujo de recuperación de carrito ya está manejando la misma audiencia.

Para un diagnóstico paso a paso, usa [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %}).

## Cómo probarlo

Prueba la ruta con un camino pequeño antes de publicarla ampliamente.

Usa un perfil de cliente de prueba que tenga consentimiento de canal, luego:

- Crea o abandona un carrito con productos reales.
- Confirma que la actividad de carrito o checkout aparezca en el perfil del cliente.
- Confirma que el disparador de la ruta coincida con la actividad.
- Acorta la espera temporalmente en una versión de prueba si necesitas feedback más rápido.
- Confirma que la condición de compra evite el recordatorio después de una compra de prueba.
- Confirma que el link de checkout abra el carrito correcto.
- Confirma que cualquier cupón aplique correctamente.
- Envía una respuesta y confirma que llegue al Inbox si tu equipo debería manejar respuestas.
- Revisa ejemplos enviados, omitidos, fallidos y convertidos después del lanzamiento.

Si cambiaste timing, texto, cupón o condiciones durante la prueba, vuelve a revisar esos ajustes antes de publicar.

## Qué revisar después del lanzamiento

Durante la primera semana, revisa:

- Cuántos perfiles de cliente entraron en la ruta.
- Cuántos recordatorios se enviaron, omitieron, fallaron o quedaron esperando.
- Si links de checkout y cupones funcionaron.
- Si las compras ocurrieron antes o después del recordatorio.
- Respuestas, bajas y preguntas de soporte.
- Clicks, ingresos atribuidos y conversión.
- Si esta ruta se superpone con Recuperador de Carritos con IA u otro flujo de recuperación de carrito.

Ajusta una parte por vez: espera, texto del mensaje, oferta, audiencia, canal o condición de detención.

## Guías relacionadas

- [Playbook Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %})
- [Playbook Recuperación de Navegación]({% link _journeys/browse-recovery-playbook.md %})
- [Carrito abandonado: plantilla de ruta vs playbook con IA]({% link _journeys/abandoned-cart-route-vs-ai-playbook.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Soluciona un playbook que no se disparó o no envió]({% link _journeys/troubleshoot-a-playbook-that-did-not-trigger-or-send.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
