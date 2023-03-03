import 'package:get/get.dart';
import 'package:gym_app/app/routes/app_pages.dart';

class IndexcontrollerController extends GetxController {
  //TODO: Implement IndexcontrollerController
  RxInt pageIndex = 0.obs;
  void indexPage(int i) {
    switch (i) {
      case 0:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME);
        print("1");
        break;
      case 1:
        pageIndex.value = i;
        Get.toNamed(Routes.PROFILE_PAGE);
        print("1");
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.STREAMING_PAGE);
        print("1");
        break;
      case 3:
        pageIndex.value = i;
        Get.offAllNamed(Routes.ARTICLE_PAGE);
        print("1");
        break;
    }
  }
}
