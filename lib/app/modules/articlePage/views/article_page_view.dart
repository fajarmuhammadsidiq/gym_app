import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/app/data/Models/article.dart';
import 'package:gym_app/app/routes/app_pages.dart';

import '../../../controllers/indexcontroller_controller.dart';
import '../controllers/article_page_controller.dart';

class ArticlePageView extends StatefulWidget {
  ArticlePageView({Key? key}) : super(key: key);

  @override
  State<ArticlePageView> createState() => _ArticlePageViewState();
}

class _ArticlePageViewState extends State<ArticlePageView> {
  IndexcontrollerController indexC = Get.find();
  ArticlePageController controller = Get.put(ArticlePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white, Colors.red]),
            ),
            child: Center(
              child: Text(
                "Article for you",
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder(
              future: controller.articleFuture(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                int datacount = snapshot.data!.data!.posts!.length;
                var data = snapshot.data!.data!.posts;
                var data2 = Random().nextInt(datacount);
                Posts data1 = data![data2];
                return Container(
                  alignment: Alignment.bottomLeft,
                  height: 250,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                        image: NetworkImage("${data1.thumbnail}"),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.red])),
                      child: Text("${data1.title} diambil dari CNN")),
                );
              }),
          const SizedBox(height: 20),
          FutureBuilder(
            future: controller.articleFuture(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data?.data?.posts?.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data?.data?.posts![index];
                  final data1 = snapshot.data?.data;
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_ARTICLE, arguments: data);
                      },
                      leading: Container(
                        width: 50,
                        height: 50,
                        child: Image.network(
                          "${data?.thumbnail}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.white,
                                Colors.red,
                              ])),
                          child: Text("${data?.title}")),
                      subtitle: Text(
                          textAlign: TextAlign.justify, "${data?.description}"),
                    ),
                  );
                },
              );
            },
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(248, 238, 72, 21),
          unselectedItemColor: Colors.grey,
          currentIndex: indexC.pageIndex.value,
          onTap: (int i) => indexC.indexPage(i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: "profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call_outlined), label: "Stream"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_gymnastics), label: "LifeStyle")
          ]),
    );
  }
}
