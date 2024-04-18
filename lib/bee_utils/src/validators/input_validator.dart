import 'package:bee/bee_utils/src/common/regex_pattern.dart';

class Validator {
  Validator._();

  String validateEmail(String? email) {
    String input = (email ?? '').trim();

    if (input.isEmpty || input.length >= 255 || !RegExp(RegexPattern.email).hasMatch(input)) {
      throw Exception('Invalid Email');
    }

    return input;
  }

  String? tryValidateEmail(String? email) {
    try {
      return validateEmail(email);
    } catch (e) {
      return null;
    }
  }

  String validatePhone(String? phone) {
    String input = (phone ?? '').trim();

    if (input.isEmpty || !RegExp(RegexPattern.phone).hasMatch(input)) {
      throw Exception('Invalid Phone');
    }

    return input;
  }

  String? tryValidatePhone(String? phone) {
    try {
      return validatePhone(phone);
    } catch (e) {
      return null;
    }
  }
}
