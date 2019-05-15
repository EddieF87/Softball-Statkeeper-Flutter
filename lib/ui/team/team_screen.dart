import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/store/team_store.dart';
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
    TeamStore teamStore = Provider.of<TeamStore>(context);

    return FutureBuilder(
      future: teamStore.getTeamFromDB(fireID, fireID),
      builder: (BuildContext context, AsyncSnapshot<Team> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Center(child: Text("Can't find team!"));
          }
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
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: Couldn't find Team!"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class TeamTabView extends StatelessWidget {
  final TeamStore teamStore;

  const TeamTabView(this.teamStore);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          children: <Widget>[
            TeamStatsPage(
              teamStore: teamStore,
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
