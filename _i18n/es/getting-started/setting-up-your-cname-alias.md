## Enlaces Cortos

<div class="note">
    Nota: El alias de enlace corto es parte de la función <i>White Label</i>.
    Consulta nuestros <a href="https://www.hellotext.com/pricing" class="active" target="_blank">Precios</a> para obtener más información.
</div>

Hellotext genera enlaces cortos que se utilizan para recopilar información del cliente y realizar un seguimiento de su actividad en su sitio.
Con los enlaces cortos, puede saber qué campaña o viaje envió el mensaje al cliente, cuándo hizo clic en el enlace corto,
y a dónde fueron redirigidos.

Por defecto, Hellotext genera enlaces cortos utilizando el dominio `hello.link`. Los enlaces cortos se mostrarán en el siguiente formato
al enviar a los clientes: `hello.link/XXXXXX`.

Alias de un enlace corto le permite especificar un dominio específico para usar en lugar de `hello.link`. Ayuda a hacer su
mensajes más personalizados ya que sus clientes reconocen el dominio y confían automáticamente en el enlace, esto puede ser útil cuando se construye la lealtad de la marca.

Por ejemplo, si usted es dueño del dominio `mydomain.com`, puede alias sus enlaces cortos para usar `mydomain.com` en lugar de `hello.link`.
Entonces, cuando se generan enlaces cortos, Hellotext utilizará el dominio que especificó en lugar de `hello.link`.
Los enlaces cortos se mostrarán en el siguiente formato al enviar a los clientes: `mydomain.com/XXXXXX`.

## Configurar el alias en Hellotext

Para configurar el alias, debe ser un administrador o propietario del negocio.
En primer lugar, inicie sesión en su cuenta y vaya a la página de configuración del negocio. Haga clic en _Editar negocio_
Y luego ingrese un nombre de dominio en el campo CNAME, asegúrese de que el cname corresponda a un dominio que usted posea.


## Configurar el alias en su proveedor de DNS


Navega a tu proveedor de DNS y crea un registro CNAME que apunte tu subdominio al dominio predeterminado de tu sitio. 
Por ejemplo, si deseas usar el subdominio `www.myshop.com` para Enlaces Cortos, 
crea un registro CNAME que apunte `www.myshop.com` a `hello.link`. Para obtener más información sobre cómo crear el 
registro correcto, consulta la documentación de tu proveedor de DNS.

<div class="note">
    Nota: Los cambios de DNS pueden tardar hasta 24 horas en propagarse.
</div>

Después de configurar el alias en Hellotext, Hellotext comenzará a usar el alias configurado cuando se haya verificado.
que el alias esté configurado correctamente en su proveedor de DNS y pueda recibir llamadas. Una vez que verifiquemos que el alias
apunta con éxito a `hello.link`, comenzaremos a usar el alias para enlaces cortos. Hellotext solo comenzará a usar el alias
una vez que se verifica el alias, podrá saber con seguridad que los enlaces cortos enviados a sus clientes se pueden abrir.

## Notas sobre cómo cambiar el alias

Los alias se utilizan en los mensajes enviados a los clientes; después de configurar el alias en un dominio específico, debes tener cuidado al cambiarlo nuevamente.
Si cambia el alias, Hellotext comenzará a usar ese alias inmediatamente después de haberlo verificado.
Sin embargo, los mensajes que se enviaron antes de que se cambiara el alias seguirán usando el alias anterior. Esto significa que cuando cambias el alias,
debe configurar redireccionamientos correctos a `hello.link` para el alias anterior, de modo que los clientes aún puedan abrir los enlaces cortos que se les enviaron antes de que se cambiara el alias.
Hellotext no es responsable de enrutar enlaces cortos antiguos al destino correcto, por lo que debes asegurarte de que el alias anterior siga siendo válido.
