import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/account_utils/classes/supabase_account_utils_response.dart';

class SupabaseAccountUtils {
  static Future<SupabaseAccountUtilsResponse> register({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(password: password, email: email);

      return SupabaseAccountUtilsResponse(success: true);
    } on AuthException catch (e) {
      return SupabaseAccountUtilsResponse(success: false, exception: e);
    }
  }

  static Future<SupabaseAccountUtilsResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);

      return SupabaseAccountUtilsResponse(success: true);
    } on AuthException catch (e) {
      return SupabaseAccountUtilsResponse(success: false, exception: e);
    }
  }
}
