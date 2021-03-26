import 'dart:math';

import 'package:flutter/material.dart';

class DateUtil {
  static DateTime today() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime setDateTime(DateTime date, int hour, int minute) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  static DateTime mergeDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static int howManyDaysInTheMonth(DateTime date) {
    var month = DateTime(date.year, date.month);
    var nextMonth = DateTime(month.year, month.month + 1);
    return nextMonth.difference(month).inDays;
  }

  static DateTime getDayOfTheMonth(DateTime date) {
    var monthDayCount = howManyDaysInTheMonth(date);
    final random = Random();
    var day = random.nextInt(monthDayCount);
    var hour = random.nextInt(23);
    var minute = random.nextInt(59);

    return DateTime(date.year, date.month, day, hour, minute);
  }
}
