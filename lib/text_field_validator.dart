import 'package:study_flutter/string_regex.dart';

abstract class TextFieldValidator {
  /// validates the TextField that receives the first name
  static String? firstName(String? value) {
    if (value == null || value.length < 2) {
      return 'too short';
    }
    if (value.isEmpty) {
      return 'cannot be empty';
    }
    return null;
  }

  /// validates the TextField that receives the last name
  static String? lastname(String? value) {
    if (value == null || value.length < 2) {
      return 'too short';
    }
    if (value.isEmpty) {
      return 'cannot be empty';
    }
    return null;
  }

  /// validates the TextField that receives the phone number
  static String? phoneNumber(String? value) {
    // if (value != null) {
    //   final phoneNumber = PhoneNumber.parse(
    //     value,
    //     callerCountry: IsoCode.NG,
    //   );
    //   final isValid = phoneNumber.isValid(type: PhoneNumberType.mobile);
    //   if (!isValid) return "Phone number is invalid";
    // }
    return null;
  }

  /// validates the TextField that receives the email
  static String? email(String? value) {
    if (value != null) {
      final isValid = RegExp(StringRegex.email).hasMatch(value);
      if (!isValid) return "Email is not valid";
    }
    return null;
  }

  /// validates the TextField that receives the password
  static String? password(String? value) {
    if (value != null) {
      final upperCase = RegExp(StringRegex.passUpperCase).hasMatch(value);
      final lowerCase = RegExp(StringRegex.passLowerCase).hasMatch(value);
      final symbol = RegExp(StringRegex.passSymbol).hasMatch(value);
      final digits = RegExp(StringRegex.pass8Chars).hasMatch(value);
      final min8char = RegExp(StringRegex.pass8Chars).hasMatch(value);

      if (!upperCase) return 'Must have an upper case letter';
      if (!lowerCase) return 'Must have a lower case letter';
      if (!symbol) return 'Must have a symbol';
      if (!digits) return 'Must have a number';
      if (!min8char) return 'Must have at least 8 characters';
    }
    return null;
  }
}
