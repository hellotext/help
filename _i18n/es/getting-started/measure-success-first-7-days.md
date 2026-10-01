Usa esta guía después de que tu primera campaña, misión, ruta, captura o flujo de Inbox lleve algunos días en vivo.

Confirma que la configuración funciona, que los clientes se comportan como esperabas y qué necesitas ajustar antes de ampliar.

Durante la primera semana, mira tanto la calidad de las señales y la salud operativa como los ingresos. Define una meta concreta y registra fecha de lanzamiento, audiencia, canal, zona horaria del negocio y período del reporte. Mantén esas referencias en cada revisión; siete días desde el lanzamiento pueden ser distintos de los últimos siete días del calendario.

## Qué revisar primero

Empieza por lo básico:

- ¿Entraron los perfiles de cliente correctos en la audiencia o flujo?
- ¿Hellotext recibió las señales esperadas?
- ¿Los mensajes se enviaron por el canal esperado?
- ¿Funcionaron links, respuestas, derivaciones y reportes?
- ¿Los clientes reaccionaron de forma saludable?
- ¿Aparecieron órdenes, clicks o ingresos en los reportes esperados?

Si la configuración o tracking está mal, corrige eso antes de comparar performance. Una señal recibida, un objeto de pedido existente y un mensaje entregado son estados diferentes. Revisa el perfil, la referencia, el origen y la fecha de un registro real antes de concluir que falta una venta o que funcionó una automatización.

## Día 1: confirma la salud del lanzamiento

El primer día, busca problemas evidentes.

Revisa:

- Mensajes enviados, entregados, fallidos y omitidos.
- Bajas, quejas o respuestas negativas inesperadas.
- Links rotos, ofertas incorrectas, productos incorrectos o mala personalización.
- Respuestas que deberían haber llegado al Inbox.
- Misiones, rutas o agentes que deberían haber pausado o derivado.
- Eventos, clicks, órdenes y atribución apareciendo donde esperabas.

En **Campañas → Enviadas**, abre la campaña y comprueba el selector del reporte. Para evaluar la primera semana, elige **Primeros 7 días**; para el primer día o un intervalo exacto, usa **Personalizado** y revisa la zona horaria. La vista de demostración siguiente conserva **Primeros 14 días**, el valor predeterminado; sus importes y tasas ilustran los controles, no resultados de tu primera semana.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y cuatro métricas de una campaña de demostración">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: min(100%, 1258.0000px); margin-inline: auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" width="2480" height="610" loading="lazy" decoding="async" alt="Reporte ficticio con Primeros 14 días seleccionado y tarjetas Ingresos atribuidos, ROI promedio, Conversión e Ingresos/mensaje; la fuente de teléfono muestra una tarjeta y la flecha del carrusel." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con datos ficticios del 19 de abril al 2 de mayo de 2026. No se envió una campaña para producir esta imagen. En escritorio aparecen cuatro tarjetas completas; las fuentes móviles muestran el selector y la primera tarjeta del carrusel.</figcaption>
</figure>

Las tarjetas son **Ingresos atribuidos**, **ROI promedio**, **Conversión** e **Ingresos/mensaje**. En este ejemplo ficticio de 14 días se ven USD 1,9 mil (USD 1.872 antes de abreviar), 5,4×, 6,3 % y USD 0,36. El ROI divide ingresos atribuidos por costo estimado de entrega; la conversión divide compras atribuidas por mensajes entregados. Comprueba los registros y denominadores, además del porcentaje.

Distingue una solicitud aceptada o un mensaje preparado de un envío despachado y de una entrega confirmada. Consulta el estado y motivo de cada mensaje cuando corresponda; los mensajes omitidos antes de crear un registro no tienen por qué figurar como fallos de entrega. Un aviso de API `received` tampoco confirma entrega ni atribución.

Pausa y corrige el flujo si la audiencia incorrecta está recibiendo mensajes o si los clientes están viendo contenido incorrecto. Revisa qué permite detener cada flujo y qué mensajes siguen pendientes: pausar no retira los que ya recibió el proveedor. Conserva las bajas y no reactives contactos para repetir la prueba.

## Días 2 a 3: lee comportamiento, no solo totales

Después de la primera ventana de lanzamiento, busca patrones. Compara fechas, canales y poblaciones equivalentes, y conserva el tamaño de la muestra. Examina respuestas negativas y quejas en conversaciones o registros disponibles; no asumas que cada pregunta de esta lista tiene una columna automática en el reporte.

Para capturas, revisa:

- Qué fuente está creando suscriptores.
- Si el camino de opt-in es claro.
- Si los datos capturados del perfil de cliente son útiles.

Para campañas, revisa:

- Destinatarios, entrega, clicks, respuestas, conversiones e ingresos atribuidos.
- Qué link, oferta, producto o segmento generó la respuesta más fuerte.
- Si las bajas o quejas sugieren que la audiencia o mensaje fue demasiado amplio.

Para misiones y rutas, revisa:

- Qué disparador o señal inició el flujo.
- Cuántos perfiles de cliente eran elegibles.
- Dónde los clientes se detuvieron, respondieron, convirtieron o fueron derivados.
- Si timing, condiciones de ramas o texto del mensaje necesitan ajustes.

Para Inbox, revisa:

- Qué preguntas hicieron los clientes.
- Qué conversaciones necesitaron ayuda humana.
- Si las asignaciones y tiempos de respuesta fueron claros.
- Si las derivaciones de IA o misiones dieron suficiente contexto al equipo.

Distingue **CTR** de **Interacción**: en las filas del reporte de campaña, el CTR divide los clics rastreados del período entre entregas; en Rendimiento de canales usa mensajes con al menos un clic entre entregas. **Interacción** en el embudo de campaña incluye mensajes entregados vistos, clicados o respondidos, una vez por mensaje, y agrupa esos resultados por su día de despacho. Una respuesta posterior puede actualizar un día anterior. No compares esas cifras como si fueran clics únicos de personas ni la misma población que las compras del período.

En capturas, un perfil creado o accesible no demuestra permiso para marketing. Revisa el consentimiento por canal, destino y tipo de mensaje, junto con suscripciones y fuente. En misiones y rutas, inspecciona el disparador y el paso concreto; una audiencia grande no significa que todas las personas entraron o recibieron cada mensaje.

## Día 7: decide qué hacer después

Después de la primera semana, elige una de cuatro acciones.

| Si ves... | Próxima acción |
| --- | --- |
| Buena entrega, respuestas útiles, reportes limpios y conversiones tempranas | Mantén el flujo y amplía con cuidado. |
| Configuración sana pero pocos clicks, respuestas o conversiones | Ajusta audiencia, oferta, texto, timing o lógica de la misión. |
| Datos incorrectos, señales faltantes, links rotos o atribución poco clara | Corrige la configuración antes de juzgar performance. |
| Bajas inesperadas, respuestas negativas, audiencia incorrecta o sobrecarga de soporte | Pausa, reduce alcance y relanza más pequeño. |

Registra la decisión, la evidencia y una fecha para volver a revisar. Cambia una causa principal por vez para poder explicar el resultado. Una mejor tasa con pocos casos no basta para ampliar: conserva consentimiento, límites de canal y capacidad del equipo.

## Métricas que importan al principio

Las métricas iniciales más útiles dependen de lo que lanzaste.

Para crecimiento de audiencia:

- Nuevos suscriptores.
- Fuente de opt-in.
- Calidad de consentimiento.
- Campos de perfil recopilados.

Para campañas:

- Entrega y tasa de fallos.
- Clicks y click-through rate.
- Respuestas.
- Conversiones.
- Ingresos atribuidos.
- Bajas o quejas.

Para misiones y rutas:

- Volumen de disparadores.
- Perfiles de cliente elegibles.
- Envíos, omisiones, esperas y condiciones de detención.
- Respuestas, derivaciones y conversiones.
- Órdenes o ingresos atribuidos cuando corresponde.

Para Inbox y soporte:

- Conversaciones nuevas.
- Conversaciones asignadas y sin asignar.
- Tiempo de respuesta.
- Preguntas repetidas.
- Calidad de derivación.

Abre el [Reporte de carga y capacidad]({% link _analytics-reporting-attribution/workload-capacity-report-guide.md %}) para distinguir volumen y capacidad. La vista ficticia siguiente usa **Personalizado**, del 11 al 24 de septiembre de 2026, con **Carga activa** seleccionada; no representa una primera semana de lanzamiento.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Cuatro tarjetas de carga y capacidad del equipo">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: min(100%, 1253.0000px); margin-inline: auto;">
      <picture>
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/workload-capacity-report-guide/kpi-overview-es.png" srcset="/images/analytics-reporting-attribution/workload-capacity-report-guide/kpi-overview-es.png 2x" width="2470" height="605" loading="lazy" decoding="async" alt="Reporte ficticio con período Personalizado y cuatro tarjetas completas: Carga activa 20,3 %, Manejadas 27, Resueltas 39 y Concurrencia 1,5; las cuatro comparaciones son verdes." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con métricas agregadas ficticias del 11 al 24 de septiembre de 2026. La fuente aprobada conserva las comparaciones favorables de sus registros originales. La misma imagen completa se usa en escritorio y móvil; el texto presenta los valores compactos.</figcaption>
</figure>

El ejemplo muestra **Carga activa 20,3 %**, **Manejadas 27**, **Resueltas 39** y **Concurrencia 1,5**. Carga activa compara tiempo de atención con capacidad disponible; Manejadas cuenta conversaciones distintas con atención humana superpuesta al período y Resueltas usa la fecha de resolución humana. No restes esas tarjetas para calcular pendientes. Consulta la cola actual: en Presión operativa, Sin respuesta, Mayor espera y Riesgo SLA reflejan el estado actual, mientras Utilización y Concurrente usan el período. Los tiempos de respuesta pertenecen a su medición de servicio, no a la tarjeta Concurrencia.

## Qué no sobreinterpretar

Evita sacar conclusiones grandes a partir de:

- Una audiencia muy pequeña.
- Un lanzamiento que solo corrió unas horas.
- Un link roto o evento faltante que afectó la prueba.
- Una orden inusualmente grande o pequeña.
- Atribución antes de que la ventana completa haya tenido tiempo de correr.
- Una campaña y una misión compitiendo por el mismo perfil de cliente.

En el reporte de campaña, **Tiempo de conversión** agrupa compras atribuidas ocurridas durante el período según el tiempo desde el inicio de la campaña. No mide cuánto tardó cada persona desde su clic ni extiende la ventana de atribución.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Compras atribuidas distribuidas desde el lanzamiento">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: min(100%, 591.3333px); margin-inline: auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-es-mobile-wide.png 2x" width="1048" height="810" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-es-desktop-wide.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/time-to-conversion-es-desktop-wide.png 3x" width="1720" height="1100" loading="lazy" decoding="async" alt="Gráfico ficticio Tiempo de conversión: 9 % el mismo día, 47 % entre 1 y 3 días, 19 % entre 4 y 7 días, 25 % entre 8 y 30 días y 0 % en 30 días o más." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real en español con compras ficticias del período aprobado de 14 días. El tiempo se mide desde el lanzamiento; la compra debe pertenecer al rango y cumplir las reglas de atribución. No se fabricaron compras para este artículo.</figcaption>
</figure>

En la distribución ficticia se ven **9 % / 47 % / 19 % / 25 % / 0 %** para el mismo día, 1–3, 4–7, 8–30 y 30+ días. Tener una barra de 8–30 días no significa que cada campaña deba esperar 30 días ni que toda compra posterior sea elegible. Revisa su fecha y evidencia de atribución. El período de un reporte puede incluir compras posteriores sin las entregas originales; la conversión puede mostrar cero si su denominador de entregas es cero.

Si dos vistas difieren, sigue [Integridad de datos y diferencias en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %}) y concilia uno o dos registros existentes. Evita crear pedidos, eventos o envíos para hacer coincidir un total.

Los datos tempranos deberían ayudarte a encontrar qué revisar después. No siempre son un veredicto final.

## Preguntas antes de ampliar

Antes de activar más misiones, rutas, campañas o agentes, responde:

- ¿Perfiles de cliente, consentimiento y elegibilidad de canal están limpios?
- ¿Las señales correctas llegan a Hellotext?
- ¿Los clientes reciben el mensaje correcto en el momento correcto?
- ¿Las respuestas y derivaciones llegan a las personas correctas?
- ¿Puedes explicar los resultados que estás viendo?
- ¿Sabes qué ajustar después?

Si la respuesta es no, mantén el lanzamiento pequeño mientras corriges la parte más débil.

## Guías relacionadas

- [Primeros logros recomendados]({% link _getting-started/first-wins-starter-pack.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Resumen de analítica, reportes y atribución]({% link _analytics-reporting-attribution/analytics-overview.md %})
- [Reportes de misiones]({% link _analytics-reporting-attribution/playbook-reporting.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Atribución de ventas]({% link _analytics-reporting-attribution/sales-attribution.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})
- [Derivación de IA al Inbox]({% link _team/ai-handoff-to-inbox.md %})
