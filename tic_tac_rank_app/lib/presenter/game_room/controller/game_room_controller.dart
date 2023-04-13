import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/data/game_room/models/game_room_message_model.dart';
import 'package:tic_tac_rank_app/domain/game_room/game_room_message_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GameRoomController extends GetxController {
  final channel = Rxn<WebSocketChannel>();

  late GameRoomMessageEntity msgEntity;

  List<dynamic>? board;

  RxBool isMyTurn = false.obs;

  RxString actualPlayerToken = ''.obs;

  String myPlayerToken = '';

  void handleSnapshotReceive(AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.data == null) return;

    msgEntity = GameRoomMessageModel.fromJson(jsonDecode(snapshot.data));

    _handleNewMessage(msgEntity.msg);
  }

  void makePlay({
    required int rowIndex,
    required int colIndex,
  }) {
    board?[colIndex][rowIndex] = myPlayerToken;

    channel.value?.sink.add(jsonEncode({
      'msg': 'made_play',
      'board': board,
      'status': 4003,
    }));
  }

  void _handleNewMessage(String msg) {
    print('msg: $msg');

    switch (msg) {
      case 'All players connected':
        channel.value?.sink.add(
          jsonEncode({
            'msg': 'Ready',
            'board': [[]],
            "status": 4003
          }),
        );
        myPlayerToken = msgEntity.player!;
        return;

      case 'Game Live':
        _handleNextPlay();
        return;

      case 'Game Ended':
        _handleGameEnded();
        return;
    }
  }

  void _handleNextPlay() {
    board = msgEntity.board!;
    isMyTurn.value = msgEntity.playerTurn == myPlayerToken;
    actualPlayerToken.value = msgEntity.playerTurn!;
  }

  void _handleGameEnded() {
    Get.toNamed(AppRouter.homeScreen);
  }

  @override
  void onInit() {
    super.onInit();
    final String roomId = Get.parameters['roomId']!;
    const String url = !kIsWeb
        ? 'ws://10.0.2.2:8000/match/122'
        : 'ws://localhost:8000/match/121';

    channel.value = WebSocketChannel.connect(
      Uri.parse('$url/$roomId'),
    );
  }

  @override
  void dispose() {
    channel.value?.sink.close();
    super.dispose();
  }
}
