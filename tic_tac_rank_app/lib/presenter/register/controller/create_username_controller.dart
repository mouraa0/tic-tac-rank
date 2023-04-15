import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/global/global.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/database_utils/supabase_database_utils.dart';
import 'package:tic_tac_rank_app/core/utils/forms/forms_utils.dart';
import 'package:tic_tac_rank_app/core/error/show_error_snack_bar/show_error_snack_bar_extension.dart';

class CreateUsernameController extends GetxController {
  String username = '';

  final usernameErrorText = Rxn<String>();

  RxBool isButtonActive = false.obs;
  RxBool isButtonLoading = false.obs;

  void addUsername() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isButtonLoading.value = true;

    final response =
        await SupabaseDatabaseUtils.editUsername(newUsername: username);

    if (response.success) {
      return Get.offAndToNamed(AppRouter.homeScreen);
    }

    isButtonLoading.value = false;
    snackbarKey.currentState?.showErrorSnackBar(exception: response.exception);
  }

  void loginWithAnotherAccount() async {
    await supabase.auth.signOut();

    Get.offAndToNamed(AppRouter.loginScreen);
  }

  void _verifyButtonActive() {
    if (username.isNotEmpty && usernameErrorText.value == null) {
      isButtonActive.value = true;

      return;
    }

    isButtonActive.value = false;
  }

  void onChangedUsername(String str) {
    username = str;

    FormsUtils.validateUsername(
      username: username,
      errorText: usernameErrorText,
    );
    _verifyButtonActive();
  }
}
