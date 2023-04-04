import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.black),
            ),
            child: const Text(
              'Find Match',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
