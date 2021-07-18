double amountToDouble(String amount) {
  String amountFormatted = amount.split(',').join();
  return double.parse(amountFormatted);
}
