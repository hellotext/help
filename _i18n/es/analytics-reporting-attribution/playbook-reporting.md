Usa esta guía después de que un playbook, agente de IA o ruta haya estado activo suficiente tiempo como para reunir actividad real de clientes.

Reportar un playbook no significa mirar un solo número. Revisa ingresos, performance, atribución y señales operativas juntas para entender si el playbook está creando valor, generando carga para el equipo o perdiendo las señales que necesita.

## Por dónde empezar

Empieza por el reporte que responde la pregunta que tienes.

Usa el reporte de **Ingresos** cuando quieres entender ventas atribuidas, la diferencia entre campañas y playbooks, y qué playbooks o rutas generaron ingresos.

Usa el reporte de **Performance** cuando quieres comparar tasa de conversión, tiempo hasta conversión y tasa de derivación entre playbooks, canales, campañas, conversaciones asistidas por IA y conversaciones asistidas por personas.

Usa el **Inbox** y el historial de conversaciones cuando necesitas entender por qué un playbook derivó, qué preguntó el cliente y si la derivación le dio suficiente contexto al equipo.

Antes de comparar resultados, elige el rango de fechas correcto y confirma que el playbook tuvo suficiente tráfico para aprender algo.

## Revisa ingresos de playbooks

En el reporte de Ingresos, mira:

- **Ingresos impulsados por IA**, cuando Hellotext puede conectar la venta con una interacción o playbook asistido por IA.
- **Ingresos impulsados por humanos**, cuando la participación de una persona del equipo influyó en la venta atribuida.
- **Ingresos totales**, para entender el monto atribuido completo.
- **Desglose por playbook**, para comparar flujos por ingresos atribuidos.
- **Campañas vs Playbooks**, para entender si los envíos puntuales o los flujos siempre activos están generando más ventas atribuidas.
- **Sección de Playbooks**, para comparar ingresos, comportamiento de conversión, mensajes entregados y alcance de clientes por flujo.

Usa reportes de ingresos para responder preguntas como:

- ¿Qué playbook o ruta produce más ingresos atribuidos?
- ¿Los ingresos vienen de playbooks autónomos, conversaciones asistidas por personas o campañas?
- ¿Algunos canales, audiencias o flujos rinden mejor que otros?
- ¿El playbook necesita mejores datos de producto, timing, lógica de oferta o reglas de derivación?

Si un playbook tiene ingresos fuertes pero muchas derivaciones humanas, igual puede ser valioso. Revisa si esas derivaciones son esperadas, rentables y llegan a la persona o equipo correcto.

## Revisa performance y derivaciones

Usa el reporte de Performance para entender si un playbook está sano, no solo si produjo ingresos.

Revisa:

- **Tasa de conversión**, para comparar con qué frecuencia las conversaciones o flujos llegan al resultado esperado.
- **Tiempo hasta conversión**, para ver cuánto tardan los clientes en convertir después de que empieza la interacción.
- **Tasa de derivación**, para ver con qué frecuencia el playbook necesita ayuda humana.
- **Desglose por playbook**, para comparar flujos lado a lado.
- **Desglose IA vs humano**, para entender cómo influyen la automatización y la participación del equipo.

Una tasa alta de derivación no siempre es mala. Puede significar que el playbook está enviando correctamente a una persona conversaciones sensibles, clientes enojados, productos defectuosos o casos no resueltos. Se vuelve un problema cuando el mismo tema se deriva una y otra vez porque al playbook le falta conocimiento, contexto, permisos o un siguiente paso claro.

## Usa evidencia de atribución

Los reportes y exports de ingresos te ayudan a explicar por qué Hellotext atribuyó una venta.

Al revisar atribución, mira:

- La campaña, ruta o playbook conectado con la venta.
- El canal y la fuente que influyeron en el cliente.
- Si la interacción fue impulsada por IA, por una persona o por ambos.
- La razón de atribución y la evidencia disponible.
- Si hubo otro punto de contacto comercial antes de la compra.

Usa [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) cuando necesites entender ventanas de atribución, comportamiento de last-click, cancelaciones, devoluciones o intervención humana.

## Compara playbooks con cuidado

Compara playbooks solo cuando el contexto sea suficientemente parecido.

Antes de decidir, revisa:

- El mismo rango de fechas.
- Tamaño de audiencia y tráfico similares.
- Mezcla de canales comparable.
- Si el playbook estuvo activo durante todo el período.
- Si el playbook tenía las señales, datos de producto y políticas que necesitaba.
- Si una campaña, descuento, fecha especial o evento de la tienda cambió el resultado.

Evita juzgar un playbook con IA nuevo contra una ruta madura demasiado rápido. Los primeros resultados suelen revelar conocimiento faltante, prompts débiles o reglas de derivación poco claras antes de mostrar el rendimiento de largo plazo.

## Soluciona resultados débiles o confusos

Usa el patrón que ves para decidir qué revisar después.

| Si ves... | Revisa... |
| --- | --- |
| Poca o ninguna actividad | Disparadores, señales, elegibilidad de audiencia, canal listo y si el playbook está activo. |
| Mensajes entregados pero pocas conversiones | Timing, oferta, claridad del mensaje, relevancia del producto y si la audiencia es demasiado amplia. |
| Muchas conversaciones no resueltas | Prompt del agente, documentos cargados, datos de producto, políticas y reglas de derivación. |
| Mucho ingreso impulsado por humanos | Si la derivación es esperada y si el playbook debería responder más antes de derivar. |
| Ingresos atribuidos faltantes | Tracking, links, eventos de órdenes, ventanas de atribución y si otro canal recibió crédito por last-click. |
| Muchas bajas o respuestas negativas | Calidad de audiencia, consentimiento, frecuencia, tono y relevancia de la oferta. |

Si faltan señales o actividad, usa [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}) antes de juzgar el playbook.

## Qué ajustar después

Ajusta una cosa por vez para que el siguiente reporte sea más fácil de interpretar.

Mejoras comunes:

- Acotar la audiencia o disparador.
- Mejorar el prompt o conocimiento cargado para un agente de IA.
- Sumar datos faltantes de producto, políticas, órdenes o perfil de cliente.
- Ajustar esperas, condiciones o ramas de la ruta.
- Cambiar el mensaje, oferta o lógica de recomendación.
- Actualizar reglas de derivación para que la conversación llegue a la persona o equipo correcto.
- Agregar tracking o configuración de atribución cuando el reporte no puede ver el camino completo.

Después de cambiar un playbook, dale suficiente tiempo y tráfico antes de comparar de nuevo.

## Guías relacionadas

- [Resumen de playbooks y automatización]({% link _journeys/playbooks-overview.md %})
- [Elige tu primer playbook]({% link _journeys/choose-your-first-playbook.md %})
- [Biblioteca de playbooks por misión]({% link _journeys/playbook-library-by-mission.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Mide el éxito en tus primeros 7 días]({% link _getting-started/measure-success-first-7-days.md %})
