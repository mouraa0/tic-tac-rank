import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/error/classes/error_info.dart';
import 'package:tic_tac_rank_app/core/routes/app_router.dart';

class AuthExceptionHandler {
  static ErrorInfo call(AuthException exception) {
    switch (exception.message.toLowerCase()) {
      case 'user already registered':
        return ErrorInfo(
          msg: exception.message,
          buttonTitle: 'login',
          onButtonPressed: () => Get.offAndToNamed(AppRouter.loginScreen),
        );

      default:
        return ErrorInfo(msg: exception.message);
    }
  }
}
