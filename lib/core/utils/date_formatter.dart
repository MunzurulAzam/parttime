import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 String convertToYearMonth(String input) {
  // Split the input by '/'
  List<String> parts = input.split('/');

  // Extract the month and year
  String month = parts[0];
  String year = parts[1];

  // Convert 'YY' to 'YYYY'
  String fullYear = '20' + year;

  // Return in the format 'YYYY-MM'
  return '$fullYear-$month';
}
