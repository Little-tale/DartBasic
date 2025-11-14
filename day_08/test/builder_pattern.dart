// ignore_for_file: avoid_print

class Ramen {
  final String name;
  final bool hasEgg;
  final bool hasCheese;
  final int spicyLevel;

  // 외부에서 직접 new 못 하게 private 생성자로 막기
  Ramen._({
    required this.name,
    required this.hasEgg,
    required this.hasCheese,
    required this.spicyLevel,
  });

  @override
  String toString() {
    return 'Ramen(name: $name, egg: $hasEgg, cheese: $hasCheese, spicy: $spicyLevel)';
  }
}

class RamenBuilder {
  String name = '기본라면';
  bool hasEgg = false;
  bool hasCheese = false;
  int spicyLevel = 1;

  Ramen build() {
    if (spicyLevel < 0 || spicyLevel > 5) {
      throw ArgumentError('spicyLevel은 0 ~ 5 사이여야 합니다.');
    }

    return Ramen._(
      name: name,
      hasEgg: hasEgg,
      hasCheese: hasCheese,
      spicyLevel: spicyLevel,
    );
  }
}

void main() {
  final builder = RamenBuilder();

  builder.name = '신라면';
  builder.hasEgg = true;
  builder.spicyLevel = 3;

  final ramen = builder.build();

  print(ramen);
}
