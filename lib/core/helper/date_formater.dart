import 'package:intl/intl.dart';

String formatDate(String timestamp) {

  DateTime dateTime = DateTime.parse(timestamp);

<<<<<<< HEAD
  String formattedDate = DateFormat('d MMM yyyy h a').format(dateTime);
=======
  String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
>>>>>>> 834c035 (booking list data add done)

  return formattedDate;
}
