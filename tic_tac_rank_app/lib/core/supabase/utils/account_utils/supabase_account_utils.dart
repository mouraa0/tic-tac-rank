import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/supabase_utils_response.dart';

class SupabaseAccountUtils {
  static Future<SupabaseUtilsResponse> register({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(password: password, email: email);

      return SupabaseUtilsResponse(success: true);
    } on AuthException catch (e) {
      return SupabaseUtilsResponse(success: false, exception: e);
    }
  }

  static Future<SupabaseUtilsResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);

      return SupabaseUtilsResponse(success: true);
    } catch (e) {
      return SupabaseUtilsResponse(success: false, exception: e);
    }
  }

  static Future<SupabaseUtilsResponse> resetPassword({
    required String email,
  }) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);

      return SupabaseUtilsResponse(success: true);
    } catch (e) {
      return SupabaseUtilsResponse(success: false, exception: e);
    }
  }
}
