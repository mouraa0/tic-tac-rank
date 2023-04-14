import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';

class GeneralController extends GetxController {
  void _initHandler() {
    final session = supabase.auth.currentSession;
    Future.delayed(
      Duration.zero,
      () {
        if (session != null) {
          return Get.offAndToNamed(AppRouter.homeScreen);
        }

        return Get.offAndToNamed(AppRouter.loginScreen);
      },
    );
  }

  @override
  void onInit() {
    _initHandler();
    super.onInit();
  }
}
