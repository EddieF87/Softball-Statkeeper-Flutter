import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_stats_page.dart';

class TeamScreen extends StatefulWidget {
  final String title;
  final String firestoreID;

  TeamScreen({
    Key key,
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  Team team;

  Future<Team> _retrieveTeam(String fID) async {
    List<Player> players = await RepositoryServicePlayers.getAllPlayersFromTeam(widget.firestoreID, widget.firestoreID);
    Team retrievedTeam = await RepositoryServiceTeams.getTeam(fID);
    retrievedTeam.players.addAll(players);
    return retrievedTeam;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _retrieveTeam(widget.firestoreID),
      builder: (BuildContext context, AsyncSnapshot<Team> snapshot) {
        if (snapshot.hasData) {
          team = snapshot.data;
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(
                      children: <Widget>[
                        TeamStatsPage(
                          team: team,
                        ),
                        Center(
                          child: Text(
                            "GamePage",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
