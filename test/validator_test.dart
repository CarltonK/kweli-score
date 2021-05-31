import 'package:flutter_test/flutter_test.dart';
import 'package:kweliscore/helpers/helpers.dart';

void main() {
  final ValidationHelper validator = ValidationHelper.empty();
  test("Email validator", () {
    // Set a static email
    final String emailYes = "myemail@domain.com";
    final String emailNone = "";

    expect(validator.emailValidator(emailYes), null);
    expect(validator.emailValidator(emailNone), "Please provide an email");
  });

  test("Password validator", () {
    // Set a static password
    final String passwordYes = "1234567";
    final String passwordNone = "";

    expect(validator.passwordValidator(passwordYes), null);
    expect(
      validator.passwordValidator(passwordNone),
      "Please provide your password",
    );
  });

  test("National ID validator", () {
    // Set a static National ID
    final String idYes = "1234567";
    final String idYesTwo = "12345678";
    final String idNone = "";

    expect(validator.idValidator(idYes), null);
    expect(validator.idValidator(idYesTwo), null);
    expect(
      validator.idValidator(idNone),
      "Please provide a valid Identification Number",
    );
  });

  test("Phone Number validator", () {
    // Set a static Phone Number
    final String phoneNumberYes = "0712345678";
    final String phoneNumberNone = "";

    expect(validator.phoneValidator(phoneNumberYes), null);
    expect(
      validator.phoneValidator(phoneNumberNone),
      "Please provide your phone number",
    );
  });
}
