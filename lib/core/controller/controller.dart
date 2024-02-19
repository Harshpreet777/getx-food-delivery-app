import 'package:get/get.dart';

class Controller extends GetxController {
  var selectedGender = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var pass = ''.obs;
  var confirmpass = ''.obs;
  var lgnEmail = ''.obs;
  var lgnPass = ''.obs;

  void onClickRadioButton(var gender) {
    selectedGender.value = gender;
  }

  void nameController(var userName) {
    name.value = userName;
  }

  void emailController(var userEmail) {
    email.value = userEmail;
  }

  void passController(var userPass) {
    pass.value = userPass;
  }

  void confirmpassController(var userConfirmPass) {
    confirmpass.value = userConfirmPass;
  }
  void lgnEmailController(var loginEmail){
    lgnEmail.value=loginEmail;
  }
  void lgnPassController(var loginPass){
    lgnPass.value=loginPass;
  }
}
