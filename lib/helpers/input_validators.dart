import 'package:get/get_utils/get_utils.dart';

class InputValidators {
  InputValidators._();

  static String? noValueValidation<T>(T? value) => (value != null) ? null : "";

  static String? noMessageValidation(String? value) =>
      (value != null && value.isNotEmpty) ? null : "";

  static String? validateLogin(String? value) =>
      (value != null && value.length >= 6) ? null : 'Invalid Login';

  static String? validateUsername(String? value) =>
      (value != null && value.length >= 2) ? null : 'Invalid username';

  static String? validateEmail(String? value) =>
      (value != null && GetUtils.isEmail(value)) ? null : "Invalid email";

  static String? validatePassword(String? value) =>
      (value != null && value.length > 5) ? null : 'Invalid password';

  static String? validatePasswordConfirmation(String? value,
          {required String password}) =>
      validatePassword(password) == null
          ? (value == password)
              ? null
              : 'Mismatching passwords'
          : null;

  static String? validatePhone(String? value) =>
      (value != null && value.length > 7) ? null : 'Invalid Phone';

  static String? validateSMSCode(String? value) {
    return (value != null && value.length == 4) ? null : 'Invalid SMS code';
  }
}
