class Validation {
  Validation._privateConstructor();

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field can\'t be empty';
    } else if (!(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))) {
      return 'Enter correct email or gmail';
    } else {
      return null;
    }
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field can\'t be empty';
    } else if (value.length < 8) {
      return 'Password must be more than 7 characters';
    }
    //! Enable before Build
    //  else if (!(RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]$').hasMatch(value))) {
    //   return 'Please Enter Strong Password';
    // }
    else {
      return null;
    }
  }

  static String? confirmPasswordValidation(String? value, String passwordValue) {
    if (value == null || value.isEmpty) {
      return 'This field can\'t be empty';
    } else if (value.length < 8) {
      return 'Password must be more than 7 characters';
    } else if (value != passwordValue) {
      return 'Password not match';
    } else {
      return null;
    }
  }

  static String? simpleFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field can\'t be empty';
    } else {
      return null;
    }
  }

  static String? phoneValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field can\'t be empty';
    } else if (value.length <= 4) {
      return 'This field can\'t be empty';
    } else if (value.length >= 4 && value.length < 14) {
      return 'Please Enter Correct Number';
    } else {
      return null;
    }
  }
}
