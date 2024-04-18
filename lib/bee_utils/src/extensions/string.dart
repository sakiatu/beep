import 'package:bee/bee_utils/src/common/regex_pattern.dart';

extension StringExtension on String {
  String capitalizeFirstLetter() => isEmpty ? this : this[0].toUpperCase() + substring(1);
}

extension StringValidationExtension on String {
  bool get isEmail => RegExp(RegexPattern.email).hasMatch(this);

  bool get isPhoneNumber => RegExp(RegexPattern.phone).hasMatch(this);

  bool get isDateTime => DateTime.tryParse(this) is DateTime;

  bool get isNum => num.tryParse(this) is num;
}
