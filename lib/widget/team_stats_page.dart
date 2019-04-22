import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/widget/add_players_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/widget/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/widget/team_controls.dart';
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
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          TeamLedger(
            team: widget.team,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: PlayersStatsTable(
                statkeeperFirestoreID: widget.team.firestoreID,
              ),
            ),
          ),
          TeamControls(
            onAddButtonTapped: () => _showAddPlayersDialog(),
            onScoresButtonTapped: () => _showScores(),
          ),
        ],
      ),
    );
  }

  _showScores() {
    debugPrint("_showScores");
  }

  Future<void> _showAddPlayersDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddPlayersDialog(
          teamFireID: widget.team.firestoreID,
          sKFireID: widget.team.statkeeperFirestoreID,
          onNewPlayersSubmitted: () {
            setState(() {

            });
          },
        );
      },
    );
  }
}
