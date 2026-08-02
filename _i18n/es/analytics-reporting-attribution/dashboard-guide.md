El Dashboard ofrece una vista rápida de la actividad reciente del negocio y acceso a los reportes para analizarla en profundidad. Úsalo para detectar un cambio y luego abre el reporte correspondiente para entender su origen.

El Dashboard combina cuatro áreas:

- un resumen fijo de 14 días;
- acciones registradas de clientes;
- un calendario de campañas; y
- reportes de rendimiento del negocio y operaciones.

## Comienza por los avisos y onboarding

Hellotext puede mostrar un checklist de onboarding o avisos de la cuenta antes de las métricas. Revísalos primero porque una conexión incompleta, autorización vencida de un canal o problema de la cuenta puede afectar los envíos y datos que aparecen más abajo.

Completar un paso del onboarding no demuestra que se hayan importado datos históricos ni que todas las señales estén llegando. Después de conectar una fuente, verifica un cliente, evento y pedido recientes antes de depender del Dashboard.

## Interpreta el resumen de 14 días

Las tarjetas del resumen siempre incluyen el día actual y los 13 días anteriores. Su cambio porcentual compara ese total con el período previo de 14 días. El gráfico pequeño muestra los valores diarios dentro del período actual.

Cambiar la fecha dentro de un reporte detallado no modifica estas tarjetas del Dashboard.

### Ingresos atribuidos

Los **Ingresos atribuidos** son los ingresos positivos que Hellotext vinculó con campañas, rutas, playbooks o interacciones comerciales elegibles según sus reglas y ventanas de atribución.

Selecciona la tarjeta para abrir el **Reporte de ingresos** y revisar el resultado en mayor detalle.

Los ingresos atribuidos no son lo mismo que:

- todos los ingresos registrados por la tienda conectada;
- ingresos solamente influenciados por una interacción con el cliente; o
- ingresos incrementales que no habrían ocurrido sin Hellotext.

Consulta [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para entender la evidencia, precedencia y ventanas detrás de este valor.

### Benchmark de atribución de ingresos

El **Benchmark de atribución de ingresos** muestra el porcentaje de los ingresos totales registrados que fue atribuido a Hellotext durante el mismo período de 14 días.

El marcador representa el benchmark típico de la plataforma. Úsalo como contexto, no como un objetivo garantizado. El resultado depende del modelo del negocio, campañas y playbooks activos, comportamiento de clientes, evidencia de atribución y de que Hellotext reciba todos los ingresos de pedidos.

Este porcentaje puede aparecer vacío cuando Hellotext no tiene ingresos totales para el período, aunque otra integración o reporte externo contenga ventas.

### Conversaciones

**Conversaciones** cuenta las conversaciones iniciadas durante el período de 14 días.

No representa:

- la cantidad de mensajes intercambiados;
- clientes únicos;
- conversaciones que están esperando actualmente en el Inbox; ni
- conversaciones resueltas por IA o el equipo.

Usa los reportes de operaciones para preguntas sobre resolución, SLA, asignación y carga de trabajo.

### Valores vacíos

Un guion significa que Hellotext no calculó un valor positivo para esa tarjeta en el período. No interpretes una tarjeta vacía como prueba de que nada ocurrió en el negocio. Confirma que los canales, tienda, eventos e identificadores correspondientes estén conectados y enviando datos.

## Entiende la tabla de Acciones

La tabla de **Acciones** resume tipos de eventos registrados durante los últimos 14 días. Una acción es el tipo de actividad, como una compra, suscripción, envío de formulario, evento de conversación o acción personalizada definida por el negocio.

| Columna | Qué muestra |
| --- | --- |
| **Eventos** | Cantidad de ocurrencias registradas para la acción. |
| **Valor Promedio** | Valor monetario total registrado para la acción dividido entre sus ocurrencias. |
| **Monto** | Valor monetario total registrado entre todas esas ocurrencias. |

Selecciona el encabezado de una columna para ordenar la tabla por volumen de eventos, valor promedio o monto total.

No todas las acciones incluyen dinero. Una acción válida puede tener eventos aunque su valor promedio y monto estén vacíos o en cero. Si una acción personalizada debería incluir un valor, verifica que la integración envíe el monto y moneda dentro del evento en lugar de agregarlos solamente al nombre de la acción.

La tabla de Acciones describe lo que recibió Hellotext. Por sí sola, no atribuye la acción a una campaña o playbook. Usa el reporte correspondiente cuando importen la fuente y atribución.

## Usa el calendario de campañas

El calendario organiza por semana las campañas programadas y enviadas.

- Muévete entre semanas con los controles anterior y siguiente.
- Pasa el cursor sobre una campaña para revisar su audiencia, cantidad de destinatarios, horario programado o de envío, canales y creador.
- Para campañas enviadas, el detalle también puede mostrar ingresos atribuidos y CTR.
- Selecciona una campaña programada para continuar editándola o una campaña enviada para abrir sus resultados.

El calendario contiene campañas. No es una agenda completa de todos los mensajes que podría enviar un playbook, agente de IA o ruta.

## Elige el reporte correcto

Las tarjetas de reportes se dividen entre **Rendimiento del negocio** y **Operaciones & Experiencia**.

| Reporte | Úsalo para responder |
| --- | --- |
| **Reporte de ingresos** | ¿Cuántos ingresos se registraron, cuáles se atribuyeron a IA o al equipo y qué canales, playbooks o campañas recibieron crédito? |
| **Reporte de rendimiento** | ¿Cómo están cambiando la tasa de conversión, tiempo hasta conversión y tasa de derivación? |
| **Insights de demanda** | ¿Qué solicitudes de clientes no pudieron resolverse, qué productos fueron afectados y cuántos ingresos podrían haberse perdido? |
| **Reporte de calidad de servicio** | ¿Con qué frecuencia la IA o el equipo resolvieron conversaciones, cumplieron el SLA o dejaron conversaciones sin resolver? |
| **Reporte de carga y capacidad** | ¿Cuánto trabajo está asignado, manejado, resuelto, transferido o activo entre colaboradores y equipos? |

Abre un reporte cuando necesites cambiar el período, seleccionar una métrica, comparar un desglose o revisar filas detalladas. Los desgloses disponibles dependen del reporte y métrica.

## Cambia el período de un reporte

Los reportes detallados tienen su propio selector de fechas. Las opciones habituales incluyen 7, 14 o 30 días y un rango personalizado, con más períodos disponibles dentro del selector personalizado.

Al comparar reportes:

1. Usa el mismo período.
2. Revisa qué fecha usa el reporte para asignar los resultados.
3. Aplica el mismo desglose de canal o fuente.
4. Espera que se cierren las ventanas de atribución actuales antes de tratar los resultados recientes como definitivos.

El mismo resultado puede aparecer en fechas distintas sin que ninguno de los reportes esté equivocado. Los reportes de playbooks asignan los resultados elegibles posteriores a la fecha de activación original, los reportes de campañas los asignan a la fecha de entrega original y el Reporte de ingresos usa la fecha de compra. Los reportes de rendimiento de conversaciones siguen la fecha de inicio de la conversación. Las secciones de estado actual usan el momento indicado por esa sección.

El reporte de operaciones también puede incluir una sección de presión operativa en vivo. Una instantánea en vivo describe la cola actual y no está limitada por el período histórico seleccionado para el reporte.

## Una rutina práctica de revisión

Para una revisión habitual del negocio:

1. Resuelve los avisos de cuenta o integraciones que aparecen al principio.
2. Revisa la dirección de los ingresos atribuidos y conversaciones durante 14 días.
3. Usa el benchmark para entender los ingresos atribuidos como proporción de los ingresos totales registrados.
4. Revisa Acciones para detectar caídas, aumentos o valores monetarios faltantes inesperados.
5. Consulta el calendario de campañas para revisar próximos envíos y resultados recientes.
6. Abre el reporte que responda la pregunta específica en lugar de comparar métricas principales que miden cosas diferentes.

Por ejemplo, un aumento de conversaciones con ingresos atribuidos estables no explica la causa. Abre **Rendimiento** para revisar conversión y derivación, **Calidad de servicio** para analizar resolución e **Ingresos** para revisar las fuentes de atribución.

## Soluciona datos faltantes o inesperados

Si el Dashboard parece incompleto:

- Confirma la zona horaria del negocio y usuario antes de comparar días.
- Verifica que la tienda o sistema externo continúe conectado.
- Comprueba que perfiles, pedidos, conversaciones y eventos recientes aparezcan en Hellotext.
- Confirma que los identificadores de clientes y pedidos permitan vincular la actividad con el perfil correcto.
- Revisa si una fuente externa tuvo precedencia sobre la atribución de Hellotext.
- Asegúrate de comparar los 14 días fijos del Dashboard con el mismo período dentro del reporte detallado.

Los resultados recientes pueden cambiar mientras la atribución siga abierta o lleguen datos atrasados. Si falta el evento de origen, comienza con [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Guía del Reporte de rendimiento]({% link _analytics-reporting-attribution/performance-report-guide.md %})
- [Guía del Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %})
- [Cómo interpretar los tiempos de respuesta]({% link _team/understanding-response-times.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
