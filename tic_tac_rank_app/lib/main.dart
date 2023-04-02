import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/presenter/view/tic_tac_toe/tic_tac_toe_prototype.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToePrototype(),
    );
  }
}
