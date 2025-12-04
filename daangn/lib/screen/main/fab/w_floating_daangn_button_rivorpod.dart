import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needToMakeButtonBigger = false;

  @override
  bool updateShouldNotify(
      FloatingButtonState old, FloatingButtonState current) {
    return super.updateShouldNotify(old, current);
  }

  void onTapButton() {
    final isExpended = state.isExpanded;
    final isSmall = state.isSmall;

    state = FloatingButtonState(
        !state.isExpanded, needToMakeButtonBigger ? false : true);

    if (needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }

    if (!isSmall && !isExpended) {
      needToMakeButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    if (state.isExpanded) return;

    state = state.copyWith(isSmall: isSmall);
  }
}

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    FloatingButtonState(false, false),
  ),
);
