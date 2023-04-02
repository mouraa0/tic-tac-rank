import 'package:tic_tac_rank_app/core/domain/tic_tac_toe/entities/player_entity.dart';

class GameEntity {
  final PlayerEntity player1;
  final PlayerEntity player2;
  final List<List<int>> gameTable;

  GameEntity({
    required this.player1,
    required this.player2,
    required this.gameTable,
  });
}
