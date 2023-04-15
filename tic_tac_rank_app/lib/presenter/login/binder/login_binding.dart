import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/login/controller/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
