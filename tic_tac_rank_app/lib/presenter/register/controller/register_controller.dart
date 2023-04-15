import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/global/global.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/account_utils/supabase_account_utils.dart';
import 'package:tic_tac_rank_app/core/utils/forms/forms_utils.dart';
import 'package:tic_tac_rank_app/core/error/show_error_snack_bar/show_error_snack_bar_extension.dart';

class RegisterController extends GetxController {
  String email = '';
  String password = '';

  final emailErrorText = Rxn<String>();
  // final usernameErrorText = Rxn<String>();
  final passwordErrorText = Rxn<String>();

  RxBool isButtonActive = false.obs;
  RxBool isButtonLoading = false.obs;

  void register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isButtonLoading.value = true;

    final response =
        await SupabaseAccountUtils.register(email: email, password: password);
    if (response.success) {
      return Get.offAndToNamed(AppRouter.homeScreen);
    }

    isButtonLoading.value = false;
    snackbarKey.currentState?.showErrorSnackBar(exception: response.exception);
  }

  void _verifyRegisterButtonActive() {
    //TODO: improve shitty logic;
    if (email.isNotEmpty &&
        emailErrorText.value == null &&
        password.isNotEmpty &&
        passwordErrorText.value == null) {
      isButtonActive.value = true;

      return;
    }

    isButtonActive.value = false;
  }

  void onChangedEmail(String str) {
    email = str;

    FormsUtils.validateEmail(email: email, errorText: emailErrorText);
    _verifyRegisterButtonActive();
  }

  void onChangedPassword(String str) {
    password = str;

    FormsUtils.validatePassword(psw: password, errorText: passwordErrorText);
    _verifyRegisterButtonActive();
  }
}
