Usa esta guía para elegir el camino de configuración que coincide con cómo vende tu negocio y dónde viven los datos de clientes.

La mayoría de los equipos debería conectar primero su plataforma de comercio, después conectar canales de mensajería, agregar herramientas de captura, verificar datos y señales, y recién después lanzar playbooks, rutas, campañas o agentes.

Si usas más de una plataforma, empieza por la plataforma que tiene la actividad de clientes, productos, carritos y órdenes más confiable.

## Orden recomendado

Para la mayoría de las implementaciones, sigue este orden:

1. Conecta la plataforma de comercio o fuente de datos.
2. Conecta el canal de mensajería que vas a usar primero.
3. Agrega una captura o camino de opt-in en checkout.
4. Verifica perfiles de cliente, consentimiento, eventos, productos, carritos, órdenes y reportes.
5. Elige un primer playbook, ruta o campaña.
6. Revisa el checklist antes de enviar antes de que los clientes reciban mensajes.

Este orden evita que problemas de configuración se conviertan después en problemas de envío, reportes o atribución.

## Camino Shopify

Usa este camino cuando Shopify es tu tienda principal.

Empieza aquí:

- [Conecta Shopify]({% link _integrations/connect-shopify.md %})
- [Configura el opt-in en checkout de Shopify]({% link _captures/shopify-checkout.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})

Después de que la conexión funcione, usa la actividad de Shopify como señales para recuperación de carrito, recuperación de navegación, primera compra, recompra, segmentación, campañas y atribución.

## Camino Wix

Usa este camino cuando Wix es tu tienda o sitio principal.

Empieza aquí:

- [Conecta Wix]({% link _integrations/connect-wix.md %})
- [Configura el opt-in en checkout de Wix]({% link _captures/wix-checkout.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})

Después de que la conexión funcione, confirma que perfiles de cliente, órdenes, carritos y estado de suscripción aparezcan correctamente antes de lanzar playbooks o campañas.

## Camino WooCommerce

Usa este camino cuando WooCommerce es tu tienda principal.

Empieza aquí:

- [Conecta WooCommerce]({% link _integrations/connect-woo.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})

La configuración de WooCommerce depende del plugin de Hellotext y del identificador de negocio y token de acceso correctos. Verifica el plugin antes de diagnosticar playbooks o reportes.

## Camino VTEX

Usa este camino cuando VTEX es tu plataforma de comercio.

Empieza aquí:

- [Conecta VTEX]({% link _integrations/connect-vtex.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Qué son las señales]({% link _journeys/what-are-signals.md %})

Después de conectar, confirma que los eventos que necesita tu primer playbook estén presentes en los perfiles de cliente correctos.

## Camino Mercado Libre

Usa este camino cuando Mercado Libre es un canal importante de ventas o conversaciones para tu negocio.

Empieza aquí:

- [Conecta Mercado Libre]({% link _integrations/connect-mercado-libre.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Resumen de inbox y conversaciones]({% link _team/inbox-overview.md %})

Mercado Libre puede ser parte de una configuración más amplia. Si también tienes una tienda principal, conecta esa tienda para que Hellotext entienda más contexto de clientes y órdenes.

## Camino de comercio por WhatsApp

Usa este camino cuando WhatsApp es un canal principal para conversaciones, descubrimiento de productos o comercio.

Empieza aquí:

- [Conecta WhatsApp]({% link _integrations/connect-whatsapp.md %})
- [Conecta tu catálogo a WhatsApp]({% link _integrations/connect-catalog-to-whatsapp.md %})
- [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})

Si tu experiencia de WhatsApp depende de recomendaciones de producto o contexto de órdenes, conecta la plataforma de comercio antes o junto con WhatsApp.

## Camino custom o API

Usa este camino cuando tu fuente de datos es custom, tu checkout no está cubierto por una integración estándar o tu equipo necesita enviar eventos directamente.

Empieza aquí:

- [Resumen de desarrolladores y API]({% link _developers/developers-overview.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Seguimiento de clientes no identificados]({% link _developers/tracking-unidentified-customers.md %})
- [Seguimiento externo]({% link _developers/external-tracking.md %})

Para implementaciones custom, define el primer objetivo de negocio antes de implementar todos los eventos. Recuperación de carrito, recuperación de navegación, primera compra, derivación a soporte y atribución necesitan datos distintos.

## Qué hacer después de configurar

Después de completar tu camino:

- Haz una prueba completa con un perfil de cliente que puedas reconocer.
- Confirma que el perfil de cliente tiene el canal y estado de consentimiento correctos.
- Dispara el evento o señal que necesita tu primer flujo.
- Confirma que la señal aparece en el perfil de cliente correcto.
- Prueba un mensaje, click, respuesta, derivación y reporte.
- Lanza un primer logro antes de ampliar.

Sigue leyendo:

- [Checklist de lanzamiento]({% link _getting-started/launch-checklist.md %})
- [Primeros logros recomendados]({% link _getting-started/first-wins-starter-pack.md %})
- [Checklist antes de enviar]({% link _getting-started/go-live-checklist.md %})
