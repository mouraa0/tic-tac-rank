import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';

class RegisterController extends GetxController {
  String email = '';
  String password = '';

  final emailErrorText = Rxn<String>();
  // final usernameErrorText = Rxn<String>();
  final passwordErrorText = Rxn<String>();

  RxBool isRegisterButtonActive = false.obs;
  RxBool isRegisterButtonLoading = false.obs;

  // void register() {
  //   supabase.auth.signUp(password: password, email: email);
  // }

  void register() {
    print('email: $email');
    print('password: $password');
  }

  void _verifyRegisterButtonActive() {
    if (email.isNotEmpty &&
        emailErrorText.value == null &&
        password.isNotEmpty &&
        passwordErrorText.value == null) {
      isRegisterButtonActive.value = true;

      return;
    }

    isRegisterButtonActive.value = false;
  }

  void onChangedEmail(String str) {
    email = str;

    _validateEmail();
    _verifyRegisterButtonActive();
  }

  void _validateEmail() {
    if (!EmailValidator.validate(email)) {
      emailErrorText.value = 'not a valid email';

      return;
    }

    emailErrorText.value = null;
  }

  // void onChangedUsername(String str) {
  //   username = str;

  //   _validateUsername();
  //   _verifyRegisterButtonActive();
  // }

  // void _validateUsername() {
  //   if (username.length > 14) {
  //     usernameErrorText.value = 'username must be 14 characters or less.';

  //     return;
  //   }

  //   usernameErrorText.value = null;
  // }

  void onChangedPassword(String str) {
    password = str;

    _validatePassword();
    _verifyRegisterButtonActive();
  }

  void _validatePassword() {
    RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      passwordErrorText.value =
          'must be at least 8 characters with a letter and a number.';

      return;
    }

    passwordErrorText.value = null;
  }
}
