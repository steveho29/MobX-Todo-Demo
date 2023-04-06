import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDeadline(DateTime deadline) {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
        .add_jm()
        .format(deadline);
  }

  static DateTime cinderella() {
    var now = DateTime.now();

    return DateTime(now.year, now.month, now.day, 23, 59, 59, 999, 999);
  }

  static DateTime beginOfDay() {
    var now = DateTime.now();

    return DateTime(now.year, now.month, now.day);
  }
}