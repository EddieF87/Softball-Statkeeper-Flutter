import 'package:intl/intl.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/model/team_utils.dart';

class StatFormatter {
  ///If stat amount is a double, format as #.000, if null, format as "---"
  static String displayAmount({dynamic amount, String statName: ""}) {
    if (displaySpecial(statName)) {
      if (amount < 0) {
        return "- - -";
      } else {
        return NumberFormat("#.000").format(amount);
      }
    } else {
      return amount.toString();
    }
  }

  static bool displaySpecial(String statName) {
    switch (statName) {
      case PlayerUtils.LABEL_AVG:
      case PlayerUtils.LABEL_OBP:
      case PlayerUtils.LABEL_OBPROE:
      case PlayerUtils.LABEL_OPS:
      case PlayerUtils.LABEL_SLG:
      case TeamUtils.LABEL_WINPCT:
        return true;
      default:
        return false;
    }
  }
}
