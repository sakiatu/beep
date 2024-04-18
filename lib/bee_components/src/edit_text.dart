import 'package:flutter/material.dart';

class EditText extends TextField {
  EditText({
    String? label,
    String? hint,
    IconData? icon,
    Widget? suffix,
    VoidCallback? onClick,
    bool border = true,
    bool disabled = false,
    super.key,
    super.readOnly,
    super.minLines,
    super.maxLines,
    super.autofocus,
    super.controller,
    super.obscureText,
    super.onSubmitted,
    super.keyboardType,
    super.textInputAction,
  }) : super(
          enabled: !disabled,
          decoration: InputDecoration(
            border: border ? const OutlineInputBorder() : InputBorder.none,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            labelText: label,
            hintText: hint,
            hintStyle:  const TextStyle(fontVariations: [FontVariation.weight(450)]),
            prefixIcon: icon == null ? null : Icon(icon),
            suffix: suffix,
          ),
          onTap: onClick,
          textCapitalization: _cap(keyboardType),
        );

  static TextCapitalization _cap(TextInputType? type) => switch (type) {
        null => TextCapitalization.sentences,
        TextInputType.name => TextCapitalization.words,
        _ => TextCapitalization.none
      };
}
