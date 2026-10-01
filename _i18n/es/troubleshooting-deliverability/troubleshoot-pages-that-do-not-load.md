Usa esta guía cuando una página de Hellotext queda vacía, muestra una carga que no termina, presenta información incompleta, responde lentamente o vuelve a mostrar el mismo error.

## Antes de recargar

Conserva primero la información que permitirá investigar el problema:

- copia la URL completa;
- anota el negocio seleccionado y su ID público, si está disponible;
- registra la fecha y hora aproximadas con zona horaria;
- toma una captura del mensaje o estado visible; y
- anota la última acción realizada y la última etapa cuyo resultado pudiste confirmar.

Si el error apareció al enviar una campaña, importar datos, cambiar facturación o ejecutar otra acción que puede crear resultados duplicados, confirma su estado antes de repetirla. Una carga interrumpida o un aviso ausente no demuestra que el servidor haya rechazado la operación. Conserva la solicitud original y consulta su resultado; si sigue incierto, pide ayuda antes de volver a enviar o guardar.

En **Configuración > General**, el encabezado identifica el negocio. Este ejemplo ficticio se llama **Enterprise** y muestra el ID público **4ONLdN32**; el nombre no identifica su plan. Es una pantalla independiente que carga correctamente, sin pulsar **Editar negocio** ni cambiar de negocio. Sirve para ubicar el contexto que debes registrar, no para mostrar un error o su recuperación. Consulta [Configura tu negocio]({% link _getting-started/setting-up-your-business.md %}) si necesitas localizar estos datos.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre e ID público de un negocio ficticio en General">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 886px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/developers/custom-store-integration/business-es-mobile.png 2x" width="748" height="524" />
        <img class="ht-editorial-visual__image" src="/images/developers/custom-store-integration/business-es.png" srcset="/images/developers/custom-store-integration/business-es.png 2x" width="1736" height="404" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Nombre e ID público de un negocio ficticio en General" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Estado independiente que carga correctamente; no muestra el problema ni su solución.</figcaption>
</figure>

## Define el alcance

Comprueba qué tan amplio es el problema:

1. ¿Falla una sola página o todas las páginas de Hellotext?
2. ¿Falla un solo negocio o también ocurre al cambiar de negocio?
3. ¿Le ocurre a una sola persona o a varias personas del equipo?
4. ¿La página queda vacía o carga, pero los datos no coinciden con los filtros?
5. ¿Comenzó después de un cambio de rol, integración, navegador o red?

Una página que carga sin resultados no siempre tiene un problema técnico. Revisa el período, zona horaria, filtros, negocio y permisos antes de tratarla como una página caída. Compara la misma URL y objeto con una persona que ya tenga acceso autorizado; no cambies roles para probar. Anota qué combinación falla y cuál funciona, sin asumir que esa comparación identifica por sí sola la causa.

En reportes, conserva también el rango completo de fechas y la métrica. Este ejemplo histórico ficticio selecciona **Primeros 14 días**, del **19 de abril al 2 de mayo de 2026**, anclados a la campaña. En escritorio aparecen cuatro tarjetas completas: ingresos atribuidos en USD, ROI como múltiplo, conversión como porcentaje e ingresos por mensaje en USD. La vista estrecha muestra la primera tarjeta del carrusel. Es un estado independiente que carga, no datos actuales ni un resultado de recuperación. Revisa [Cómo analizar tus campañas]({% link _analytics-reporting-attribution/campaign-reporting.md %}) para interpretar sus métricas.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Período y cuatro tarjetas de un reporte histórico ficticio">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 1258px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-mobile-wide.png 2x" width="1048" height="580" />
        <img class="ht-editorial-visual__image" src="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png" srcset="/images/analytics-reporting-attribution/campaign-reporting/summary-period-es-wide-desktop.png 2x" width="2480" height="610" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Período y cuatro tarjetas de un reporte histórico ficticio" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Reporte independiente; las cifras no demuestran que una página se haya recuperado.</figcaption>
</figure>

Si ves el encabezado pero un panel sigue cargando, identifica cuál: distintas partes pueden solicitar datos por separado. Un reporte vacío, una sección pendiente y una página completamente inaccesible aportan evidencia diferente.

## Recupera la página

Prueba en este orden después de conservar el trabajo sin guardar. Revisa después de cada paso y detente cuando la página funcione:

1. Recarga la página una vez si es una vista de consulta. Si el navegador pide reenviar un formulario, cancela y confirma primero el resultado original.
2. Abre la misma URL en una ventana privada del mismo navegador. Ingresa con la misma cuenta autorizada y confirma el mismo negocio; una ventana privada tiene una sesión y almacenamiento distintos.
3. Confirma que tu conexión puede abrir otras páginas y que una VPN, proxy o filtro corporativo no esté bloqueando Hellotext.
4. Prueba otro navegador actualizado o una red distinta cuando la política de tu equipo lo permita.
5. Cierra sesión y vuelve a ingresar solo si el problema parece limitado a tu sesión y ya conservaste el trabajo. No elimina los registros del negocio, pero sí cambia la sesión; no lo uses para repetir una operación incierta.
6. Deshabilita temporalmente extensiones de privacidad o bloqueo de contenido para probar, cuando sea seguro hacerlo.

Que funcione en privado u otro navegador ayuda a acotar el problema, pero no prueba que una extensión o caché sea la causa. Las extensiones pueden tener permisos distintos en privado. Conserva el resultado de cada comparación y restaura cualquier extensión que deshabilites.

Limpiar la caché y borrar cookies o almacenamiento del sitio son acciones distintas. Usa la limpieza de datos solo después de guardar la evidencia y el trabajo pendiente: según las opciones elegidas puede cerrar la sesión, quitar preferencias o borradores locales y afectar registros del navegador. No elimina información guardada en los servidores de Hellotext ni cancela una operación ya recibida. Revisa qué categorías borrar y evita limpiar todos los sitios. La [documentación de almacenamiento de Chrome](https://developer.chrome.com/docs/devtools/application) explica las categorías del navegador.

## Revisa permisos y contexto

Si la navegación general funciona, pero una página específica no:

- confirma que estás en el negocio correcto;
- revisa si tu rol y las funciones disponibles para el negocio permiten acceder a esa configuración o reporte;
- abre la página desde la navegación de Hellotext en vez de usar un favorito antiguo;
- elimina filtros para comprobar si la vista vuelve a mostrar datos; y
- revisa si el objeto enlazado todavía existe y sigue disponible para tu negocio.

Un error de acceso, una vista sin datos y una carga técnica fallida necesitan soluciones distintas. Conserva el texto exacto del aviso y cualquier redirección a ingreso, verificación o plan. Los permisos se evalúan por herramienta; el nombre del rol no es una matriz universal de acceso. Borrar datos del navegador no concede permisos ni restaura un objeto eliminado.

La figura siguiente es el selector real de rol de **Lucía Méndez**, una persona ficticia ya existente, con **Agente** seleccionado. Muestra tres opciones completas, sin el pie de guardado. No muestra tu rol, un acceso denegado ni una modificación: avanzar con **Siguiente** guarda el rol, por lo que no debe usarse como prueba de acceso. Consulta [Roles y permisos del equipo]({% link _team/understanding-team-roles.md %}) y pide al responsable del negocio comprobar tu acceso actual.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Tres opciones de rol con Agente seleccionado para una persona ficticia">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="max-width: 631px; width: fit-content; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/team/understanding-team-roles/roles-es-mobile.png 2x" width="828" height="1190" />
        <img class="ht-editorial-visual__image" src="/images/team/understanding-team-roles/roles-es.png" srcset="/images/team/understanding-team-roles/roles-es.png 2x" width="1226" height="1054" style="width: auto; margin: 0 auto;" loading="lazy" decoding="async" alt="Tres opciones de rol con Agente seleccionado para una persona ficticia" />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Selector independiente sin cambios; no muestra un error de acceso.</figcaption>
</figure>

## Obtén evidencia técnica

Si tienes acceso a las herramientas de desarrollo del navegador:

1. Abre **Consola** y **Red** antes de una reproducción de consulta; no vuelvas a enviar, importar o guardar para obtener evidencia.
2. En Chrome, activa **Preserve log** si necesitas conservar solicitudes durante la navegación. Recarga una vez solo cuando no vaya a reenviar un formulario.
3. Conserva el primer error relevante y su hora. En **Red**, distingue documento, solicitud de datos y archivo JavaScript; anota URL, método y estado. Un documento con HTTP 200 no prueba que todos los paneles estén listos.

Consulta la [referencia de Red de Chrome](https://developer.chrome.com/docs/devtools/network/reference/). No uses **Resend** o **Replay XHR** para investigar una operación incierta.

| Evidencia | Qué revisar |
| --- | --- |
| Redirección al ingreso o 401 | Cuenta y sesión de la solicitud afectada. |
| 403 | Acceso a esa herramienta y negocio; puede afectar solo un panel. |
| 404 | URL, negocio y disponibilidad del objeto; no prueba por sí solo que haya sido eliminado. |
| 5xx | Solicitud original y hora para soporte; evita repetir la operación. |
| Bloqueo, fallo de conexión o ausencia de código HTTP | Mensaje del navegador y recurso afectado; no lo registres como un 500. |

Los [estados HTTP de MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status) ayudan a interpretar la respuesta; el código aislado no identifica la causa.

Un HAR puede contener URLs, identificadores y cuerpos con datos de clientes o mensajes. Incluso la exportación sanitizada de Chrome, que omite encabezados sensibles de cookies y autorización, requiere revisión. Compártelo solo si soporte lo pide y acuerda un canal seguro; no publiques tokens, contraseñas ni códigos de verificación.

## Cuándo contactar a soporte

Contacta a soporte cuando:

- el problema también ocurre en una ventana privada y otro navegador o red;
- afecta a varias personas o negocios;
- impide acceder a Inbox, canales, campañas, misiones, facturación o datos esenciales;
- una acción queda en un estado incierto y repetirla podría duplicar resultados; o
- ves errores repetidos de servidor o solicitudes fallidas que no puedes resolver.

Incluye la URL, ID del negocio, cuenta afectada, navegador y versión, hora con zona horaria, última acción y resultados de las comparaciones. Separa lo que observaste de lo que supones; una captura de otra página que funciona no demuestra la causa. Si una operación quedó incierta, indica qué resultado pudiste confirmar antes del error.

Usa [Contacta a soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) para reunir la información necesaria.

## Guías relacionadas

- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Soluciona una captura que no aparece o no registra clientes]({% link _troubleshooting-deliverability/troubleshoot-a-capture.md %})
- [Diferencias e integridad de datos en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
