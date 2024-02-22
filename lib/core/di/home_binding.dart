import 'package:get/get.dart';
import 'package:getx_task/core/repos/service.dart';
import 'package:getx_task/core/viewmodels/login_view_model.dart';
import 'package:getx_task/core/viewmodels/sign_up_view_model.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApiServices());
    Get.put(LoginViewModel());
    Get.put(SignUpViewModel());
  }
}
