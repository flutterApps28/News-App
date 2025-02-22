import 'package:get/get.dart';
import 'package:news_apk/views/home_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String newsDetail = '/newsDetail';

  static List<GetPage> pages = [
    GetPage(
        name: home,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(microseconds: 200)),
  ];
}
