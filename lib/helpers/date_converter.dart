import 'package:intl/intl.dart';

class DatePrettier {
  DateTime? dateTime;

  DatePrettier(DateTime dateTime) {
    this.dateTime = dateTime;
  }

  // Convert to "year month date"
  String convertToymd() {
    //Date Parsing and Formatting
    var formatter = DateFormat('y-MM-dd');
    return formatter.format(this.dateTime!);
  }
}
