import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tic_tac_rank_app/presenter/game_room/binder/game_room_bindings.dart';
import 'package:tic_tac_rank_app/presenter/game_room/view/game_room_screen.dart';
import 'package:tic_tac_rank_app/presenter/home/view/home_screen.dart';
import 'package:tic_tac_rank_app/presenter/login/view/login_screen.dart';
import 'package:tic_tac_rank_app/presenter/matchmaking/binder/matchmaking_bindings.dart';
import 'package:tic_tac_rank_app/presenter/matchmaking/view/matchmaking_screen.dart';

class AppRouter {
  static String homeScreen = '/';
  static String matchmakingScreen = '/matchmaking';
  static String matchScreen = '/match';
  static String matchConfigRoute = '$matchScreen/:roomId';
  static String loginScreen = '/login';
  static String registerScreen = '/register';

  static returnPages() {
    return [
      GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: matchmakingScreen,
        page: () => const MatchmakingScreen(),
        binding: MatchmakingBindings(),
      ),
      GetPage(
        name: matchConfigRoute,
        page: () => const GameRoomScreen(),
        binding: GameRoomBindings(),
      ),
    ];
  }
}
