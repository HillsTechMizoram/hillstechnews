import 'package:intl/intl.dart';

String dateTimeFormat(String date) {
  DateTime dateParsed = DateTime.parse(date);
  String formatedDate = DateFormat('MMM d, yyyy').format(dateParsed);
  return formatedDate;
}

String timeFormat(String date) {
  //var format = DateFormat('hh:mm a');

  DateTime dateParsed = DateTime.parse(date);
  String formatedDate = DateFormat('hh:mm a').format(dateParsed);
  return formatedDate;
}
