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

  test("PIN validator", () {
    // Set a static password
    final String pinYes = "1234567";
    final String pinNone = "";

    expect(validator.pinValidator(pinYes), null);
    expect(
      validator.pinValidator(pinNone),
      "Please provide your PIN",
    );
  });

  test("National ID validator", () {
    // Set a static National ID
    final String idYes = "1234567";
    final String idYesTwo = "12345678";
    final String idNone = "";

    expect(validator.identityValidator(idYes), null);
    expect(validator.identityValidator(idYesTwo), null);
    expect(
      validator.identityValidator(idNone),
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
