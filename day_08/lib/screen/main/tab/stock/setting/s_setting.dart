import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  // bool isPushOn = false;

  // @override
  // void initState() {
  //   isPushOn = Prefs.isPushOn.get();
  //   super.initState();
  // }

  final controller = ScrollController();

  final scrollController = ScrollController();
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: 2000.ms,
  );

  @override
  void initState() {
    animationController.addListener(() {
      final state = animationController.status;
      switch (state) {
        case AnimationStatus.dismissed:
        case AnimationStatus.forward:
        case AnimationStatus.reverse:
        case AnimationStatus.completed:
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: '설정'.text.make(),
      // ),
      body: Stack(
        children: [
          ListView(
            controller: controller,
            padding: const EdgeInsets.only(top: 150),
            children: [
              Obx(
                () => SwitchMenu(
                  '푸시 설정',
                  isOn: Prefs.isPushOnRx.get(),
                  onTap: (bool isOn) {
                    // Prefs.isPushOn.set(isOn);
                    Prefs.isPushOnRx.set(isOn);
                    // setState(() {
                    //   // isPushOn = isOn;

                    // });
                  },
                ),
              ),
              Obx(() => Slider(
                  value: Prefs.sliderPosition.get(),
                  onChanged: (value) {
                    Prefs.sliderPosition.set(value);
                  })),
              Obx(
                () => BigButton(
                  text: '날짜 ${getDateString()}',
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(90.days),
                      lastDate: DateTime.now().add(90.days),
                    );

                    if (date != null) {
                      Prefs.birthDay.set(date);
                    }
                  },
                ),
              ),
              Obx(
                () => BigButton(
                  text: '저장된 숫자 ${Prefs.number.get()}',
                  onTap: () async {
                    final number = await NumberDialog().show();

                    if (number != null) {
                      Prefs.number(number);
                    }
                  },
                ),
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: "애니메이션 forward",
                onTap: () async {
                  animationController.forward();
                },
              ),
              BigButton(
                text: "애니메이션 reverse",
                onTap: () async {
                  animationController.reverse();
                },
              ),
              BigButton(
                text: "애니메이션 repeat",
                onTap: () async {
                  animationController.repeat();
                },
              ),
              BigButton(
                text: "애니메이션 reset",
                onTap: () async {
                  animationController.reset();
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
              BigButton(
                text: '오픈소스',
                onTap: () async {
                  Nav.push(OpensourceScreen());
                },
              ),
            ],
          ),
          AnimatedAppBar(
            '설정',
            controller: controller,
            animationController: animationController,
          )
        ],
      ),
    );
  }

  String getDateString() {
    var text = Prefs.birthDay.get();
    if (text != null) {
      return text.formattedDate;
    } else {
      return "";
    }
  }
}
