import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/ui/statkeeper_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_stats_page.dart';

class TeamScreen extends StatKeeperScreen {
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
