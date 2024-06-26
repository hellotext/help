Los formularios te permiten crear formularios dinámicos basados en atributos integrados de suscriptores, 
como Nombre y Apellido, o propiedades personalizadas que has creado para tu lista de suscriptores.

## Crear un formulario

Para crear un nuevo formulario, visita la sección de **Capturas** en el panel de control y haz clic en **Nueva Captura**. 
De las opciones disponibles, selecciona **Formulario Web** y serás dirigido al Editor de Formularios.

## Entendiendo el código generado

Después de crear tu formulario, Hellotext te dará un fragmento de código que puedes opcionalmente insertar en tu sitio web, 
el cual se verá como el siguiente.

```html
<form data-hello-form=":id">
  <header data-form-hero>
  </header>

  <main data-form-inputs>
  </main>

  <button data-form-button>
  </button>

  <footer data-form-notice>
  </footer>
</form>
```

<div class="note--lavender-light flex space-x-2 justify-center items-center">
  {% include icons/tip.svg %}

  <p>
    Asegúrate de instalar <a class="active" target="_blank" href="https://github.com/hellotext/hellotext.js">Hellotext.js</a> para poblar dinámicamente el formulario.
  </p>
</div>

## Entendiendo los componentes

### Hero

El Hero es el encabezado del formulario. Es lo primero que ven tus suscriptores cuando se carga el formulario. 
Hellotext, al cargar el formulario, busca un elemento HTML con el atributo `data-form-hero` y carga el contenido dentro de él. 
Si no encuentra el elemento, Hellotext crea manualmente el encabezado y lo añade al principio del formulario, asegurándose de que sea el primer componente en el elemento.

### Inputs

Los Inputs son los campos que tus suscriptores necesitan completar. Puedes especificar qué campos son obligatorios y cuáles no en el editor de formularios.
En el editor de formularios, puedes agregar cualquier campo basado en una propiedad existente y controlar si el campo es obligatorio o no. Para cada Input, Hellotext genera un elemento HTML que se ve así

```html
<article>
  <label for=":id"></label>
  <input type=":type" id=":id" name=":name" placeholder=":placeholder" required>
  <div data-error-container></div>
</article>
```

Al igual que con el Hero, Hellotext busca un elemento HTML dentro del formulario con el identificador `data-form-inputs` 
y carga los inputs dentro de él. El elemento `data-error-container` se utiliza y se muestra solo cuando el usuario intenta enviar el formulario y no ha completado campo/s obligatorio/s.

### Button

El botón del formulario es donde se realiza la presentación del formulario. 
Hellotext busca un elemento `button` con el atributo `data-form-button` y carga el botón dentro de él. 
Si no encuentra el elemento, Hellotext crea manualmente el botón y lo añade al formulario después de la sección de Inputs.

### Notice

El Notice es el pie de página del formulario. Es lo último que verán tus suscriptores cuando se muestra el formulario. 
Hellotext busca un elemento HTML con el atributo `data-form-notice` y carga el contenido dentro de él. 
Si no encuentra el elemento, Hellotext crea manualmente el pie de página y lo añade al formulario después de la sección del botón.

### Seguridad

Hellotext previene el robo de identidad y la suplantación de otras personas mediante la Autenticación de Dos Factores (2FA). 
Cuando un suscriptor completa el formulario, Hellotext envía un código de Contraseña de Un Solo Uso (OTP) al suscriptor. 
Si el suscriptor ingresa su correo electrónico, se envía un correo electrónico a esa dirección; de lo contrario, se envía un SMS a su número de teléfono.

Hasta que se ingrese un OTP válido, los datos no se mostrarán en el panel de control ni contribuirán al marketing de atribución. 
Esto protege eficazmente a los clientes y a tu negocio contra bots y otros actores malintencionados.

### Personalización del diseño del formulario

Hellotext define un diseño fijo para los formularios. Sin embargo, puedes anular este diseño si lo deseas. 
Para cambiar dónde carga Hellotext los componentes del formulario, puedes agregar componentes de plantilla que Hellotext poblara en lugar de crear.

Por ejemplo, si deseas mostrar el componente de botón después del componente de aviso,
puedes definir los elementos `data-form-notice` y `data-form-button` como elementos vacíos. 
Hellotext simplemente cargaría el contenido dentro de los elementos respectivos sin crear el diseño predeterminado.

```html
<form data-hello-form=":id">
  <footer data-form-notice>
  </footer>

  <button data-form-button>
  </button>
</form>
```

### Personalización del estilo del formulario

Hellotext envía formularios con un diseño básico en HTML para que puedas estilizarlos según tus preferencias y directrices 
de marca. Los formularios de Hellotext tienen estilos mínimos para asegurar que se vean bien en cualquier sitio web. 
Sin colores, sin bordes, sin rellenos, solo los elementos del formulario con diseños específicos.

## Hellotext Attribution

El logo de Hellotext se muestra en la esquina inferior derecha del formulario. 
Esto asegura que tus suscriptores sepan que el formulario está impulsado por Hellotext y que sus datos están seguros y protegidos.

Esto forma parte de nuestra política de "White Label". Es necesario que este logo se muestre y se mantenga visible en el 
formulario, a menos que el paquete al que te suscribas tenga la función de "White Label" habilitada.

Para más información sobre los paquetes disponibles y las características, 
consulta nuestra [Página de Precios](https://www.hellotext.com/pricing).

## Eventos de JavaScript

Los formularios dependen de [Hellotext.js](https://github.com/hellotext/hellotext.js), es necesario instalar Hellotext.js para poblar dinámicamente el formulario. A continuación se describen los eventos despachados por Hellotext.js:

- `forms:collected` - Se despacha cuando Hellotext ha recopilado todos los formularios. La recopilación significa que Hellotext ha contactado con la API y ha obtenido los datos del formulario. La carga útil del evento es un array de formularios que fueron recopilados.
- `form:completed` - Se despacha cuando el usuario completa todos los campos requeridos en el formulario y ha ingresado exitosamente el código de Contraseña de Un Solo Uso que enviamos.
