import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/add_players_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_controls.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_ledger.dart';

class TeamStatsPage extends StatelessWidget {
  final StatKeeperStore statKeeperStore;
  final int teamIndex;

  const TeamStatsPage({
    this.teamIndex = 0,
    this.statKeeperStore,
  }) : assert(statKeeperStore != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) =>
                TeamLedger(team: statKeeperStore.teams[teamIndex]),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: PlayersStatsTable(
                teamFireID: statKeeperStore.teams[teamIndex].fireID,
                isLeague: false,
                statKeeperStore: statKeeperStore,
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
        builder: (BuildContext context) => AddPlayersDialog(
              statKeeperStore: statKeeperStore,
              teamIndex: teamIndex,
            ),
      );
}
