import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.todoHolder.notifier,
      builder: (context, todoList, child) {
        return (todoList.isEmpty
            ? '할일을 작성해보세요.'.text.size(20).makeCentered()
            : Column(
                children: todoList.map((e) => TodoItem(e)).toList(),
              ));
      },
    );
  }
}
