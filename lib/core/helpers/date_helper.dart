import 'package:stageup/core/constants/months.dart';
import 'package:stageup/core/constants/weeksdays.dart';

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

  static String getStringDuration(DateTime date) {
    var days = DateTime.now().day - date.day;
    switch (days) {
      case 0:
        return "Aujourd'hui";
      case 1:
        return "il y a $days jour";
      default:
        return "il y a $days jours";
    }
  }
}
