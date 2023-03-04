import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/detail_banner_controller.dart';

class DetailBannerView extends GetView<DetailBannerController> {
  const DetailBannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final squats = [
      "Tapakkan kaki di lantai. Atur agar jaraknya selebar baru. Kuatkan punggung Anda. Arahkan kaki kiri ke sudut jam 10 dan kaki kanan ke sudut jam 2, tidak lurus.[1]",
      "Tekuk lutut. Turunkan badan seolah Anda akan duduk di kursi. Mantapkan tumit di lantai. Tarik perut ke dalam. Tegakkan punggung dalam posisi netral selama latihan ini.",
      "Turunkan badan dengan terkontrol. Ketika menurunkan badan, dorong pinggul ke belakang. Turunlah serendah mungkin sementara tulang kering tetap vertikal dan tumit di lantai.[2] Dari posisi itu, naikkan lagi badan dari tumit perlahan-lahan, jika perlu seimbangkan badan dengan condong ke depan.",
      "Ulangi. Jika Anda pemula, usahakan melakukan 10 repetisi. Jika sudah lebih bugar, Anda bisa melakukan 15–30 repetisi per set. Lakukan dalam satu hingga tiga set. Ingatlah untuk istirahat di antara set."
    ];

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'xqvCmoLULNY',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      "Squats ",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: BackButton(
                      color: Colors.black,
                    ),
                  ),
                  body: Column(
                    children: [
                      player,
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          width: Get.width,
                          height: Get.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xFF38474C),
                              Color(0xFF0E7D77),
                            ]),
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(40),
                              topEnd: Radius.circular(40),
                            ),
                          ),
                          child: ListView(
                            padding: EdgeInsets.only(top: 20),
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  "Latihan Squats",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              ListView(
                                  shrinkWrap: true,
                                  children: squats
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              " ${e}",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                      .toList()),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        backgroundColor: Colors.orange),
                                    onPressed: () {},
                                    child: Text("Tambah ke favorits")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  body: Column(
                    children: [player],
                  ),
                );
              }
            },
          );
        });
  }
}
