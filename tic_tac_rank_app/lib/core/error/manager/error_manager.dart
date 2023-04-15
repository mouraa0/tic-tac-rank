import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/error/classes/error_info.dart';
import 'package:tic_tac_rank_app/core/error/handlers/auth_exception_handler.dart';

class ErrorManager {
  static ErrorInfo getErrorMessage(dynamic exception) {
    if (exception is AuthException) {
      return AuthExceptionHandler.call(exception);
    }

    return ErrorInfo(msg: '');
  }
}
