import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditCaptionController extends GetxController {
  RxString arg = "".obs;

  TextEditingController text = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      arg.value = Get.arguments["text"];
      text.text = Get.arguments["text"];
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
