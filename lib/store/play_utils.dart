import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class PlayUtils{

  void updatePlayerStats(Player player, String result) {
    switch (result) {
      case Player.LABEL_1B:
        player.singles++;
        break;
      case Player.LABEL_2B:
        player.doubles++;
        break;
      case Player.LABEL_3B:
        player.triples++;
        break;
      case Player.LABEL_HR:
        player.hrs++;
        break;
      case Player.LABEL_ROE:
        player.reachedOnErrors++;
        break;
      case Player.LABEL_BB:
        player.walks++;
        break;
      case Player.LABEL_K:
        player.strikeOuts++;
        break;
      case Player.LABEL_OUT:
        player.outs++;
        break;
      case Player.LABEL_HBP:
        player.hbp++;
        break;
      case Player.LABEL_SF:
        player.sacFlies++;
        break;
    }
  }
}