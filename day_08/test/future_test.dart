import 'dart:math';

import 'package:fast_app_base/common/common.dart';

void main() async {
  // future의 기본 개념
  // 미래 즉 언젠가 주겠다를 약속
  // 시간이 걸리는 Computation 작업 또는 유저의 응답을 기다리는 상태

  // future 생성과 수행
  print("start");
  getObjects().then((value) {
    print("${value?[0].name}");
  });
  print("end");
  // future Timeout
  getObjects().timeout(const Duration(seconds: 1)).catchError((e, stackTrace) {
    print(e);
  }).then((value) {
    print(value);
  });
  // future Error Handling
  // futureOr
  // Future 타입 또는 일반적인 타입으로 가능
  // FutureOr<String> testFutureOr = "";
  await sleepAsync(const Duration(seconds: 4));
}

class EmptyClass {
  var name = Random().nextInt(100).toString();
}

List<EmptyClass> empty = [
  EmptyClass(),
  EmptyClass(),
  EmptyClass(),
  EmptyClass(),
];

Future<List<EmptyClass>?> getObjects() async {
  await sleepAsync(const Duration(seconds: 2));
  return empty;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
