import 'package:flutter/material.dart';

extension ContextBasicExtension on BuildContext {
  double get x => MediaQuery.of(this).size.width;

  double get y => MediaQuery.of(this).size.height;

  Size get size => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);

  TextTheme get styles => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;

  bool get isDark => theme.brightness == Brightness.dark;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get isLandscape => orientation == Orientation.landscape;
}

extension ContextNavigationExtension on BuildContext {
  void back() => Navigator.of(this).pop();

  void to(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void toReplace(Widget page) => Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));

  void toRemoveUntil(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);

  void toNamed(String route) => Navigator.of(this).pushNamed(route);

  void toNamedRemoveUntil(String route) => Navigator.of(this).pushNamedAndRemoveUntil(route, (route) => false);

  void toNamedReplace(String route) => Navigator.of(this).pushReplacementNamed(route);

  void toNamedRemoveUntilReplace(String route) => Navigator.of(this).pushNamedAndRemoveUntil(route, (route) => false);
}

extension ContextSnackBar on BuildContext {
  void hideSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void showSuccess([String msg = 'Success']) =>
      showSnackBar(msg, foreground: colors.onPrimary, background: colors.primary);

  void showError([String msg = 'Error']) => showSnackBar(msg, foreground: colors.onError, background: colors.error);

  void showSnackBar(
    String msg, {
    Color? foreground,
    Color? background,
    SnackBarBehavior? behavior = SnackBarBehavior.floating,
    int duration = 2000,
    bool closeIcon = false,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        behavior: behavior,
        closeIconColor: foreground,
        action: action,
        showCloseIcon: closeIcon,
        backgroundColor: background,
        duration: Duration(milliseconds: duration),
        content: Text(msg, style: styles.labelLarge?.copyWith(color: foreground)),
      ));
  }
}
