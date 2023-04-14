import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/widgets/buttons/app_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                title: 'Find Match',
                onPressed: () => Get.toNamed(AppRouter.matchmakingScreen),
              ),
              const SizedBox(height: 20),
              AppButton(
                title: 'Logoff',
                onPressed: () => supabase.auth.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
