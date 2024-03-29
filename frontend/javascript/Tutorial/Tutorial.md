# Javascript

In HTML, JavaScript code is inserted between `<script>` and `</script>` tags.

```html
<script>
    // Javascript code
<\script>
```

## Functions

A JavaScript function is a block of JavaScript code, that can be executed when
"called" for.

---

Scripts can be placed in the `<body>` or/and in the `head` section of an HTML
page or in external files.

## Sections

*Note: placing scripts at the bottom of the `<body>` element improves the
display speed.*

## External files

External scripts are practical when the same code is used in many different web pages.

JavaScript files have the file extension **.js**.

To use an external script, put the name of the script file in the src (source) attribute of a `<script>` tag:

```html
<!-- Import using a file path -->
<script src="fileName.js"></script>
<!-- Import using a URL-->
<script src="https://fileName.js"></script>
```

### Advantages

- separates HTML and code, makes HTML and JavaScript easier to read and maintain.
- cached JavaScript files can speed up page loads.

## Display possibilities

JavaScript can "display" data in different ways:

### Using innerHTML

To access an HTML element, JavaScript can use the document.getElementById(id) method.

The id attribute defines the HTML element. The innerHTML property defines the HTML content:

```html
<!DOCTYPE html>
<html>
<body>

<h1>My First Web Page</h1>
<p>My First Paragraph</p>

<p id="demo"></p>

<script>
document.getElementById("demo").innerHTML = 5 + 6;
</script>

</body>
</html> 
```

### Using document.write()

Only for testing purposes

```html
<!DOCTYPE html>
<html>
<body>

<h1>My First Web Page</h1>
<p>My first paragraph.</p>

<script>
document.write(5 + 6);
</script>

</body>
</html> 
```

### Using window.alert()

Used to display data in an alert box:

```html
<!DOCTYPE html>
<html>
<body>

<h1>My First Web Page</h1>
<p>My first paragraph.</p>

<script>
window.alert(5 + 6);
</script>

</body>
</html> 
```

You can skip the window keyword.

In JavaScript, the window object is the global scope object. This means that
variables, properties, and methods by default belong to the window object. This
also means that specifying the window keyword is optional.

## More Tutorials

- [Logging](Logging.md)
