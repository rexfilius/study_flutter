import 'package:flutter/cupertino.dart';
import 'package:study_flutter/screens/keyboard2/custom_input_view.dart';

class CustomKeyboardOverlay {
  static OverlayEntry? _overlayEntry;

  static showOverlay(
    BuildContext context, {
    VoidCallback? keyboardUpButtonPressed,
    VoidCallback? keyboardDownButtonPressed,
    VoidCallback? keyboardDoneButtonPressed,
  }) {
    if (_overlayEntry != null) {
      return;
    }

    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: CustomInputView(
            upButtonPressed: keyboardUpButtonPressed,
            downButtonPressed: keyboardDownButtonPressed,
            doneButtonPressed: () {
              keyboardDoneButtonPressed == null
                  ? FocusManager.instance.primaryFocus?.unfocus()
                  : keyboardDownButtonPressed?.call();
            },
          ),
        );
      },
    );

    overlayState.insert(_overlayEntry!);
  }

  static removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
