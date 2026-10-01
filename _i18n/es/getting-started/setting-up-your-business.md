Usa esta guía cuando estás creando un negocio nuevo en Hellotext o revisando un negocio existente antes del lanzamiento.

Para ver el orden completo de lanzamiento, empieza por el [checklist de lanzamiento]({% link _getting-started/launch-checklist.md %}).

## Antes de empezar

Asegúrate de tener claro:

- El nombre del negocio y el país principal.
- Quién debe ser propietario del negocio en Hellotext.
- Quién necesita acceso de administrador durante la configuración.
- Qué plataforma de eCommerce, marketplace o sistema personalizado debería conectarse primero.
- Qué canal de mensajería vas a usar primero, normalmente WhatsApp o SMS.

Si todavía no tienes acceso a Hellotext, contacta a tu representante de Hellotext o solicita una demo desde el [sitio de Hellotext](https://www.hellotext.com/demo).

## Crea o revisa el negocio

Cuando crees un negocio, usa un nombre y un username que tu equipo pueda reconocer. El país debería coincidir con el lugar donde opera principalmente el negocio. Revisa las condiciones de tu mercado: el país de facturación puede afectar impuestos y moneda, y la disponibilidad o tarifa de un canal depende también del destino y proveedor.

Abre **Configuración** y comprueba el nombre y el **ID del negocio** para reconocer el negocio seleccionado. El ID es público; es distinto del correo de acceso, del usuario del negocio en la URL y de un token privado de API. En este ejemplo, **Enterprise** es el nombre ficticio del negocio, sin confirmar el plan contratado.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reconoce el negocio seleccionado en Configuración">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Negocio ficticio Enterprise con ID público 4ONLdN32 y control Editar negocio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con datos ficticios. Enterprise es un nombre de negocio; esta tarjeta no demuestra el plan contratado.</figcaption>
</figure>

**Editar negocio** permite revisar el nombre, **Usuario**, idioma del negocio y zona horaria. Usuario identifica el negocio en su URL; no cambia el correo con el que entra cada persona. Revisa la zona horaria que usarán sus horarios y reportes, y el idioma del negocio por separado del idioma de cada cuenta.

Para revisar el país, abre **Facturación**, busca **Información de facturación** y el control para cambiar de país. La pantalla siguiente muestra **Uruguay** y el aviso sobre impuestos de próximas facturas. Es una revisión del país de facturación; abrir el formulario o seleccionar una opción no guarda el cambio ni conecta un canal. Confirma sus consecuencias antes de guardar.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Revisa el país de facturación y su aviso de impuestos">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 903px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/billing-settings-and-invoices/country-es-mobile.png 2x" width="812" height="564" />
        <img class="ht-editorial-visual__image" src="/images/billing/billing-settings-and-invoices/country-es.png" srcset="/images/billing/billing-settings-and-invoices/country-es.png 2x" width="1770" height="568" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Formulario real Cambiar país de facturación con Uruguay seleccionado, aviso sobre impuestos, Guardar y Cancelar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz ficticia existente, formulario abierto sin guardar. La selección de Uruguay no demuestra disponibilidad de un canal.</figcaption>
</figure>

Antes de conectar integraciones o enviar mensajes, confirma que:

- El nombre del negocio es correcto.
- El username es fácil de identificar para tu equipo.
- El país, idioma y zona horaria del negocio son correctos.
- La cuenta propietaria es la indicada.
- Los usuarios administradores que configurarán integraciones tienen acceso.

En **Tu Equipo**, comprueba quién figura como **Dueño**. Tener rol Administrador no convierte a una persona en Dueño. Si la cuenta propietaria no es la correcta, resuélvelo antes de hacer cambios más amplios de configuración. Sigue leyendo: [Transfiere la propiedad del negocio]({% link _integrations/transferring-ownership.md %}).

## Confirma el contexto de facturación y plan

Tu plan determina qué está incluido, cómo se cuentan los consumos y qué reglas de facturación aplican. En **Facturación**, revisa el plan, el período y el uso del negocio correcto. El importe mostrado hasta ahora puede cambiar durante el mes; no es una factura final ni se obtiene sumando todas las categorías.

Este ejemplo ficticio de **Grow** corresponde a septiembre de 2026 en Uruguay: mínimo mensual de 299 USD, tarifa por atribución de 252 USD sobre 8.400 USD de ventas, 12 USD de SMS y 2 USD de otros mensajes. El cálculo muestra el mayor de esos importes, 299 USD. El ejemplo ayuda a reconocer la tarjeta, sin fijar las condiciones de otro mercado o contrato.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Identifica el plan y el importe calculado hasta ahora">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 750px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/billing/understanding-plan-quotas/plan-es-mobile.png 2x" width="920" height="528" />
        <img class="ht-editorial-visual__image" src="/images/billing/understanding-plan-quotas/plan-es.png" srcset="/images/billing/understanding-plan-quotas/plan-es.png 2x" width="1464" height="504" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tarjeta real Tu plan es Grow con importe ficticio de 299 USD hasta ahora, categorías Plan, Attribution, SMS y Resto de mensajes y control Cambiar mi Plan." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Uso ficticio de septiembre de 2026 en Uruguay; mínimo Grow 299, atribución 252, SMS 12 y otros mensajes 2 USD. El mayor es 299; no es una factura final ni una suma de categorías.</figcaption>
</figure>

Usa las guías de facturación cuando necesites entender mínimos del plan, tarifas por performance, costos SMS, tarifas variables por mensajes o facturas.

Sigue leyendo:

- [Modelo de precios]({% link _billing/how-pricing-works.md %})
- [Uso y consumos del plan]({% link _billing/understanding-plan-quotas.md %})

Para precios actuales de planes y tablas de tarifas SMS, revisa siempre la página pública de [precios de Hellotext](https://www.hellotext.com/precios).

Un negocio prepago nuevo puede tener acceso a SMS, pero el envío requiere destinos y remitentes disponibles, permiso de los destinatarios, saldo o condiciones de pago suficientes y límites vigentes. Puede aplicarse un límite diario temporal mientras Hellotext revisa la calidad de sus envíos; crear el negocio no garantiza un envío inmediato. Sigue leyendo: [Límites de envío SMS para negocios nuevos]({% link _troubleshooting-deliverability/sms-sending-limits-for-new-businesses.md %}).

## Conecta tu fuente de datos

Conecta la plataforma donde viven los datos de clientes, órdenes, productos, carritos y compras. Esto ayuda a Hellotext a crear perfiles de cliente, leer señales, personalizar mensajes y atribuir resultados desde el comienzo.

Empieza por el resumen de configuración y después elige la guía que coincida con tu tienda o marketplace. Confirma que conectas la cuenta de origen correcta y que tienes los permisos necesarios. La autorización y la sincronización son pasos distintos: una conexión activa no demuestra que ya se importaron todos los datos. Revisa una muestra conocida de perfiles y pedidos, sus referencias, origen, moneda y fechas; un pedido guardado no demuestra por sí solo una compra registrada o atribuida.

Sigue leyendo: [Resumen de configuración e integraciones]({% link _integrations/setup-overview.md %}).

## Conecta tu primer canal de mensajería

Antes de crear capturas, misiones, rutas o campañas, confirma qué canal deberían usar tus clientes para recibir mensajes y responder.

Usa el resumen de mensajería para decidir qué preparar para SMS, WhatsApp y configuración de remitentes. Comprueba el remitente, destinos, mecanismo de baja y atención de respuestas. Para WhatsApp, revisa la versión activa aprobada de la plantilla que vas a usar cuando sea necesaria. Tener un canal conectado o un teléfono en un perfil no demuestra permiso para ese canal y tipo de comunicación, ni habilita todos los flujos de envío.

Sigue leyendo: [Resumen de canales de mensajería]({% link _numbers/messaging-overview.md %}).

## Invita a las personas correctas

Invita a quienes van a configurar el negocio, revisar reportes, responder conversaciones o gestionar clientes desde el Inbox.

Usa los roles con cuidado: **Agente** para atención del Inbox, **Manager** para operación y marketing, y **Administrador** para quienes necesitan mantener ajustes sensibles. Reserva **Dueño** para la persona responsable del negocio; su cambio usa la transferencia de propiedad, no la invitación normal. El plan también determina si puedes agregar colaboradores: un rol no agrega funciones que tu negocio no tenga disponibles.

En **Tu Equipo**, abre **Invitar a un miembro del equipo** e ingresa su dirección de correo electrónico. Este campo muestra `operations@example.test` como borrador ficticio sin guardar; todavía no se creó ni envió una invitación.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Reconoce el correo de una invitación antes de crearla">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 445px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/getting-started/setting-up-your-business/invite-es-mobile.png 2x" width="764" height="196" />
        <img class="ht-editorial-visual__image" src="/images/getting-started/setting-up-your-business/invite-es.png" srcset="/images/getting-started/setting-up-your-business/invite-es.png 2x" width="854" height="196" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Campo real Dirección de correo electrónico con operations@example.test escrito sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Primer campo del asistente Invita a un miembro del equipo. Correo ficticio sin guardar, sin crear invitación ni enviar correo.</figcaption>
</figure>

Continúa el asistente solo con una persona autorizada: revisa rol, equipos y capacidad del Inbox antes de enviar la invitación. Guardar un borrador no da acceso; la persona debe aceptar la invitación. Rol, pertenencia a equipos y capacidad resuelven permisos, enrutamiento y carga de trabajo por separado.

Sigue leyendo: [Roles y permisos de equipo]({% link _team/understanding-team-roles.md %}).

## Continúa con el lanzamiento

Cuando el acceso, el contexto de facturación, los datos, los canales y el equipo estén listos, continúa con capturas, tu primera audiencia y tu primera misión o ruta. Antes de activarla o planificar un envío, usa el checklist para revisar permisos, contenido, audiencia y responsables. Cualquier validación con envío debe estar autorizada y aislada, con destinatarios propios que hayan dado permiso; un borrador o una respuesta de aceptación no demuestra entrega.

Sigue leyendo: [Checklist de lanzamiento]({% link _getting-started/launch-checklist.md %}).
