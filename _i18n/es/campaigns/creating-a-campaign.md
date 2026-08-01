Usa una campaña cuando quieres enviar un mensaje planificado y puntual a una audiencia seleccionada. Tú eliges los canales, la audiencia, el mensaje y el momento de envío; Hellotext determina qué perfiles de cliente elegibles pueden contactarse realmente por esos canales.

## Antes de empezar

Asegúrate de tener:

- Un canal de SMS o WhatsApp activo.
- Perfiles de cliente con consentimiento para el canal que usarás.
- Un objetivo y llamado a la acción claros.
- Las listas, segmentos, links con tracking, cupones o contenido multimedia que necesites.
- Un método de pago o saldo cuando lo requieran tu cuenta y los canales.

Sigue leyendo: [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %}).

## 1. Inicia la campaña y elige cómo se enviará

1. Abre **Campañas**.
2. Selecciona **Nueva Campaña**.
3. Elige una de las opciones de envío disponibles:

- **WhatsApp y SMS:** intenta primero por WhatsApp y usa SMS cuando WhatsApp no está disponible para un cliente elegible.
- **Solo WhatsApp:** envía únicamente por WhatsApp.
- **Solo SMS:** envía únicamente por SMS.

Las opciones disponibles dependen de los canales conectados al negocio. El **Target estimado** se actualiza para mostrar cuántos perfiles de cliente podrían contactarse con la opción elegida.

Selecciona **Siguiente** para continuar. Dale a la campaña un nombre interno claro en el encabezado para que el equipo pueda reconocerla después en las vistas de Borradores, Programadas, Enviadas y reportes.

## 2. Elige quién la recibirá

El paso de audiencia empieza con **Todas las audiencias**. Puedes mantenerlo cuando todos los perfiles de cliente elegibles deberían considerarse o reemplazarlo por una selección más específica.

Puedes incluir o excluir:

- Listas.
- Segmentos.
- Audiencias de campañas programadas o enviadas anteriormente.

Usa el botón de agregar para combinar varias reglas de audiencia. Cambia **Incluir** por **Excluir** cuando un grupo deba quedar fuera de la campaña.

Hellotext elimina duplicados entre grupos superpuestos y actualiza el target estimado automáticamente. La estimación considera los canales seleccionados, el estado de suscripción, la contactabilidad, las inclusiones y las exclusiones, por lo que puede ser menor que el tamaño total de las listas o segmentos elegidos.

Usa el control de ajustes junto al **Target estimado** cuando quieras limitar la campaña a una cantidad máxima de clientes elegibles de la audiencia seleccionada. Este límite no vuelve contactable a un perfil que no sea elegible.

Sigue leyendo: [Listas vs. segmentos]({% link _audience/lists-and-segments.md %}).

## 3. Redacta el mensaje

Escribe un mensaje enfocado con una próxima acción clara. El editor muestra una vista previa del canal mientras redactas.

Las herramientas disponibles dependen de la opción de envío. Una campaña puede incluir:

- Texto con el formato soportado por el canal elegido.
- Un link con tracking.
- Etiquetas de personalización basadas en propiedades del perfil de cliente.
- Un cupón.
- Un canal o remitente de envío.
- Contenido de WhatsApp como archivo adjunto, ubicación, pie de página o botones cuando sean compatibles.

Cuando WhatsApp forma parte de la campaña, el mensaje también se prepara como plantilla de WhatsApp. El contenido nuevo o modificado puede necesitar aprobación de Meta antes de entregarse.

Sigue leyendo: [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}).

## Agrega links con tracking

Usa la herramienta de links del editor en lugar de pegar una URL larga. Hellotext crea un link corto `hello.link`, registra clics elegibles y conecta la visita con actividad rastreada posterior.

Un clic rastreado puede aportar evidencia activa para la atribución de la campaña, pero no es la única evidencia que evalúa Hellotext.

Sigue leyendo: [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}).

## Agrega etiquetas de personalización

Las etiquetas insertan propiedades del perfil de cliente en el mensaje entregado. Usa un valor alternativo cuando la propiedad pueda faltar, por ejemplo `{name|cliente}`.

Revisa cuidadosamente la vista previa al usar etiquetas. El valor alternativo debería producir una frase natural para perfiles que no tengan ese dato.

Sigue leyendo: [Etiquetas de personalización]({% link _audience/personalization-tags.md %}).

## Agrega un cupón

Usa la herramienta de cupones para hacer referencia a un cupón disponible en Hellotext. Esto mantiene el cupón conectado con la campaña y sus resultados en lugar de tratar un código escrito manualmente como texto común.

Confirma que las reglas, vencimiento y productos elegibles del cupón correspondan a la audiencia antes de enviar.

## 4. Revisa la vista previa y envía una prueba

Usa la vista previa para comprobar el mensaje en cada canal seleccionado. Revisa:

- La primera línea y el llamado a la acción.
- La personalización y los valores alternativos.
- El destino de los links con tracking.
- El texto y la validez del cupón.
- Los archivos, botones, pie de página o ubicación de WhatsApp.
- La longitud del SMS y la estimación de partes que muestra el editor.

Envía una prueba a un número de teléfono antes de continuar. Una prueba por SMS puede entregarse directamente. Una prueba de WhatsApp con contenido nuevo puede quedar programada hasta que Meta apruebe la plantilla.

La prueba confirma la presentación y entrega al número elegido. No demuestra que todos los perfiles de la audiencia final sean elegibles.

## 5. Elige cuándo se enviará

Elige una de estas opciones:

- **Enviar ahora:** inicia inmediatamente el proceso de aprobación y entrega.
- **Enviar más tarde:** selecciona una fecha y hora futuras.

Hellotext aplica las ventanas de comunicación requeridas para el país de destino y los ajustes de horas nocturnas del negocio. Si el momento elegido no está permitido, la interfaz puede solicitar otro horario o mover la entrega a la siguiente ventana permitida.

Usa **Guardar y Cerrar** en cualquier paso cuando quieras conservar la campaña como borrador y terminarla más adelante.

## 6. Revisa y confirma

Antes de seleccionar **Enviar**, verifica:

- La cantidad estimada de clientes segmentados.
- Las audiencias incluidas y excluidas.
- Los canales y el remitente de entrega.
- La vista previa del mensaje para cada canal.
- Los links con tracking, etiquetas, cupón y contenido de WhatsApp.
- La fecha y hora de entrega.
- El costo estimado de Meta cuando aplique WhatsApp.

La pantalla de confirmación es la última oportunidad de detectar una audiencia o mensaje incorrectos antes de que la campaña entre en aprobación y entrega.

## Entiende la revisión de campañas

Las campañas dirigidas a por lo menos 100 clientes requieren revisión editorial. Una campaña de WhatsApp también puede esperar a Meta cuando su plantilla todavía no fue aprobada.

Mientras la revisión está pendiente, la campaña aparece como **En revisión** o **WhatsApp en revisión**. Una vez aprobada, sigue el horario de entrega elegido. Si el equipo de revisión o Meta rechazan el contenido, abre la campaña, revisa el feedback, realiza los cambios solicitados y vuelve a enviarla.

El tiempo de aprobación puede variar, especialmente cuando Meta debe revisar contenido nuevo de WhatsApp. Deja tiempo suficiente antes de una promoción o evento programado.

## Después de enviar

Usa las pestañas de Campañas para seguir su estado:

- **Borradores:** guardadas pero no enviadas a revisión.
- **Programadas:** enviadas a revisión, aprobadas para una hora futura o preparándose para enviar.
- **Enviadas:** la entrega comenzó y los resultados están disponibles.
- **Archivadas:** campañas terminadas que quitaste de la lista activa de Enviadas.

Las respuestas de clientes continúan hacia el Inbox por el canal correspondiente. Los reportes de campaña se generan automáticamente después de la entrega para que puedas revisar mensajes entregados, interacción, conversión, ROI e ingresos atribuidos.

Sigue leyendo: [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %}).

## Checklist antes de enviar

Antes del envío final, confirma que:

- El objetivo necesita una campaña puntual en lugar de un playbook o una ruta.
- La audiencia es específica y tiene consentimiento para el canal.
- Las exclusiones quitan perfiles internos, de prueba, inválidos o inapropiados.
- El remitente y el comportamiento de fallback son correctos.
- El mensaje tiene una próxima acción clara.
- Los links, etiquetas, cupones, archivos y botones funcionan en una prueba.
- El horario deja margen para revisión editorial o de Meta.
- Alguien supervisará respuestas, problemas de entrega y resultados después del lanzamiento.

## Guías relacionadas

- [Resumen de campañas]({% link _campaigns/campaigns-overview.md %})
- [Buenas prácticas para campañas]({% link _campaigns/campaign-best-practices.md %})
- [¿A quién puedo escribirle?]({% link _audience/consent-and-subscriber-status.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %})
- [Reportes de campaña]({% link _analytics-reporting-attribution/campaign-reporting.md %})
- [Cómo funciona Hellotext]({% link _getting-started/how-hellotext-works.md %})
