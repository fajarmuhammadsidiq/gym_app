import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gym_app/app/controllers/indexcontroller_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  IndexcontrollerController indexC = Get.put(IndexcontrollerController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.INTRO,
      getPages: AppPages.routes,
    ),
  );
}
