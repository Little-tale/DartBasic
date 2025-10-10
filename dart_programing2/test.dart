// 함수 / 메서드
import 'dart:ffi';
import 'dart:math';

/// 프로그래밍에서 가장 기본적인 단위
/// 동작에 대한 단위
/// 리턴타입 / 함수명 (매개변수)
void main() {
  String text = "Hello, World!!";
  print(text);

  int num1 = 10;
  int num2 = 20;

  int sum = add(num1, num2);
  print(sum);

  repeatFunction(); // call RepeatPart
  switchExample(); // call SwitchPart
  exceptionExample(); // call exception
  asyncWithSyncExample(); // call AsyncPart
}

int add(int num1, int num2) {
  return num1 + num2;
}

void repeatFunction() {
  // 분기문과 반복문
  /// 분기문: 프로그램이 특정한 상황에 을을 할지 말지
  /// 반복문: 특정한 코드를 여러 번 실행

  bool a = Random().nextBool();

  if (a) {
    print("a is true");
  } else if (Random().nextBool()) {
    print('a is Finally True');
  } else {
    print("a is false");
  }

  for (int i = 1; i <= 10; i++) {
    print("Current number is: $i");
  }

  List<int> indexs = [0, 1, 2, 3, 4, 5];
  // final
  // 변수에 값을 단 한번만 할당하게 함. (런타임)
  // const 는 컴파일 시점
  for (final index in indexs) {
    print("Current index is: $index");
  }

  while (Random().nextBool()) {
    print("This will print multiple times");
  }

  int doWhileNum = 0;

  do {
    print("Current doWhileNum is: $doWhileNum");
    doWhileNum++;
  } while (doWhileNum < 5);
}

void switchExample() {
  int value = Random().nextInt(5);
  switch (value) {
    case 0:
      print('value is 0');
    case 1:
    case 2:
      print('value is 1 or 2');
      break;
    case 3:
      print('value is 3');
      break;
    case 4:
      print('value is 4');
      break;
    case 5:
      print('value is 5');
      break;
    case > 10:
      print("Cheater");
    default:
      print('value is unknown');
      break;
  }
}

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

void asyncWithSyncExample() {
  // 비동기 프로그래밍
  // 동기성 / 비동기성
  // 동기 : 모든 코드가 순차적 진행되는 상태
  // 비동기 : 코드가 동시다발적으로 실행되서 순차적으로 할수 없는 상태

  // async / await / Future : 1회만 돌려 받는 경우
  Future<void> todo(int second) async {
    await Future.delayed(Duration(seconds: second));
    print("Task completed after $second seconds");
  }

  todo(3);
  todo(1);
  todo(5);

  // async* / yield / Stream : 지속적으로 응답을 돌려받는 경우

  Stream<int> todo2() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      print("Current Stream value is: $i");
      yield i;
    }
  }

  todo2().listen((event) {
    print("Received Stream event: $event");
  });
}
