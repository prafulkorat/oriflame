import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/common_text.dart';
import '../../../utils/strings.dart';
import '../controllers/edit_caption_controller.dart';

class EditCaptionView extends GetView<EditCaptionController> {
  const EditCaptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCaptionController>(
      init: EditCaptionController(),
      assignId: true,
      builder: (logic) {
        return Scaffold(
          backgroundColor: color.white,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: color.white,
            leading: InkWell(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Future.delayed(Duration(milliseconds: 500), () {
                  Get.back();
                });
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Icon(Icons.close, color: color.black),
            ),
            actions: [
              Obx(() {
                return InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Future.delayed(Duration(milliseconds: 500), () {
                      Get.back(result: controller.text.text);
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: controller.arg.value == controller.text.text ? color.appColor.withOpacity(0.5) : Color(0xff7EC086),
                    ),
                    margin: EdgeInsets.only(right: 16),
                    height: 35,
                    width: 65,
                    alignment: Alignment.center,
                    child: commonText.statictext(
                      text: Strings.save,
                      color: color.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
            ],
            title: commonText.statictext(
              text: Strings.editCaption,
              color: color.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
          ),
          body: TextField(
            controller: controller.text,
            onChanged: (value) {
              controller.update();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            maxLines: 1000,
          ),
        );
      },
    );
  }
}
