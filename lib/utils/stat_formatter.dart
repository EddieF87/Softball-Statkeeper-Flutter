import 'package:intl/intl.dart';

class StatFormatter {
  static final formatter = NumberFormat("#.000");

  ///If stat amount is a double, format as #.000, if null, format as "---"
  static String displayAmount(dynamic amount) {
    if (amount is num && amount < 0) {
      return "- - -";
    } else if (amount is double) {
      return formatter.format(amount);
    } else {
      return amount.toString();
    }
  }
}
