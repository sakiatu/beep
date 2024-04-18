import 'package:flutter/material.dart';

import 'loader.dart';

enum _ButtonType { normal, tonal, text, outlined, danger, dangerTonal, dangerText, dangerOutlined }

class MyButton extends FilledButton {
  final _ButtonType _type;

  MyButton({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.normal,
        super(child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.tonal({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.tonal,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.text({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.text,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.outlined({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.outlined,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.danger({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.danger,
        super(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.dangerTonal({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.dangerTonal,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.dangerText({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.dangerText,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  MyButton.dangerOutlined({
    super.key,
    required String title,
    IconData? icon,
    required VoidCallback? onClick,
    bool loading = false,
    bool disabled = false,
  })  : _type = _ButtonType.dangerOutlined,
        super.tonal(
            child: loading ? _loader() : _foreground(title, icon), onPressed: disabled || loading ? null : onClick);

  static Widget _loader() => const Loader(size: 24, stroke: 2.5);

  static Widget _foreground(String text, IconData? icon) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [if (icon != null) ...[Icon(icon),const SizedBox(width: 16)], Text(text)]);

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final style = super
        .defaultStyleOf(context)
        .copyWith(minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)));
    final disableForeground = Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
    final disableBackground = Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    const outlinedBorderWidth = 1.5;

    return switch (_type) {
      _ButtonType.normal || _ButtonType.tonal => style,
      _ButtonType.text => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.primary),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      _ButtonType.outlined => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.primary),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.resolveWith((states) => BorderSide(
              color: states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.primary,
              width: outlinedBorderWidth))),
      _ButtonType.danger => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.onError),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableBackground : Theme.of(context).colorScheme.error)),
      _ButtonType.dangerTonal => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.onErrorContainer),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableBackground : Theme.of(context).colorScheme.errorContainer)),
      _ButtonType.dangerText => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.error),
          backgroundColor: MaterialStateProperty.all(Colors.transparent)),
      _ButtonType.dangerOutlined => style.copyWith(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.error),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.resolveWith((states) => BorderSide(
              color: states.contains(MaterialState.disabled) ? disableForeground : Theme.of(context).colorScheme.error,
              width: outlinedBorderWidth)))
    };
  }
}
