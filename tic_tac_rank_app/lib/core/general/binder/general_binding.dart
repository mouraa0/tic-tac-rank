import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/general/controller/general_controller.dart';

class GeneralBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralController());
  }
}
