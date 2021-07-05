import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeTools {
  static DateTime getDate(DateTime date) {
    return new DateTime(date.year, date.month, date.day);
  }

  static String dateFormat(DateTime date) {
    return DateFormat("dd.MM.yyyy").format(date);
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

  static Future<DateTimeRange> showRangedDateTimePicker(
      BuildContext context, DateTime startDate, DateTime finishDate,
      {DateTime borderDate}) async {
    final initialRange = startDate == null
        ? null
        : DateTimeRange(start: startDate, end: finishDate);

    final pickedDate = await showDateRangePicker(
        context: context,
        firstDate: borderDate == null ? DateTime(2000) : borderDate,
        lastDate: DateTime(2025),
        initialDateRange: initialRange);

    return pickedDate;
  }
}
