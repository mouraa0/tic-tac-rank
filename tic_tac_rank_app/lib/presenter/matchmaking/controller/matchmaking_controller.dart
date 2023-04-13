import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/data/matchmaking/models/matchmaking_message_model.dart';
import 'package:tic_tac_rank_app/domain/matchmaking/entities/matchmaking_message_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchmakingController extends GetxController {
  late Stream stream;
  late WebSocketChannel channel;

  RxString screenMsg = ''.obs;

  MatchmakingMessageEntity? mostRecentData;

  void _handleEventReceive(dynamic event) async {
    if (event == null) return;

    mostRecentData = MatchmakingMessageModel.fromJson(jsonDecode(event));

    screenMsg.value = mostRecentData!.msg;

    if (mostRecentData!.msg == 'Found match') {
      return _goToMatchScreen();
    }
  }

  void _goToMatchScreen() {
    Future.delayed(
      Duration.zero,
      () => Get.offAndToNamed(
        '${AppRouter.matchScreen}/${mostRecentData!.roomId}',
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    const String url = !kIsWeb
        ? 'ws://10.0.2.2:8000/matchmaking/122'
        : 'ws://localhost:8000/matchmaking/121';

    channel = WebSocketChannel.connect(Uri.parse(url));

    channel.stream.listen((event) => _handleEventReceive(event));
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
