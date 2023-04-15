import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/error/classes/error_info.dart';

class AuthExceptionHandler {
  static ErrorInfo call(AuthException exception) {
    return ErrorInfo(msg: exception.message);
  }
}
