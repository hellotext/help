Usa esta guía cuando una página de Hellotext queda vacía, muestra una carga que no termina, presenta información incompleta, responde lentamente o vuelve a mostrar el mismo error.

## Antes de recargar

Conserva primero la información que permitirá investigar el problema:

- copia la URL completa;
- anota el negocio seleccionado;
- registra la fecha y hora aproximadas con zona horaria;
- toma una captura del mensaje o estado visible; y
- anota la última acción realizada.

Si el error apareció al enviar una campaña, importar datos, cambiar facturación o ejecutar otra acción que puede crear resultados duplicados, confirma su estado antes de repetirla.

## Define el alcance

Comprueba qué tan amplio es el problema:

1. ¿Falla una sola página o todas las páginas de Hellotext?
2. ¿Falla un solo negocio o también ocurre al cambiar de negocio?
3. ¿Le ocurre a una sola persona o a varias personas del equipo?
4. ¿La página queda vacía o carga, pero los datos no coinciden con los filtros?
5. ¿Comenzó después de un cambio de rol, integración, navegador o red?

Una página que carga sin resultados no siempre tiene un problema técnico. Revisa el período, zona horaria, filtros, negocio y permisos antes de tratarla como una página caída.

## Recupera la página

Prueba en este orden y vuelve a revisar después de cada paso:

1. Recarga la página una vez.
2. Abre la misma URL en una ventana privada del mismo navegador.
3. Confirma que tu conexión puede abrir otras páginas y que una VPN, proxy o filtro corporativo no esté bloqueando Hellotext.
4. Prueba otro navegador actualizado o una red distinta cuando la política de tu equipo lo permita.
5. Cierra sesión y vuelve a ingresar si el problema parece limitado a tu sesión.
6. Deshabilita temporalmente extensiones de privacidad o bloqueo de contenido para probar, cuando sea seguro hacerlo.

Limpia los datos del sitio solo después de guardar la evidencia y cualquier trabajo sin guardar. Este paso cierra la sesión y borra preferencias locales del navegador, aunque no elimina información guardada en tu negocio de Hellotext.

## Revisa permisos y contexto

Si la navegación general funciona, pero una página específica no:

- confirma que estás en el negocio correcto;
- revisa si tu rol permite acceder a esa configuración o reporte;
- abre la página desde la navegación de Hellotext en vez de usar un favorito antiguo;
- elimina filtros para comprobar si la vista vuelve a mostrar datos; y
- revisa si el objeto enlazado todavía existe y sigue disponible para tu negocio.

Un error de acceso, una vista sin datos y una carga técnica fallida necesitan soluciones distintas. Conserva el texto exacto del aviso.

## Obtén evidencia técnica

Si tienes acceso a las herramientas de desarrollo del navegador:

1. Abre **Consola** y **Red** antes de reproducir el problema.
2. Recarga la página y repite la acción una vez.
3. Conserva el texto del primer error relevante.
4. En **Red**, identifica solicitudes fallidas y anota URL, método, estado y hora.

Un archivo HAR puede contener identificadores de clientes, contenido de mensajes, cookies o encabezados de autorización. No lo compartas salvo que soporte lo solicite y hayas confirmado una forma segura de enviarlo.

## Cuándo contactar a soporte

Contacta a soporte cuando:

- el problema también ocurre en una ventana privada y otro navegador o red;
- afecta a varias personas o negocios;
- impide acceder a Inbox, canales, campañas, playbooks, facturación o datos esenciales;
- una acción queda en un estado incierto y repetirla podría duplicar resultados; o
- ves errores repetidos de servidor o solicitudes fallidas que no puedes resolver.

Usa [Contacta a soporte de Hellotext]({% link _troubleshooting-deliverability/contact-hellotext-support.md %}) para reunir la información necesaria.

## Guías relacionadas

- [Checklist de solución de problemas]({% link _troubleshooting-deliverability/troubleshooting-checklist.md %})
- [Soluciona señales o actividad faltante]({% link _troubleshooting-deliverability/troubleshoot-missing-signals-or-activity.md %})
- [Soluciona una captura que no aparece o no registra clientes]({% link _troubleshooting-deliverability/troubleshoot-a-capture.md %})
- [Diferencias e integridad de datos en reportes]({% link _analytics-reporting-attribution/data-completeness-and-reporting-gaps.md %})
