import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/supabase_account_utils.dart';
import 'package:tic_tac_rank_app/core/utils/forms/forms_utils.dart';

class RegisterController extends GetxController {
  String email = '';
  String password = '';

  final emailErrorText = Rxn<String>();
  // final usernameErrorText = Rxn<String>();
  final passwordErrorText = Rxn<String>();

  RxBool isRegisterButtonActive = false.obs;
  RxBool isRegisterButtonLoading = false.obs;

  void register() async {
    isRegisterButtonLoading.value = true;
    await SupabaseAccountUtils.register(email: email, password: password);

    Get.offAndToNamed(AppRouter.homeScreen);
    isRegisterButtonLoading.value = false;
  }

  void _verifyRegisterButtonActive() {
    //TODO: improve shitty logic;
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

    FormsUtils.validateEmail(email: email, errorText: emailErrorText);
    _verifyRegisterButtonActive();
  }

  void onChangedPassword(String str) {
    password = str;

    FormsUtils.validatePassword(psw: password, errorText: passwordErrorText);
    _verifyRegisterButtonActive();
  }
}
