import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_plays.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/game_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/stat_cell.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_stats_page.dart';

class TeamScreen extends StatelessWidget {
  final String title;
  final String fireID;

  const TeamScreen({
    Key key,
    this.title,
    this.fireID,
  }) : assert(fireID != null);

  @override
  Widget build(BuildContext context) {
//    debugPrint("buildTEAMSCREEN");
    StatKeeperStore teamStore = Provider.of<StatKeeperStore>(context);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: <Widget>[
              Tab(
                text: "Stats",
              ),
              Tab(
                text: "Game",
              )
            ],
          ),
          TeamTabView(teamStore),
        ],
      ),
    );
  }
}

class TeamTabView extends StatelessWidget {
  final StatKeeperStore teamStore;

  const TeamTabView(this.teamStore);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          children: <Widget>[
            TeamStatsPage(),
            LineUpScreen(players: teamStore.getPlayersBattingOrder(),),
          ],
        ),
      ),
    );
  }
}

class LineUpScreen extends StatefulWidget {
  final List<Player> players;

  const LineUpScreen({this.players});

  @override
  State<StatefulWidget> createState() => _LineUpState();
}

class _LineUpState extends State<LineUpScreen> {

  @override
  Widget build(BuildContext context) {
    StatKeeperStore teamStore = Provider.of<StatKeeperStore>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: ReorderableListView(
            header: Text("ffvfscdc"),
            children: [
              for (final player in widget.players)
                StatCell(
                  key: ValueKey(player),
                  data: player.name,
                )
            ],
            onReorder: (oldIndex, newIndex) {
              setState(() {
                _sortBattingOrder(oldIndex, newIndex);
                teamStore.updateLineUp();
              });
            },
          ),
        ),
        RaisedButton(
          onPressed: () => _goToGame(context),
          child: Text(
            "Start Game",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  _sortBattingOrder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final Player item = widget.players.removeAt(oldIndex);
    widget.players.insert(newIndex, item);
  }

  _goToGame(BuildContext context) async {
    StatKeeperStore statKeeperStore =
    Provider.of<StatKeeperStore>(context, listen: false);

    await RepositoryServicePlays.resetPlays(statKeeperStore.statkeeperFireID);

    print(
        "jjjj   ${statKeeperStore.statkeeperFireID}   ${statKeeperStore.teams[0]
            .firestoreID}");

    GameStore gameStore = GameStore(
        sKFireID: statKeeperStore.statkeeperFireID,
        awayFireID: statKeeperStore.teams[0].firestoreID,
        homeFireID: statKeeperStore.teams[0].firestoreID);

    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) =>
            GameScreen(
              gameStore: gameStore,
            ),
      ),
    );
//        .whenComplete(_retrieveLeagueData);
  }
}
