import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_task/core/di/home_binding.dart';
import 'package:getx_task/core/routing/router.dart';
import 'package:getx_task/core/routing/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomeRoute,
      getPages: RoutingPage.getPages,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
