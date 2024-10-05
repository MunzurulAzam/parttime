import 'package:intl/intl.dart';

String formatDate(String timestamp) {

  DateTime dateTime = DateTime.parse(timestamp);

  String formattedDate = DateFormat('d MMM yyyy').format(dateTime);

  return formattedDate;
}
