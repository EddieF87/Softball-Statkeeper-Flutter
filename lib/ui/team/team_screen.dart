import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
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
    debugPrint("buildTEAMSCREEN");
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
              child: Text(
                "GamePage",
              ),
            )
          ],
        ),
      ),
    );
  }
}
