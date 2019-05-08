import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class ScoreBoard extends StatelessWidget {
  final String batterName;
  final String awayTeamName;
  final String homeTeamName;
  final int awayTeamRuns;
  final int homeTeamRuns;
  final int outs;
  final int inning;
  final double avg;
  final int hr;
  final int rbi;
  final int runs;

  const ScoreBoard({
    Key key,
    @required this.batterName,
    @required this.awayTeamName,
    @required this.homeTeamName,
    @required this.awayTeamRuns,
    @required this.homeTeamRuns,
    @required this.outs,
    @required this.inning,
    @required this.avg,
    @required this.hr,
    @required this.rbi,
    @required this.runs,
  })  : assert(batterName != null),
        assert(awayTeamName != null),
        assert(homeTeamName != null),
        assert(awayTeamRuns != null),
        assert(homeTeamRuns != null),
        assert(outs != null),
        assert(inning != null),
        assert(avg != null),
        assert(hr != null),
        assert(rbi != null),
        assert(runs != null),
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
                    Text("$awayTeamName $awayTeamRuns"),
                    Text("$homeTeamName $homeTeamRuns"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("At Bat: $batterName"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(" AVG: ${StatFormatter.displayAmount(avg)} "),
                    Text(" HR: $hr "),
                    Text(" RBI: $rbi "),
                    Text(" R: $runs "),
                  ],
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
