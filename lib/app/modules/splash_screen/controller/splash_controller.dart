import 'package:get/get.dart';

import '../../home_screen/views/home_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Get.offAll(() => const HomeView(),
          transition: Transition.fade),
    );
  }
}
