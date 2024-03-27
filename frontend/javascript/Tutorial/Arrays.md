# Arrays

## Declaration

Arrays are declared using [] operator

```javascript
const arrayName = [value1, value2, value3, value4];
```

## Length

To get the length of the array

```javascript
const arrayLength = arrayName.length
```

## Add elements

To add elements to the end of an array:

```javascript
arrayName.push(NewElement);
```

## Remove elements

To remove the last element from the array:

```javascript
arrayName.pop();
```

## Copying an array by values

As an array is a complex type, when copied the copy will only contain the
address of the array instead of the values.
If you want to copy the array by values you can use the operator "...": 

```javascript
let array2 = [...array1];
// here the values of array1 are copied into array2
```
