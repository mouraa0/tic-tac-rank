import 'package:tic_tac_rank_app/domain/matchmaking/entities/matchmaking_message_entity.dart';

class MatchmakingMessageModel extends MatchmakingMessageEntity {
  MatchmakingMessageModel({
    required super.msg,
    required super.status,
    super.roomId,
  });

  factory MatchmakingMessageModel.fromJson(Map<String, dynamic> json) {
    return MatchmakingMessageModel(
      msg: json['msg'],
      status: json['status'],
      roomId: json['room_id'],
    );
  }
}
