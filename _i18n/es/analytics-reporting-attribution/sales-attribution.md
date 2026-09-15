Hellotext vincula pedidos con campañas, playbooks, rutas y otras interacciones elegibles mediante evidencia de origen, una precedencia de fuentes definida y ventanas de atribución.

La métrica resultante son los **ingresos atribuidos**: ingresos vinculados a actividad elegible de Hellotext según estas reglas.

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

- una fuente o UTM de Hellotext vinculada con una campaña, playbook o ruta;
- un clic en un link elegible de una campaña, playbook o ruta;
- una interacción válida con una recomendación de productos.

La evidencia pasiva puede incluir:

- la entrega elegible de una campaña;
- la entrega elegible de un playbook proactivo;
- una recomendación o señal de comercio válida;
- otro contexto de origen compatible registrado por Hellotext.

Un [link con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}) es una fuente útil de evidencia, pero no es obligatorio para todos los caminos de atribución. Del mismo modo, recibir un mensaje no hace que cualquier compra posterior se atribuya: deben cumplirse los requisitos de entrega, cliente, pedido, fuente y ventana temporal.

### ¿Puede atribuirse una venta después de ver un mensaje, sin hacer clic?

Sí. Un cliente que ve un mensaje elegible de una campaña o un playbook proactivo y compra dentro de la ventana de entrega por defecto de 24 horas puede cumplir los requisitos aunque no haga clic en un link. El mensaje debe cumplir los requisitos de entrega y visibilidad del canal, y la compra debe pasar las reglas de origen y atribución.

Ver un mensaje no hace que todas las compras futuras sean atribuibles, y la atribución no demuestra que el cliente no habría comprado de todos modos.

## Ventanas de atribución

Hellotext usa actualmente estas ventanas por defecto:

- **Siete días desde un clic o interacción elegible.**
- **24 horas desde una entrega o señal pasiva elegible.**

La duración de las ventanas puede configurarse por cuenta.

La ventana de siete días comienza cuando ocurre el clic o la interacción elegible. No son siete días adicionales después de las primeras 24 horas.

Algunas señales tienen su propio período de validez. No todas las entregas, canales, plantillas, rutas o playbooks son elegibles para atribución pasiva.

### ¿Qué cuenta como interacción con una recomendación del catálogo de WhatsApp?

Abrir un producto recomendado a través del catálogo de WhatsApp con tracking dentro de los **diez minutos posteriores a la recomendación** puede contar como una interacción válida. El producto abierto debe coincidir con uno de los recomendados, y la actividad debe estar vinculada con el mismo cliente y ocurrir antes de la compra.

Esa visita válida puede habilitar la ventana de sesión por defecto de siete días, medida desde la visita. Una etiqueta genérica de tracking del catálogo o una visita a un producto no relacionado no son suficientes por sí solas.

## ¿Atribuimos el pedido completo?

**El monto depende del camino de atribución seleccionado para la compra.** La atribución por campaña y otros caminos a nivel de pedido pueden atribuir el monto del pedido. Algunos caminos de Webchat aplican límites por producto y cantidad:

- **Recomendaciones de productos de Webchat:** cuando este camino determina la atribución, solo contribuyen al monto atribuido los productos comprados que coinciden con señales de recomendación vigentes. Product Recommender también debe pasar su evaluación comercial.
- **Productos agregados al carrito desde sugerencias de conjuntos de Webchat:** cuando este camino determina la atribución, solo contribuyen las cantidades compradas que coinciden con las respaldadas por la acción de agregar al carrito. Las unidades que ya estaban en el carrito antes de esa acción no reciben atribución por ella.

Por ejemplo, un cliente compra un producto recomendado por $40 y otro no relacionado por $60. Si se selecciona el camino de recomendación de Webchat y se aprueba la atribución, el monto atribuido es **$40**, mientras que el pedido sigue representando **$100** en los ingresos totales del comercio.

Estos límites corresponden a esos caminos de atribución de Webchat; no son un requisito de coincidencia de productos para todas las ventas de campañas o playbooks. Una etiqueta de tracking de un playbook de Webchat no basta por sí sola para atribuir el pedido completo sin evidencia de productos coincidentes por estos caminos.

Para estos cálculos por producto, Hellotext normalmente utiliza los montos de las líneas coincidentes del pedido. Si una línea elegible tiene un total de cero, como un artículo promocional gratuito, Hellotext utiliza su precio unitario de catálogo para la cantidad elegible. Por eso, el valor atribuido puede diferir del monto pagado por esos artículos.

## Qué sucede cuando hay otra fuente de marketing

Si el pedido o la conversión contiene una fuente reconocida de otro canal de marketing, esa fuente tiene precedencia **salvo que Hellotext pueda demostrar que su evidencia elegible seleccionada ocurrió después**.

Ambas marcas de tiempo deben conocerse. Si falta alguna o son iguales, prevalece la fuente externa y Hellotext no cuenta el pedido como ingresos atribuidos a Hellotext. La evidencia posterior de Hellotext también debe pasar las demás reglas de atribución; ser posterior no basta por sí solo.

Si aparece evidencia externa más fuerte después de una atribución inicial, el motor puede revocar la atribución anterior a Hellotext y mantener el pedido dentro de los ingresos totales del comercio.

La ausencia de una fuente compatible no demuestra que Hellotext deba recibir la atribución. El pedido todavía necesita evidencia elegible de Hellotext.

## Cómo se evalúa la participación de IA y del equipo

La participación de una persona del equipo no produce un único resultado universal. La regla aplicable depende del camino de origen.

### Product Recommender: ¿quién impulsó la interacción comercial?

Product Recommender requiere actividad comercial de la IA o del playbook registrada antes de la compra y una evaluación que identifique a la IA como impulsora comercial. Esto implica evaluar acciones que acercan al cliente a la compra, en lugar de contar todos los mensajes de la conversación.

Pueden contar las recomendaciones de IA, los links de productos, los links de checkout y las interacciones válidas del cliente. Del lado del equipo, las acciones comerciales incluyen recomendaciones, cupones, links de productos, links de checkout y objetivos registrados manualmente.

- Si la última acción comercial registrada corresponde a una persona del equipo, la evaluación no otorga atribución a la IA.
- Si las últimas acciones comerciales de IA y humanas tienen marcas de tiempo idénticas, no se determina un impulsor y la evaluación no otorga atribución.
- Una toma de control humana sostenida que cumpla los requisitos también puede impedir la atribución, incluso sin un cupón o link individual. Esta regla revisa el tramo final e ininterrumpido de conversación dirigido por una persona: al menos diez minutos, sin pausas de más de cinco minutos entre intervenciones ni antes de la compra. La actividad de IA puede interrumpir ese tramo.
- Una respuesta exclusivamente de soporte, como contestar una consulta sobre la entrega, no cuenta por sí sola como una acción comercial humana.

La IA puede haber ayudado en una compra sin recibir la atribución.

### Campañas, propiedad del checkout y otros playbooks

- **La atribución por campaña** se evalúa a partir de evidencia de origen y puede aplicarse aunque una persona del equipo complete el checkout. No utiliza la evaluación de impulsor comercial de Product Recommender.
- **Un checkout de propiedad humana** bloquea la atribución ordinaria que no sea de campaña cuando el pedido pertenece explícitamente a una persona del equipo o a un operador de comercio. La continuación demostrada de una compra atribuida anteriormente es un caso aparte de pedido de reemplazo, con un límite de monto, que se explica más abajo.
- **Otros playbooks** pueden recibir atribución a partir de su contexto de origen compatible. Un link de checkout enviado por una persona del equipo y registrado puede requerir la evaluación comercial, aunque la plataforma de comercio no haya identificado a un propietario humano del pedido.
- **Las rutas** siguen sus reglas de contexto de origen y propiedad del checkout. No todas las ventas pasan por la misma evaluación entre IA y personas.

## Confirmaciones tardías y registros repetidos de pedidos

### ¿Por qué puede aparecer una atribución después de que termine la ventana?

Las ventanas se evalúan con los tiempos registrados de la actividad del cliente y de la conversión, no con el momento en que termina el procesamiento. Una demora en recibir o procesar un evento no crea una nueva ventana de atribución.

Cuando un pedido tiene contexto de origen y evaluación guardado antes de su confirmación, una confirmación tardía puede reutilizar ese contexto. La actividad posterior de la conversación no se convierte automáticamente en el origen de esa compra anterior.

### ¿Recibir el pedido otra vez hace que se cuente de nuevo?

Los registros repetidos del mismo pedido reconocido no crean otra atribución ordinaria. Los ingresos desglosados por artículo tampoco crean una segunda atribución a nivel de compra. Esto depende de que Hellotext reconozca el mismo pedido; un reemplazo con otro identificador sigue las reglas de continuidad que se explican a continuación.

## Cancelaciones, reembolsos y pedidos de reemplazo

Cuando Hellotext recibe una cancelación o revocación compatible para un pedido atribuido, puede eliminar el monto atribuido activo de los reportes y de los cálculos de facturación aplicables.

Si un pedido cancelado es reemplazado y Hellotext puede comprobar que el nuevo pedido continúa la compra original, la atribución trasladada se limita al menor de estos valores:

- el monto atribuido anteriormente; o
- el valor del pedido de reemplazo.

El comportamiento de reembolsos y reembolsos parciales depende de los datos de comercio que Hellotext recibe y admite. Después de un ajuste en el valor de un pedido, verifica el monto en el reporte de Ingresos y contacta a Soporte si no coincide con el pedido de origen.

## Cómo revisar una decisión de atribución

Para filas atribuidas, la exportación del reporte de Ingresos puede mostrar:

- la campaña, ruta o playbook que recibió la atribución;
- el tipo y motivo de atribución;
- la fuente y el canal;
- evidencia comercial de IA y humana, cuando corresponda;
- el driver comercial, cuando fue evaluado;
- una explicación en lenguaje simple;
- un link a la conversación o al contexto del evento.

Los recibos detallados del motor también registran los candidatos y la evidencia considerados. Cuando un pedido no atribuido o un registro anterior no muestra suficiente detalle en el reporte, contacta a Soporte con la referencia del pedido y la información del cliente.

## Ingresos atribuidos y crecimiento incremental

Los ingresos atribuidos responden:

> ¿Qué ingresos se vincularon con evidencia elegible de Hellotext según la metodología de atribución?

La medición incremental responde otra pregunta:

> ¿Cuántos ingresos adicionales ocurrieron gracias a la actividad en comparación con lo que habría ocurrido de todos modos?

Hellotext no trata estas dos mediciones como equivalentes.

## Ejemplos

### Mensaje de campaña visto sin clic

Un cliente ve un mensaje elegible de una campaña y compra dentro de la ventana de entrega por defecto de 24 horas. No hay una fuente externa reconocida.

El pedido puede atribuirse a la campaña aunque el mensaje no haya incluido un link corto.

### Compra después de un clic

Un cliente hace clic en un link elegible de Hellotext y compra seis días después.

El pedido puede ser elegible porque ocurrió dentro de los siete días desde el clic. La ventana comienza en el clic, no cuando termina la ventana de entrega.

### Fuente externa al comprar

Un cliente interactuó antes con Hellotext, pero el pedido contiene una fuente reconocida de otro canal de marketing observada después de esa evidencia de Hellotext.

El pedido no se atribuye a Hellotext porque la fuente externa tiene precedencia.

### Evidencia de Hellotext posterior a una fuente externa

Se registra una fuente externa a las 10:00. El cliente hace clic en un link elegible de una campaña de Hellotext a las 11:00 y compra a las 12:00. Se conocen ambas marcas de tiempo de origen.

La evidencia posterior de Hellotext puede tener precedencia si la compra pasa las demás reglas de atribución. Si no puede establecerse la secuencia temporal de las fuentes, la fuente externa conserva la precedencia.

### Recomendación con participación de soporte

Product Recommender recomienda un producto y el cliente interactúa con esa recomendación. Luego, una persona del equipo responde una consulta exclusivamente de soporte.

La respuesta de soporte no elimina automáticamente la atribución. La decisión usa la evidencia comercial compatible y su secuencia.

### Checkout humano sin campaña

Hubo una interacción con un playbook, pero una persona del equipo u operador de comercio es propietario explícito del checkout final y no hay una campaña con precedencia.

El pedido puede permanecer en los ingresos totales del comercio sin convertirse en ingresos atribuidos a Hellotext.

### Evento monetario personalizado

Se recibe un evento personalizado con monto positivo y contexto compatible de cliente y fuente.

Puede evaluarse para atribución. Ser personalizado no lo excluye automáticamente, pero el evento por sí solo no es evidencia suficiente.

### Sin evidencia compatible

La compra está fuera de la ventana aplicable, no puede vincularse con el cliente o pedido, o no tiene una fuente de atribución compatible.

Los ingresos permanecen en los ingresos del comercio, pero no se atribuyen a Hellotext.

## Guías relacionadas

- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de links en campañas, rutas y playbooks]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Modelo de precios]({% link _billing/how-pricing-works.md %})
- [Uso y consumos del plan]({% link _billing/understanding-plan-quotas.md %})
