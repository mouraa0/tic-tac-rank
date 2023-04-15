import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/supabase_utils_response.dart';

class SupabaseDatabaseUtils {
  static Future<SupabaseUtilsResponse> editUsername({
    required String newUsername,
  }) async {
    final updates = {
      'id': supabase.auth.currentUser!.id,
      'username': newUsername,
    };

    try {
      await supabase.from('profiles').upsert(updates);

      return SupabaseUtilsResponse(success: true);
    } catch (e) {
      return SupabaseUtilsResponse(success: false, exception: e);
    }
  }
}
