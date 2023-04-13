import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/matchmaking/controller/matchmaking_controller.dart';

class MatchmakingScreen extends StatelessWidget {
  const MatchmakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MatchmakingController>();

    return Scaffold(
      body: Obx(
        () => StreamBuilder(
          stream: controller.channel.value?.stream,
          builder: (context, snapshot) {
            controller.handleSnapshotReceive(snapshot);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Colors.black),
                  const SizedBox(height: 20),
                  Text(controller.mostRecentData?.msg ?? ''),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
