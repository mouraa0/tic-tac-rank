class MatchmakingSnapshotEntity {
  final String msg;
  final String status;
  final String? roomId;

  MatchmakingSnapshotEntity({
    required this.msg,
    required this.status,
    this.roomId,
  });
}
