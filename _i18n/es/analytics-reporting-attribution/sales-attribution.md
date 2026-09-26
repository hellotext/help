Hellotext vincula pedidos con campañas, misiones, rutas y otras interacciones elegibles mediante evidencia de origen, una precedencia de fuentes definida y ventanas de atribución.

La métrica resultante son los **ingresos atribuidos**: ingresos vinculados a actividad elegible de Hellotext según estas reglas.

Para revisar una venta concreta, comprueba si Hellotext registró el ingreso, si existe evidencia elegible del mismo cliente o pedido, qué fuente prevalece dentro de la ventana aplicable y cuánto del pedido admite ese camino de atribución. Una venta puede aparecer en los ingresos totales sin recibir atribución.

## Qué significan los ingresos atribuidos

Una venta se atribuye cuando Hellotext recibe un evento de ingresos elegible y puede vincularlo con evidencia de origen compatible para el mismo cliente o pedido.

Los ingresos atribuidos se usan en reportes y, cuando corresponde, en la facturación basada en rendimiento. Por sí solos, no significan que Hellotext haya causado todas las ventas atribuidas ni que el monto completo represente crecimiento incremental.

## Evidencia y precedencia de fuentes

Hellotext evalúa varios tipos de evidencia antes de asignar una atribución. El pedido o la conversión debe contener suficiente contexto de cliente, pedido y origen para vincularlo con una interacción elegible.

Cuando hay más de una fuente disponible:

1. Una fuente externa reconocida tiene precedencia, salvo que las marcas de tiempo demuestren que la evidencia elegible seleccionada de Hellotext ocurrió después. Si falta alguna marca de tiempo o hay un empate, prevalece la fuente externa.
2. La evidencia activa elegible de Hellotext tiene precedencia sobre una exposición pasiva.
3. Dentro de una misma clase de evidencia, Hellotext normalmente selecciona la evidencia elegible más reciente. Reglas deterministas resuelven empates con la misma marca de tiempo.

La evidencia activa puede incluir:

- una fuente o UTM de Hellotext vinculada con una campaña, misión o ruta;
- un clic en un enlace elegible de una campaña, misión o ruta;
- una interacción válida con una recomendación de productos.

La evidencia pasiva puede incluir:

- la entrega elegible de una campaña;
- la entrega elegible de una misión proactiva;
- una recomendación o señal de comercio válida;
- otro contexto de origen compatible registrado por Hellotext.

Un [enlace con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}) es una fuente útil de evidencia, pero no es obligatorio para todos los caminos de atribución. Del mismo modo, recibir un mensaje no hace que cualquier compra posterior se atribuya: deben cumplirse los requisitos de entrega, cliente, pedido, fuente y ventana temporal.

### ¿Puede atribuirse una venta después de una entrega, sin hacer clic?

Sí. La entrega elegible de un mensaje de campaña o misión proactiva puede respaldar una compra dentro de la ventana de entrega por defecto de 24 horas, aunque el cliente no haga clic. El mensaje debe tener una entrega registrada al mismo cliente dentro de la ventana aplicable; no se exige confirmación de lectura. La compra también debe cumplir las demás reglas de origen y atribución.

La entrega no demuestra que el cliente leyó el mensaje ni hace que todas las compras futuras sean atribuibles.

## Ventanas de atribución

Hellotext usa actualmente estas ventanas por defecto:

- **Siete días desde un clic o interacción elegible.**
- **24 horas desde una entrega o señal pasiva elegible.**

La duración de las ventanas puede configurarse por cuenta.

La ventana de siete días comienza cuando ocurre el clic o la interacción elegible. No son siete días adicionales después de las primeras 24 horas.

Algunas señales tienen su propio período de validez. No todas las entregas, canales, plantillas, rutas o misiones son elegibles para atribución pasiva.

### ¿Qué cuenta como interacción con una recomendación del catálogo de WhatsApp?

Abrir un producto recomendado a través del catálogo de WhatsApp con tracking dentro de los **diez minutos posteriores a la recomendación** puede contar como una interacción válida. El producto abierto debe coincidir con uno de los recomendados, y la actividad debe estar vinculada con el mismo cliente y ocurrir antes de la compra.

Los diez minutos determinan si la visita cuenta como interacción; no son el plazo para comprar. Una visita válida puede habilitar la ventana de sesión por defecto de siete días, medida desde esa visita. Una etiqueta genérica de tracking del catálogo o una visita a un producto no relacionado no son suficientes por sí solas.

## ¿Atribuimos el pedido completo?

**El monto depende del camino de atribución seleccionado para la compra.** La atribución por campaña y otros caminos a nivel de pedido pueden atribuir el monto del pedido. Algunos caminos de Webchat aplican límites por producto y cantidad:

- **Recomendaciones de productos de Webchat:** cuando este camino determina la atribución, solo contribuyen al monto atribuido los productos comprados que coinciden con señales de recomendación vigentes. Product Recommender también debe pasar su evaluación comercial.
- **Productos agregados al carrito desde sugerencias de conjuntos de Webchat:** cuando este camino determina la atribución, las unidades pagadas se limitan a la cantidad del producto añadida por esa acción. Las unidades que ya estaban en el carrito antes de la acción no reciben atribución por ella. Las líneas promocionales gratuitas del mismo producto se tratan por separado, como se explica abajo.

Por ejemplo, un cliente compra un producto recomendado por $40 y otro no relacionado por $60. Si se selecciona el camino de recomendación de Webchat y se aprueba la atribución, el monto atribuido es **$40**, mientras que el pedido sigue representando **$100** en los ingresos totales del comercio.

Estos límites corresponden a esos caminos de atribución de Webchat; no son un requisito de coincidencia de productos para todas las ventas de campañas o misiones. Una etiqueta de tracking de una misión de Webchat no basta por sí sola para atribuir el pedido completo sin evidencia de productos coincidentes por estos caminos.

Para estos cálculos por producto, Hellotext normalmente utiliza los montos de las líneas coincidentes del pedido. Si una línea elegible del producto respaldado tiene un total exactamente igual a cero, como una promoción gratuita, Hellotext puede contarla por separado de las unidades pagadas y valorar su cantidad al precio unitario de catálogo. Por eso, el valor atribuido puede diferir del monto pagado por esos artículos.

## Qué sucede cuando hay otra fuente de marketing

Si el pedido o la conversión contiene una fuente reconocida de otro canal de marketing, esa fuente tiene precedencia **salvo que Hellotext pueda demostrar que su evidencia elegible seleccionada ocurrió después**.

Ambas marcas de tiempo deben conocerse. Si falta alguna o son iguales, prevalece la fuente externa y Hellotext no cuenta el pedido como ingresos atribuidos a Hellotext. La evidencia posterior de Hellotext también debe pasar las demás reglas de atribución; ser posterior no basta por sí solo.

Si aparece evidencia externa más fuerte después de una atribución inicial, el motor puede revocar la atribución anterior a Hellotext y mantener el pedido dentro de los ingresos totales del comercio.

La ausencia de una fuente compatible no demuestra que Hellotext deba recibir la atribución. El pedido todavía necesita evidencia elegible de Hellotext.

## Cómo se evalúa la participación de IA y del equipo

La participación de una persona del equipo no produce un único resultado universal. La regla aplicable depende del camino de origen.

### Product Recommender: ¿quién impulsó la interacción comercial?

Product Recommender requiere actividad comercial de la IA o de la misión registrada antes de la compra y una evaluación que identifique a la IA como impulsora comercial. Esto implica evaluar acciones que acercan al cliente a la compra, en lugar de contar todos los mensajes de la conversación.

Pueden contar las recomendaciones de IA, los enlaces de productos, los enlaces de checkout y las interacciones válidas del cliente. Del lado del equipo, las acciones comerciales incluyen recomendaciones, cupones, enlaces de productos, enlaces de checkout y objetivos registrados manualmente.

- Si la última acción comercial registrada corresponde a una persona del equipo, la evaluación no otorga atribución a la IA.
- Si las últimas acciones comerciales de IA y humanas tienen marcas de tiempo idénticas, no se determina un impulsor y la evaluación no otorga atribución.
- Una toma de control humana sostenida que cumpla los requisitos también puede impedir la atribución, incluso sin un cupón o enlace individual. Esta regla revisa el tramo final e ininterrumpido de conversación dirigido por una persona: al menos diez minutos, sin pausas de más de cinco minutos entre intervenciones ni antes de la compra. La actividad de IA puede interrumpir ese tramo.
- Una respuesta exclusivamente de soporte, como contestar una consulta sobre la entrega, no cuenta por sí sola como una acción comercial humana.

La IA puede haber ayudado en una compra sin recibir la atribución.

### Campañas, propiedad del checkout y otras misiones

- **La atribución por campaña** se evalúa a partir de evidencia de origen y puede aplicarse aunque una persona del equipo complete el checkout. No utiliza la evaluación de impulsor comercial de Product Recommender.
- **Un checkout de propiedad humana** bloquea la atribución ordinaria que no sea de campaña cuando el pedido pertenece explícitamente a una persona del equipo o a un operador de comercio. La continuación demostrada de una compra atribuida anteriormente es un caso aparte de pedido de reemplazo, con un límite de monto, que se explica más abajo.
- **Otras misiones** pueden recibir atribución a partir de su contexto de origen compatible. Un enlace de checkout enviado por una persona del equipo y registrado puede requerir la evaluación comercial, aunque la plataforma de comercio no haya identificado a un propietario humano del pedido.
- **Las rutas** siguen sus reglas de contexto de origen y propiedad del checkout. No todas las ventas pasan por la misma evaluación entre IA y personas.

## Confirmaciones tardías y registros repetidos de pedidos

### ¿Por qué puede aparecer una atribución después de que termine la ventana?

Las ventanas se evalúan con los tiempos registrados de la actividad del cliente y de la conversión, no con el momento en que termina el procesamiento. Una demora en recibir o procesar un evento no crea una nueva ventana de atribución.

Cuando un pedido tiene contexto de origen y evaluación guardado antes de su confirmación, una confirmación tardía puede reutilizar ese contexto. La actividad posterior de la conversación no se convierte automáticamente en el origen de esa compra anterior.

### ¿Recibir el pedido otra vez hace que se cuente de nuevo?

Los registros repetidos del mismo pedido reconocido no crean otra atribución ordinaria. Los ingresos desglosados por artículo tampoco crean una segunda atribución a nivel de compra. Esto depende de que Hellotext reconozca el mismo pedido; un reemplazo con otro identificador sigue las reglas de continuidad que se explican a continuación.

## Cancelaciones, reembolsos y pedidos de reemplazo

Cuando Hellotext recibe una cancelación o revocación compatible para un pedido atribuido, puede eliminar el monto atribuido activo de los reportes y de los cálculos de facturación aplicables.

Si una persona del equipo o un operador de comercio crea un pedido de reemplazo para uno cancelado y Hellotext puede comprobar que continúa la compra original, la atribución trasladada se limita al menor de estos valores:

- el monto atribuido anteriormente; o
- el valor del pedido de reemplazo.

El comportamiento de reembolsos y reembolsos parciales depende de los datos de comercio que Hellotext recibe y admite. Después de un ajuste en el valor de un pedido, verifica el monto en el reporte de Ingresos y contacta a Soporte si no coincide con el pedido de origen.

## Cómo revisar una decisión de atribución

Para filas atribuidas, la exportación del reporte de Ingresos puede mostrar:

- la campaña, ruta o misión que recibió la atribución;
- el tipo y motivo de atribución;
- la fuente y el canal;
- evidencia comercial de IA y humana, cuando corresponda;
- quién impulsó la interacción comercial, cuando fue evaluado;
- una explicación en lenguaje simple;
- un enlace a la conversación o al contexto del evento.

Los recibos detallados del motor también registran los candidatos y la evidencia considerados. Cuando un pedido no atribuido o un registro anterior no muestra suficiente detalle en el reporte, contacta a Soporte con la referencia del pedido y solo el identificador del cliente que necesiten para investigarlo.

## Ingresos atribuidos y crecimiento incremental

Los ingresos atribuidos responden:

> ¿Qué ingresos se vincularon con evidencia elegible de Hellotext según la metodología de atribución?

La medición incremental responde otra pregunta:

> ¿Cuántos ingresos adicionales ocurrieron gracias a la actividad en comparación con lo que habría ocurrido de todos modos?

Hellotext no trata estas dos mediciones como equivalentes.

## Ejemplos

### Entrega de campaña sin clic

Se entrega un mensaje elegible de una campaña y el cliente compra dentro de la ventana de entrega por defecto de 24 horas. No hay una fuente externa reconocida ni un clic.

El pedido puede atribuirse a la campaña aunque el mensaje no haya incluido un enlace corto. La entrega no demuestra que el cliente leyó el mensaje.

### Evidencia de Hellotext posterior a una fuente externa

Se registra una fuente externa a las 10:00. El cliente hace clic en un enlace elegible de una campaña de Hellotext a las 11:00 y compra a las 12:00. Se conocen ambas marcas de tiempo de origen.

La evidencia posterior de Hellotext puede tener precedencia si la compra pasa las demás reglas de atribución. Si no puede establecerse la secuencia temporal de las fuentes, la fuente externa conserva la precedencia.

### Recomendación con participación de soporte

Product Recommender recomienda un producto y el cliente interactúa con esa recomendación. Luego, una persona del equipo responde una consulta exclusivamente de soporte.

La respuesta de soporte no elimina automáticamente la atribución. La decisión usa la evidencia comercial compatible y su secuencia.

### Checkout humano sin campaña

Hubo una interacción con una misión, pero una persona del equipo u operador de comercio es propietario explícito del checkout final y no hay una campaña con precedencia.

El pedido puede permanecer en los ingresos totales del comercio sin convertirse en ingresos atribuidos a Hellotext.

### Evento monetario personalizado

Se recibe un evento monetario personalizado con monto positivo, configurado como objetivo, y con contexto compatible de cliente y fuente.

Puede evaluarse para atribución si cumple las demás reglas. Un evento personalizado que no sea objetivo puede figurar en ingresos totales, pero no convertirse en ingresos atribuidos, aunque tenga un monto positivo y evidencia de origen.

## Guías relacionadas

- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de links en campañas, rutas y misiones]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Modelo de precios]({% link _billing/how-pricing-works.md %})
- [Uso y consumos del plan]({% link _billing/understanding-plan-quotas.md %})
