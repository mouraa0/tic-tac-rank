import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_widget.dart';
import 'package:tic_tac_rank_app/presenter/game_room/controller/game_room_controller.dart';
import 'package:tic_tac_rank_app/presenter/game_room/view/components/board_component.dart';

class GameRoomScreen extends StatelessWidget {
  const GameRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameRoomController>();

    return Scaffold(
      body: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const BoardComponent(),
              SizedBox(
                height: 50,
                child: Visibility(
                  visible: controller.isMyTurn.value,
                  child: const Text('Your turn'),
                ),
              ),
              const SizedBox(height: 50),
              Text(controller.actualPlayerToken.value),
              const SizedBox(height: 50),
              Visibility(
                visible: controller.isGameEnded.value,
                child: const Text('Game over'),
              ),
              const SizedBox(height: 50),
              Visibility(
                visible: controller.isGameEnded.value,
                child: AppButton(
                  title: 'Home',
                  onPressed: () => Get.offAndToNamed(AppRouter.homeScreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
