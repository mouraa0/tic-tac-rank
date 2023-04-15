import 'package:get/get.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/database_utils/supabase_database_utils.dart';
import 'package:tic_tac_rank_app/core/user/user_store.dart';

class GeneralController extends GetxController {
  final _userStore = Get.find<UserStore>();

  void _initHandler() {
    final session = supabase.auth.currentSession;
    Future.delayed(
      Duration.zero,
      () async {
        if (session == null) {
          return Get.offAndToNamed(AppRouter.loginScreen);
        }

        final userHasUsername = await SupabaseDatabaseUtils.userHasUsername();

        if (userHasUsername.success) {
          await _userStore.populateUser();

          return Get.offAndToNamed(AppRouter.homeScreen);
        }

        Get.offAndToNamed(AppRouter.createUsernameScreen);
      },
    );
  }

  @override
  void onInit() {
    _initHandler();
    super.onInit();
  }
}
