import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/presenter/game_room/controller/game_room_controller.dart';

final _controller = Get.find<GameRoomController>();

class BoardComponent extends StatelessWidget {
  const BoardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const _SeparatorComponent(),
      itemBuilder: (context, index) => _RowsListViewComponent(colIndex: index),
    );
  }
}

class _RowsListViewComponent extends StatelessWidget {
  final int colIndex;

  const _RowsListViewComponent({
    Key? key,
    required this.colIndex,
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
          rowIndex: index,
          colIndex: colIndex,
        ),
      ),
    );
  }
}

class _SingleBoxComponent extends StatelessWidget {
  final int colIndex;
  final int rowIndex;

  const _SingleBoxComponent({
    Key? key,
    required this.colIndex,
    required this.rowIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: _controller.isMyTurn.value
            ? () => _controller.makePlay(rowIndex: rowIndex, colIndex: colIndex)
            : () {},
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3.2,
          height: 50,
          child: Center(
            child: Text(_controller.board[colIndex][rowIndex]),
          ),
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
