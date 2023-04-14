import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/register/controller/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
