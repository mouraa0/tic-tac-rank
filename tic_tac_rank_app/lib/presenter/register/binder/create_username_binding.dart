import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/register/controller/create_username_controller.dart';

class CreateUsernameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateUsernameController());
  }
}
