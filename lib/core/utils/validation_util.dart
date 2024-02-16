import 'package:getx_task/core/constants/string_constants.dart';

class Validations {
  static String? isNameValid(String name) {
    RegExp regExp = RegExp(StringConstants.namePattern);
    if (name.toString().isEmpty) {
      return StringConstants.isValidEmpty;
    } else if (name.length < 4) {
      return StringConstants.nameValidLength;
    } else if (!regExp.hasMatch(name)) {
      return StringConstants.nameValid;
    }
    return null;
  }

  static String? isPassValid(String pass) {
     RegExp regExp = RegExp(StringConstants.passPattern);
    if (pass.toString().isEmpty) {
      return StringConstants.isValidEmpty;
    } else if (!regExp.hasMatch(pass)) {
      return StringConstants.passValid;
    }
    return null;
  }

  static String? isEmailValid(String email) {
    RegExp regExp = RegExp(StringConstants.emailPattern);
    if (email.toString().isEmpty) {
      return StringConstants.isValidEmpty;
    } else if (!regExp.hasMatch(email)) {
      return StringConstants.emailValid;
    }
    return null;
  }
}
