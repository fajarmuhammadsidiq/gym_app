import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:duration/duration.dart';
import '../../../controllers/indexcontroller_controller.dart';

class StreamingPageView extends StatefulWidget {
  StreamingPageView({Key? key}) : super(key: key);

  @override
  State<StreamingPageView> createState() => _StreamingPageViewState();
}

class _StreamingPageViewState extends State<StreamingPageView> {
  IndexcontrollerController indexC = Get.find();

  late String videoTitle;
  // Url List
  final List<String> _videoUrlList = [
    'https://www.youtube.com/watch?v=p5hGl5Aa_uU',
    'https://www.youtube.com/watch?v=Us9dkATkwlQ',
    'https://www.youtube.com/watch?v=Fnw_ebnYqh4',
    'https://www.youtube.com/watch?v=rsZqOh6fR20'
  ];

  List<YoutubePlayerController> lYTC = [];

  Map<String, dynamic> cStates = {};
  @override
  void initState() {
    super.initState();
    fillYTlists();
  }

  fillYTlists() {
    for (var element in _videoUrlList) {
      String _id = YoutubePlayer.convertUrlToId(element)!;

      YoutubePlayerController _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          enableCaption: true,
          captionLanguage: 'en',
        ),
      );
      _ytController.addListener(() {
        if (cStates[_id] != _ytController.value.isPlaying) {
          if (mounted) {
            setState(() {
              cStates[_id] = _ytController.value.isPlaying;
            });
          }
        }
      });

      lYTC.add(_ytController);
    }
  }

  @override
  void dispose() {
    for (var element in lYTC) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: _videoUrlList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              YoutubePlayerController _ytController = lYTC[index];
              String _id = YoutubePlayer.convertUrlToId(_videoUrlList[index])!;
              String title = _ytController.metadata.author;

              Duration durasi = _ytController.metadata.duration;
              final Duration dur = parseTime("${durasi}");

              String curState = 'undefined';
              if (cStates[_id] != null) {
                curState = cStates[_id]
                    ? 'playing  :  ${title} | ${dur.inMinutes} Menit '
                    : 'Not playing';
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: Get.width,
                  height: 250,
                  child: Stack(fit: StackFit.expand, children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.topCenter,
                      height: 220.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: YoutubePlayer(
                          controller: _ytController,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.lightBlueAccent,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(isExpanded: true),
                            FullScreenButton(color: Colors.red),
                          ],
                          onReady: () {
                            print('onReady for $index');
                          },
                          onEnded: (YoutubeMetaData _md) {
                            _ytController.seekTo(const Duration(seconds: 0));
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Row(
                        children: [
                          Text(
                            curState,
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(248, 238, 72, 21),
          unselectedItemColor: Colors.grey,
          currentIndex: indexC.pageIndex.value,
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
