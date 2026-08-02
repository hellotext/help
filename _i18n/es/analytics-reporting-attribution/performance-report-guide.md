Usa el Reporte de rendimiento para entender cómo convierten las conversaciones, cuánto demora la conversión y con qué frecuencia la IA deriva explícitamente el trabajo a un colaborador.

Ábrelo desde la tarjeta **Reporte de rendimiento** dentro de **Rendimiento del negocio** en el Dashboard.

## Cómo cuenta los resultados este reporte

El período seleccionado se basa en cuándo comenzó la conversación o interacción. Una conversión o Derivación posterior permanece asignada a esa fecha de inicio.

Por ejemplo: **Conversación iniciada el 7 de abril → Derivada el 8 de abril → Compra completada el 10 de abril → Cuenta el 7 de abril.**

Esto mantiene una población consistente: la tasa de conversión, el tiempo de conversión y la tasa de Derivación siguen las conversaciones iniciadas durante el período seleccionado. Así se evita dividir compras completadas en un período entre conversaciones no relacionadas que comenzaron en otro.

Las fechas recientes pueden cambiar mientras las conversaciones sigan abiertas o su ventana de resultados no haya cerrado. Compara períodos anteriores cuando necesites resultados estables y compara períodos recientes con la misma antigüedad.

## Interpreta las métricas principales

Selecciona una métrica para actualizar la línea de tiempo y los desgloses disponibles.

### Tasa de conversión

Es el porcentaje de conversaciones dentro de la población seleccionada por fecha de inicio que resultó en una compra completada y registrada por Hellotext.

El numerador y denominador siguen la misma población de origen. Una compra completada después puede aumentar la tasa de conversión de la fecha anterior en que comenzó la conversación.

La tasa de conversión no es la conversión total de la tienda. Incluye los registros elegibles de conversaciones e interacciones disponibles para este reporte. Usa el Reporte de ingresos cuando necesites compras por fecha de compra o los ingresos totales registrados.

### Tiempo de conversión

Es el tiempo promedio entre el inicio de una conversación y su compra completada entre las conversaciones con una conversión registrada.

Un valor menor significa que las conversiones ocurrieron antes para esa población. Por sí solo no significa que la experiencia haya sido mejor: la complejidad del producto, consideración de compra, canal, Campaña y Playbook pueden cambiar el tiempo esperado.

### Tasa de Derivación

Es el porcentaje de conversaciones donde la IA solicitó explícitamente que una persona tomara el control, sin importar el motivo.

La participación humana por sí sola no cuenta como Derivación. Un colaborador puede responder, tomar responsabilidad o ayudar durante una conversación sin cambiar esta métrica cuando la IA no solicitó el traspaso.

Una Derivación no es automáticamente una falla. Los Playbooks de venta y atención pueden derivar porque el cliente está enojado, informa un producto defectuoso, necesita una respuesta no compatible, coincide con una regla de Derivación o requiere que una persona o equipo continúe.

Consulta [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %}) para conocer las formas disponibles de Derivación.

## Usa los desgloses

Los desgloses disponibles dependen de la métrica seleccionada.

Para **Tasa de conversión** y **Tiempo de conversión**, compara por:

- canal;
- Playbook;
- Campaña; o
- IA frente a humano.

Para **Tasa de Derivación**, compara por:

- canal;
- Playbook;
- Campaña;
- motivo;
- equipo;
- colaborador; o
- agente de IA.

Usa una dimensión por vez cuando investigues un cambio. Una diferencia por canal puede venir de la intención del cliente o su comportamiento de compra; una diferencia por Playbook puede venir de su misión; y una diferencia por equipo puede venir del tipo de Derivaciones que recibe.

## Entiende la distribución del Tiempo de conversión

La distribución separa las conversaciones convertidas entre **Solo IA** y **Gestionado por el equipo**.

- **Solo IA:** el camino de conversión no incluyó una Derivación explícita de IA. Un colaborador todavía puede haber participado sin tomar el control mediante una Derivación.
- **Gestionado por el equipo:** la IA derivó explícitamente la conversación antes del resultado.

Cada gráfico muestra la proporción y cantidad de conversaciones que convirtieron:

- el mismo día;
- en 1–3 días;
- en 4–7 días;
- en 8–30 días; o
- después de más de 30 días.

Usa la distribución junto con el promedio. Dos períodos pueden tener un promedio similar aunque uno contenga muchas conversiones en el mismo día y un grupo menor de conversiones muy tardías.

## Compara Rendimiento con otros reportes

Usa el reporte cuya base temporal responda tu pregunta:

| Pregunta | Reporte |
| --- | --- |
| ¿Cómo rindieron finalmente las conversaciones iniciadas durante este período? | Reporte de rendimiento |
| ¿Cuántos ingresos se compraron durante este período? | Reporte de ingresos |
| ¿Cómo rindió la población activada por un Playbook específico? | Reporte del Playbook |
| ¿Cómo rindió la población que recibió una Campaña específica? | Reporte de la Campaña |
| ¿Cómo se resolvieron las conversaciones y cumplieron el SLA? | Reporte de calidad de servicio |

La misma compra puede aparecer en fechas diferentes entre estos reportes por diseño. Rendimiento usa la fecha de inicio de la conversación, Ingresos usa la fecha de compra y los reportes de fuentes usan su propia fecha de activación o entrega.

## Convierte el reporte en una acción

| Si ves... | Revisa... |
| --- | --- |
| Baja la Tasa de conversión | Canal, Playbook, Campaña, camino de IA frente a humano, señales de compra y si los pedidos se conectan con el perfil de cliente correcto. |
| Aumenta el Tiempo de conversión | Distribución, mezcla de canales, complejidad de compra, seguimiento demorado y si las Derivaciones esperan demasiado a un colaborador. |
| Aumenta la Tasa de Derivación | Motivo, Playbook, agente de IA, canal, equipo de destino, conocimiento faltante y reglas de Derivación. |
| Un Playbook convierte bien pero lentamente | Si el período de consideración más largo es esperable para su misión antes de cambiar mensajes o lógica. |
| Un equipo recibe muchas Derivaciones | Destinos de enrutamiento, capacidad del equipo, intenciones repetidas y si la IA debería resolver más de esas solicitudes. |
| La conversión reciente parece más baja | Si las conversaciones comparadas tuvieron el mismo tiempo para convertir antes de sacar una conclusión. |

Abre conversaciones representativas antes de cambiar un Playbook, prompt, fuente de conocimiento, regla de enrutamiento o equipo de destino. El reporte identifica un patrón; el historial de la conversación y atribución explica la causa.

## Cuando faltan datos o parecen incorrectos

Confirma que:

- los inicios de conversaciones o interacciones estén registrados con la fecha correcta;
- las compras lleguen desde la fuente de eCommerce conectada y se vinculen con el perfil de cliente correcto;
- las compras elegibles se relacionen con la interacción de origen según las reglas de atribución de Hellotext;
- el contexto de Playbook, Campaña, canal, agente de IA, equipo y colaborador esté presente cuando corresponda;
- las Derivaciones explícitas de IA registren el evento y destino; y
- ambas comparaciones usen el mismo período, zona horaria, métrica y desglose.

Si una compra aparece en Ingresos pero no en Rendimiento, revisa si tiene una interacción de origen elegible. Si los registros de origen existen pero el reporte sigue siendo inconsistente, consulta [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}).

## Guías relacionadas

- [Guía del Dashboard]({% link _analytics-reporting-attribution/dashboard-guide.md %})
- [Guía del Reporte de ingresos]({% link _analytics-reporting-attribution/revenue-report-guide.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Reportes de playbooks]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Guía del Reporte de calidad de servicio]({% link _analytics-reporting-attribution/service-quality-report-guide.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
