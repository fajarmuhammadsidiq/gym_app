import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JenisOlahragaContainer extends StatelessWidget {
  const JenisOlahragaContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: Get.width,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage("assets/dash.png"), fit: BoxFit.cover),
          gradient: LinearGradient(colors: [
            Color(0xFF38474C),
            Color(0xFF0E7D77),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Squats \nWith \nWeight",
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                      fontSize: 30)),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/fire.png"),
                          fit: BoxFit.none),
                    ),
                  ),
                  Text("250 kcal",
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF8C06D),
                          fontSize: 30)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Text(
                  "lakukan sekarang",
                  style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[200],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
