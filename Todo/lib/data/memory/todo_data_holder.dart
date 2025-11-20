// import 'package:fast_app_base/data/memory/vo/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
// import 'package:fast_app_base/screen/main/tab/todo/w_todo_list.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

final userProvider = FutureProvider<String>((ref) => 'user');

final TodoDataProvider =
    StateNotifierProvider<TodoDataHolder, List<Todo>>((ref) {
  final userID = ref.watch(userProvider);

  return TodoDataHolder();
});

class TodoDataHolder extends StateNotifier<List<Todo>> {
  // final RxList<Todo> todoList = <Todo>[].obs;

  TodoDataHolder() : super([]);

  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoding;
      case TodoStatus.ongoding:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말요...?").show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.ongoding;
        });
    }
    // todoList.refresh();
    // update();
    // notifier.notifyListeners(); // TODO: 이런식으론 짜면 안될듯
    state = List.of(state);
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result == null) return;

    state.add(
      Todo(
          id: DateTime.now().millisecondsSinceEpoch,
          title: result.text,
          dueDate: result.dateTime),
    );
    // update();
    state = List.of(state);
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      // todoList.refresh();
      // update();
      state = List.of(state);
    }
  }

  void removeTodo(Todo todo) {
    // notifier.value.remove(todo);
    // todoList.remove(todo);
    // todoList.refresh();
    // update();
    state = List.of(state);
  }
}

// extension TodoDataHolderExtension on BuildContext {
//   TodoDataHolder get todoHolder => TodoDataHolder._of(this);
// }

// mixin class TodoDataProvider {
//   late final TodoDataHolder todoData = Get.find();
// }

extension TodoDataHolderExtension on WidgetRef {
  TodoDataHolder get todoHolder => read(TodoDataProvider.notifier);
}
