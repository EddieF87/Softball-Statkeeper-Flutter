import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/widget/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/widget/team_ledger.dart';

class TeamStatsPage extends StatefulWidget {
  final Team team;

  const TeamStatsPage({
    this.team,
  }) : assert(team != null);

  @override
  State<StatefulWidget> createState() => TeamStatsPageState();
}

class TeamStatsPageState extends State<TeamStatsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TeamLedger(
          team: widget.team,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: PlayersStatsTable(),
          ),
        )
      ],
    );
  }
}
