import 'package:tic_tac_rank_app/domain/game_room/game_room_message_entity.dart';

class GameRoomMessageModel extends GameRoomMessageEntity {
  GameRoomMessageModel({
    required super.msg,
    required super.status,
    super.player,
    super.board,
    super.playerTurn,
    super.winner,
  });

  factory GameRoomMessageModel.fromJson(Map<String, dynamic> json) {
    return GameRoomMessageModel(
      msg: json['msg'],
      status: json['status'],
      player: json['player'],
      board: json['board'],
      playerTurn: json['player_turn'],
      winner: json['winner'],
    );
  }
}
