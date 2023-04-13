class MatchmakingMessageEntity {
  final String msg;
  final int status;
  final String? roomId;

  MatchmakingMessageEntity({
    required this.msg,
    required this.status,
    this.roomId,
  });
}
