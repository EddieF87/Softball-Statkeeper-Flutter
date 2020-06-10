import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/model/team_utils.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/standings_cell.dart';

class StandingsRow extends StatelessWidget {
  final Team team;
  final bool isColoredRow;
  final VoidCallback onTeamSelected;

  const StandingsRow({
    Key key,
    this.team,
    this.isColoredRow = false,
    this.onTeamSelected,
  })  : assert(team != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColorLight = Theme.of(context).primaryColorLight;

    return Container(
      color: isColoredRow ? primaryColorLight : null,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () => onTeamSelected(),
              child: StandingsCell(
                data: team.name,
              ),
            ),
          ),
          _buildStandingsCell(data: team.wins),
          _buildStandingsCell(data: team.losses),
          _buildStandingsCell(data: team.ties),
          _buildStandingsCell(
            data: team.getWinPct(),
            flexAmount: 2,
          ),
          _buildStandingsCell(data: team.totalRunsScored),
          _buildStandingsCell(data: team.totalRunsAllowed),
          _buildStandingsCell(data: team.getRunDiff()),
        ],
      ),
    );
  }

  Widget _buildStandingsCell({dynamic data, int flexAmount = 1}) {
    return Expanded(
      flex: flexAmount,
      child: StandingsCell(data: data),
    );
  }
}
