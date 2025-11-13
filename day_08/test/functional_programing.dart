// ignore_for_file: avoid_print

import 'package:fast_app_base/common/cli_common.dart';

void main() async {
  imperativeStyle(); // 명령형 예시
  declarativeStyle(); // 선언형 예시
  await asyncDeclarativeStyle();
}

/// 명령형(Imperative) 스타일
/// - "어떻게 할지"를 단계별로 적어줌
void imperativeStyle() {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<int> squaredEvens = [];

  for (final n in numbers) {
    if (n % 2 == 0) {
      squaredEvens.add(n * n);
    }
  }

  print('imperative: $squaredEvens');
}

/// 선언형(Declarative) 스타일
/// - "무슨 결과가 필요하다"를 선언적으로 표현
void declarativeStyle() {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  final squaredEvens = numbers
      .where((n) => n.isEven) // 짝수만 고르고
      .map((n) => n * n) // 제곱해서
      .toList(); // 리스트로 만든다

  print('declarative: $squaredEvens');
}

Future<void> asyncDeclarativeStyle() async {
  final numList =
      (await _getNums()).where((n) => n.isEven).map((n) => n * n).toList();
  print(numList);
}

Future<List<int>> _getNums() async {
  await sleepAsync(300.n_ms);
  return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
}
