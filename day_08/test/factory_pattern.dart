// ignore_for_file: avoid_print, unused_local_variable

abstract class Ramen {
  void cook();
}

class ShinRamen implements Ramen {
  @override
  void cook() => print('신라면 끓이는 중...');
}

class JinRamen implements Ramen {
  @override
  void cook() => print('진라면 끓이는 중...');
}

class BasicRamen implements Ramen {
  @override
  void cook() => print('기본 라면 끓이는 중...');
}

class RamenFactory {
  static Ramen create(String type) {
    switch (type) {
      case 'shin':
        return ShinRamen();
      case 'jin':
        return JinRamen();
      default:
        return BasicRamen();
    }
  }
}

void main() {
  final ramen = RamenFactory.create('shin'); // 어떤 구현체인지는 몰라도 됨
  ramen.cook();

  // flutter Factory
  final json = {'name': '철수', 'age': 20};
  final user = User.fromJson(json);
}

// MARK: Dart 의 Factory
class User {
  final String name;
  final int age;

  User._(this.name, this.age); // 실제로 객체를 만드는 내부 생성자

  // 이게 factory 생성자
  factory User.fromJson(Map<String, dynamic> json) {
    return User._(
      json['name'] as String,
      json['age'] as int,
    );
  }
}
