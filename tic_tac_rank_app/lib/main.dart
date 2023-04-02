import 'package:flutter/material.dart';

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

class TicTacToePrototype extends StatelessWidget {
  const TicTacToePrototype({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => Container(
            height: 2,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
          itemBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              itemCount: 3,
              separatorBuilder: (context, index) => Container(
                width: 2,
                height: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              itemBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
