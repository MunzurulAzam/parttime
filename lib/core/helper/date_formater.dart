import 'package:intl/intl.dart';

String formatDate(String timestamp) {

  DateTime dateTime = DateTime.parse(timestamp);

  String formattedDate = DateFormat('d MMM yyyy h a').format(dateTime);

  return formattedDate;
}
