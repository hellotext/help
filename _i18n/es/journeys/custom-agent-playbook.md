Usa esta guía cuando necesitas un agente de IA para un trabajo de negocio específico que un playbook preconstruido de Hellotext no cubre.

Agente Personalizado es un playbook reactivo con IA. Escucha las intenciones que defines, sigue tus instrucciones, usa conocimiento aprobado, responde en los canales de entrada seleccionados y deriva cuando no debería seguir automáticamente.

No es una ruta. No construyes una secuencia fija de esperas, mensajes, condiciones y ramas. Defines qué trabajo tiene el agente, qué debería activarlo, qué conocimiento puede usar y quién debería tomar la conversación cuando hace falta una persona.

## Qué hace Agente Personalizado

Agente Personalizado te ayuda a crear uno o varios agentes de IA especializados.

Puede:

- Activarse cuando un mensaje del cliente coincide con una de las intenciones que defines.
- Seguir un prompt personalizado para una misión específica.
- Usar documentos cargados, sitios web aprobados u otras fuentes de conocimiento habilitadas.
- Responder en los canales de entrada que permites.
- Usar el tono que eliges para el agente.
- Derivar a la persona o equipo configurado cuando el cliente necesita ayuda humana.
- Trabajar junto a otros playbooks activos, siempre que cada uno tenga un trabajo claro.

Agente Personalizado funciona mejor cuando cada agente tiene una misión acotada. Un buen agente personalizado no es "responder cualquier cosa". Es más cercano a "responder preguntas de garantía para esta línea de productos", "calificar pedidos mayoristas", "ayudar a elegir una rutina de skincare" o "manejar preguntas sobre retiro en tienda".

## Cuándo usarlo

Usa Agente Personalizado cuando el trabajo es conversacional, reactivo y específico.

Encaja bien cuando:

- Ningún playbook preconstruido coincide suficientemente bien con el trabajo.
- Necesitas varios agentes que se activen por distintas intenciones del cliente.
- El agente necesita instrucciones propias de tu negocio.
- La respuesta depende de políticas cargadas, notas de producto, guías de talle, reglas de garantía, información de tiendas o sitios web aprobados.
- El agente debería responder primero y derivar solo cuando el caso es sensible, no resuelto o está fuera de alcance.
- Una ruta sería demasiado rígida porque el cliente puede pedir lo mismo de muchas formas.

## Cuándo no usarlo

No uses Agente Personalizado solo porque es flexible.

Usa un playbook preconstruido cuando la misión ya existe. Por ejemplo:

- Usa [Recomendador Inteligente]({% link _journeys/smart-recommender-playbook.md %}) para descubrimiento y recomendación de productos.
- Usa [Seguimiento de Pedidos]({% link _journeys/order-update-playbook.md %}) para estado de pedidos y envíos.
- Usa [Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %}) para preguntas comunes de soporte que pueden responderse con conocimiento aprobado.
- Usa [Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %}) para soporte guiado de cambios o devoluciones cuando la misión preconstruida encaja.
- Usa [Recuperador de Carritos con IA]({% link _journeys/ai-cart-saver-playbook.md %}) o [Ruta Recuperador de Carritos]({% link _journeys/cart-saver-route.md %}) para recuperar carritos abandonados.

Usa una [ruta]({% link _journeys/getting-started-with-journeys.md %}) cuando la experiencia debe seguir pasos explícitos, esperas, preguntas, condiciones, asignaciones y ramas.

Usa una campaña cuando el mensaje debería enviarse una vez a una audiencia seleccionada. Usa una captura cuando el trabajo es recopilar suscriptores o datos del perfil del cliente.

## Qué necesita antes del lanzamiento

Antes de habilitar un agente personalizado, confirma la configuración de la que depende.

Revisa que:

- El agente tenga una misión clara.
- Las intenciones sean suficientemente específicas y no se solapen demasiado con otros agentes o playbooks activos.
- El prompt explique qué debería hacer el agente, qué no debería hacer y cuándo debería derivar.
- Los documentos cargados o sitios aprobados estén actualizados y no se contradigan.
- Los canales de entrada seleccionados estén conectados y listos.
- El agente tenga un owner de derivación configurado.
- Tu equipo sepa cómo revisar conversaciones respondidas, no resueltas o derivadas.

Para validar la configuración, usa [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %}).

## Qué puedes configurar

Abre **Playbooks**, haz click en **Explorar playbooks** y elige **Agente Personalizado**.

Las tarjetas disponibles pueden variar, pero podrías revisar:

- **Intenciones:** necesidades o frases del cliente que deberían activar el agente.
- **Prompt del agente:** misión, instrucciones, límites, guía de tono y reglas de derivación.
- **Documentos cargados:** políticas, notas de producto, preguntas frecuentes, guías de talle, reglas de garantía, instrucciones operativas u otro contexto aprobado.
- **Canales de entrada:** dónde puede responder el agente cuando los clientes escriben.
- **Derivación o asignación:** quién debería tomar la conversación cuando el agente necesita ayuda.
- **Tono:** la voz usada en las respuestas.
- **Búsqueda web o solicitud externa, cuando esté disponible:** sitios web aprobados o fuentes externas de datos que el agente puede usar para esta misión.

Mantén la selección automática de canales salvo que tengas una razón clara para limitar el agente. La mayoría de las cuentas no necesita cambiar canales en el primer lanzamiento.

## Define intenciones claras

Una intención es la necesidad del cliente que debería activar el agente.

Escribe las intenciones en lenguaje de cliente, no en lenguaje interno de producto. Incluye formas realistas en que un cliente pediría lo mismo.

Buenas intenciones son específicas:

- "El cliente quiere saber si un producto está cubierto por garantía."
- "El cliente quiere ayuda para elegir un regalo para un niño."
- "El cliente pregunta si hoy hay retiro en tienda."

Intenciones débiles son demasiado amplias:

- "Soporte"
- "Pregunta"
- "Productos"
- "Ayuda"

Si dos agentes personalizados tienen intenciones parecidas, los clientes pueden ir al agente equivocado. Sepáralos por misión, área de producto, canal, idioma o resultado solo cuando la diferencia sea útil y se pueda probar.

## Escribe el prompt del agente

El prompt le dice al agente cómo hacer el trabajo después de activarse.

Incluye:

- La misión del agente.
- La situación del cliente que debería manejar.
- La información que puede usar.
- Las respuestas o acciones que puede dar.
- Qué debería preguntar cuando falta información.
- Qué no debe prometer, aprobar, modificar ni decidir.
- Cuándo debería derivar a una persona o equipo.
- Cómo debería explicar la derivación al cliente.

Evita prompts que pidan al agente resolver todos los casos de soporte y venta. Si un prompt necesita demasiadas excepciones, crea un agente más acotado o usa un playbook preconstruido.

Para estructura de prompt, usa [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %}).

## Agrega conocimiento con cuidado

Los documentos cargados y sitios aprobados ayudan al agente a responder con contexto específico del negocio.

Úsalos para:

- Políticas, preguntas frecuentes, educación de producto, guías de talle, reglas de servicio, reglas de garantía e información de tiendas.
- Instrucciones estables que el equipo ya confía.
- Detalles que todavía no están disponibles mediante datos conectados de tienda, catálogo, órdenes o perfiles de cliente.

No uses archivos desactualizados, políticas contradictorias, borradores internos o afirmaciones sin respaldo. Si la fuente cambia, actualiza el documento o sitio aprobado antes de esperar que el agente responda correctamente.

El conocimiento no reemplaza los datos estructurados. Si el agente necesita estado de pedido, productos del catálogo, propiedades del perfil, consentimiento o eventos de tracking, asegúrate de que esas señales estén conectadas y actualizadas.

## Configura derivación

Los agentes personalizados deberían saber cuándo detenerse.

Configura derivación o asignación para que la persona o equipo correcto reciba conversaciones que necesitan ayuda humana.

Casos comunes de derivación incluyen:

- El cliente pide hablar con una persona.
- El cliente está enojado, frustrado o insatisfecho.
- El cliente reporta un producto defectuoso, dañado, incorrecto o faltante.
- El pedido está fuera de la misión del agente.
- El agente no puede verificar la respuesta con el conocimiento o datos disponibles.
- El cliente pide un reembolso, cancelación, excepción, cambio de cuenta, detalle de pago o acción de venta humana.
- Ningún playbook activo puede resolver el pedido de forma segura.

Para el modelo de derivación, usa [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}).

## Cómo probarlo

Prueba con mensajes realistas antes de habilitar el agente ampliamente.

Usa perfiles de cliente y canales de prueba que coincidan con tu plan de lanzamiento, luego prueba:

- Un mensaje que debería activar el agente personalizado.
- Un mensaje parecido que debería activar otro playbook.
- Un mensaje que no debería activar ningún agente personalizado.
- Un mensaje ambiguo que debería pedir una aclaración o derivar.
- Un mensaje que requiere conocimiento cargado.
- Un mensaje donde el conocimiento cargado falta o no es claro.
- Un mensaje que debería derivarse porque el cliente está molesto, reporta un producto defectuoso o pide una decisión humana.
- Un mensaje en cada canal de entrada que planeas usar.
- Un caso donde hace falta búsqueda web o una solicitud externa, si esa opción está habilitada.

Revisa si el agente se activa por las intenciones correctas, se mantiene dentro de alcance, usa la fuente adecuada, evita adivinar, formatea bien la respuesta para el canal y deriva al owner correcto.

## Qué revisar después del lanzamiento

Durante los primeros días, revisa:

- Qué mensajes de clientes activaron el agente.
- Qué mensajes deberían haber ido a otro playbook.
- Si las intenciones son demasiado amplias, demasiado estrechas o se solapan.
- Si el prompt le dio suficientes límites al agente.
- Si el conocimiento cargado respondió las preguntas reales de clientes.
- Si las derivaciones fueron esperadas y llegaron a la persona o equipo correcto.
- Si el agente respondió preguntas sin respaldo o evitó respuestas útiles que podía manejar.
- Tasa de resolución, tasa de derivación, velocidad de respuesta, respuestas de clientes, bajas, mensajes fallidos, conversión e ingresos atribuidos cuando corresponda.

Ajusta una cosa por vez: texto de intención, prompt, conocimiento cargado, sitios aprobados, selección de canal, tono o owner de derivación.

## Guías relacionadas

- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Cómo habilitar un playbook]({% link _journeys/how-to-enable-a-playbook.md %})
- [Cómo personalizar un playbook de forma segura]({% link _journeys/how-to-customize-a-playbook-safely.md %})
- [Playbook Respuestas Instantáneas]({% link _journeys/instant-answers-playbook.md %})
- [Playbook Asistente de Cambios y Devoluciones]({% link _journeys/return-and-exchange-helper-playbook.md %})
- [Cómo escribir un gran prompt para tu agente]({% link _journeys/how-to-write-a-great-prompt.md %})
- [Cómo decide Hellotext si un playbook puede enviar]({% link _journeys/how-hellotext-decides-whether-a-playbook-can-send.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
