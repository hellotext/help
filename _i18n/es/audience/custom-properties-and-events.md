Las propiedades y los eventos personalizados permiten que Hellotext entienda información específica de tu negocio. Las propiedades describen qué es cierto actualmente sobre un cliente, mientras que los eventos registran algo que ocurrió en un momento determinado.

Úsalos para mejorar la segmentación, personalización, decisiones de playbooks, disparadores de rutas y reportes sin forzar datos propios del negocio dentro de un campo genérico.

## Las propiedades y los eventos son diferentes

| Usa una propiedad cuando | Usa un evento cuando |
| --- | --- |
| El valor describe el estado actual del cliente. | Necesitas registrar que ocurrió una acción. |
| Esperas que el valor se actualice o reemplace. | Importan el momento y la secuencia de las ocurrencias. |
| Ejemplo: nivel de fidelidad, categoría preferida, responsable de cuenta o vencimiento de membresía. | Ejemplo: cita completada, cotización solicitada, clase atendida o prueba iniciada. |

Un evento también puede hacer referencia a un objeto asociado. Por ejemplo, un evento `order.placed` puede apuntar al pedido realizado. El evento es la ocurrencia; el objeto contiene los detalles estructurados.

## Crea una propiedad personalizada

1. Ve a **Audiencia** y abre un perfil de cliente.
2. En las propiedades del perfil, selecciona **Agregar más campos**.
3. Elige el tipo que corresponda al valor, como texto, texto largo, número, checkbox, fecha, dinero, URL o etiquetas.
4. Dale un nombre claro a la propiedad e ingresa el valor para ese cliente.
5. Guarda el cambio del perfil.

El teléfono y el email funcionan de manera diferente a las propiedades personalizadas del negocio:

- Agregar un teléfono o email incorpora ese identificador únicamente al perfil del cliente que estás editando. Lo mismo sucede con otra dirección propia del perfil cuando aparece en el selector.
- Agregar otro tipo de propiedad personalizada crea su definición para el negocio, por lo que el campo queda disponible en todos los perfiles y en formularios, importaciones, segmentos, selectores de personalización y playbooks compatibles.

En ambos casos, el valor que ingresas pertenece solo al perfil del cliente que estás editando. Crear una propiedad para todo el negocio no copia ese valor a todos los perfiles.

Los tipos de propiedades disponibles pueden depender del campo y contexto del producto. Elige entre los tipos que muestra Hellotext en lugar de convertir todos los valores en texto.

## Nombra las propiedades con claridad

Usa un nombre que identifique un solo concepto estable del negocio, como `Nivel de fidelidad` o `Tienda preferida`.

- Usa nombres diferentes cuando varias propiedades tengan el mismo tipo.
- No comiences el nombre de una propiedad con un número ni incluyas llaves.
- Mantén el mismo nombre y significado entre importaciones, capturas, integraciones y procesos internos.
- Evita crear una segunda propiedad para datos que ya tienen un campo confiable.

Para renombrar una propiedad, haz clic sobre su nombre en el perfil del cliente y edita la etiqueta. Presiona Enter o haz clic fuera del campo para guardar.

Cambiar el nombre o eliminar una propiedad del negocio puede afectar segmentos, campos de captura, etiquetas de personalización y automatizaciones que dependan de ella. Revisa esos usos antes de cambiar la definición. Eliminar la definición quita la propiedad de todos los perfiles, mientras que eliminar el valor de un perfil afecta solo a ese perfil.

## Usa una propiedad como identificador único

Las propiedades compatibles pueden marcarse como **Únicas**. Esto impide que el mismo valor se asigne a más de un perfil de cliente y permite que Hellotext use la propiedad para identificar y deduplicar clientes.

El teléfono y el email son identificadores únicos habituales. También puedes crear una propiedad de texto como `Cédula de identidad` y marcarla como única cuando cada cliente deba tener un valor diferente.

Para cambiar esta configuración:

1. Haz clic sobre el nombre de la propiedad en un perfil de cliente.
2. Abre el menú de opciones junto al nombre.
3. Selecciona **Establecer como Único**.

Hellotext muestra esta opción solamente en los tipos de propiedad compatibles. Si varios perfiles ya comparten un valor, resuelve esos duplicados antes de activar la unicidad. No marques una propiedad como única si su valor puede pertenecer legítimamente a varios clientes.

## Reordena las propiedades

Arrastra una propiedad desde su control de reordenamiento para cambiar su posición.

El orden de una propiedad del negocio se comparte entre todos los perfiles. Reordenar identificadores propios del perfil, como varios teléfonos o emails, cambia su orden solamente en ese perfil y permite mantener primero el valor preferido.

## Agrega y actualiza valores

Los valores de las propiedades pueden venir de varias fuentes:

- Una persona del equipo que edita un perfil de cliente.
- Una importación por archivo o integración conectada.
- Un playbook de captura, formulario o Recolector de Propiedades.
- Un paso de una ruta.
- Hellotext.js, la API u otra integración personalizada.

Define qué fuente debe ser la principal. Si una integración mantiene un valor sincronizado, un cambio manual puede ser reemplazado después por la fuente. Al importar datos, usa la opción de sobrescritura solo cuando el archivo deba convertirse en la fuente de verdad.

## Entiende las acciones y los eventos

Una **acción** define el tipo de actividad que Hellotext puede registrar, como `order.placed` o `appointment.completed`.

Un **evento** es una ocurrencia de esa acción para un cliente. Puede incluir cuándo ocurrió, un objeto asociado, una URL, metadatos y valores monetarios cuando corresponda.

Hellotext incluye acciones predefinidas para actividades comunes de eCommerce, mensajería, capturas, suscripciones y conversaciones. Crea una acción personalizada cuando tu negocio necesita registrar algo que todavía no está representado.

## Crea una acción personalizada

Si tu plan y permisos admiten acciones personalizadas:

1. Ve a **Ajustes** y luego a **Acciones**.
2. Abre la pestaña **Personalizado** y selecciona **Crear nueva acción**.
3. Ingresa un nombre legible para la interfaz.
4. Ingresa un nombre de tracking, como `appointment.completed`.
5. Elige si la acción debe marcarse como conversión o como importante.
6. Guarda la acción.

Marcar una acción como conversión permite que los reportes traten sus eventos como conversiones. Marcarla como importante hace que las nuevas ocurrencias requieran atención y puede mover la conversación relacionada al principio del Inbox.

Trata el nombre de tracking como un contrato con tu sitio, backend e integraciones. Si lo cambias, actualiza cada fuente que envía el evento. Eliminar una acción personalizada también elimina sus eventos asociados y no se puede deshacer.

## Registra y revisa eventos

Los eventos pueden llegar automáticamente desde una tienda conectada, captura, conversación, Hellotext.js, API o integración personalizada.

Para registrar automáticamente una acción personalizada, envía su nombre de tracking exacto desde:

- **[Hellotext.js](https://github.com/hellotext/hellotext.js)** para actividad que ocurre en el navegador del cliente.
- **[La API de tracking](https://www.hellotext.com/api#tracking)** para actividad de tu backend, CRM, punto de venta u otro sistema externo.

El evento debe quedar conectado al cliente o sesión correctos e incluir el contexto que requiera la acción. Prueba una ocurrencia y confirma que aparezca en el perfil esperado antes de usarla en una ruta, segmento o reporte.

También puedes agregar una ocurrencia manualmente cuando la acción correspondiente ya existe:

1. Abre el perfil del cliente en **Audiencia**.
2. Abre el menú de acciones del perfil y selecciona **Nuevo Evento**.
3. Elige la acción y, cuando corresponda, un objeto asociado.
4. Agrega el monto, metadatos, fecha o URL relevantes.
5. Guarda el evento.

El evento aparece en la actividad del perfil de cliente. Abre un elemento de actividad para revisar sus propiedades. **Nuevo Evento** registra esa ocurrencia manualmente; no configura el tracking automático de ocurrencias futuras. Los eventos manuales deben representar algo que realmente ocurrió y no deberían agregarse solo para forzar la entrada de un cliente en un segmento o disparador.

Para enviar eventos desde un sitio o sistema externo, consulta [Seguimiento de eventos]({% link _developers/tracking-events.md %}) o [Seguimiento de origen externo]({% link _developers/external-tracking.md %}).

## Usa los datos en Hellotext

Cuando los datos estén disponibles, puedes usarlos para:

- Crear segmentos con propiedades actuales del perfil o actividad pasada.
- Insertar valores de propiedades en mensajes mediante etiquetas de personalización.
- Iniciar rutas desde un evento o actualizar una propiedad en un paso de ruta.
- Permitir que los playbooks usen señales del perfil y su actividad al tomar decisiones.
- Medir conversiones personalizadas cuando la acción esté configurada como tal.
- Revisar el historial del cliente desde la actividad de su perfil.

El valor de una propiedad no demuestra que ocurrió un evento y un evento antiguo no siempre describe el estado actual del cliente. Elige la fuente que responda la pregunta que estás haciendo.

## Verifica la configuración

Antes de depender de una propiedad o evento personalizado:

- Pruébalo con un perfil de cliente.
- Confirma que el valor o evento aparezca en el perfil esperado.
- Revisa que los nombres y formatos sean consistentes.
- Verifica que el segmento, ruta, playbook o reporte esperado pueda usarlo.
- Evita enviar el mismo evento desde una integración y desde tracking personalizado.
- Documenta la fuente y responsable para que los datos no queden desactualizados o ambiguos.

## Guías relacionadas

- [Cómo funcionan los perfiles de clientes]({% link _audience/customer-profiles.md %})
- [Crea segmentos]({% link _audience/segments.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
