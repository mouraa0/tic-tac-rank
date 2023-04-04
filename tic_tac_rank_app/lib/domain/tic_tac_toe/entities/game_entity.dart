import 'package:tic_tac_rank_app/domain/tic_tac_toe/entities/player_entity.dart';

class GameEntity {
  final PlayerEntity player1;
  final PlayerEntity player2;
  late PlayerEntity currentPlayer;

  GameEntity({
    required this.player1,
    required this.player2,
  }) {
    currentPlayer = player1;
  }

  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  void changeCurrentPlayer() {
    if (currentPlayer == player1) {
      currentPlayer = player2;
      return;
    }

    currentPlayer = player1;
  }

  void makeMove({
    required int x,
    required int y,
  }) {
    board[x][y] = currentPlayer.symbol;

    if (isGameOver()) {
      return resetBoard();
    }

    changeCurrentPlayer();
  }

  void resetBoard() {
    board = List.generate(3, (_) => List.filled(3, ''));
    currentPlayer = player1;
  }

  bool isGameOver() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0].isNotEmpty) {
        return true;
      }
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i].isNotEmpty) {
        return true;
      }
    }
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0].isNotEmpty) {
      return true;
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2].isNotEmpty) {
      return true;
    }

    return !board.any((row) => row.any((cell) => cell.isEmpty));
  }
}
