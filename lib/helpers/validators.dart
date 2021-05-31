class ValidationHelper {
  ValidationHelper.empty();

  String? passwordValidator(String? value) {
    //Check if password exists
    if (value!.isEmpty) {
      return 'Please provide your password';
    }
    return null;
  }

  String? emailValidator(String? value) {
    //Check if email exists
    if (value!.isEmpty) {
      return 'Please provide an email';
    }
    return null;
  }

  String? idValidator(String? value) {
    //Check if ID exists
    if (value!.isEmpty) {
      return 'Please provide a valid Identification Number';
    }
    return null;
  }

  String? fNameValidator(String? value) {
    //Check if Name exists
    if (value!.isEmpty) {
      return 'Please provide your Full Name';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    //Check if number exists
    if (value!.isEmpty) {
      return 'Please provide your phone number';
    }
    return null;
  }
}
