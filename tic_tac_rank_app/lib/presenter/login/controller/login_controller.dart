import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/global/global.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/account_utils/supabase_account_utils.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/database_utils/supabase_database_utils.dart';
import 'package:tic_tac_rank_app/core/utils/forms/forms_utils.dart';
import 'package:tic_tac_rank_app/core/error/show_error_snack_bar/show_error_snack_bar_extension.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';

  final emailErrorText = Rxn<String>();

  RxBool isButtonActive = false.obs;
  RxBool isButtonLoading = false.obs;

  void login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isButtonLoading.value = true;

    final response =
        await SupabaseAccountUtils.login(email: email, password: password);

    if (!response.success) {
      isButtonLoading.value = false;
      snackbarKey.currentState
          ?.showErrorSnackBar(exception: response.exception);
    }

    final userHasUsername = await SupabaseDatabaseUtils.userHasUsername();

    if (userHasUsername.success) {
      return Get.offAndToNamed(AppRouter.homeScreen);
    }

    Get.offAndToNamed(AppRouter.createUsernameScreen);
  }

  void _verifyButtonActive() {
    isButtonActive.value = true;

    //TODO: improve shitty logic;
    if (email.isNotEmpty &&
        emailErrorText.value == null &&
        password.isNotEmpty) {
      isButtonActive.value = true;

      return;
    }

    isButtonActive.value = false;
  }

  void onChangedEmail(String str) {
    email = str;

    FormsUtils.validateEmail(email: email, errorText: emailErrorText);
    _verifyButtonActive();
  }

  void onChangedPassword(String str) {
    password = str;

    _verifyButtonActive();
  }
}
