class ValidationHelper {
  ValidationHelper.empty();

  String passwordValidator(String value) {
    //Check if password exists
    if (value.isEmpty) {
      return 'Please provide your password';
    }
    //Check if password is less than 7 characters
    if (value.length < 7) {
      return 'Your password is too short';
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
    //Check if ID exists
    if (value.isEmpty) {
      return 'Please provide your National ID Number';
    }
    //Check if ID is 7 or 8 digits
    if (value.length < 7 || value.length > 8) {
      return 'Your National ID number should be 7 or 8 digits';
    }
    return null;
  }

  String phoneValidator(String value) {
    //Check if number exists
    if (value.isEmpty) {
      return 'Please provide your phone number';
    }
    //Check if phone is not 10 digits
    if (value.length != 10) {
      return 'Your phone number should be 10 digits';
    }
    //Check if phone starts with '07' or '01'
    if (!value.startsWith('07')) {
      return 'Your phone number should start with 07';
    }
    return null;
  }
}
