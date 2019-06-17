import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_plays.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/game_screen.dart';
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
            TeamStatsPage(
              statKeeperStore: teamStore,
            ),
            Center(
              child: FlatButton(
                onPressed: () => _goToGame(context),
                child: Text("Start Game"),
              ),
            )
          ],
        ),
      ),
    );
  }

  _goToGame(BuildContext context) async {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    await RepositoryServicePlays.resetPlays(statKeeperStore.statkeeperFireID);

    GameStore gameStore = GameStore(
        sKFireID: statKeeperStore.statkeeperFireID,
        awayFireID: statKeeperStore.teams[0].fireID,
        homeFireID: statKeeperStore.teams[0].fireID);

    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) => GameScreen(
          gameStore: gameStore,
        ),
      ),
    );
//        .whenComplete(_retrieveLeagueData);
  }
}
