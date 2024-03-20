import 'package:stage_up/core/constants/months.dart';
import 'package:stage_up/core/constants/weeksdays.dart';

class DateTimeHelper {
  static String getStringDate(DateTime date) {
    return "${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} ${date.year}";
  }

  static String getStringTime(DateTime date) {
    return "${date.hour} h ${date.minute} min";
  }

  static String getStringDateTime(DateTime date) {
    return "${getStringDate(date)} ${getStringTime(date)}";
  }
}
