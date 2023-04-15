import 'package:tic_tac_rank_app/core/supabase/utils/database_utils/supabase_database_utils.dart';

class UserStore {
  UserInfo? user;

  Future populateUser() async {
    user = await SupabaseDatabaseUtils.getUserInfo();
  }
}

class UserInfo {
  final int publicId;
  final String username;
  final int points;

  UserInfo({
    required this.publicId,
    required this.username,
    required this.points,
  });

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      publicId: map['public_id'],
      username: map['username'] ?? '',
      points: map['points'],
    );
  }
}
