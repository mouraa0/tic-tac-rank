import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/game_room/controller/game_room_controller.dart';
import 'package:tic_tac_rank_app/presenter/game_room/view/components/board_component.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameRoomController>();

    return Scaffold(
      body: StreamBuilder(
        stream: controller.channel.stream,
        builder: (context, snapshot) {
          controller.getNewSnapshot(snapshot);

          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const BoardComponent(),
                const SizedBox(height: 100),
                Obx(() => Text(controller.actualPlayerToken.value)),
              ],
            ),
          );
        },
      ),
    );
  }
}
