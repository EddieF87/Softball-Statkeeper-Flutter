import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/add_players_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_controls.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_ledger.dart';

class TeamStatsPage extends StatefulWidget {
  final Team team;

  const TeamStatsPage({
    this.team,
  }) : assert(team != null);

  @override
  State<StatefulWidget> createState() => TeamStatsPageState();
}

class TeamStatsPageState extends State<TeamStatsPage> {
  List<Player> players;

  _retrievePlayers() async {
    players = await RepositoryServicePlayers.getAllPlayersFromTeam(
        widget.team.statkeeperFirestoreID, widget.team.firestoreID);
    setState(() => players = players);
  }

  @override
  void initState() {
    super.initState();
    _retrievePlayers();
  }

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
              child: players != null
                  ? PlayersStatsTable(players: players)
                  : Center(
                      child: CircularProgressIndicator(),
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
          onNewPlayersSubmitted: () => _retrievePlayers(),
        );
      },
    );
  }
}
