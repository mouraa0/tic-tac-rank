import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/game_room/controller/game_room_controller.dart';

class GameRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameRoomController());
  }
}
