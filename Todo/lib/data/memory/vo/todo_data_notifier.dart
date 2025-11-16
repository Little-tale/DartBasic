import 'package:flutter/material.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  TodoDataNotifier() : super([]);

  void addTodo(Todo todo) {
    value.add(todo);
    notifyListeners(); // 노티파이 사용되는곳에 변경사항 알림
  }
}
