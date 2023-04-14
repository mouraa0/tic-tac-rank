import 'package:email_validator/email_validator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FormsUtils {
  static void validateEmail({
    required String email,
    required Rxn<String> errorText,
  }) {
    if (!EmailValidator.validate(email)) {
      errorText.value = 'not a valid email';

      return;
    }

    errorText.value = null;
  }

  static void validatePassword({
    required String psw,
    required Rxn<String> errorText,
  }) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*]{8,}$');
    if (!passwordRegex.hasMatch(psw)) {
      errorText.value =
          'must be at least 8 characters with a letter and a number.';

      return;
    }

    errorText.value = null;
  }
}
