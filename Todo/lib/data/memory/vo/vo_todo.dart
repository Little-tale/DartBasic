import 'package:fast_app_base/data/memory/vo/todo_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// class Todo {
//   int id;
//   String title;
//   final DateTime createdTime;
//   DateTime? modifytime;
//   DateTime dueDate;
//   TodoStatus status;

//   Todo({
//     required this.id,
//     required this.title,
//     this.modifytime,
//     required this.dueDate,
//     this.status = TodoStatus.incomplete,
//   }) : createdTime = DateTime.now();
// }

part 'vo_todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String title,
    required DateTime dueDate,
    DateTime? modifyTime,
    required DateTime createdTime,
    required TodoStatus status,
  }) = _Todo;
}
