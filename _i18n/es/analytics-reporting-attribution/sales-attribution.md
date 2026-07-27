Hellotext vincula pedidos con campañas, playbooks, rutas y otras interacciones elegibles mediante evidencia de origen, una precedencia de fuentes definida y ventanas de atribución.

La métrica resultante son los **ingresos atribuidos**: ingresos vinculados a actividad elegible de Hellotext según estas reglas.

## Qué significan los ingresos atribuidos

Una venta se atribuye cuando Hellotext recibe un evento de ingresos elegible y puede vincularlo con evidencia de origen compatible para el mismo cliente o pedido.

Los ingresos atribuidos se usan en reportes y, cuando corresponde, en la facturación basada en performance. Por sí solos, no significan que Hellotext haya causado todas las ventas atribuidas ni que el monto completo represente crecimiento incremental.

## Evidencia y precedencia de fuentes

Hellotext evalúa varios tipos de evidencia antes de asignar una atribución. El pedido o la conversión debe contener suficiente contexto de cliente, pedido y origen para vincularlo con una interacción elegible.

Cuando hay más de una fuente disponible:

1. Una fuente externa reconocida en el pedido o la conversión tiene precedencia sobre la atribución a Hellotext.
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

## Ventanas de atribución

Hellotext usa actualmente estas ventanas por defecto:

- **Siete días desde un clic o interacción elegible.**
- **24 horas desde una entrega o señal pasiva elegible.**

La duración de las ventanas puede configurarse por cuenta.

La ventana de siete días comienza cuando ocurre el clic o la interacción elegible. No son siete días adicionales después de las primeras 24 horas.

Algunas señales tienen su propio período de validez. No todas las entregas, canales, plantillas, rutas o playbooks son elegibles para atribución pasiva.

## Qué sucede cuando hay otra fuente de marketing

Si el pedido o la conversión contiene una fuente reconocida de otro canal de marketing, esa fuente externa tiene precedencia y Hellotext no cuenta el pedido como ingresos atribuidos a Hellotext.

Si aparece evidencia externa más fuerte después de una atribución inicial, el motor puede revocar la atribución anterior a Hellotext y mantener el pedido dentro de los ingresos totales del comercio.

La ausencia de una fuente compatible no demuestra que Hellotext deba recibir la atribución. El pedido todavía necesita evidencia elegible de Hellotext.

## Cómo se evalúa la participación de IA y del equipo

La participación de una persona del equipo no produce un único resultado universal. La regla aplicable depende del camino de origen.

- La evidencia de una campaña se evalúa directamente y no utiliza la evaluación de driver comercial de Product Recommender.
- Un checkout que pertenece explícitamente a una persona del equipo o a un operador de comercio puede bloquear atribuciones que no sean de campaña.
- En los flujos de Product Recommender, Hellotext puede evaluar acciones comerciales explícitas de IA y humanas antes de la compra, como recomendaciones, cupones, links de productos, links de checkout e interacción elegible del cliente.
- Una respuesta exclusivamente de soporte no se trata automáticamente como una acción comercial humana.
- Una toma de control humana sostenida puede afectar la decisión de Product Recommender aunque no se haya registrado un cupón o link individual.
- Otros playbooks y rutas siguen sus propias reglas de contexto de origen y no deben describirse como si todas las ventas pasaran por la misma evaluación entre IA y personas.

La participación humana, la asistencia comercial, la propiedad del checkout y el resultado final de atribución son datos relacionados, pero distintos.

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

### Entrega elegible de una campaña sin clic

Un cliente recibe un mensaje elegible de una campaña y compra dentro de la ventana de entrega por defecto de 24 horas. No hay una fuente externa reconocida.

El pedido puede atribuirse a la campaña aunque el mensaje no haya incluido un link corto.

### Compra después de un clic

Un cliente hace clic en un link elegible de Hellotext y compra seis días después.

El pedido puede ser elegible porque ocurrió dentro de los siete días desde el clic. La ventana comienza en el clic, no cuando termina la ventana de entrega.

### Fuente externa al comprar

Un cliente interactuó antes con Hellotext, pero el pedido contiene una fuente reconocida de otro canal de marketing.

El pedido no se atribuye a Hellotext porque la fuente externa tiene precedencia.

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

- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de links en campañas, rutas y playbooks]({% link _developers/tracking-on-campaigns-and-journeys.md %})
- [Modelo de precios]({% link _billing/how-pricing-works.md %})
- [Uso y consumos del plan]({% link _billing/understanding-plan-quotas.md %})
