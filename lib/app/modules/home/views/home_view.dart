import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/app/controllers/indexcontroller_controller.dart';
import 'package:gym_app/app/modules/home/views/widget/jenis_olahraga.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  IndexcontrollerController indexC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color(0xFF0E7D77),
                    Color(0xFF38474C),
                  ]),
                ),
                child: ListTile(
                  minVerticalPadding: 25,
                  title: Text(
                    "Good Morning",
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[200],
                    ),
                  ),
                  subtitle: Text(
                    "Fajar muhammad sidiq",
                    style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[200],
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(60),
                      image: DecorationImage(
                          image: AssetImage("assets/user.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              ">>> Pilih jenis Olahraga mu <<<",
              style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20),
            ),
            Container(
              width: Get.height,
              height: Get.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    JenisOlahragaContainer(),
                    JenisOlahragaContainer(),
                    JenisOlahragaContainer(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(248, 238, 72, 21),
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          onTap: (int i) => indexC.indexPage(i),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call_outlined), label: "Stream"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_gymnastics), label: "Training")
          ]),
    );
  }
}
