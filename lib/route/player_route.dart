import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_stats.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_label.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stats_page.dart';

class PlayerRoute extends StatKeeperRoute {
  PlayerRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PlayerRouteState createState() => _PlayerRouteState();
}

class _PlayerRouteState extends State<PlayerRoute> {
  PlayerStatLabel label = PlayerStatLabel(
    stat: "Test",
    amount: 0,
  );
  String nameOfStatToUpdate;
  PlayerStats _playerStats;

  @override
  void initState() {
    super.initState();
    nameOfStatToUpdate = "---";
    _playerStats = PlayerStats(
        id: 889333315,
        firestoreID: "firestoreID",
        name: "MAGIC JOGBSON",
        rbi: 99,
        runs: 70,
        hrs: 7,
        walks: 6,
        rOE: 2,
        outs: 3);
  }

  void _chooseStatToUpdate(String newStatToUpdate) {
    if (nameOfStatToUpdate != newStatToUpdate) {
      setState(() => nameOfStatToUpdate = newStatToUpdate);
    }
  }

  void _updateStat(StatToUpdate statToUpdate) {
    if (PlayerStats.CHANGEABLE_LABELS.contains(statToUpdate.name)) {
      setState(() {
        switch (statToUpdate.name) {
          case PlayerStats.LABEL_R:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.runs += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_RBI:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.rbi += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_1B:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.singles += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_2B:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.doubles += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_3B:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.triples += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_HR:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.hrs += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_OUT:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.outs += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_ROE:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.rOE += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_SF:
            debugPrint(
                "UPDATE STAT: ${statToUpdate.name} + ${statToUpdate.amount}");
            _playerStats.sacFlies += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_BB:
            _playerStats.walks += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_SB:
            _playerStats.stolenBases += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_G:
            _playerStats.games += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_HBP:
            _playerStats.strikeOuts += statToUpdate.amount;
            break;
          case PlayerStats.LABEL_K:
            _playerStats.strikeOuts += statToUpdate.amount;
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD PlayerRoute");
    return Column(children: <Widget>[
      PlayerStatsPage(
        playerStats: _playerStats,
        onTap: (newStatToUpdate) => _chooseStatToUpdate(newStatToUpdate),
      ),
      PlayerStatControls(
        stat: nameOfStatToUpdate,
        onSubmit: (statToUpdate) => _updateStat(statToUpdate),
      ),
    ]);
  }
}
