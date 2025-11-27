import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/data/local/local_db.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_to_result.dart';
import 'package:flutter/material.dart';
// import 'package:nav_hooks/dialog/dialog.dart';
import 'package:nav_hooks/dialog/hook_dialog.dart';

class WriteTodoDialog extends HookDialogWidget<WriteTodoResult> {
  final Todo? todoForEdit;

  WriteTodoDialog({super.key, this.todoForEdit});

  @override
  Widget build(BuildContext context) {
    final _selectedDate = useState(DateTime.now());
    final textController = useTextEditingController();
    final focusNode = useFocusNode();

    useMemoized(() {
      if (todoForEdit != null) {
        _selectedDate.value = todoForEdit!.dueDate;
        textController.text = todoForEdit?.title ?? '';
      }
      AppKeyboardUtil.show(context, focusNode);
    });
    return BottomDialogScaffold(
        body: RoundedContainer(
      color: context.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              '할일용 작성해주세요'.text.size(10).bold.make(),
              spacer,
              _selectedDate.value.formattedDate.text.make(),
              IconButton(
                onPressed: () => _selectDate(context, _selectedDate),
                icon: const Icon(
                  Icons.calendar_month,
                ),
              )
            ],
          ),
          height20,
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  focusNode: focusNode,
                ),
              ),
              RoundButton(
                  text: '추가',
                  onTap: () {
                    final result = WriteTodoResult(
                        dateTime: _selectedDate.value,
                        text: textController.text);
                    hide(result);
                  }),
            ],
          )
        ],
      ),
    ));
  }

  bool get isEditMode => todoForEdit != null;

  void _selectDate(
      BuildContext context, ValueNotifier<DateTime> selectedDate) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      selectedDate.value = date;
    }
  }
  // @override
  // DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}
