# shop_app

### Inheritance ("extends") vs Mixins ("with")

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

### Provider with context or value

- If nothing based on context then go for value
- If based on context then go with create
- In case of re-use inside app, you can go with value provider method
