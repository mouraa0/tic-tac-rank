import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/reset_password/controller/reset_password_controller.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
