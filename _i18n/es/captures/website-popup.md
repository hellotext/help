Popup de Sitio Web te permite captar números de teléfono, direcciones de email y otros datos del perfil del cliente sin sacar a los visitantes de tu sitio.

Es un playbook de captura, no un playbook agéntico ni una ruta. El popup crea o actualiza un perfil del cliente. Luego puedes entregar un cupón de forma opcional y conectar la captura con una ruta de bienvenida o seguimiento para la nueva persona suscrita.

Popup de Sitio Web se está habilitando de forma progresiva. Si aparece como **A solicitud**, está deshabilitado o no aparece en el grupo **Capturas** dentro de **Explorar playbooks**, confirma su disponibilidad con tu equipo de Hellotext antes de planificar el lanzamiento.

## Cuándo usar Popup de Sitio Web

Usa Popup de Sitio Web cuando quieres:

- Convertir visitantes anónimos del sitio en personas suscritas.
- Captar un número de teléfono, email u otras propiedades del perfil del cliente.
- Presentar una oferta sin enviar al visitante a otra página.
- Usar más de un paso para mantener breve la primera interacción.
- Adaptar la experiencia para mobile y desktop.
- Iniciar una ruta de bienvenida después de la suscripción.

Usa un [Formulario Web]({% link _captures/forms.md %}) cuando el formulario deba vivir dentro de la página en lugar de abrirse sobre ella. Usa un [Link Compartible]({% link _captures/shareable-link.md %}) cuando el opt-in comience fuera de tu sitio, por ejemplo desde redes sociales, un anuncio o un email.

## Antes de empezar

Decide qué datos realmente necesitas al momento de la suscripción. Un número de teléfono o un email suele ser suficiente para el primer paso. Los campos adicionales pueden usar propiedades existentes del perfil del cliente, incluidas las propiedades personalizadas creadas por tu negocio.

También confirma:

- A qué canal se suscribe el visitante.
- Qué valor u oferta comunica el popup.
- Si se debe entregar un cupón después de la suscripción.
- Si una ruta debe comenzar al completar la captura.
- Quién puede instalar Hellotext en el sitio si hace falta una instalación manual.
- Que el aviso de consentimiento describa correctamente los mensajes que el visitante acepta recibir.

Para revisar elegibilidad por canal y consentimiento, consulta [A quién puedes escribirle]({% link _audience/consent-and-subscriber-status.md %}).

## Crea el popup

1. Abre **Playbooks** y haz clic en **Explorar playbooks**.
2. Busca el grupo **Capturas** y elige **Popup de Sitio Web**.
3. Dale un nombre que identifique su ubicación o propósito.
4. Construye los pasos de suscripción y el estado **Completado**.
5. Revisa el estilo, layout y configuración.
6. Guarda y continúa a la asignación opcional de cupón y ruta.
7. Revisa las opciones de visualización disponibles, luego instala y publica el popup.

El editor muestra vistas previas separadas para mobile y desktop. Revisa ambas mientras trabajas en lugar de considerar que la vista de desktop representa el resultado final para todos los visitantes.

## Construye los pasos de suscripción

Un popup puede usar varios pasos. Esto te permite pedir primero un dato importante y solicitar más información solamente después de que el visitante continúa.

En cada paso puedes:

- Editar el título, texto de apoyo, botón, links y aviso de consentimiento.
- Agregar campos basados en propiedades estándar o personalizadas del perfil del cliente.
- Cambiar la etiqueta y el placeholder de cada campo.
- Marcar campos como obligatorios cuando el flujo no pueda continuar sin ellos.
- Agregar, eliminar, renombrar y reordenar pasos.
- Ver cómo se muestra el paso en mobile y desktop.

Usa el estado **Completado** para confirmar que se recibió la suscripción y explicar qué ocurrirá después. Haz que este mensaje sea útil incluso cuando no hayas asignado un cupón.

No pidas todas las propiedades disponibles solo porque existen. Cada campo adicional exige más esfuerzo al visitante y puede reducir la cantidad de personas que completan el popup. Capta lo mínimo necesario para el primer seguimiento útil y enriquece el perfil más adelante mediante conversaciones, compras, formularios u otras señales.

## Escribe textos claros para el popup

El visitante debería entender el valor, los datos solicitados y la siguiente acción antes de ingresar información.

- Comienza con el beneficio concreto o la razón para suscribirse.
- Usa el texto de apoyo para explicar qué recibirá el visitante, no para repetir el título.
- Haz que el botón describa la acción, por ejemplo **Obtén mi descuento** o **Notifícame**, en lugar de usar una etiqueta vaga.
- Mantén el primer paso lo bastante breve como para leerlo fácilmente en un teléfono.
- Mantén el aviso de consentimiento legible y separado de la promesa promocional.
- Haz que el estado completado explique si debe revisar WhatsApp, SMS o email, seguir comprando o esperar un seguimiento.
- No crees urgencia falsa ni prometas un cupón, canal de entrega o tiempo de respuesta que el flujo configurado no puede ofrecer.

Lee todos los pasos como una sola secuencia. Un buen primer paso igualmente puede resultar confuso si el segundo cambia la oferta, pide datos inesperados o usa una llamada a la acción diferente.

## Configura el estilo, layout y apertura

El editor separa la configuración del popup en tres áreas:

| Área | Qué controla |
| --- | --- |
| **Estilo** | La tipografía y los colores del texto, fondo, texto del botón y fondo del botón. Estas opciones se aplican a todo el popup. |
| **Layout** | La disposición usada en desktop y mobile. Cada dispositivo puede usar el layout que mejor se adapte a su pantalla. |
| **Configuración** | Si el popup se abre automáticamente o primero aparece como una burbuja, la apariencia de esa burbuja y si se muestra en mobile, desktop o ambos. |

Cuando el popup usa una burbuja, los visitantes ven un pequeño acceso flotante y abren el popup completo al seleccionarlo. Configura el texto, color de texto, color de fondo y alineación de la burbuja para que sea visible sin cubrir controles importantes del sitio.

Cuando el popup se abre automáticamente, revisa el control de demora disponible en tu cuenta. Dale a la página tiempo suficiente para resultar útil antes de interrumpir al visitante.

La primera versión se concentra en la forma de apertura y los dispositivos. Las condiciones avanzadas basadas en la URL de la página, scroll, ubicación o visualizaciones anteriores del popup todavía están en desarrollo. No planifiques un lanzamiento alrededor de esas condiciones salvo que estén disponibles y se puedan guardar en tu cuenta.

## Asigna un cupón y una ruta

La asignación de cupón y ruta es opcional.

Asigna un cupón cuando la promesa de suscripción incluya un descuento. Cuando la entrega de cupones está habilitada para tu cuenta, Hellotext envía el código al dato de contacto que dejó el visitante en lugar de mostrarlo inmediatamente en el navegador. Hellotext puede elegir el canal disponible más costo-eficiente entre WhatsApp y SMS, o usar email cuando no se captó un teléfono.

El estado completado puede mostrar el destino oculto parcialmente y el canal de entrega. También puede permitir que el visitante cambie el número o email, o solicite otro envío una vez cumplida la espera para reenviar.

Asigna una ruta cuando la nueva persona suscrita deba entrar en un flujo de bienvenida o seguimiento. Si la misma captura ya activa otra ruta, revisa la advertencia antes de continuar para evitar que la persona ingrese en flujos duplicados.

## Instala el popup

El paso de instalación ofrece los métodos disponibles para el sitio conectado:

- **Instalación automática:** úsala cuando Hellotext detecta una tienda Shopify conectada y compatible.
- **Instalación manual:** instala [Hellotext.js](https://github.com/hellotext/hellotext.js) y luego agrega al sitio el código de inicialización generado para este popup.

Usa el código generado exactamente como aparece porque incluye los identificadores de tu negocio y del popup. Si un desarrollador o una agencia administra el sitio, envíale las instrucciones completas de instalación manual que aparecen en este paso.

Después de instalarlo, publica el popup solamente después de probar el sitio real. Que la vista previa del editor sea correcta no confirma que el script de la tienda, el comportamiento por dispositivo o el envío de datos estén funcionando.

## Prueba antes de publicar

Prueba la experiencia completa con datos de cliente que puedas usar de forma segura.

Confirma que:

- El popup se abre mediante la activación automática o la burbuja configurada.
- Aparece en los dispositivos mobile y desktop previstos.
- No cubre la navegación, checkout, controles de consentimiento u otras acciones esenciales del sitio.
- Cada paso cabe en la pantalla sin texto ni controles cortados.
- Los campos obligatorios detienen envíos incompletos y explican qué falta corregir.
- Los teléfonos, emails y otras propiedades llegan al perfil del cliente correcto.
- El aviso de consentimiento coincide con el canal y tipo de mensaje.
- El estado completado explica claramente la siguiente acción.
- El cupón asignado llega al destino esperado cuando la entrega está habilitada.
- La ruta asignada comienza una sola vez y no se superpone con otro flujo de bienvenida.
- Cerrar, volver a abrir y usar la burbuja funciona como esperas.

Repite la prueba en una ventana privada y en un teléfono real. Esto permite detectar problemas de instalación, sesión y layout responsive que la vista previa del editor no puede mostrar.

## Si el popup no aparece

Revisa estos puntos en orden:

1. Confirma que el popup se haya guardado, instalado y publicado.
2. Confirma que Hellotext.js y el código de inicialización del popup carguen en la página.
3. Revisa si el popup está limitado a mobile o desktop.
4. Revisa si se abre automáticamente, después de una demora o solamente desde una burbuja.
5. Prueba en una ventana privada para evitar que una sesión anterior afecte el resultado.
6. Confirma que las condiciones de visualización disponibles en tu cuenta coincidan con la página que estás probando.
7. Vuelve a abrir el paso de instalación y compara el código generado con el que se ejecuta en el sitio.

Al reportar un problema, incluye el nombre del popup, URL probada, dispositivo, hora aproximada, forma de apertura y si el popup no apareció o falló después del envío.

## Guías relacionadas

- [Resumen de herramientas de captura]({% link _captures/capture-overview.md %})
- [Formularios Web]({% link _captures/forms.md %})
- [Links Compartibles]({% link _captures/shareable-link.md %})
- [Opt-in en checkout de Shopify]({% link _captures/shopify-checkout.md %})
- [A quién puedes escribirle]({% link _audience/consent-and-subscriber-status.md %})
- [Primeros pasos con rutas]({% link _journeys/getting-started-with-journeys.md %})
- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
