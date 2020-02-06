# convenijs
JavaScript convenience class library.

## global method

### Array.remove(s, n = 1)  
Deletes the element with the element number specified by "s" in the array (Stuff the last element).
The number to be deleted can be specified by "n".

## conveni class

### Usage  
conveniobj = new conveni();

## class method

### echo
Displays variable-length arguments.  

```
a = 'hoge';
b = 'foo';
c = 100;
conveniobj.echo('a=%@, b=%@, c=%@", a, b, c);  <--- display 'a=hoge, b=foo, c=100'
```
### sprintf
The format is the same as echo, but instead of being displayed, it is returned as a string.

```
a = 'hoge';
b = 'foo';
c = 100;
d = conveniobj.sprintf('a=%@, b=%@, c=%@", a, b, c);
console.log(d);  <--- display 'a=hoge, b=foo, c=100'
```
### cpObj
Copies an object as an entity.

```
obj = {a:'hoge', b:'foo', c:100};
obj2 = conveniobj.cpObj(obj);
```
### cpArr
Copies an array as an entity.

```
arr = [0, 1, 2, 3, 4];
arr2 = conveniobj.cpArr(arr);
```
### toggle
Passing True returns False, Passing False returns True.

```
a = true;
b = conveniobj.toggle(a);
console.log(b); <--- display 'false'
```
### exeFunc
Executes an anonymous function a specified number of times.

```
conveniobj.exeFunc(function(x) {
  console.log(x * 2);
}, 10);
