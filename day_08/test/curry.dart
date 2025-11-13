main() {
  /// 커리
  // 함수 자체를 쪼개줌
  final mult = curryMul(2);

  for (int i = 1; i <= 10; i++) {
    print(mult(i));
  }
}

curry(Function f) => (a, {Iterable? args}) =>
    (args?.length ?? 0) > 1 ? f(a, args) : (b) => f(a, b);

final testMul = (int a, int b) => a * b;
final curryMul = curry(testMul);
