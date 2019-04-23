import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/league_standings_page.dart';
import 'package:sleekstats_flutter_statkeeper/widget/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/widget/team_controls.dart';

class LeagueRoute extends StatKeeperRoute {
  final String title;
  final String firestoreID;

  LeagueRoute({
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _LeagueRouteState createState() => _LeagueRouteState();
}

class _LeagueRouteState extends State<LeagueRoute> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: PageController(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: LeagueStandingsPage(
                    teams: _createDummyTeams(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PlayersStatsTable(
                    statkeeperFirestoreID: widget.firestoreID,
                  ),
                ),
              ],
            ),
          ),
          TeamControls(
            onAddButtonTapped: () => _showAddTeamsDialog(),
            onScoresButtonTapped: () => _showScores(),
          ),
        ],
      ),
    );
  }

  _showAddTeamsDialog() {}

  _showScores() {}

  List<Team> _createDummyTeams() {
    List<Team> teams = [];
    teams.add(Team(
        name: "CUJNECJUSKM",
        firestoreID: "CIEccrji",
        wins: 34,
        losses: 21,
        ties: 4,
        runsAllowed: 44,
        runsScored: 22));
    teams.add(Team(
        name: "bnrt",
        firestoreID: "vesbrntu",
        wins: 34,
        losses: 20,
        ties: 4,
        runsAllowed: 132,
        runsScored: 88));
    teams.add(Team(
        name: "twnmtr6i",
        firestoreID: "wbv",
        wins: 1,
        losses: 3,
        ties: 1,
        runsAllowed: 12,
        runsScored: 31));
    teams.add(Team(name: "vdgfmujyrh", firestoreID: "vweeynbg"));
    return teams;
  }
}
