import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_text_watching_bear.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

class NumberDialog extends DialogWidget<int?> {
  NumberDialog({super.key, super.animation = NavAni.Fade});

  @override
  State<NumberDialog> createState() => _NumberDialogState();
}

class _NumberDialogState extends DialogState<NumberDialog> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final numberFocus = FocusNode();
  final passwordFocus = FocusNode();
  final textBearController = TextWatchingBearController();

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState() {
    // 숫자 길이
    numberController.addListener(() {
      setState(() {
        look = calcAnimationToBearWatch();
      });
    });
    // 숫자 키보드 활성화인지
    numberFocus.addListener(() {
      setState(() {
        check = numberFocus.hasFocus;
      });
    });
    // 비밀번호 키보드 활성화인지
    passwordFocus.addListener(() {
      setState(() {
        handsUp = passwordFocus.hasFocus;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // type: MaterialType.transparency,
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedContainer(
              child: Column(
            children: [
              '숫자를 입력해주세요'.text.make(),
              SizedBox(
                width: 250,
                height: 250,
                child: TextWatchingBear(
                  check: check,
                  handsUp: handsUp,
                  look: look,
                  controller: textBearController,
                ),
              ),
              TextField(
                focusNode: numberFocus,
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                focusNode: passwordFocus,
                obscureText: true,
                controller: passwordController,
                keyboardType: TextInputType.number,
              ),
              RoundButton(
                  text: "end",
                  onTap: () async {
                    final text = numberController.text;
                    try {
                      int number = int.parse(text);
                      textBearController.runSuccessAnimation();
                      await sleepAsync(2.seconds);
                      widget.hide(number);
                    } catch (e) {
                      textBearController.runFailAnimation();
                    }
                  })
            ],
          ))
        ],
      ),
    );
  }

  double calcAnimationToBearWatch() {
    return numberController.text.length.toDouble() * 1.5;
  }
}
