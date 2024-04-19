import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/common/utils/app_focus.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomKeyboardConfig extends StatelessWidget {
  final FocusNode focusNode;
  const CustomKeyboardConfig({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

  /// Creates the [KeyboardActionsConfig] to hook up the fields
  /// and their focus nodes to our [FormKeyboardActions].
  KeyboardActionsConfig buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          displayArrows: false,
          onTapAction: () {
            AppFocus.unfocus(context);
          },
        ),
      ],
    );
  }
}
