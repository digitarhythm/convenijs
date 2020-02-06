# convenijs
JavaScript convenience class library.

## global method
- Array.remove(n)  
Deletes the element with the specified element number in the array.  
(Stuff the last element)

## conveni class
- Usage  
conveniobj = new conveni();

## class method

### echo
Displays variable-length arguments.  

```
a = 'hoge';
b = 'foo';
c = 100;
conveniobj.echo('a=%@, b=%@, c=%@", a, b, c);
```
### sprintf
The format is the same as echo, but instead of being displayed, it is returned as a string.

```
a = 'hoge';
b = 'foo';
c = 100;
d = conveniobj.sprintf('a=%@, b=%@, c=%@", a, b, c);
console.log(d); <--- display 'a=hoge, b=foo, c=100'
```
### cpObj
Copies an object as an entity.

```
arr = {a:'hoge', b:'foo', c:100};
arr2 = conveniobj.cpObj(arr);
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
