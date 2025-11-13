void main() {
  /// 람다

  // ignore: unused_element
  int add(int a, int b) {
    return a + b;
  }

  (int a, int b) => a + b;
  // ignore: unused_element
  int add2(int a, int b) => a + b;
  // ignore: unused_local_variable
  final add3 = (int a, int b) => a + b;

  // 특징
  /// 1. 익명성
  /// 2. 함수 : Class 에 종속되지 않음
  /// 3. 전달 : 전달 1급 객체로서 함수 파라미터로 전달, 변수에 저장 가능
  /// 4. 간결 : 익명 클래스처럼 많은 코드를 구현할 필요가 없다.
}
