import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/user/user_store.dart';
import 'package:tic_tac_rank_app/data/game_room/models/game_room_message_model.dart';
import 'package:tic_tac_rank_app/domain/game_room/game_room_message_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GameRoomController extends GetxController {
  final _userStore = Get.find<UserStore>();

  final channel = Rxn<WebSocketChannel>();

  late GameRoomMessageEntity msgEntity;

  RxList<dynamic>? board;

  RxBool isMyTurn = false.obs;

  RxBool isGameEnded = false.obs;

  RxString actualPlayerToken = ''.obs;

  String myPlayerToken = '';

  void _handleEventReceive(dynamic event) {
    if (event == null) return;

    msgEntity = GameRoomMessageModel.fromJson(jsonDecode(event));

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
        return _handleNextPlay();

      case 'Game Ended':
        return _handleGameEnded();
    }
  }

  void _handleNextPlay() {
    board = msgEntity.board!.obs;
    isMyTurn.value = msgEntity.playerTurn == myPlayerToken;
    actualPlayerToken.value = msgEntity.playerTurn!;
  }

  void _handleGameEnded() {
    board = msgEntity.board!.obs;
    channel.value?.sink.close();
    isMyTurn.value = false;
    isGameEnded.value = true;
  }

  @override
  void onClose() {
    // isMyTurn.value = false;

    // actualPlayerToken.value = '';

    // myPlayerToken.value = '';
    // isGameEnded.value = false;

    channel.value?.sink.close();
    board = null;
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    final String roomId = Get.parameters['roomId']!;
    final String url =
        '${dotenv.env['WEBSOCKET_ENDPOINT']!}/match/${_userStore.user!.publicId}';

    channel.value = WebSocketChannel.connect(
      Uri.parse('$url/$roomId'),
    );

    channel.value?.stream.listen((event) {
      return _handleEventReceive(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    channel.value?.sink.close();
    board = null;
  }
}
