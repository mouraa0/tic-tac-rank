import 'package:flutter/material.dart';

class MatchmakingScreen extends StatelessWidget {
  const MatchmakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(color: Colors.black),
            SizedBox(height: 20),
            Text('Searching Match'),
          ],
        ),
      ),
    );
  }
}
