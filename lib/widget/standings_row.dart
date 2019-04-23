import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/widget/standings_cell.dart';

class StandingsRow extends StatelessWidget {
  final Team team;
  final bool isColoredRow;

  const StandingsRow({
    Key key,
    this.team,
    this.isColoredRow = false,
  })  : assert(team != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColorLight = Theme.of(context).primaryColorLight;

    return Container(
      color: isColoredRow ? primaryColorLight : null,
      child: Row(
        children: <Widget>[
          StandingsCell(data: team.name, flexAmount: 3,),
          StandingsCell(data: team.wins),
          StandingsCell(data: team.losses),
          StandingsCell(data: team.ties),
          StandingsCell(data: team.getWinPct(), flexAmount: 2,),
          StandingsCell(data: team.runsScored),
          StandingsCell(data: team.runsAllowed),
          StandingsCell(data: team.getRunDiff()),
        ],
      ),
    );
  }
}
