class GameRoomMessageEntity {
  final String msg;
  final int status;
  final String? player;
  final List<dynamic>? board;
  final String? winner;
  final String? playerTurn;

  GameRoomMessageEntity({
    required this.msg,
    required this.status,
    this.player,
    this.board,
    this.winner,
    this.playerTurn,
  });
}
