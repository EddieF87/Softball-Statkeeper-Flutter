import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class ScoreBoard extends StatelessWidget {
//  final String batterName;
  final String awayTeamName;
  final String homeTeamName;

//  final int awayTeamRuns;
//  final int homeTeamRuns;
//  final int outs;
//  final int inning;
//  final double avg;
//  final int hr;
//  final int rbi;
//  final int runs;

  final GameStore gameStore;

  const ScoreBoard({
    Key key,
    @required this.gameStore,
    @required this.awayTeamName,
    @required this.homeTeamName,
  })  : assert(gameStore != null),
        assert(awayTeamName != null),
        assert(homeTeamName != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Observer(
                      builder: (_) =>
                          Text("$awayTeamName ${gameStore.awayTeamRuns}"),
                    ),
                    Observer(
                      builder: (_) =>
                          Text("$homeTeamName ${gameStore.homeTeamRuns}"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Observer(
                      builder: (_) =>
                          Text("At Bat: ${gameStore.batter?.name ?? ""}"),
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          " AVG: ${StatFormatter.displayAmount(statName: PlayerUtils.LABEL_AVG, amount: gameStore.batter?.getAVG() ?? 0.0)} "),
                      Text(" HR: ${gameStore.batter?.hrs ?? 0} "),
                      Text(" RBI: ${gameStore.batter?.rbi ?? 0} "),
                      Text(" R: ${gameStore.batter?.runs ?? 0} "),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.cake)
        ],
      ),
    );
  }
}
