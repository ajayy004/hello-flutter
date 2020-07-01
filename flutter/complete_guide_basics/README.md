# complete_guide_basics

## Code

### Ex-1

```dart
class Person {
  String name = 'John';
  int age = 30;
}

double addNumber(double num1, double num2) {
  return num1+num2;
}

void main() {
  double result = addNumber(1,5);
  result = addNumber(1,1.1);
  print(result);
  var p1 = Person();
  print(p1.name);
  p1.name = 'Joe';
  print(p1.name);
  print("hello basics");
}
```

### Ex-2

```dart
class Person {
  String name;
  int age;

  Person({String inputName, int age = 23}) {
    name=inputName;
    this.age=age;
  }
}

double addNumber(double num1, double num2) {
  return num1+num2;
}

void main() {
  double result = addNumber(1,5);
  result = addNumber(1,1.1);
  print(result);
  var p1 = Person(inputName: 'John', age: 30);
  var p2 = Person(inputName: 'Joe', age: 30);
  print(p1.age);
  print(p2.age);
  print("hello basics");
}
```

### Ex-3

```dart
class Person {
  String name;
  int age;

  Person({this.name, this.age = 23}) {}
}

double addNumber(double num1, double num2) {
  return num1+num2;
}

void main() {
  double result = addNumber(1,5);
  result = addNumber(1,1.1);
  print(result);
  var p1 = Person(name: 'John', age: 30);
  var p2 = Person(name: 'Joe', age: 30);
  print(p1.age);
  print(p2.age);
  print("hello basics");
}
```

## It’s All Widgets!

- AppBar
  > A typical AppBar with a title, actions, and an overflow dropdown menu.
- Scaffold
  > Scaffold class gives out of the box basic style and features
- Text
  > The Text widget lets you create a run of styled text.
- Column
  > A Column widget arranges its children vertically.
- Row
  > A Row widget arranges its children horizontally.
- Container
  > Containers are widgets that wrap around other child widgets to define their style/position properties.
- Wrap
  > A Wrap Widget is smart, can be used to wrap multiple Widgets
- RaisedButton
- Icon
- Image
- Placeholder
