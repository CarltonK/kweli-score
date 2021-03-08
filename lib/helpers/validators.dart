class Validator {
  Validator.empty();

  String passwordValidator(String value) {
    //Check if password exists
    if (value.isEmpty) {
      return 'Please provide your Password';
    }
    //Check if password is less than 7 characters
    if (value.length < 7) {
      return 'Your pasword is too short';
    }
    return null;
  }

  String emailValidator(String value) {
    //Check if email exists
    if (value.isEmpty) {
      return 'Please provide an email';
    }
    //Check if @ sign exists
    if (!value.contains('@') || !value.contains('.')) {
      return 'Please provide a valid email';
    }
    return null;
  }

  String idValidator(String value) {
    //Check if fname exists
    if (value.isEmpty) {
      return 'Please provide your ID Number';
    }
    //Check if phone is not 10 digits
    if (value.length != 10) {
      return 'Your ID number should be 10 digits';
    }
    return null;
  }

  String phoneValidator(String value) {
    //Check if number exists
    if (value.isEmpty) {
      return 'Please provide your Phone Number';
    }
    //Check if phone is not 10 digits
    if (value.length != 10) {
      return 'Your phone number should be 10 digits';
    }
    //Check if phone starts with '07'
    if (!value.startsWith('07')) {
      return 'Your phone number should start with 07';
    }
    return null;
  }
}
