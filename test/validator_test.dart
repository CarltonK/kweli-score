import 'package:flutter_test/flutter_test.dart';
import 'package:kweliscore/helpers/helpers.dart';

void main() {
  final ValidationHelper validator = ValidationHelper.empty();
  test("Email validator", () {
    // Set a static email
    final String emailYes = "myemail@domain.com";
    final String emailNone = "";
    final String emailNo = "email";

    expect(validator.emailValidator(emailYes), null);
    expect(validator.emailValidator(emailNone), "Please provide an email");
    expect(validator.emailValidator(emailNo), "Please provide a valid email");
  });

  test("Password validator", () {
    // Set a static password
    final String passwordYes = "1234567";
    final String passwordNone = "";
    final String passwordNo = "12345";

    expect(validator.passwordValidator(passwordYes), null);
    expect(
      validator.passwordValidator(passwordNone),
      "Please provide your password",
    );
    expect(
      validator.passwordValidator(passwordNo),
      "Your password is too short",
    );
  });

  test("National ID validator", () {
    // Set a static National ID
    final String idYes = "1234567";
    final String idYesTwo = "12345678";
    final String idNone = "";
    final String idNo = "123456";
    final String idNoTwo = "123457890";

    expect(validator.idValidator(idYes), null);
    expect(validator.idValidator(idYesTwo), null);
    expect(
      validator.idValidator(idNone),
      "Please provide your National ID Number",
    );
    expect(
      validator.idValidator(idNo),
      "Your National ID number should be 7 or 8 digits",
    );
    expect(
      validator.idValidator(idNoTwo),
      "Your National ID number should be 7 or 8 digits",
    );
  });

  test("Phone Number validator", () {
    // Set a static Phone Number
    final String phoneNumberYes = "0712345678";
    final String phoneNumberNone = "";
    final String phoneNumberNo = "071234567";
    final String phoneNumberNoTwo = "07123456789";
    final String phoneNumberNoThree = "0112345678";

    expect(validator.phoneValidator(phoneNumberYes), null);
    expect(
      validator.phoneValidator(phoneNumberNone),
      "Please provide your phone number",
    );
    expect(
      validator.phoneValidator(phoneNumberNo),
      "Your phone number should be 10 digits",
    );
    expect(
      validator.phoneValidator(phoneNumberNoTwo),
      "Your phone number should be 10 digits",
    );
    expect(
      validator.phoneValidator(phoneNumberNoThree),
      "Your phone number should start with 07",
    );
  });
}
