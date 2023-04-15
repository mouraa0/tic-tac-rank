import 'package:tic_tac_rank_app/core/supabase/supabase_constants.dart';
import 'package:tic_tac_rank_app/core/supabase/utils/supabase_utils_response.dart';
import 'package:tic_tac_rank_app/core/user/user_store.dart';

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

  static Future<SupabaseUtilsResponse> userHasUsername() async {
    final UserInfo userInfo = await getUserInfo();

    return SupabaseUtilsResponse(success: userInfo.username.isNotEmpty);
  }

  static Future<UserInfo> getUserInfo() async {
    return UserInfo.fromMap(
      await supabase
          .from('profiles')
          .select()
          .eq('id', supabase.auth.currentUser!.id)
          .single() as Map<String, dynamic>,
    );
  }
}
