import 'dart:convert';

import 'package:get/get.dart';
import 'package:gym_app/app/data/Models/article.dart';
import 'package:http/http.dart' as http;

class ArticlePageController extends GetxController {
  //TODO: Implement ArticlePageController

  Future<Article> articleFuture() async {
    const url = "https://api-berita-indonesia.vercel.app/cnn/gayaHidup/";
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      print("status code oke");
    } else {
      print("status code error");
    }
    return Article.fromJson(data);
  }
}
