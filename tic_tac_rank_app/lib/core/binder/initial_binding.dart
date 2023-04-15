import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/controller/general_controller.dart';
import 'package:tic_tac_rank_app/core/user/user_store.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserStore());
    Get.put(GeneralController());
  }
}
