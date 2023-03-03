import 'package:get/get.dart';

import '../controllers/streaming_page_controller.dart';

class StreamingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreamingPageController>(
      () => StreamingPageController(),
    );
  }
}
