import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_flutter/pages/keyboard2/amount_text_input_formatter.dart';
import 'package:study_flutter/pages/keyboard2/custom_keyboard_overlay.dart';
import 'package:study_flutter/utils/extension_on_string.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.focusNode,
    this.outerTitle,
    this.hintText,
    this.initialText,
    this.controller,
    this.obscureText = false,
    this.suffixOuterTitle,
    this.onTapSuffixOuterTitle,
    this.validator,
    this.onChanged,
    this.inputType,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.errorText,
    this.enabled,
    this.maxLength,
    this.maxLines,
    this.hasInputFormat = false,
    this.backgroundColor,
    this.borderColor,
    this.showOuterTile = false,
    this.horizontalPadding,
    this.verticalPadding,
    this.expand = false,
    this.readOnly = false,
    this.height,
    this.width,
    this.inputFormatter,
    this.keyboardUpArrowAction,
    this.keyboardDownArrowAction,
    this.keyboardDoneAction,
    this.hintStyle,
    this.style,
    this.textFieldIsRequired = false,
  });

  final FocusNode? focusNode;
  final String? outerTitle;
  final String? suffixOuterTitle;
  final void Function()? onTapSuffixOuterTitle;
  final String? hintText;
  final String? initialText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? errorText;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final Color? backgroundColor;
  final bool hasInputFormat;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? height;
  final double? width;
  final Color? borderColor;
  final bool showOuterTile;
  final bool expand;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatter;
  final bool textFieldIsRequired;
  final VoidCallback? keyboardDownArrowAction;
  final VoidCallback? keyboardUpArrowAction;
  final VoidCallback? keyboardDoneAction;

  @override
  State<CustomTextField> createState() => _RexTextFieldState();
}

class _RexTextFieldState extends State<CustomTextField> {
  ///

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      focusNode = widget.focusNode!;
    } else {
      focusNode = FocusNode();
    }

    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          if (Platform.isIOS) {
            CustomKeyboardOverlay.showOverlay(
              context,
              keyboardUpButtonPressed: widget.keyboardUpArrowAction,
              keyboardDownButtonPressed: widget.keyboardDownArrowAction,
              keyboardDoneButtonPressed: widget.keyboardDoneAction,
            );
          }
        } else {
          if (Platform.isIOS) {
            CustomKeyboardOverlay.removeOverlay();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.verticalPadding ?? 8,
        horizontal: widget.horizontalPadding ?? 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showOuterTile && widget.outerTitle.isNotBlank) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: widget.textFieldIsRequired
                      ? Text(widget.outerTitle!)
                      : Text(
                          widget.outerTitle!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: Colors.purple.shade700,
                          ),
                        ),
                ),
                widget.onTapSuffixOuterTitle != null
                    ? TextButton(
                        onPressed: widget.onTapSuffixOuterTitle,
                        child: Text(widget.suffixOuterTitle ?? ''),
                      )
                    : Container()
              ],
            ),
            const SizedBox(height: 12),
          ],
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: TextFormField(
              focusNode: focusNode,
              controller: widget.controller,
              validator: widget.validator,
              onChanged: widget.onChanged,
              initialValue: widget.initialText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: widget.inputType,
              obscureText: widget.obscureText,
              enabled: widget.enabled,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              expands: widget.expand,
              readOnly: widget.readOnly,
              style: widget.style,
              textAlign: TextAlign.left,
              textInputAction: widget.textInputAction,
              textAlignVertical: TextAlignVertical.top,
              inputFormatters: widget.inputFormatter ??
                  [
                    LengthLimitingTextInputFormatter(widget.maxLength),
                    widget.inputType == TextInputType.number &&
                            widget.hasInputFormat
                        ? FilteringTextInputFormatter.digitsOnly
                        : LengthLimitingTextInputFormatter(widget.maxLength),
                    (widget.inputType == TextInputType.number ||
                                widget.inputType ==
                                    const TextInputType.numberWithOptions(
                                        decimal: true)) &&
                            widget.hasInputFormat
                        ? AmountTextInputFormatter()
                        : LengthLimitingTextInputFormatter(widget.maxLength),
                  ],
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                fillColor: widget.backgroundColor ?? Colors.white,
                filled: true,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle,
                errorText: widget.errorText,
                errorStyle: const TextStyle(color: Colors.red),
                focusedBorder: _inputBorder,
                enabledBorder: _inputBorder,
                border: _inputBorder,
                counterText: '',
              ),
            ),
          )
        ],
      ),
    );
  }
}

final _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(
    color: Colors.white,
  ),
);
