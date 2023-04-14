import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';

class SupabaseAccountUtils {
  static Future register({
    required String email,
    required String password,
  }) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  // static Future login({
  //   required String email,
  //   required String password,
  // }) async {
  //   await supabase.auth.signInWithPassword(password: password, email: email);
  // }
}
