import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/team_stats_page.dart';

class TeamRoute extends StatKeeperRoute {
  final String title;
  final String firestoreID;

  TeamRoute({
    Key key,
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _TeamRouteState createState() => _TeamRouteState();
}

class _TeamRouteState extends State<TeamRoute> {

  Future<Team> _retrieveTeam(String fID) async {
    return await RepositoryServiceTeams.getTeam(fID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _retrieveTeam(widget.firestoreID),
      builder: (BuildContext context, AsyncSnapshot<Team> snapshot) {
        if (snapshot.hasData) {
          return TeamStatsPage(
            team: snapshot.data,
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
