import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:getx_task/core/di/locator.dart';
import 'package:getx_task/ui/views/my_app_view.dart';

void main() async {
  // setupLocator();
  await GetStorage.init();
  runApp(const MyApp());
}

