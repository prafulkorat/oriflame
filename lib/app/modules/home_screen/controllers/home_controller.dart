import 'package:get/get.dart';

import '../../../utils/img_icons.dart';


class HomeController extends GetxController {
  RxInt tabSelected = 0.obs;
  RxInt selectIndex = 0.obs;

  List tabData = ["Smart Post", "Library", "Communities", "Share&Win"];

  List homeData = [
    {
      "image": images.content1,
      "profile": images.profile,
      "text":
          "💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy lipstick doesn't just promise rich pigments but brings you the benefits of hyaluronic acid and collagen-boosting peptides too. Pamper your lips with care while enjoying a long-lasting, luminous matte colour. 💋 ✨ #Oriflame #GiordaniGold #LipCareGoals Use my referral code: UK-AMANDA3012 Use my referral link: www.oriflame.com/giordani/amada3012",
      "song": "",
      "social_media": [
        "${images.insta1}",
        "${images.insta2}",
        "${images.fecbook1}",
        "${images.fecbook2}",
        "${images.message}",
        "${images.tiktok}",
        "${images.whatsapp}",
        "${images.wa_business}",
        "${images.telegram}",
        "${images.mail}",
        "${images.other}",
      ]
    },
    {
      "image": images.content2,
      "profile": images.profile,
      "text":
          "✨ Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance Use my referral code: UK-AMANDA3012 Use my referral link: www.oriflame.com/giordani/amada3012",
      "song": "",
      "social_media": [
        "${images.insta1}",
        "${images.insta2}",
        "${images.fecbook1}",
        "${images.fecbook2}",
        "${images.message}",
        "${images.tiktok}",
        "${images.whatsapp}",
        "${images.wa_business}",
        "${images.telegram}",
        "${images.mail}",
        "${images.other}",
      ]
    },
    {
      "image": images.content3,
      "profile": images.profile,
      "text":
          "Experience the elegance of Eclat Amour—a fragrance that captures the essence of romance and sophistication. Let every spritz wrap you in timeless charm and effortless allure. 💕 #EclatAmour #TimelessElegance Use my referral code: UK-AMANDA3012 Use my referral link: www.oriflame.com/giordani/amada3012",
      "song": "",
      "social_media": [
        "${images.insta1}",
        "${images.insta2}",
        "${images.fecbook1}",
        "${images.fecbook2}",
        "${images.message}",
        "${images.tiktok}",
        "${images.whatsapp}",
        "${images.wa_business}",
        "${images.telegram}",
        "${images.mail}",
        "${images.other}",
      ]
    },
  ];

  List bottomList = [
    "${images.bottomIcon1}",
    "${images.bottomIcon2}",
    "${images.bottomIcon3}",
    "${images.bottomIcon4}",
    "${images.bottomIcon5}",
  ];

  @override
  void onInit() {
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
