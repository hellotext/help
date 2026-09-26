Los reportes de campaña se generan automáticamente después de la entrega. Reúnen la entrega de mensajes, la interacción rastreada, las compras atribuidas y los ingresos atribuidos para que puedas entender qué ocurrió y qué conviene mejorar.

Para abrir uno, ve a **Campañas**, abre la vista de campañas entregadas y selecciona una campaña.

## Elige el período del reporte

El reporte se abre con **Primeros 14 días** seleccionado. Puedes cambiar a los primeros 7 o 30 días, o elegir un rango personalizado.

El período seleccionado se basa en cuándo se entregaron los mensajes de la campaña. Las métricas, el gráfico, el embudo, los resultados por mensaje y los desgloses de ingresos siguen a los mensajes entregados durante ese período. Los clicks y compras elegibles pueden ocurrir después y permanecer asignados a la fecha de entrega original.

Por ejemplo: **Mensaje entregado el 7 de abril → Compra el 10 de abril → Cuenta el 7 de abril en el reporte de campaña.** El Reporte de ingresos cuenta esa misma compra el 10 de abril porque usa la fecha de compra.

Cambiar el período del reporte no modifica la ventana de atribución utilizada para decidir si una compra corresponde a la campaña.

Un mensaje de la campaña puede permanecer en la lista aunque sus resultados queden fuera del rango seleccionado. En ese caso, su fila puede mostrar valores en cero hasta que elijas un período que incluya su actividad.

## Interpreta el resumen de la campaña

Las cuatro tarjetas del resumen responden preguntas diferentes:

* **Ingresos atribuidos:** cuántos ingresos provienen de compras elegibles atribuidas a mensajes de la campaña entregados durante el período seleccionado.
* **ROI promedio:** ingresos atribuidos divididos por el costo estimado de entrega de los mensajes de la campaña.
* **Conversión:** compras atribuidas divididas por mensajes entregados.
* **Ingresos/mensaje:** ingresos atribuidos divididos por mensajes entregados.

Selecciona una tarjeta para actualizar el gráfico y ver cómo cambió esa métrica en el tiempo. La conversión se calcula con compras atribuidas y mensajes entregados; no es el porcentaje de personas que hicieron clic y luego compraron.

## Sigue el embudo de entrega

El **Embudo de entrega de campaña** recorre cuatro etapas:

* **Enviado:** mensajes de la campaña despachados durante el período seleccionado.
* **Entregado:** mensajes que llegaron a los clientes.
* **Interacción:** mensajes entregados que generaron al menos un clic en un enlace rastreado durante el período. Es una cantidad de mensajes con interacción, no la suma total de clics.
* **Conversión:** compras atribuidas a la campaña. Su porcentaje usa las compras atribuidas divididas por los mensajes entregados, igual que la métrica de conversión del resumen.

Usa el embudo para detectar dónde cambia el rendimiento. Una diferencia grande entre enviados y entregados apunta a la entrega o la posibilidad de contactar a los clientes. Una entrega saludable con poca interacción apunta más a la audiencia, el mensaje o el llamado a la acción.

## Compara los mensajes de la campaña

La sección **Mensajes** muestra la fecha y la vista previa de cada mensaje de la campaña, junto con:

* **Entregados:** mensajes entregados correctamente.
* **CTR:** clics rastreados divididos por mensajes entregados.
* **ROI promedio:** ingresos atribuidos divididos por el costo estimado de entrega.
* **Conversión:** compras atribuidas divididas por mensajes entregados.
* **Ingresos/mensaje:** ingresos atribuidos divididos por mensajes entregados.
* **Ingresos:** ingresos atribuidos a ese mensaje.

Esto permite comparar los mensajes reales sin mezclar el rendimiento de los clics con el de las compras. Un mensaje puede tener un CTR saludable y una conversión más débil si los clientes hacen clic pero no completan la compra.

## Entiende el tiempo de conversión

**Tiempo de conversión** muestra cuánto demoraron en ocurrir las ventas atribuidas desde la entrega del mensaje, con rangos como el mismo día, 1–3 días, 4–7 días y períodos posteriores.

El período del reporte selecciona las entregas originales de los mensajes. Una venta puede ocurrir días después y aun contarse con su fecha de entrega cuando corresponde a la campaña según las reglas de atribución aplicables.

## Compara ingresos por canal y segmento

**Ingresos atribuidos por canal** muestra cómo se distribuyen los ingresos atribuidos entre los canales de mensajería disponibles. Úsalo para ver qué canal aportó más ingresos, no solo cuál entregó más mensajes.

**Ingresos atribuidos por segmento** muestra la distribución entre segmentos de clientes cuando hay datos de segmentación disponibles. Interpreta con cuidado las muestras pequeñas antes de aplicar el resultado a una audiencia futura.

## Revisa la actividad reciente

**Actividad reciente** lista eventos rastreados de clientes asociados con la campaña durante el período seleccionado. Puedes buscar un cliente o una actividad y abrir un evento para revisar más detalles.

Que un evento aparezca aquí no significa automáticamente que haya generado ingresos atribuidos. La compra todavía necesita evidencia elegible de cliente, pedido, origen y tiempo.

## Separa la actividad de la atribución

Un clic en un enlace corto rastreado es evidencia activa de la campaña y normalmente abre una ventana de atribución de siete días desde el clic elegible. El clic no es la única evidencia posible: una entrega elegible de la campaña puede aportar evidencia pasiva dentro de la ventana predeterminada de 24 horas.

Hellotext evalúa la evidencia disponible y su precedencia antes de asignar una compra. Una fuente de marketing externa reconocida puede tener precedencia sobre la evidencia de Hellotext. Lee [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}) para conocer la metodología completa.

## Convierte el reporte en una decisión

* **Hay muchos más enviados que entregados:** revisa el consentimiento, que los perfiles de los clientes tengan un canal disponible y los posibles problemas de entrega.
* **La entrega es saludable, pero el CTR es bajo:** revisa la relevancia de la audiencia, la claridad del mensaje y el llamado a la acción.
* **El CTR es saludable, pero la conversión es baja:** revisa el destino, la disponibilidad del producto, la oferta y la experiencia de compra.
* **Hay ingresos, pero el ROI o los ingresos por mensaje son débiles:** compara el costo de entrega, la combinación de canales y la calidad de la audiencia.
* **Un canal o segmento aporta más ingresos:** úsalo como señal para la próxima campaña, considerando también el tamaño de la audiencia y el volumen de mensajes.
* **Las conversiones llegan durante varios días:** espera lo suficiente antes de considerar definitivo el resultado del primer día.

## Cuando faltan resultados o parecen incorrectos

Primero confirma que el período seleccionado incluya la entrega elegible del mensaje. Luego verifica que estén disponibles los enlaces rastreados y los eventos de compra. Las integraciones de comercio compatibles pueden enviar los datos de compras automáticamente; las tiendas personalizadas pueden usar [Hellotext.js o la API]({% link _developers/tracking-events.md %}).

Si la actividad sigue sin aparecer, consulta [Soluciona señales o actividad faltantes]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %}).

## Guías relacionadas

* [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
* [Buenas prácticas para campañas]({% link _campaigns/campaign-best-practices.md %})
* [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
* [Rastrear enlaces en campañas y recorridos]({% link _developers/tracking-on-campaigns-and-journeys.md %})
* [Usar enlaces rastreados]({% link _analytics-reporting-attribution/tracked-links.md %})
* [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
* [Introducción a Analíticas]({% link _analytics-reporting-attribution/analytics-overview.md %})
