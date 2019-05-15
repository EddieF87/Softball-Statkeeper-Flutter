import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/team_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/add_players_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_controls.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_ledger.dart';

class TeamStatsPage extends StatelessWidget {
  final TeamStore teamStore;

  const TeamStatsPage({
    this.teamStore,
  }) : assert(teamStore != null);

  @override
  Widget build(BuildContext context) {
    TeamStore teamStore = Provider.of<TeamStore>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) => TeamLedger(team: teamStore.team),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child:
//              Observer(
//                builder: (_) =>
                  PlayersStatsTable(
                isLeague: false,
                playersGroupStore: teamStore,
//                    ),
              ),
            ),
          ),
          TeamControls(
            onAddButtonTapped: () => _showAddPlayersDialog(context),
            onScoresButtonTapped: () => _showScores(),
          ),
        ],
      ),
    );
  }

  _showScores() {
    debugPrint("_showScores");
  }

  Future<void> _showAddPlayersDialog(BuildContext context) async =>
      showDialog<void>(
        context: context,
        builder: (BuildContext context) =>
            AddPlayersDialog(teamStore: teamStore),
      );
}
