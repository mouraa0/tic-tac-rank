import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/matchmaking/controller/matchmaking_controller.dart';

class MatchmakingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchmakingController());
  }
}
