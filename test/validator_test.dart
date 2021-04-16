import 'package:flutter_test/flutter_test.dart';
import 'package:kweliscore/helpers/helpers.dart';

void main() {
  test("Email validator", () {
    // Set a static email
    final String emailYes = "myemail@domain.com";
    final String emailNone = "";
    final String emailNo = "email";

    final ValidationHelper validator = ValidationHelper.empty();

    expect(validator.emailValidator(emailYes), null);
    expect(validator.emailValidator(emailNone), "Please provide an email");
    expect(validator.emailValidator(emailNo), "Please provide a valid email");
  });
}
