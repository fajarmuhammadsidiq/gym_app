import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_banner_controller.dart';

class DetailBannerView extends GetView<DetailBannerController> {
  const DetailBannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBannerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailBannerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
