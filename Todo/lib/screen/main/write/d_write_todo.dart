import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/data/memory/vo/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_to_result.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  final Todo? todoForEdit;

  WriteTodoDialog({super.key, this.todoForEdit});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog>
    with AfterLayoutMixin {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    if (widget.todoForEdit != null) {
      _selectedDate = widget.todoForEdit!.dueDate;
    }
    textController.text = widget.todoForEdit?.title ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
        body: RoundedContainer(
      color: context.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              '할일용 작성해주세요'.text.size(10).bold.make(),
              spacer,
              _selectedDate.formattedDate.text.make(),
              IconButton(
                onPressed: _selectDate,
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
                    widget.hide(
                      WriteTodoResult(
                          dateTime: _selectedDate, text: textController.text),
                    );
                  }),
            ],
          )
        ],
      ),
    ));
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, focusNode);
  }
}
