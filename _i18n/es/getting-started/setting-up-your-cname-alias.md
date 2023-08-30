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


## Configurar un subdominio


Navega a tu proveedor de DNS y crea un registro CNAME que apunte tu subdominio al dominio predeterminado de tu sitio. 
Por ejemplo, si deseas usar el subdominio `www.myshop.com` para Enlaces Cortos, 
crea un registro CNAME que apunte `www.myshop.com` a `hello.link`. Para obtener más información sobre cómo crear el 
registro correcto, consulta la documentación de tu proveedor de DNS.

## Configurar un dominio apex

Para configurar un dominio ápice, como por ejemplo `example.com`, debes configurar un dominio personalizado en la configuración de tu negocio y al menos un registro ALIAS, ANAME o A con tu proveedor de DNS.
Por ejemplo, si en lugar de utilizar el subdominio `shop.mysite.com` para Enlaces Cortos, deseas usar el dominio ápice `mysite.com`, debes crear un registro ALIAS, ANAME o A que apunte `mysite.com` a `hello.link`.
Para obtener más información sobre cómo crear el registro correcto, consulta la documentación de tu proveedor de DNS.

<div class="note">
    Nota: Los cambios de DNS pueden tardar hasta 24 horas en propagarse.
</div>

Después de configurar el alias en Hellotext, Hellotext comenzará a usar el alias configurado cuando se haya verificado.
que el alias esté configurado correctamente en su proveedor de DNS y pueda recibir llamadas.

## Verificar el alias

Hellotext intenta verificar el alias haciéndole ping cada 5 minutos.
Una vez que el ping se realiza con éxito, esto significa que el ping ha viajado desde Hellotext hasta tu proveedor de DNS y ha vuelto a Hellotext.
Esto indica que el alias está configurado correctamente y Hellotext comenzará a usar el alias para enlaces cortos en ese momento.
Cuando actualices el alias, Hellotext iniciará nuevamente el proceso de verificación

## Notas sobre cómo cambiar el alias

Los alias se utilizan en los mensajes enviados a los clientes; después de configurar el alias en un dominio específico, debes tener cuidado al cambiarlo nuevamente.
Si cambia el alias, Hellotext comenzará a usar ese alias inmediatamente después de haberlo verificado.
Sin embargo, los mensajes que se enviaron antes de que se cambiara el alias seguirán usando el alias anterior. Esto significa que cuando cambias el alias,
debe configurar redireccionamientos correctos a `hello.link` para el alias anterior, de modo que los clientes aún puedan abrir los enlaces cortos que se les enviaron antes de que se cambiara el alias.
Hellotext no es responsable de enrutar enlaces cortos antiguos al destino correcto, por lo que debes asegurarte de que el alias anterior siga siendo válido.
