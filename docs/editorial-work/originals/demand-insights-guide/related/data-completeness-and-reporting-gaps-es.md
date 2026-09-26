Usa esta guía cuando una tarjeta del Dashboard, métrica, desglose o venta atribuida falta o no coincide con otra vista de Hellotext o sistema externo.

Una diferencia no siempre es una falla de tracking. Dos vistas pueden usar períodos, poblaciones, fechas, monedas, denominadores o reglas de atribución diferentes. Define qué mide cada número antes de cambiar la integración.

## Define la diferencia exacta

Registra ambos lados de la comparación:

- Negocio y reporte de Hellotext.
- Métrica y desglose seleccionados.
- Fechas de inicio y finalización.
- Zona horaria del negocio y usuario.
- Moneda de reporte.
- Filtro de canal, campaña, misión, ruta, equipo o segmento.
- Valor mostrado en Hellotext y valor esperado de la otra fuente.
- Un cliente, pedido, conversación o evento que demuestre la diferencia.

Evita reportar solamente que “los ingresos están mal” o “faltan datos”. Un registro concreto permite determinar si la diferencia comenzó en la recolección, identidad, elegibilidad del reporte o atribución.

## 1. Iguala el período y la definición

Confirma que ambas vistas midan lo mismo.

### Iguala el período

El resumen del Dashboard y la tabla de Acciones siempre usan los últimos 14 días. Los reportes detallados tienen su propio selector y pueden usar 7, 14, 30 días o un período personalizado.

Usar las mismas fechas es necesario, pero no suficiente. También debes confirmar en qué evento se basa el período seleccionado.

### Entiende cómo cuenta los resultados cada reporte

Los reportes de Hellotext pueden asignar un resultado a uno de estos tres tipos de fecha:

- **La fecha de la actividad de origen:** algunas métricas agrupan resultados posteriores por el mensaje o la conversación que los originó, aunque el resultado ocurra otro día.
- **La fecha en que ocurrió el resultado:** el período selecciona compras, reseñas, resoluciones u otros eventos completados dentro de ese rango.
- **El estado actual:** la sección muestra qué es cierto en el momento indicado, como la carga actual, los seguimientos pendientes o la pertenencia a una audiencia.

El reporte o la sección debe explicar qué fecha utiliza. Estas son las reglas más comunes:

| Reporte o sección | Fecha usada por el período seleccionado |
| --- | --- |
| Dashboard | Los ingresos usan la fecha de compra, la actividad usa la fecha de cada evento y las tarjetas de estado actual reflejan el momento indicado. |
| Reporte de ingresos | Fecha de compra. Las filas de campañas y misiones identifican la fuente acreditada para compras completadas durante el período seleccionado. |
| Reporte detallado de una campaña | Los envíos, entregas, clics y compras atribuidas se cuentan en la fecha de cada evento. La etapa Interacción del embudo exige que la entrega y un clic rastreado ocurran dentro del período seleccionado. |
| Reporte de una misión | Envíos, entregas y clics usan la fecha de cada evento; las métricas de ingresos y conversión pueden agrupar compras por la fecha del mensaje de origen acreditado. |
| Rendimiento, Conversaciones y Calidad de servicio | Fecha de inicio de la conversación. La conversión, derivación, resolución y satisfacción posteriores siguen a la conversación de origen. |
| Ingresos por canal en el Reporte de ingresos | Fecha de compra de la venta atribuida; el canal identifica el origen acreditado. |
| Insights de demanda | Fecha en que terminó la interacción elegible clasificada como demanda no satisfecha. |
| Reseñas y feedback | El feedback recibido usa la fecha de envío de la respuesta; el rendimiento de recopilación usa la fecha de entrega de la solicitud; los seguimientos pendientes muestran el estado actual. |
| Carga y capacidad | El trabajo atendido y resuelto usa la fecha de cada acción; la cola, el backlog y el riesgo muestran el estado actual. |

Por ejemplo, si un mensaje de una misión se envía el 7 de abril y el cliente realiza una compra atribuida el 10 de abril, una métrica de ingresos agrupada por mensaje de origen puede mostrarla el 7. El Reporte de ingresos la cuenta el 10. Si el mensaje pertenece a una campaña, su reporte detallado también cuenta la compra el 10.

La regla que asigna la fecha no extiende ni reemplaza la ventana de atribución. En las métricas agrupadas por origen, una compra posterior se agrega a la fecha del mensaje solo cuando cumple las reglas de atribución de Hellotext.

### Iguala la definición de la métrica

Algunos números que suelen confundirse son:

- **Ingresos totales:** ingresos de comercio disponibles para Hellotext durante el período, incluidos ingresos atribuidos y no atribuidos.
- **Ingresos atribuidos:** ingresos elegibles acreditados a Hellotext según su metodología de atribución.
- **Tasa de conversión:** numerador específico de un reporte dividido entre su población elegible correspondiente.
- **CTR:** clicks registrados divididos entre mensajes entregados cuando se aplica esa definición.
- **Conversaciones:** conversaciones iniciadas, no mensajes, clientes únicos ni la cola actual del Inbox.
- **Monto de una acción:** valor monetario incluido en ocurrencias de una acción, no ingresos atribuidos automáticamente.

No compares dos porcentajes hasta confirmar que usen el mismo numerador y denominador.

## 2. Sigue un registro de principio a fin

Elige un cliente, compra, conversación o evento faltante y síguelo a través del camino de medición.

### Confirma el perfil del cliente

En **Audiencia**, verifica que:

- el perfil exista en el negocio correcto;
- su teléfono, email, ID externo o identidad conectada sea correcta;
- perfiles duplicados no hayan dividido la actividad;
- la propiedad, estado de suscripción, lista o segmento esperado esté presente; y
- la actividad aparezca en el perfil esperado y no en otro cliente.

Cuando el click queda en un perfil y la compra en otro, el reporte puede no conectar el recorrido aunque ambos eventos existan.

### Confirma el evento de origen

Busca el evento que necesita la métrica:

- mensaje enviado o entregado;
- click en un link con tracking;
- inicio, asignación, derivación o resolución de conversación;
- vista de producto, carrito o checkout;
- compra o conversión personalizada;
- cancelación, reembolso o pedido de reemplazo; o
- acción personalizada y valor monetario esperado en la tabla de Acciones.

Si el evento no aparece en la actividad del cliente, el problema ocurre antes del reporte. Revisa la tienda conectada, canal, captura, implementación de Hellotext.js, solicitud de API o integración personalizada.

### Confirma el contexto del evento

Un evento puede existir y aun así no incluir el contexto requerido por el reporte. Revisa el identificador del cliente, referencia de pedido o producto, canal, origen de campaña o misión, moneda, monto, estado y fecha.

Para tracking personalizado, usa el nombre exacto de acción esperado por Hellotext. Pequeñas variaciones pueden crear acciones separadas y dividir los resultados.

## 3. Revisa la elegibilidad del reporte

Después de confirmar el evento, revisa si pertenece a la métrica que estás analizando.

### Dashboard

- En las métricas históricas, el evento debe estar dentro del período fijo de 14 días.
- Los ingresos atribuidos necesitan un registro de atribución positivo y activo.
- El benchmark de ingresos también necesita ingresos totales de comercio para el período.
- Conversaciones cuenta inicios de conversaciones, no el estado actual de la cola.
- La tabla de Acciones muestra acciones con eventos registrados en el período.

### Reportes de campañas

- En el reporte detallado, cada envío, entrega, clic y compra atribuida se cuenta si ese evento ocurre dentro del período seleccionado.
- Las métricas de entrega necesitan un resultado de entrega registrado.
- El CTR necesita clics registrados durante el período y mensajes entregados para su denominador.
- La conversión y los ingresos necesitan una compra atribuida elegible dentro del período; la entrega original puede haber ocurrido antes. Si no hay entregas en el rango, la tasa de conversión puede mostrarse en cero aunque haya una compra atribuida.

### Reportes de misiones y rendimiento

- La misión, la ruta o el agente debe estar en actividad y recibir tráfico elegible.
- Debe registrarse el evento requerido de disparador, interacción, conversión, derivación o resolución.
- El reporte de una misión combina métricas por fecha de evento con ingresos agrupados por mensaje de origen; el Reporte de rendimiento agrupa resultados por la fecha de inicio de la conversación. Revisa la regla de cada métrica antes de comparar períodos.
- Un desglose por canal, misión, IA frente a personas o equipo necesita esa dimensión en la actividad de origen.

### Reportes de operaciones

- La calidad de servicio depende del ciclo y datos de resolución de las conversaciones.
- Las métricas de SLA necesitan los registros correspondientes de respuesta y tiempos.
- Carga y capacidad dependen de asignaciones, transferencias, atención, resolución, equipos y personas.
- La presión operativa es una instantánea actual y no está restringida por el período histórico seleccionado en otras partes del reporte.

### Insights de demanda

Insights de demanda necesita interacciones finalizadas que el reporte clasifique como demanda no satisfecha. Los desgloses requieren datos de la dimensión elegida; el historial de pedidos puede afectar la estimación de ingresos perdidos. Una pregunta del cliente en Inbox no se convierte automáticamente en una señal de demanda no satisfecha.

## 4. Revisa la atribución por separado

Un pedido puede aparecer en ingresos totales sin atribuirse a Hellotext.

Para una venta atribuida faltante, verifica que:

- Hellotext haya recibido la compra o evento monetario positivo.
- La compra esté conectada con el cliente y pedido esperados.
- Exista una campaña, ruta, misión, click, entrega, recomendación o interacción comercial elegible.
- La evidencia esté dentro de su ventana de atribución.
- Una fuente externa reconocida no haya tenido precedencia.
- La propiedad humana del checkout o actividad comercial no haya cambiado la decisión aplicable.
- Una cancelación, reembolso, reemplazo o fuente posterior más fuerte no haya revocado o ajustado la atribución.

Hellotext selecciona la atribución según la evidencia disponible y no acredita el monto completo de forma independiente a cada campaña y misión que interactuó con el cliente.

Consulta [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) antes de tratar un pedido no atribuido como un evento faltante.

## Comparaciones que no coinciden directamente

| Comparación | Por qué puede ser diferente |
| --- | --- |
| Dashboard vs reporte detallado | El Dashboard usa 14 días fijos; el reporte tiene su propio período y métrica. |
| Reporte de una misión vs Reporte de ingresos | Una métrica de ingresos de la misión puede agrupar la compra por fecha del mensaje de origen; Ingresos la incluye en su fecha de compra. Otras métricas de la misión usan la fecha de cada evento. |
| Reporte detallado de una campaña vs Reporte de ingresos | Ambos cuentan la compra en su fecha, pero el primero muestra las ventas atribuidas a esa campaña; Ingresos incluye las demás fuentes y también puede mostrar ingresos totales. |
| Ingresos totales de Hellotext vs ingresos de la tienda | Hellotext solo puede reportar los pedidos y actualizaciones compatibles que recibió; también pueden diferir la fecha, moneda, estado, duplicados, reembolsos, impuestos, envío o definiciones netas/brutas. |
| Ingresos totales vs ingresos atribuidos | Los ingresos totales incluyen ingresos de comercio no atribuidos; la atribución necesita evidencia elegible de Hellotext. |
| Monto de Acciones vs Reporte de ingresos | Una acción puede incluir dinero sin representar ingresos canónicos de pedidos ni recibir atribución. |
| CTR de campaña vs tasa de conversión | El CTR mide interacción registrada; la conversión mide compras atribuidas elegibles frente a su población de entrega. |
| Ingresos de campaña vs ingresos de misiones | La precedencia selecciona la fuente elegible acreditada en lugar de duplicar la venta entre todos los puntos de contacto. |
| Conversaciones vs carga del Inbox | El Dashboard cuenta inicios; el reporte de operaciones mide asignaciones, carga activa, atención, transferencias y resoluciones. |
| Reporte actual vs exportación anterior | Eventos atrasados, atribución abierta, cancelaciones, reembolsos o correcciones de origen pueden actualizar el reporte después de generar la exportación. |

## Concilia ingresos con un sistema externo

Compara pedidos individuales antes de comparar totales.

1. Exporta o identifica el mismo período en ambos sistemas.
2. Usa referencias de pedidos e identificadores de clientes para hacer coincidir registros.
3. Confirma qué fecha del pedido determina su inclusión.
4. Compara la moneda y comportamiento de conversión.
5. Revisa si los totales incluyen impuestos, envío, descuentos, cancelaciones, reembolsos, pedidos de prueba o pedidos duplicados y de reemplazo.
6. Separa los ingresos totales faltantes de la atribución faltante.
7. Usa la exportación del Reporte de ingresos cuando necesites el motivo de atribución de Hellotext y contexto de respaldo para las filas acreditadas.

Documenta la definición acordada de comparación para que la próxima conciliación use las mismas reglas.

## Entiende los resultados recientes y cambiantes

Los resultados recientes pueden cambiar porque:

- las ventanas de atribución continúan abiertas;
- un pedido o conversión llega después de la interacción original;
- un canal o integración de comercio termina de procesar datos atrasados;
- un pedido se cancela, reembolsa o reemplaza;
- llega evidencia de origen más fuerte; o
- una corrección de identidad conecta actividad que estaba separada.

En las métricas agrupadas por mensaje de origen o inicio de conversación, una fecha reciente puede seguir creciendo mientras su ventana de resultados o atribución continúe abierta. Usa un período anterior cuyas ventanas ya hayan cerrado para comparaciones más estables. Para campañas actuales o misiones siempre activas, considera provisionales los primeros resultados.

## Cuándo contactar a Soporte

Si el evento de origen existe con el contexto requerido pero el reporte esperado todavía no lo incluye, envía a Soporte:

- ID del negocio y URL del reporte;
- métrica, desglose y período exacto;
- zona horaria del negocio y usuario;
- ID del perfil, pedido, conversación, campaña o misión;
- nombre y fecha del evento;
- integración de origen o camino de API;
- valor esperado y valor real; y
- capturas o exportaciones que muestren ambos lados de la comparación.

Usa uno o dos registros representativos en lugar de un total amplio sin ejemplos. No incluyas contraseñas, secretos de API ni datos innecesarios del cliente.

Si falta el evento, primero sigue [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía de Insights de demanda]({% link _analytics-reporting-attribution/demand-insights-guide.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
