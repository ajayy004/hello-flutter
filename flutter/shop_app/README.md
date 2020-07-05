# shop_app

- Inheritance ("extends") vs Mixins ("with")

```dart
mixin Agility {
  final int speed = 20;

  void sitDown() {
    print('Sitting down...');
  }
}


class Mammal {
  void breathe() {
    print('Breathe in... breathe out...');
  }
}

class Person extends Mammal with Agility {
  String name;
  int age;

  Person(this.name, this.age);
}

void main() {
  final p1 = Person('P1', 20);
  print(p1.name);
  p1.breathe();
  print(p1.speed);
  p1.sitDown();

}
```
