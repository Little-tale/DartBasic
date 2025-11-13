void main() {
  /// 람다

  // ignore: unused_element
  int add(int a, int b) {
    return a + b;
  }

  (int a, int b) => a + b;
  // ignore: unused_element
  int add2(int a, int b) => a + b;
  final add3 = (int a, int b) => a + b;
}
