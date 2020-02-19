import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_row.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_pageview.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/stats_header_row.dart';

class PlayersStatsTable extends StatelessWidget {
  final ValueSetter<String> onTeamLinkClicked;
  final bool isLeague;
  final String teamFireID;

  const PlayersStatsTable({
    Key key,
    this.teamFireID,
    this.onTeamLinkClicked,
    this.isLeague = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor, width: 4.0),
      ),
      child: Observer(builder: (_) {
        return statKeeperStore.players.isEmpty
            ? Center(child: Text("Add players!"))
            : _buildStatsTable(context);
      }),
    );
  }

  Widget _buildStatsTable(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Container(
        color: Colors.white,
        width: isLeague ? 1320.0 : 1250.0,
        child: Column(
          children: <Widget>[
            StatsHeaderRow(
              onStatSelected: (stat) => statKeeperStore.sortPlayers(stat),
              isLeague: isLeague,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  List<Player> players = isLeague
                      ? statKeeperStore.players
                      : statKeeperStore.players
                          .where((p) => p.teamFireID == teamFireID)
                          .toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        PlayerStatRow(
                          isLeague: isLeague,
                          player: players[index],
                          isColoredRow: index.isOdd,
                          onPlayerSelected: () => _navigateToPlayersPageView(
                              context, players[index].fireID),
                          onTeamSelected: (String teamFireID) =>
                              onTeamLinkClicked(teamFireID),
                        ),
                    itemCount: players.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the PageView of players.
  void _navigateToPlayersPageView(BuildContext context, String playerFireID) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context, listen: false);

    int playerIndex =
        statKeeperStore.players.indexWhere((p) => p.fireID == playerFireID);
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return PlayersPageView(startingIndex: playerIndex,);
        },
      ),
    );
  }
}
