import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_rank_app/core/user/user_store.dart';
import 'package:tic_tac_rank_app/core/widgets/scaffold/scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Get.find<UserStore>();

    return AppScaffold(
      showFloatingButton: true,
      pageTitle: ['Welcome, ', userStore.user!.username],
      body: const [],
    );
  }
}

class CardNews extends StatelessWidget {
  const CardNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/images/trophy.jpg'),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: Center(
            child: Text('New winner!'),
          ),
        ),
      ),
    );
  }
}
