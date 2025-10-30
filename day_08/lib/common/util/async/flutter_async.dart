import 'dart:async';

import 'package:flutter/material.dart';

export 'cli_async.dart';

extension AsyncExtension on Object {
  /// 지정한 duration 뒤에 func를 실행합니다.
  /// 만약 이 객체가 State고 이미 dispose 된 상태라면 실행하지 않습니다.
  /// stateful 위젯에선 값을 State에 저장하니 State 이면서 화면에 벗어나는지에 조건에 따라 발생 하지 않습니다.
  Timer delay(Duration duration, Function func) {
    return Timer(duration, () {
      // State는 dispose() 되면 화면에서 사라진 판정
      if (this is State && !(this as State).mounted) {
        return;
      }
      func();
    });
  }
}

void runOnUI(void Function() uiFunction) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    uiFunction();
  });
}
