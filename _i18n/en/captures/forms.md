Forms allow you to create dynamic Forms based on built-in subscriber attributes such as First Name and Last Name, 
or custom properties you have created for your subscriber list.

## Creating a Form

To create a new Form, visit the **Captures** section on the dashboard, and click on **New Capture**. 

<img src="images/captures/forms/en/new-capture-method.jpeg" alt="" width="768" />

From available options to choose from, select **Website Form** and you will be taken to the Form Editor.

<img src="images/captures/forms/en/click-form.jpeg" alt="" width="768" />

## Understanding Components

### Hero

<img src="images/captures/forms/en/component-header.jpeg" alt="" width="768" />

The Hero is the header of the form. It is the first thing that your subscribers see when the form is loaded. 
Hellotext, when loading the form looks for an HTML element with the `data-form-hero` attribute and load the content inside it.
If the element is not found, Hellotext creates the header manually, and prepends it to the form, making sure that it is the first component in the element.

### Inputs

<img src="images/captures/forms/en/component-inputs.jpeg" alt="" width="768" />

The Inputs are the fields that your subscribers need to fill, you can specify which fields are required and which one are not in the Form editor. 
In the form editor, you can add any field based on an existing property, and control whether the field is required or not. For each Input, Hellotext generates an HTML element that looks like this

```html
<article>
  <label for=":id"></label>
  <input type=":type" id=":id" name=":name" placeholder=":placeholder" required>
  <div data-error-container></div>
</article>
```

Like the Hero, Hellotext looks for an HTML element within the form with `data-form-inputs` identifier and loads the inputs inside it.
The `data-error-container` element is used and displayed only when the user tries to submit the form and they have not filled required field/s.

### Button

<img src="images/captures/forms/en/component-button.jpeg" alt="" width="768" />

The Button is where the form's submission happens. Hellotext looks for a `button` element with the `data-form-button` attribute and loads the button inside it. 
If the element is not found, Hellotext creates the button manually, and appends it to the form after the Inputs section.

### Notice

<img src="images/captures/forms/en/component-footer.jpeg" alt="" width="768" />

The Notice is the footer of the form. It is the last thing that your subscribers will see when the form is shown. 
Hellotext looks for an HTML element with the `data-form-notice` attribute and loads the content inside it. 
If the element is not found, Hellotext creates the footer manually, and appends it to the form after the Button section.

### Security

Hellotext prevents identity theft and impersonation of other people via Two-Factor Authentication (2FA). 
When a subscriber fills the form, Hellotext sends a One Time Password (OTP) code to the subscriber. If the subscriber enters their email, an email is sent to them, otherwise an SMS is sent to their phone number.

Until a valid OTP has been entered, data will not show up on the dashboard and will not contribute to attribution marketing. Effectively protecting customers and your business from bots, and other malicious actors.


## Understanding the generated code

After you create your form, Hellotext will give you a code snippet that you can optionally embed on your website that looks like the following.

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
    Make sure to install <a class="active" target="_blank" href="https://github.com/hellotext/hellotext.js">Hellotext.js</a> to dynamically populate the form.
  </p>
</div>

### Customizing the Form's layout

Hellotext defines a fixed layout for forms. But you can override this layout if you want, to change where Hellotext loads the form's components,
you can add the boilerplate components that Hellotext will populate instead of creating. 
For example, if you want to show the Button component after the Notice component, you can define the `data-form-notice` and `data-form-button` as empty elements, 
Hellotext would simply load the contents inside the respective elements without creating the default layout

```html
<form data-hello-form=":id">
  <footer data-form-notice>
  </footer>

  <button data-form-button>
  </button>
</form>
```

### Customizing the Form's style

Hellotext ships Forms with a boilerplate HTML layout so that you can style them according to your preference and brand guidelines.
Hellotext forms have bare minimum styling to ensure that they look good on any website. No colors, no borders, no padding, just the form elements with specific layouts.


## Hellotext Attribution

Hellotext logo is displayed at the bottom-right of the form. This is to ensure that your subscribers know that the form is powered by Hellotext, and that their data is secure and protected.
This is part of our _White Label_ policy, it is required that this logo be displayed and kept visible on the form. Unless the package you subscribe to has the _White Label_ feature enabled.
Please refer to our [Pricing](https://www.hellotext.com/pricing) for more information regarding available packages and the features.


## JavaScript Events

Forms rely on [Hellotext.js](https://github.com/hellotext/hellotext.js), it's required to install Hellotext.js to dynamically populate the form. The following events are dispatched by Hellotext.js

- `forms:collected` - Dispatched when Hellotext collects all the forms. Collection means that Hellotext has contacted the API and fetched the form data. The event's payload is the array of forms that were collected.
- `form:completed` - Dispatched when the user fills all required inputs in the form, and successfully completes the One Time Password code we send. 
