import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/players_group_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_row.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_pageview.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/stats_header_row.dart';

class PlayersStatsTable extends StatelessWidget {
  final PlayersGroupStore playersGroupStore;
  final ValueSetter<String> onTeamLinkClicked;
  final bool isLeague;

  const PlayersStatsTable({
    Key key,
    this.playersGroupStore,
    this.onTeamLinkClicked,
    this.isLeague = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor, width: 4.0),
      ),
      child: Observer(
        builder: (_) {
          return playersGroupStore.players.isEmpty
              ? Center(child: Text("Add players!"))
              : _buildStatsTable(context);
        }
      ),
    );
  }

  Widget _buildStatsTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new Container(
        color: Colors.white,
        width: isLeague ? 1320.0 : 1250.0,
        child: Column(
          children: <Widget>[
            StatsHeaderRow(
              onStatSelected: (stat) => playersGroupStore.sortPlayers(stat),
              isLeague: isLeague,
            ),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          PlayerStatRow(
                            isLeague: isLeague,
                            player: playersGroupStore.players[index],
                            isColoredRow: index.isOdd,
                            onPlayerSelected: () =>
                                _navigateToPlayersPageView(context, index),
                            onTeamSelected: (String teamFireID) =>
                                onTeamLinkClicked(teamFireID),
                          ),
                      itemCount: playersGroupStore.players.length,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the PageView of players.
  void _navigateToPlayersPageView(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          PlayerStore playerStore = Provider.of<PlayerStore>(context);
          return PlayersPageView(
            playerStore: playerStore,
            playersGroupStore: playersGroupStore,
            startingIndex: index,
          );
        },
      ),
    );
  }
}
