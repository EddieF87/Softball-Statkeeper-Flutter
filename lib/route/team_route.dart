import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/group_players_stats_page.dart';
import 'package:sleekstats_flutter_statkeeper/widget/team_ledger.dart';

class TeamRoute extends StatKeeperRoute {
  final String title;
  final String teamFirestoreID;

  TeamRoute({
    Key key,
    this.title,
    this.teamFirestoreID,
  })  : assert(teamFirestoreID != null),
        super(key: key);

  @override
  _TeamRouteState createState() => _TeamRouteState();
}

class _TeamRouteState extends State<TeamRoute> {
  Team team;

  @override
  void initState() {
    super.initState();
    _retrieveTeam(widget.teamFirestoreID);
  }

  _retrieveTeam(String fID) async {
    team = await RepositoryServiceTeams.getTeam(fID);
    setState(() {
      team = team;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildTeamPage(team);
  }

  Widget _buildTeamPage(Team displayedTeam) {
    if (displayedTeam == null) {
      return Center(
        child: Text("Retrieving Team Info"),
      );
    }
    return Column(
      children: <Widget>[
        TeamLedger(
          team: displayedTeam,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: GroupPlayersStatsPage(),
          ),
        )
      ],
    );
  }
}
