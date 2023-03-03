import 'package:get/get.dart';

import '../modules/articlePage/bindings/article_page_binding.dart';
import '../modules/articlePage/views/article_page_view.dart';
import '../modules/detailArticle/bindings/detail_article_binding.dart';
import '../modules/detailArticle/views/detail_article_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/profilePage/bindings/profile_page_binding.dart';
import '../modules/profilePage/views/profile_page_view.dart';
import '../modules/streamingPage/bindings/streaming_page_binding.dart';
import '../modules/streamingPage/views/streaming_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.STREAMING_PAGE,
      page: () => StreamingPageView(),
      binding: StreamingPageBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_PAGE,
      page: () => ArticlePageView(),
      binding: ArticlePageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ARTICLE,
      page: () => DetailArticleView(),
      binding: DetailArticleBinding(),
    ),
  ];
}
