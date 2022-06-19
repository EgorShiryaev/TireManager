import 'package:flutter/material.dart';

class DateTimeHelper {
  static DateTime convertDateTimeToDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static TimeOfDay convertDateTimeToTimeOfDay(DateTime dateTime) {
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static DateTime convertDateAndTimeOfDayToDateTime(
    DateTime date,
    TimeOfDay time,
  ) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
