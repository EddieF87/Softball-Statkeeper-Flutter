import 'package:intl/intl.dart';

class StatFormatter {

  ///If stat amount is a double, format as #.000, if null, format as "---"
  static String displayAmount(dynamic amount) {
    if (amount is double && amount < 0) {
      return "- - -";
    } else if (amount is double) {
      return NumberFormat("#.000").format(amount);
    } else {
      return amount.toString();
    }
  }
}
