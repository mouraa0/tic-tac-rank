import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/general/controller/general_controller.dart';
import 'package:tic_tac_rank_app/core/styles/text/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.find<GeneralController>();

    return Scaffold(
      body: Center(
        child: Text('TicTacRank', style: AppTextStyles.pageTitle),
      ),
    );
  }
}
