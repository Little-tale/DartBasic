// import 'package:fast_app_base/data/memory/vo/todo_data_notifier.dart';
import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
// import 'package:fast_app_base/screen/main/tab/todo/w_todo_list.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  // final RxList<Todo> todoList = <Todo>[].obs;

  TodoBloc() : super(const TodoBlocState(BlocStatus.initial, <Todo>[])) {
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemoveEvent>(_removeTodo);
  }

  void _changeTodoStatus(
      TodoStatusUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final copyTodoList = List.of(state.todoList);
    final todo = event.updatedTodo;
    final todoIndex =
        copyTodoList.indexWhere((element) => element.id == todo.id);
    TodoStatus status = todo.status;
    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoding;
      case TodoStatus.ongoding:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog("정말요...?").show();
        result?.runIfSuccess((data) {
          status = TodoStatus.ongoding;
        });
    }
    // todoList.refresh();
    // update();
    // notifier.notifyListeners(); // TODO: 이런식으론 짜면 안될듯
    copyTodoList[todoIndex] = todo.copyWith(status: status);
    // emit(state.copyWith(todoList: copyTodoList));
    emitNewList(copyTodoList, emit);
  }

  void _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
    // add
    final copyTodoList = List.of(state.todoList);

    final result = await WriteTodoDialog().show();
    if (result == null) return;

    copyTodoList.add(
      Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
        status: TodoStatus.incomplete,
      ),
    );
    // update();
    emitNewList(copyTodoList, emit);
  }

  void _editTodo(
      TodoContentUpdateEvent event, Emitter<TodoBlocState> emit) async {
    final todo = event.updatedTodo;
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      // todo.title = result.text;
      // todo.dueDate = result.dateTime;
      // todoList.refresh();
      // update();

      final copyTodoList = List.of(state.todoList);
      copyTodoList[copyTodoList
          .indexWhere((element) => element.id == todo.id)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
        modifyTime: DateTime.now(),
      );
      emitNewList(copyTodoList, emit);
    }
  }

  void _removeTodo(TodoRemoveEvent event, Emitter<TodoBlocState> emit) {
    // notifier.value.remove(todo);
    // todoList.remove(todo);
    // todoList.refresh();
    // update();

    final copyTodoList = List.of(state.todoList);
    final todo = event.removedTodo;

    copyTodoList.removeWhere((element) => element.id == todo.id);
    emitNewList(copyTodoList, emit);
  }

  void emitNewList(List<Todo> copyTodoList, Emitter<TodoBlocState> emit) {
    emit(state.copyWith(todoList: copyTodoList));
  }
}

// extension TodoDataHolderExtension on BuildContext {
//   TodoDataHolder get todoHolder => TodoDataHolder._of(this);
// }

// mixin class TodoDataProvider {
//   late final TodoCubit todoData = Get.find();
// }
