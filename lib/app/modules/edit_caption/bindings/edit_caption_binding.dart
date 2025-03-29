import 'package:get/get.dart';

import '../controllers/edit_caption_controller.dart';

class EditCaptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCaptionController>(
      () => EditCaptionController(),
    );
  }
}
