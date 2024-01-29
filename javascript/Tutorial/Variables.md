# Variables and constants

## Types

### Basic types

- number
- string: using ' or "
- bool: using true or false

### Declare a variable

```javascript
let variableName = value;
```

### Declare a constant

```javascript
const constantName = value;
```

### Casting a type

When we want to make sure that the variable has a certain type, we can cast it.

example:

```javascript
variable2 = Number(variable1);
// in this example variable2 is the value of variable1 but with the type Number
```

## References

When copying a variable with a basic type, the *value* holded by the first
variable is copied into the second variable.

```javascript
variable2 = variable1;
// variable2's value is a copied version of the value of variable1
```

As the value is copied into the second variable, changing the value of the first
variable will not affect the value of the second variable.

---

When copying a variable variable with a complex type, the *address* of the first
variable is copied onto the second variable's address.

```javascript
variable2 = complexVariable1;
// variable2 is the copied address of variable1
```

As the value copied is the address, if the value of the first variable is changed
the second one will be changed too.
