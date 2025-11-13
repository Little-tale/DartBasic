// MARK: List
extension ListSwapExtensions<T> on List<T> {
  void swapAt(int from, int to) {
    final temp = this[from];
    this[from] = this[to];
    this[to] = temp;
  }

  Stream<T> toStream() => Stream.fromIterable(this);
}

// MARK: Test
// class TestModel {
//   String name;

//   TestModel({required this.name});
// }

// void main() {
//   final test = [1, 2, 3, 4, 5];
//   test.swapAt(3, 1);
//   log(test.toString()); // [log] [1, 4, 3, 2, 5]

//   // map
//   final map = HashMap<String, TestModel>();
//   map["toss"] = TestModel(name: "ASD");
//   map["kakao"] = TestModel(name: "ASDKakao");
//   map.putIfAbsent("kakao", () => TestModel(name: "ASDKakao2"));

//   // 생성
//   final list = [];
//   final map2 = {};
//   final set = {};
// }

// final class Results<T, F> {
//   final T success;
//   final F failure;

//   Results({required this.success, required this.failure});
// }

// final class EmptyClass {}

// Results TestResultFunc<T, F extends EmptyClass>(T success, F failure) {
//   return Results(success: success, failure: failure);
// }
