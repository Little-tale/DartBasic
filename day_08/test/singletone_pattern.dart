// ignore_for_file: unused_local_variable

import 'dart:isolate';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

class SingletonExample {
  SingletonExample._();

  static final SingletonExample shared = SingletonExample._();

  factory SingletonExample() {
    return shared;
  }
}

main() {
  final objc = SingletonExample.shared;
  final objc2 = SingletonExample(); // Same

  Isolate.run(() {
    final isolateObjc = SingletonExample();
    final isolateObjc2 = SingletonExample();

    log((isolateObjc2 == isolateObjc).toString()); // true
    log((isolateObjc == objc).toString()); // false
  });
}
