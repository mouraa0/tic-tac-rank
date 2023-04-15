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

  static void validateUsername({
    required String username,
    required Rxn<String> errorText,
  }) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9]$');

    if (username.length < 3 || username.length > 14) {
      errorText.value = 'Must be between 3 and 14 characters long';

      return;
    }

    if (usernameRegex.hasMatch(username)) {
      errorText.value = 'Only letters and numbers allowed';

      return;
    }

    errorText.value = null;
  }
}
