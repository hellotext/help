Tiempo de respuesta ayuda a tu equipo a entender qué tan rápido reciben respuesta los clientes y qué conversaciones necesitan atención primero.

Las reglas de respuesta definen los tiempos que Hellotext usa para decidir si una espera está al día, en riesgo, demorada o vencida.

> Las reglas de respuesta están disponibles en los planes Pro y Enterprise.

## Qué son las reglas de respuesta

Una regla de respuesta define dos tiempos:

- Primera respuesta a nuevas conversaciones: tiempo máximo para responder el primer mensaje de un cliente en una conversación nueva.
- Respuestas posteriores: tiempo máximo para responder después de que el cliente envía un nuevo mensaje en una conversación ya activa.

Hellotext usa estos tiempos para mostrar la salud de respuesta en conversaciones, equipos, colaboradores y reportes.

## Cómo funcionan

Cuando un cliente envía un mensaje que requiere atención, Hellotext inicia un temporizador de respuesta.

Si la conversación todavía no tuvo una respuesta del equipo, se usa el tiempo de Primera respuesta a nuevas conversaciones. Después de que el equipo respondió una vez, los siguientes mensajes del cliente usan el tiempo de Respuestas posteriores.

Si el cliente envía varios mensajes antes de recibir respuesta, el temporizador no se reinicia. Esos mensajes se consideran parte de la misma espera del cliente.

Cuando el equipo envía una respuesta visible para el cliente, Hellotext registra la respuesta. Si llega antes del límite, la conversación sigue dentro del tiempo esperado. Si llega después, la respuesta se registra, pero el tiempo de respuesta se considera vencido.

Las notas internas, borradores, campañas y actividad del sistema no cuentan como respuestas.

## Horario comercial

Los tiempos de respuesta respetan el Horario comercial configurado.

Si un cliente escribe durante el horario abierto, el tiempo empieza a contar en ese momento. Si escribe fuera del horario comercial, el tiempo empieza a contar cuando el negocio vuelve a abrir.

Si un límite cruza un período cerrado, el tiempo restante continúa contando cuando el negocio vuelve a abrir.

## Política predeterminada y reglas por canal

Cada negocio tiene una Política de respuesta predeterminada. Esta política se usa cuando no existe una regla específica para el canal de la conversación.

En planes Pro y Enterprise, puedes crear reglas de respuesta por canal, por ejemplo WhatsApp, SMS, Webchat, Instagram o Messenger. Si existe una regla para el canal, Hellotext usa esa regla. Si no, usa la Política de respuesta predeterminada.

Los cambios a una regla de respuesta aplican a nuevos temporizadores. Las conversaciones que ya tenían un temporizador activo conservan el límite que tenían cuando se inició.

## Estados en conversaciones

En la lista de conversaciones, Hellotext puede mostrar indicadores de respuesta para ayudar a priorizar el trabajo.

Los estados son:

- Respuesta en riesgo: la conversación está cerca de vencer su tiempo de respuesta.
- Respuesta demorada: el tiempo de respuesta ya pasó y el cliente sigue esperando.
- Respuesta vencida: la espera sigue sin resolverse después de superar el tiempo esperado y necesita atención urgente.

Estos indicadores ayudan al equipo a priorizar las conversaciones que necesitan una respuesta más rápida.

## Estados en Equipo y colaboradores

En las vistas de Equipo y colaboradores, Hellotext muestra indicadores de salud de respuesta cuando la función está disponible.

Los estados son:

- Respuesta al día
- Respuesta en riesgo
- Respuesta demorada
- Respuesta vencida

En Equipo, Hellotext considera las conversaciones asignadas o pendientes de asignación a ese equipo. En colaboradores, considera las conversaciones asignadas a cada persona.

Estos estados no crean reglas separadas por equipo o colaborador. Las reglas se configuran a nivel general o por canal. Las vistas de Equipo y colaboradores muestran cómo se están cumpliendo.

## Reportes

En reportes, los supervisores pueden revisar la presión operativa por colaborador o por equipo.

El reporte de Presión operativa muestra información como conversaciones sin respuesta, mayor espera, riesgo de respuesta, utilización, concurrencia y burn.

Los estados de riesgo son:

- Seguro
- En riesgo
- Inminente

Esto ayuda a detectar cuándo un equipo o colaborador está acumulando conversaciones que podrían afectar los tiempos de respuesta.

## Cómo configurar reglas de respuesta

1. Ve a Ajustes.
2. Abre Equipo.
3. Entra en Tiempo de respuesta.
4. Abre la pestaña Reglas de respuesta.
5. Edita la Política de respuesta predeterminada o crea una regla por canal.
6. Configura Primera respuesta a nuevas conversaciones.
7. Configura Respuestas posteriores.
8. Guarda los cambios.

Para configurar cuándo debe contar el tiempo, usa la pestaña Horario comercial en la misma sección.

## Plan necesario

Para usar reglas de respuesta necesitas un plan Pro o Enterprise.

Si tu negocio no tiene un plan compatible, puedes abrir la página de Tiempo de respuesta, pero las reglas no estarán activas. Verás un botón para actualizar el plan en lugar del botón para crear una regla.

En planes que no incluyen esta función, los indicadores de salud de respuesta no se muestran en conversaciones, equipos ni colaboradores.

## Buenas prácticas

Usa la Política de respuesta predeterminada como expectativa general para todo el negocio.

Crea reglas de respuesta por canal cuando algunos canales necesiten tiempos distintos. Por ejemplo, es posible que quieras responder conversaciones de WhatsApp más rápido que canales similares al email.

Mantén actualizado el Horario comercial para que los tiempos reflejen cuándo tu equipo realmente está disponible.

Revisa conversaciones, equipos, colaboradores y reportes regularmente para detectar demoras antes de que afecten la experiencia del cliente.
