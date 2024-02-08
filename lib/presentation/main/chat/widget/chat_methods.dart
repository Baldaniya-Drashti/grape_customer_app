import 'package:intl/intl.dart';

class ChatMethods {
  bool isSameDay(DateTime date1, DateTime date2) {
    return DateFormat('yyyy-MM-dd').format(date1) ==
        DateFormat('yyyy-MM-dd').format(date2);
  }

  bool isToday(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  String formatAsYesterday(DateTime date) {
    DateTime currentDate = DateTime.now();
    DateTime previousDate = currentDate.subtract(Duration(days: 1));
    DateTime dateToCheck = date;
    if (dateToCheck.year == previousDate.year &&
        dateToCheck.month == previousDate.month &&
        dateToCheck.day == previousDate.day) {
      return 'Yesterday';
    }
    return DateFormat.yMMMd().format(date);
  }
}
