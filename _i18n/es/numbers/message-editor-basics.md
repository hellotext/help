Usa el editor de mensajes para redactar respuestas en la bandeja de entrada, campañas y mensajes de rutas o misiones. Las herramientas disponibles dependen del canal y del lugar donde estás editando; no todos admiten los mismos adjuntos, emojis, tarjetas de contacto o formatos. Consulta el [Resumen del editor de mensajes]({% link _numbers/message-editor-overview.md %}) para reconocer sus usos.

Esta guía explica cómo aplicar negrita y cursiva en el editor y cómo abrir la herramienta de enlaces. Escribir o previsualizar un borrador no lo guarda, aprueba ni envía a clientes.

### Cómo formatear tus mensajes

Haz clic dentro del texto antes de usar un atajo. En las plantillas, **Mensaje** y **Correo** tienen editores distintos: comprueba qué versión estás modificando. El formato que ves al redactar no garantiza que el canal lo conserve. **SMS usa texto plano**; la negrita o cursiva del editor no convierte el SMS en un mensaje con ese estilo.

#### Negrita

Selecciona las palabras que quieres resaltar y usa el atajo:

- <kbd> Ctrl</kbd> + <kbd>B</kbd> en Windows
- <kbd>⌘ Command</kbd> + <kbd>B</kbd> en Mac

Para quitar la negrita, selecciona esas palabras y vuelve a usar el mismo atajo. Revisa el resultado dentro del editor antes de continuar.

#### Cursiva

Selecciona las palabras que quieres poner en cursiva y usa el atajo:

- <kbd> Ctrl</kbd> + <kbd>I</kbd> en Windows
- <kbd>⌘ Command</kbd> + <kbd>I</kbd> en Mac

Vuelve a usarlo sobre la selección para quitar la cursiva. Puedes aplicar ambos estilos a una selección, pero usa el énfasis con moderación para mantener el mensaje legible.

La figura muestra la versión **Mensaje** de una plantilla ficticia sin guardar: **Consulta** está en negrita e *instrucciones* en cursiva. Es el estado del editor, no una plantilla aprobada ni un SMS entregado; su versión SMS sigue siendo texto plano.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real de Mensaje con Consulta en negrita e instrucciones en cursiva, borrador ficticio sin guardar.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 642px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/format-es-mobile.png 2x" width="652" height="528" />
        <img src="/images/numbers/message-editor-basics/format-es.png" srcset="/images/numbers/message-editor-basics/format-es.png 2x" style="width: auto; margin: 0 auto;" width="1248" height="528" loading="lazy" decoding="async" alt="Editor real de Mensaje con Consulta en negrita e instrucciones en cursiva, borrador ficticio sin guardar." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con un borrador ficticio sin guardar; no se creó ni envió contenido.</figcaption>
</figure>

#### Links

La herramienta de link del editor permite insertar un enlace corto con seguimiento. Su icono de cadena está en la barra de herramientas, visible en la figura del editor. Coloca el cursor donde quieras insertar el enlace y abre la herramienta con el icono o estos atajos, mientras el editor tiene el foco:

- <kbd> Ctrl</kbd> + <kbd>K</kbd> en Windows
- <kbd>⌘ Command</kbd> + <kbd>K</kbd> en Mac

En **Crear un enlace corto**, pega la URL completa del destino, incluido `https://`. El formulario tiene un campo de URL; no un campo para asignar un nombre dinámico al enlace. Las [Etiquetas de personalización]({% link _audience/personalization-tags.md %}) son otra herramienta y deben revisarse con los datos del perfil correspondientes.

La figura muestra **https://shop.example.test/returns**, un destino ficticio escrito sin confirmar. No se creó un enlace ni se visitó ese destino. **Agregar enlace corto** y **Cancelar** se muestran completos para identificar la decisión.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Formulario real Crear un enlace corto con URL ficticia sin agregar y botones Agregar enlace corto y Cancelar completos.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 464px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 600px)" srcset="/images/numbers/message-editor-basics/link-es-mobile.png 2x" width="728" height="428" />
        <img src="/images/numbers/message-editor-basics/link-es.png" srcset="/images/numbers/message-editor-basics/link-es.png 2x" style="width: auto; margin: 0 auto;" width="892" height="388" loading="lazy" decoding="async" alt="Formulario real Crear un enlace corto con URL ficticia sin agregar y botones Agregar enlace corto y Cancelar completos." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Interfaz real con un borrador ficticio sin guardar; no se creó ni envió contenido.</figcaption>
</figure>

Cuando hayas revisado tu URL real, **Agregar enlace corto** la registra e inserta el enlace en el editor. Pulsar <kbd>Enter</kbd> dentro del campo también inicia esa creación. **Cancelar** cierra el formulario sin agregar la URL pendiente. Agregar el enlace ocurre antes de guardar o enviar el mensaje: descartar después el borrador no debe tomarse como una anulación del enlace ya creado.

Comprueba el destino final mediante una validación autorizada con datos aislados. Que el formulario acepte una URL no demuestra que su página exista o sea accesible. Abrir un enlace de un mensaje puede registrar un clic y afectar reportes; evita usar enlaces de clientes para probar. Consulta [Links con tracking]({% link _analytics-reporting-attribution/tracked-links.md %}) para interpretar esas señales. Un enlace creado o un clic no demuestra consentimiento, entrega ni una venta atribuida.
