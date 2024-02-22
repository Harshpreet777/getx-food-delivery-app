import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_task/core/routing/routes.dart';
import 'package:getx_task/ui/views/detail_view.dart';
import 'package:getx_task/ui/views/home_view.dart';
import 'package:getx_task/ui/views/login_signup_view.dart';
import 'package:getx_task/ui/views/search_view.dart';
import 'package:getx_task/ui/views/welcome_view.dart';

class RoutingPage {
  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomeView(),
    ),
    GetPage(
        name: Routes.detailsRoute,
        page: () => DetailView(),
        transition: Transition.zoom),
    GetPage(
      name: Routes.loginSignUpRoute,
      page: () => const LoginSignUpView(),
    ),
    GetPage(
        name: Routes.searchRoute,
        page: () => const SearchView(),
        transition: Transition.zoom),
    GetPage(
      name: Routes.welcomeRoute,
      page: () => const WelcomeView(),
    )
  ];
}
