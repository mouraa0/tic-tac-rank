import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/core/presenter/home/view/home_screen.dart';
import 'package:tic_tac_rank_app/core/presenter/tic_tac_toe/view/tic_tac_toe_prototype.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
