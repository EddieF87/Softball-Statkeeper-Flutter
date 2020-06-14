import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/model/team_utils.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class TeamLedger extends StatelessWidget {
  final Team team;

  const TeamLedger({
    Key key,
    this.team,
  })  : assert(team != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            team.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48.0,
            ),
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                  "${team.wins}-${team.losses}-${team.ties}  (${StatFormatter.displayAmount(statName: TeamUtils.LABEL_WINPCT, amount: team.getWinPct())})"),
              Text("RS: ${team.totalRunsScored} RA: ${team.totalRunsAllowed}"),
            ],
          ),
        )
      ],
    );
  }
}
