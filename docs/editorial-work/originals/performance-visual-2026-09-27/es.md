Usa el Reporte de rendimiento para ver qué proporción de interacciones tiene una conversión registrada, cuánto tardaron en convertir las que no tuvieron una Derivación explícita de IA y qué proporción se derivó a una persona.

Ábrelo desde la tarjeta **Reporte de rendimiento** dentro de **Rendimiento del negocio** en el Dashboard.

## Cómo cuenta los resultados este reporte

Las tasas del reporte agrupan los registros de interacción según su fecha de inicio, no por cliente único. Una interacción puede existir incluso sin una conversación asociada. Una conversión o Derivación registrada después se asigna a la fecha en que comenzó esa interacción.

Por ejemplo: **Interacción iniciada el 7 de abril → IA la deriva el 8 de abril → Se registra una conversión el 10 de abril.** Esa interacción puede contar en las tasas de conversión y Derivación del 7 de abril. Como fue derivada, no entra en el promedio visible de **Tiempo de conversión**.

**Tasa de conversión** y **Tasa de Derivación** dividen sus respectivos recuentos entre todas las interacciones iniciadas en el período. **Tiempo de conversión** usa una población más estrecha: interacciones convertidas sin Derivación explícita de IA. Las series y los desgloses tampoco muestran siempre la misma medida que la tarjeta principal; interpreta cada vista según su cálculo.

Las fechas recientes pueden cambiar cuando se registran conversiones o Derivaciones posteriores para interacciones ya iniciadas. Compara cohortes con la misma antigüedad antes de atribuir una caída reciente a un cambio de rendimiento.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### Tasa de conversión

Es el porcentaje de interacciones iniciadas en el período que tienen una conversión registrada. El numerador cuenta esas interacciones convertidas y el denominador incluye todas las interacciones iniciadas en el período.

La conversión puede provenir de una compra atribuida o de una meta registrada manualmente por un colaborador. Si se registra más tarde, puede aumentar la tasa de la fecha anterior en que comenzó la interacción.

Esta tasa no es la tasa de compra de toda la tienda ni un recuento de clientes únicos. Usa el Reporte de ingresos cuando necesites compras e ingresos por fecha de compra.

### Tiempo de conversión

La tarjeta principal muestra el tiempo promedio desde el inicio hasta la conversión registrada **entre las interacciones convertidas sin Derivación explícita de IA**. El reporte calcula por separado el promedio de las interacciones derivadas, pero esa segunda cifra no aparece en la tarjeta ni en la serie principal.

Una persona pudo haber participado en una interacción sin Derivación, así que esta cifra no equivale necesariamente a trabajo hecho sólo por IA. Un valor menor indica conversiones más rápidas dentro de esa población; por sí solo no demuestra una mejor experiencia. Si no hubo conversiones elegibles, un valor de cero tampoco demuestra una conversión instantánea.

### Tasa de Derivación

Es el porcentaje de interacciones iniciadas en el período en las que la IA solicitó explícitamente que una persona tomara el control. El numerador cuenta interacciones con Derivación registrada y el denominador incluye todas las interacciones iniciadas en el período.

La participación humana por sí sola no cuenta como Derivación. Un colaborador puede responder, tomar responsabilidad o ayudar durante una conversación sin cambiar esta métrica cuando la IA no solicitó el traspaso.

Una Derivación no es automáticamente una falla. Revisa la interacción y sus reglas antes de decidir si el traspaso fue apropiado.

Consulta [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}) para conocer las formas disponibles de Derivación.

## Usa los desgloses

Los desgloses ofrecidos dependen de la métrica seleccionada. En los que tienen cálculo implementado, el gráfico muestra **recuentos**: interacciones convertidas para **Tasa de conversión** y **Tiempo de conversión**, o interacciones derivadas para **Tasa de Derivación**. Esos valores no son una tasa ni un tiempo promedio por categoría.

El selector ofrece estas opciones para **Tasa de conversión** y **Tiempo de conversión**:

- canal;
- Misión;
- Campaña; o
- IA frente a humano.

Para **Tasa de Derivación**, el selector ofrece:

- canal;
- Misión;
- Campaña;
- motivo;
- equipo;
- colaborador; o
- agente de IA.

El desglose **IA frente a humano** clasifica por vínculos con Campaña o flujo de automatización y, en otros casos, por colaborador asociado; no separa las interacciones según si hubo Derivación. No lo compares directamente con los dos gráficos de duración. Para calcular una tasa por canal o Misión, necesitas además el total de interacciones iniciadas en esa categoría.

Las opciones **motivo**, **equipo** y **agente de IA** aparecen para Derivación, pero no tienen un cálculo de desglose en este reporte. Un resultado vacío allí no demuestra que no hubo Derivaciones. **Colaborador** puede mostrar el recuento de interacciones derivadas asociadas a una persona; las no asignadas no aparecen en ese grupo.

## Entiende los gráficos de duración

Debajo de **Tiempo de conversión**, los gráficos **Solo IA** y **Gestionado por el equipo** distribuyen interacciones con un intervalo de duración asignado desde su inicio hasta el evento que las cerró. **Incluyen interacciones cerradas sin conversión**, por lo que no son una distribución exclusiva de ventas o metas logradas.

- **Solo IA:** no hubo Derivación explícita de IA. Un colaborador pudo haber participado sin que se registrara un traspaso.
- **Gestionado por el equipo:** la IA registró una Derivación, haya o no una conversión posterior.

Cada gráfico muestra el recuento y la proporción **dentro de su propio grupo** para los intervalos que la interfaz llama:

- el mismo día;
- en 1–3 días;
- en 4–7 días;
- en 8–30 días; o
- en 30 días o más.

En este cálculo, «el mismo día» significa menos de 24 horas transcurridas, no necesariamente la misma fecha del calendario. El intervalo queda fijado cuando termina la interacción; una conversión registrada después no lo recalcula. No uses estos gráficos como desglose del promedio de **Tiempo de conversión**, que sólo incluye interacciones convertidas sin Derivación.

## Compara Rendimiento con otros reportes

Usa el reporte cuya base temporal responda tu pregunta:

| Pregunta | Reporte |
| --- | --- |
| ¿Qué conversiones y Derivaciones se registraron para las interacciones iniciadas en este período? | Reporte de rendimiento |
| ¿Qué ingresos se registraron por compras de este período? | Reporte de ingresos |
| ¿Cómo rindió una Misión según cada una de sus métricas? | Reporte de la Misión |
| ¿Qué entregas, clics y compras atribuidas ocurrieron durante este período? | Reporte de la Campaña |
| ¿Cómo se resolvieron las conversaciones y cumplieron el SLA? | Reporte de calidad de servicio |

Rendimiento agrupa por fecha de inicio de la interacción; Ingresos, por fecha de compra. El detalle de campaña cuenta cada evento en su propia fecha, incluida una compra atribuida en la fecha de compra. Los reportes de misiones combinan métricas por fecha de evento con algunas métricas de ingresos y conversión agrupadas por fecha del mensaje de origen acreditado. Revisa la regla de cada métrica antes de comparar períodos.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Baja la Tasa de conversión | Si faltan conversiones registradas, si cambió el volumen de interacciones iniciadas y qué muestran los registros de origen. Un recuento por canal no es una tasa por canal. |
| Aumenta el Tiempo de conversión | Las interacciones convertidas sin Derivación y sus fechas de inicio y conversión. Los gráficos de duración incluyen también cierres sin conversión. |
| Aumenta la Tasa de Derivación | Interacciones representativas, reglas de traspaso y contexto de Misión o canal. Un desglose vacío por motivo o equipo no es una prueba de cero. |
| Una Misión muestra más conversiones | Su volumen total de interacciones antes de concluir que aumentó la tasa. |
| Un colaborador aparece en muchas Derivaciones | Las asignaciones y la capacidad del equipo en los reportes operativos antes de atribuirle toda la carga. |
| La conversión reciente parece más baja | Si las cohortes comparadas tuvieron el mismo tiempo para registrar resultados. |

Abre las interacciones y conversaciones representativas antes de cambiar una Misión, un prompt, una fuente de conocimiento, una regla de enrutamiento o un equipo de destino. El reporte señala un patrón; los registros de origen ayudan a explicar la causa.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- los inicios de interacciones estén registrados con la fecha correcta;
- la conversión esté registrada en la interacción, ya sea por atribución de una compra o por una meta cargada manualmente;
- las Derivaciones explícitas de IA tengan su evento registrado; la participación humana sin ese evento no cambia la tasa;
- el contexto de canal, Misión, Campaña o colaborador esté presente para el desglose que quieres leer; y
- ambas comparaciones usen el mismo período, zona horaria y métrica, teniendo en cuenta si comparas una tarjeta, una serie o un recuento desglosado.

Si una compra aparece en Ingresos pero no como conversión en Rendimiento, revisa si quedó vinculada a una interacción registrada; los dos reportes no tienen la misma población. Si la tarjeta y la serie de **Tiempo de conversión** difieren cerca del último día del rango, verifica las fechas de las interacciones sin Derivación antes de sacar una conclusión. Si los registros existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
