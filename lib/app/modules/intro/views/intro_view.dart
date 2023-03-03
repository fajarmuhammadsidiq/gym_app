import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/app/routes/app_pages.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF38474C),
            Color(0xFF0E7D77),
          ])),
        ),
        Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/intro.png"),
        ),
        Positioned(
            left: 20,
            top: 60,
            child: Text(
              "PUSH \nYOUR SELF \nHARDER",
              style: GoogleFonts.tourney(fontSize: 45, color: Colors.white),
            )),
        Positioned(
          bottom: 44,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: 40,
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF8C06D),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
