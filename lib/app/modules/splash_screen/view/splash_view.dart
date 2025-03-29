import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriflame/app/modules/splash_screen/controller/splash_controller.dart';

import '../../../utils/img_icons.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            width: 200,
            images.appLogo,
            alignment: Alignment.center,
          ),
        ),
      );
    });
  }
}
