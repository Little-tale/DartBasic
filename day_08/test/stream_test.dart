import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Stream 기본 개념
  /// Future - 1번의 데이터를 가져옴
  /// Stream - 여러번의 데이터를 받음

  /// Stream 생성과 수행
  /// 1. async*
  countStream(5).listen((event) {
    print(event);
  });

  /// 2. streamController
  final controller = StreamController<int>();
  final stream = controller.stream;

  stream.listen((event) {
    print(event);
  });

  addDataToTheSink(controller);

  /// Stream 데이터 변환
  countStream(4).map((event) => '$event 초가 지났습니다.').listen((event) {
    print(event);
  });

  // countStream(4).transform);

  /// Stream 데이터 관찰
  StreamBuilder(
    // 뷰 쪽에서 써야함
    builder: (context, snapshot) {
      final count = snapshot.data;
      if (count == null) {
        return CircularProgressIndicator();
      }
      return Text("$count");

      // ignore: dead_code
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          // TODO: Handle this case.
          throw UnimplementedError();
        case ConnectionState.waiting:
          // TODO: Handle this case.
          throw UnimplementedError();
        case ConnectionState.active:
          // TODO: Handle this case.
          throw UnimplementedError();
        case ConnectionState.done:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    },
    stream: countStream(5),
  );

  /// 위젯에서 Stream 데이터 표현하기

  /// Stream 데이터 관찰 -> BroadcastStream

  final broadcaseStream = countStream(4).asBroadcastStream();

  broadcaseStream.listen((event) {
    print(event);
  });
  await sleepAsync(1.n_seconds);
  broadcaseStream.listen((event) {
    print(event);
  });

  await sleepAsync(8.n_seconds);
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await sleepAsync(1.n_seconds);
    yield i;
  }
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 5; i++) {
    controller.sink.add(i);
    await sleepAsync(1.n_seconds);
  }
}
