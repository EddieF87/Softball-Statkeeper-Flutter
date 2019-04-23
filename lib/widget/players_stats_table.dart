import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_row.dart';
import 'package:sleekstats_flutter_statkeeper/widget/stats_header_row.dart';

class PlayersStatsTable extends StatefulWidget {
  final String statkeeperFirestoreID;

  const PlayersStatsTable({
    Key key,
    this.statkeeperFirestoreID,
  })  : assert(statkeeperFirestoreID != null),
        super(key: key);

  @override
  State<PlayersStatsTable> createState() => PlayersStatsTableState();
}

class PlayersStatsTableState extends State<PlayersStatsTable> {
  List<Player> players = [];
  String statToSortBy = Player.LABEL_G;

  Future<List<Player>> _retrievePlayers() async {
    debugPrint("_retrievePlayers");
    return await RepositoryServicePlayers.getAllPlayers(
        widget.statkeeperFirestoreID);
  }

  _sortPlayers(String stat) {
    Map<String, Comparator<Player>> comparatorMap = Player.toComparatorMap();
    if (comparatorMap.containsKey(stat)) {
      players.sort(comparatorMap[stat]);
    } else {
      players.sort(comparatorMap[Player.LABEL_G]);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 4.0),
      ),
      child: FutureBuilder(
        future: _retrievePlayers(),
        builder: (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
          if (snapshot.hasData) {
            players = snapshot.data;
            debugPrint("hasData");
            if (snapshot.data == null || snapshot.data.isEmpty) {
              debugPrint("snapshot.data == null || snapshot.data.isEmpty");
              return Center(child: Text("No players yet!"));
            } else {
              debugPrint("snapshot.data  here  ");
              snapshot.data.forEach((Player player) => debugPrint(player.name));
              return _buildStatsTable();
            }
          } else if (snapshot.hasError) {
            debugPrint("hasError  ");
            return Center(child: Text("Error: Couldn't find players!"));
          } else {
            debugPrint("else  ");
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildStatsTable() {
    debugPrint("_buildStatsTable");
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new SizedBox(
        width: 1320.0,
        child: Column(
          children: <Widget>[
            StatsHeaderRow(
              statSorted: statToSortBy,
              onStatSelected: (statLabel) => setState(() {
                    statToSortBy = statLabel;
                  }),
            ),
            Expanded(
              child: _buildList(statToSortBy),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(String stat) {
    _sortPlayers(stat);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => PlayerStatRow(
            player: players[index],
            isColoredRow: index.isOdd,
          ),
      itemCount: players.length,
    );
  }
}
