import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Pub_Function {
  static String formatDate(String inputDate) {
    if (inputDate == '') return '';
    DateTime parsedDate = DateTime.parse(inputDate);
    String formattedDate = "${parsedDate.year}/${parsedDate.month}/${parsedDate.day}";
    return formattedDate;
  }

  static String weekDay(int num) {
    switch (num) {
      case 1:
        return '每週一';
      case 2:
        return '每週二';
      case 3:
        return '每週三';
      case 4:
        return '每週四';
      case 5:
        return '每週五';
      case 6:
        return '每週六';
      case 7:
        return '每週日';
      default:
        return '';
    }
  }

  static void msgShow(String msg) {
    Fluttertoast.showToast(
      backgroundColor: Color.fromARGB(255, 73, 73, 73),
      msg: msg,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16,
    );
  }

  static DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  static TimeOfDay DTToTimeOfDay(DateTime dt) {
    return TimeOfDay(hour: dt.hour, minute: dt.minute);
  }

  static String dateTimeToHHmm(DateTime time) {
    return DateFormat.Hm().format(time);
  }
}
