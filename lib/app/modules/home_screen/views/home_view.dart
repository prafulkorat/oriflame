import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oriflame/app/modules/Edit_Caption/views/edit_caption_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/colors.dart';
import '../../../utils/common_text.dart';
import '../../../utils/img_icons.dart';
import '../../../utils/strings.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      assignId: true,
      builder: (logic) {
        return Scaffold(
          extendBody: true,
          backgroundColor: color.white,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: color.white,
            title: SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Center(
                        child: Image.asset(images.appLogo, height: 50)),
                    Positioned(right: 0, bottom: 0, child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff9ed5ad),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    )),
                  ],
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            spacing: 5,
            children: [
              SizedBox(height: 5),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.tabData.length,
                  padding: EdgeInsets.only(left: 16),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.tabSelected.value = index;
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Obx(() {
                        return commonText.statictext(
                          text: "${controller.tabData[index]}",
                          color: controller.tabSelected.value == index ? color.appColor : color.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        );
                      }),
                    ).paddingOnly(right: 22);
                  },
                ),
              ),
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.homeData.length,
                  onPageChanged: (value) {
                    controller.selectIndex.value = value;
                  },
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            controller.homeData[index]["image"],
                            width: Get.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.2),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                              child: Row(
                                children: [
                                  Image.asset(controller.homeData[index]["profile"], fit: BoxFit.cover),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(images.tag, scale: 3.5).paddingOnly(bottom: 4),
                                        commonText.statictext(
                                          text: Strings.feedBio,
                                          color: color.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: color.black.withOpacity(0.2),
                                    ),
                                    alignment: Alignment.center,
                                    height: 22,
                                    width: 45,
                                    child: commonText.statictext(
                                      text: "${index + 1} of ${controller.homeData.length}",
                                      color: color.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: 16, right: 16, top: 17, bottom: 20),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: color.black.withOpacity(0.2),
                                  ),
                                  alignment: Alignment.center,
                                  height: 65,
                                  width: 22,
                                  child: ListView.builder(
                                    padding: EdgeInsets.only(top: 6, bottom: 6),
                                    itemCount: controller.homeData.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 6, right: 6),
                                        child: Obx(() {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: controller.selectIndex.value == index ? color.appColor : color.white,
                                            ),
                                            height: 10,
                                            // width: 20,
                                          ).paddingOnly(bottom: 10);
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 16, right: 16, top: 17, bottom: 70),
                              child: Column(
                                children: [
                                  SizedBox(height: 17),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: color.black.withOpacity(0.2),
                                    ),
                                    padding: EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    width: Get.width,
                                    child: Row(
                                      children: [
                                        Icon(Icons.music_note, color: color.white),
                                        SizedBox(width: 4),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Recommended: ',
                                            style: TextStyle(color: color.white, fontSize: 12),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Bad Habits ',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: color.white,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'by Ed Sheeran ',
                                                style: TextStyle(color: color.white, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => EditCaptionView(), arguments: {
                                        "text": controller.homeData[index]["text"],
                                      })!
                                          .then((value) {
                                        if (value != null) {
                                          controller.homeData[index]["text"] = value;
                                          controller.update();
                                        }
                                      });
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: color.black.withOpacity(0.2),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      alignment: Alignment.center,
                                      width: Get.width,
                                      child: commonText.statictext(
                                        text: "${controller.homeData[index]["text"]}",
                                        color: color.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        maxLines: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Row(
                                    children: [
                                      commonText.statictext(
                                        text: "Quick share to:",
                                        color: color.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 40,
                                          child: ListView.builder(
                                            padding: EdgeInsets.only(left: 8),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.homeData[index]["social_media"].length,
                                            itemBuilder: (context, index1) {
                                              return InkWell(
                                                onTap: () {
                                                  showDialogBox(context,onComplete: () {
                                                    Get.back();
                                                    _launchSocialMedia(index1);
                                                  });
                                                },
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                                child: Image.asset(
                                                  controller.homeData[index]["social_media"][index1],
                                                  height: 32,
                                                  width: 30,
                                                ).paddingOnly(right: 16),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),

                      ],
                    );
                  },
                ),
              )
            ],
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectIndex.value,
            elevation: 0,
            onTap: (index) {
              controller.selectIndex.value = index;
            },
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,

            items: List.generate(
              controller.bottomList.length,
                  (index) => BottomNavigationBarItem(
                icon: Image.asset(controller.bottomList[index], height: 30, width: 30),
                label: '', // Add a label if needed
              ),
            ),
          )),

        );
      },
    );
  }


}

Future showDialogBox(BuildContext context, {required Function onComplete}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 3),
          onEnd: () {
            onComplete();
          },
          builder: (context, value, child) {
            String title = Strings.generatingStr;
            if (value > 0.3 && value < 0.5) {
              title = Strings.copyingStr;
            } else if (value > 0.5 && value < 0.7) {
              title = Strings.savingStr;
            } else if (value > 0.7) {
              title = Strings.preparingStr;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RotatingLoader(),  // Applied Circular Animation
                const SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color.grey2,
                  ),
                ),
                const SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LinearProgressIndicator(
                    value: value,
                    minHeight: 10,
                    color: color.progress,
                    backgroundColor: color.bgProgress,
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

class RotatingLoader extends StatefulWidget {
  @override
  _RotatingLoaderState createState() => _RotatingLoaderState();
}

class _RotatingLoaderState extends State<RotatingLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),  // Faster rotation
      vsync: this,
    )..repeat(); // Continuously rotate
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(images.loader, width: 60),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

void _launchSocialMedia(int index) {
  switch (index) {
    case 0: // Instagram
    case 1:
      _launchUrl(
        "instagram://user?username=instagram",
        "https://www.instagram.com/instagram/",
      );
      break;
    case 2: // Facebook
    case 3:
      _launchUrl(
        "fb://page/4",
        "https://www.facebook.com/",
      );
      break;
    case 4: // Messenger
      _launchUrl(
        "fb-messenger://user/100044582168658",
        "https://www.messenger.com/",
      );
      break;
    case 5: // TikTok
      _launchUrl(
        "snssdk1233://user/profile/123456789",
        "https://www.tiktok.com/",
      );
      break;
    case 6: // WhatsApp
      _launchUrl(
        "whatsapp://send?phone=+123456789",
        "https://wa.me/123456789",
      );
      break;
    case 7: // WhatsApp Business
      _launchUrl(
        "whatsapp://send?phone=+123456789&business=1",
        "https://wa.me/123456789?business=1",
      );
      break;
    case 8: // Telegram
      _launchUrl(
        "tg://resolve?domain=username",
        "https://t.me/username",
      );
      break;
    case 9: // Email
      _launchUrl(
        "mailto:example@example.com",
        "https://mail.google.com/",
      );
      break;
    case 10: // Other (fallback URL)
      _launchUrl(
        "https://www.google.com/",
        "https://www.google.com/",
      );
      break;
    default:
      print("Invalid index");
  }
}

Future<void> _launchUrl(String appUrl, String webUrl) async {
  Uri appUri = Uri.parse(appUrl);
  Uri webUri = Uri.parse(webUrl);

  if (await canLaunchUrl(appUri)) {
    // Open in app if available
    await launchUrl(appUri);
  } else {
    // Otherwise open in browser
    await launchUrl(webUri, mode: LaunchMode.externalApplication);
  }
}
