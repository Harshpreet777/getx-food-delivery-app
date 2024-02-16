import 'package:get/get.dart';
import 'package:getx_task/core/repos/service.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiServices>(() => ApiServices());
  }
}
