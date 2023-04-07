import 'package:tic_tac_rank_app/domain/matchmaking/entities/snapshot_entity.dart';

class MatchmakingSnapshotModel extends MatchmakingSnapshotEntity {
  MatchmakingSnapshotModel({
    required super.msg,
    required super.status,
    super.roomId,
  });

  factory MatchmakingSnapshotModel.fromJson(Map<String, dynamic> json) {
    return MatchmakingSnapshotModel(
      msg: json['msg'],
      status: json['status'],
      roomId: json['room_id'],
    );
  }
}
