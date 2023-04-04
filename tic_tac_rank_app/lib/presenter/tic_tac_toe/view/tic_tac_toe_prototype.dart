import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/domain/tic_tac_toe/entities/game_entity.dart';
import 'package:tic_tac_rank_app/domain/tic_tac_toe/entities/player_entity.dart';

class TicTacToePrototype extends StatefulWidget {
  const TicTacToePrototype({super.key});

  @override
  State<TicTacToePrototype> createState() => _TicTacToePrototypeState();
}

class _TicTacToePrototypeState extends State<TicTacToePrototype> {
  final PlayerEntity _player1 = PlayerEntity(
    id: 1,
    name: 'Player 1',
    image: '',
    symbol: 'X',
  );

  final PlayerEntity _player2 = PlayerEntity(
    id: 2,
    name: 'Player 2',
    image: '',
    symbol: 'O',
  );

  late GameEntity _game;

  void _makeMove({required int x, required int y}) {
    setState(() {
      _game.makeMove(x: x, y: y);
    });
  }

  @override
  void initState() {
    _game = GameEntity(player1: _player1, player2: _player2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ColumnListViewComponent(
              game: _game,
              makeMove: _makeMove,
            ),
            const SizedBox(height: 100),
            Text(_game.currentPlayer.name),
          ],
        ),
      ),
    );
  }
}

class _ColumnListViewComponent extends StatelessWidget {
  final GameEntity game;
  final Function makeMove;

  const _ColumnListViewComponent({
    Key? key,
    required this.game,
    required this.makeMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const _SeparatorComponent(),
      itemBuilder: (context, index) => _RowsListViewComponent(
        game: game,
        colIndex: index,
        makeMove: makeMove,
      ),
    );
  }
}

class _RowsListViewComponent extends StatelessWidget {
  final GameEntity game;
  final Function makeMove;
  final int colIndex;

  const _RowsListViewComponent({
    Key? key,
    required this.game,
    required this.colIndex,
    required this.makeMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const _SeparatorComponent(),
        itemBuilder: (context, index) => _SingleBoxComponent(
          makeMove: () => makeMove(x: colIndex, y: index),
          icon: game.board[colIndex][index],
        ),
      ),
    );
  }
}

class _SingleBoxComponent extends StatelessWidget {
  final String icon;
  final Function makeMove;

  const _SingleBoxComponent({
    Key? key,
    required this.icon,
    required this.makeMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => makeMove(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3.2,
        height: 50,
        child: Center(
          child: Text(icon),
        ),
      ),
    );
  }
}

class _SeparatorComponent extends StatelessWidget {
  const _SeparatorComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
    );
  }
}
