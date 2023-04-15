import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/supabase_account_utils.dart';
import 'package:tic_tac_rank_app/core/utils/forms/forms_utils.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';

  final emailErrorText = Rxn<String>();

  RxBool isButtonActive = false.obs;
  RxBool isButtonLoading = false.obs;

  void login() async {
    isButtonLoading.value = true;

    await SupabaseAccountUtils.login(email: email, password: password);

    Get.offAndToNamed(AppRouter.homeScreen);
    isButtonLoading.value = false;
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
