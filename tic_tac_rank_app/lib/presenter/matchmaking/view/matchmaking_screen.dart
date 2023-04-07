import 'package:flutter/material.dart';
import 'package:tic_tac_rank_app/presenter/matchmaking/controller/matchmaking_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MatchmakingScreen extends StatefulWidget {
  const MatchmakingScreen({super.key});

  @override
  State<MatchmakingScreen> createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends State<MatchmakingScreen> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://10.0.2.2:8000/matchmaking/121'),
  );

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  final _controller = MatchmakingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _channel.stream,
        builder: (context, snapshot) {
          _controller.handleSnapshotReceive(snapshot);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(color: Colors.black),
                const SizedBox(height: 20),
                Text(_controller.mostRecentData?.msg ?? ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
