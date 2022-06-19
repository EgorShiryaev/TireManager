import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tire_manager/utils/datetime_helper.dart';

void main() {
  final now = DateTime.now();
  final dateNow = DateTimeHelper.convertDateTimeToDate(now);
  final timeNow = DateTimeHelper.convertDateTimeToTimeOfDay(now);
  test('convert DateTime.now to date', () {
    final matcherDate = DateTime(now.year, now.month, now.day);
    expect(dateNow, matcherDate);
  });
  test('convert DateTime.now to timeOfDay', () {
    final matcherTimeOfDay = TimeOfDay(hour: now.hour, minute: now.minute);
    expect(timeNow, matcherTimeOfDay);
  });
  test('convert date and timeOfDay to dateTime', () {
    final dateTimeNow =
        DateTimeHelper.convertDateAndTimeOfDayToDateTime(dateNow, timeNow);
    final matcherDateTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    expect(dateTimeNow, matcherDateTime);
  });
}
