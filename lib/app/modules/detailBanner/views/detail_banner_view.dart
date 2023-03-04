import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/detail_banner_controller.dart';

class DetailBannerView extends GetView<DetailBannerController> {
  const DetailBannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'xqvCmoLULNY',
      flags: YoutubePlayerFlags(
        autoPlay: true,
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
                    title: Text("Squats "),
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
                            borderRadius: BorderRadiusDirectional.circular(40)),
                      ))
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
