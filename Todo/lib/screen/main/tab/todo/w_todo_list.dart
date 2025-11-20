import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// GetView 는 별루... -> 다른 컨트롤러들이 필요해짐
class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => todoData.todoList.isEmpty
          ? '할일을 작성해보세요.'.text.size(20).makeCentered()
          : Column(
              children: todoData.todoList.map((e) => TodoItem(e)).toList(),
            ),
    );
  }
}
