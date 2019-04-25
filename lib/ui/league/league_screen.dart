import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/add_teams_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/statkeeper_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/league_standings_page.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_controls.dart';

class LeagueScreen extends StatKeeperScreen {
  final String title;
  final String firestoreID;

  LeagueScreen({
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  List<Player> players;
  List<Team> teams;

  _retrievePlayers() async {
    players = await RepositoryServicePlayers.getAllPlayers(widget.firestoreID);
    setState(() => players = players);
  }

  _retrieveTeams() async {
    teams = await RepositoryServiceTeams.getAllTeams(widget.firestoreID);
    setState(() => teams = teams);
  }

  void _retrieveLeagueData() async {
    teams = await RepositoryServiceTeams.getAllTeams(widget.firestoreID);
    players = await RepositoryServicePlayers.getAllPlayers(widget.firestoreID);

    setState(() {
      teams = teams;
      players = players;
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveLeagueData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
//            unselectedLabelColor: Colors.green,
//            labelColor: ,
            tabs: <Widget>[
              Tab(
                text: "Standings",
              ),
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
                  teams != null
                      ? LeagueStandingsPage(teams: teams)
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  Padding(
                    padding: EdgeInsets.only(right: 32.0, left: 32.0),
                    child: players != null
                        ? PlayersStatsTable(
                            players: players,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: players != null
                        ? PlayersStatsTable(
                            players: players,
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TeamControls(
              onAddButtonTapped: () => _showAddTeamsDialog(),
              onScoresButtonTapped: () => _showScores(),
            ),
          ),
        ],
      ),
    );
  }

  _showAddTeamsDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddTeamsDialog(
          sKFireID: widget.firestoreID,
          onNewTeamsSubmitted: () {
            _retrieveLeagueData();
          },
        );
      },
    );
  }

  _showScores() {}
}
