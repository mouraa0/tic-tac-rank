import 'package:flutter/material.dart';

class TicTacToePrototype extends StatelessWidget {
  const TicTacToePrototype({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const _ColumnListViewComponent(),
      ),
    );
  }
}

class _ColumnListViewComponent extends StatelessWidget {
  const _ColumnListViewComponent({
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
      itemBuilder: (context, index) => const _RowsListViewComponent(),
    );
  }
}

class _RowsListViewComponent extends StatelessWidget {
  const _RowsListViewComponent({
    Key? key,
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
        itemBuilder: (context, index) => const _SingleBoxComponent(),
      ),
    );
  }
}

class _SingleBoxComponent extends StatelessWidget {
  const _SingleBoxComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
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
