import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeTools {
  static DateTime getDate(DateTime date) {
    return new DateTime(date.year, date.month, date.day);
  }

  static Future<DateTime> showDateTimePicker(BuildContext context, date) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: date, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    return getDate(pickedDate);
  }
}
