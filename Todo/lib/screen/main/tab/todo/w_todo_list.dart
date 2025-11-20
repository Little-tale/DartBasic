import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// GetView 는 별루... -> 다른 컨트롤러들이 필요해짐
class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(TodoDataProvider);

    return todoList.isEmpty
        ? '할일을 작성해보세요.'.text.size(20).makeCentered()
        : Column(
            children: todoList.map((e) => TodoItem(e)).toList(),
          );
  }
}
