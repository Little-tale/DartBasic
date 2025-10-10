void exceptionExample() {
  int num1 = 0;
  try {
    // ~/ 절단 나눗셈
    print(10 ~/ num1); // 예외가 발생한 것으로 예상되는 코드
  } on UnimplementedError catch (e, stack) {
    print("UnimplementedError: $e, stack $stack");
  } on TypeError catch (e, stack) {
    print("TypeError: $e, stack $stack");
  } catch (e, stack) {
    // 예외 발생시
    print("Error: $e, stack $stack");
  } finally {
    // 예외가 발생 하든 안하든 후에 할 행위
    print("This will always execute");
  }
}
