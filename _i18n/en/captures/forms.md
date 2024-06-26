Forms allow you to create dynamic Forms based on built-in subscriber attributes such as First Name and Last Name, 
or custom properties you have created for your subscriber list.

## Creating a Form

To create a new Form, visit the **Captures** section on the dashboard, and click on **New Capture**. 
From available options to choose from, select **Website Form** and you will be taken to the Form Editor.

## Understanding the Generated Code

After you create your form, Hellotext will give you a code snippet that you can optionally embed on your website that looks like the following.

```html
<form data-hello-form=":id">
  <header data-form-hero>
  </header>

  <main data-form-inputs>
  </main>

  <section data-form-button>
  </section>

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

## Understanding Form Elements

### Hero

The Form Hero is the header of the form. It is the first thing that your subscribers will see when the form is shown. 
Hellotext, when loading the form looks for an HTML element with the `data-form-hero` attribute and load the content inside it.
If the element is not found, Hellotext creates the header manually, and prepends it to the form.

### Inputs

The Form Inputs are the fields that your subscribers see and need to fill. 
In the form editor, you can add any field based on an existing property, and control whether the field is required or not. For each Input, Hellotext generates an HTML element that looks like this

```html
<article>
  <label for=":id"></label>
  <input type=":type" id=":id" name=":name" placeholder=":placeholder" required>
</article>
```

Like the Hero, Hellotext looks for an HTML element within the form with `data-form-inputs` identifier and loads the inputs inside it.
