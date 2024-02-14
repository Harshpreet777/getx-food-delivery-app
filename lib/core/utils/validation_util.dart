class Validations {
  static String? isPassValid(String pass) {
    String passPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(passPattern);
    if (pass.toString().isEmpty) {
      return "Cannot be Empty";
    } else if (!regExp.hasMatch(pass)) {
      return "Password is Not Valid";
    }
    return null;
  }

  static String? isEmailValid(String email) {
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailPattern);
    if (email.toString().isEmpty) {
      return "Cannot be Empty";
    } else if (!regExp.hasMatch(email)) {
      return "Email is Not Valid";
    }
    return null;
  }
}
