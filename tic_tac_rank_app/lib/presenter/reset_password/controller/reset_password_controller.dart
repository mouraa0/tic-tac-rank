import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/global/global.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/account_utils/supabase_account_utils.dart';
import 'package:tic_tac_rank_app/core/utils/forms/forms_utils.dart';
import 'package:tic_tac_rank_app/core/error/show_error_snack_bar/show_error_snack_bar_extension.dart';

class ResetPasswordController extends GetxController {
  String email = '';

  final emailErrorText = Rxn<String>();

  RxBool isButtonActive = false.obs;
  RxBool isButtonLoading = false.obs;

  void resetPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isButtonLoading.value = true;

    final response = await SupabaseAccountUtils.resetPassword(email: email);

    if (!response.success) {
      isButtonLoading.value = false;

      snackbarKey.currentState
          ?.showErrorSnackBar(exception: response.exception);
    }

    Get.offAndToNamed(AppRouter.loginScreen);
  }

  void _verifyButtonActive() {
    isButtonActive.value = true;

    if (email.isNotEmpty && emailErrorText.value == null) {
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
}
