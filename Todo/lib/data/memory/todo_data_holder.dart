import 'package:fast_app_base/data/memory/vo/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/widgets.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    TodoDataHolder inherited =
        (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>()!);
    return inherited;
  }

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
    notifier.notifyListeners(); // TODO: 이런식으론 짜면 안될듯
  }

  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result == null) return;

    notifier.addTodo(
      Todo(
          id: DateTime.now().millisecondsSinceEpoch,
          title: result.text,
          dueDate: result.dateTime),
    );
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      notifier.notifyListeners();
    }
  }

  void removeTodo(Todo todo) {
    notifier.value.remove(todo);
    notifier.notifyListeners();
  }
}

extension TodoDataHolderExtension on BuildContext {
  TodoDataHolder get todoHolder => TodoDataHolder._of(this);
}
