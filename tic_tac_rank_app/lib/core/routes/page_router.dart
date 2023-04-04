import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tic_tac_rank_app/presenter/home/view/home_screen.dart';
import 'package:tic_tac_rank_app/presenter/matchmaking/view/matchmaking_screen.dart';
import 'package:tic_tac_rank_app/presenter/tic_tac_toe/view/tic_tac_toe_prototype.dart';

class PageRouter {
  static String homeScreen = '/';
  static String matchmakingScreen = '/mm';
  static String matchScreen = '/match';

  static returnPages() {
    return [
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: matchmakingScreen,
        page: () => const MatchmakingScreen(),
      ),
      GetPage(
        name: matchScreen,
        page: () => const TicTacToePrototype(),
      ),
    ];
  }
}
