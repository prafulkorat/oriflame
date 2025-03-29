import 'package:get/get.dart';
import '../modules/Edit_Caption/bindings/edit_caption_binding.dart';
import '../modules/Edit_Caption/views/edit_caption_view.dart';
import '../modules/home_screen/bindings/home_binding.dart';
import '../modules/home_screen/views/home_view.dart';
import '../modules/splash_screen/bindings/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CAPTION,
      page: () => const EditCaptionView(),
      binding: EditCaptionBinding(),
    ),
  ];
}
