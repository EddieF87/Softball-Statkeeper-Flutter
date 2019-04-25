import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/add_teams_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/teams_pageview.dart';
import 'package:sleekstats_flutter_statkeeper/ui/statkeeper_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/league_standings_page.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/add_players_dialog.dart';
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
                      isLeague: true,
                      players: players,
                      onTeamLinkClicked: (String teamFireID) =>
                          _navigateToTeamsPageViewByTeamFireID(
                            context,
                            teamFireID,
                          ),
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
              onAddButtonTapped: () => _showAddChoiceDialog(),
              onScoresButtonTapped: () => _showScores(),
            ),
          ),
        ],
      ),
    );
  }

  _showAddChoiceDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddChoiceDialog(
          teams: teams,
          onAddPlayersChoice: (Team team) =>
              _showAddPlayersDialog(
                teamFirestoreID: team.firestoreID,
                teamName: team.name,
                statkeeperFirestoreID: widget.firestoreID,
              ),
          onAddTeamsChoice: () =>
              _showAddTeamsDialog(statkeeperFirestoreID: widget.firestoreID),
        );
      },
    );
  }

  Future<void> _showAddTeamsDialog({String statkeeperFirestoreID}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddTeamsDialog(
          sKFireID: statkeeperFirestoreID,
          onNewTeamsSubmitted: () {
            _retrieveTeams();
          },
        );
      },
    );
  }

  Future<void> _showAddPlayersDialog({String teamFirestoreID,
    String statkeeperFirestoreID,
    String teamName}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddPlayersDialog(
          teamFireID: teamFirestoreID,
          sKFireID: statkeeperFirestoreID,
          teamName: teamName,
          onNewPlayersSubmitted: () => _retrievePlayers(),
        );
      },
    );
  }

  _showScores() {}

  /// Navigates to the PageView of teams.
  void _navigateToTeamsPageViewByTeamFireID(BuildContext context,
      String teamFireID) {
    if (teams == null) {
      return;
    }
    int index = teams.indexWhere((team) => team.firestoreID == teamFireID);
    if (index < 0) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return TeamsPageView(
            teams: teams,
            startingIndex: index,
          );
        },
      ),
    );
  }
}

class AddChoiceDialog extends StatefulWidget {
  final List<Team> teams;
  final ValueSetter<Team> onAddPlayersChoice;
  final VoidCallback onAddTeamsChoice;

  const AddChoiceDialog({
    Key key,
    this.teams,
    this.onAddPlayersChoice,
    this.onAddTeamsChoice,
  })
      : assert(teams != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => AddChoiceDialogState();
}

enum Choice { PLAYER, TEAM }

class AddChoiceDialogState extends State<AddChoiceDialog> {
  Choice choice = Choice.TEAM;
  bool isPlayersChoice = false;
  List<DropdownMenuItem<Team>> _dropDownMenuItems;
  Team _selectedTeam;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(widget.teams);
    _selectedTeam = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Team>> buildAndGetDropDownMenuItems(List teams) {
    List<DropdownMenuItem<Team>> items = new List();
    for (Team team in teams) {
      items.add(new DropdownMenuItem(value: team, child: new Text(team.name)));
    }
    return items;
  }

  void changedDropDownItem(Team selectedTeam) {
    setState(() {
      _selectedTeam = selectedTeam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create New...'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: RadioListTile<Choice>(
              title: const Text('Teams:'),
              groupValue: choice,
              value: Choice.TEAM,
              onChanged: (value) =>
                  setState(() {
                    choice = value;
                    isPlayersChoice = false;
                  }),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  child: RadioListTile<Choice>(
                    title: const Text('Players:'),
                    groupValue: choice,
                    value: Choice.PLAYER,
                    onChanged: (value) =>
                        setState(() {
                          choice = value;
                          isPlayersChoice = true;
                        }),
                  ),
                ),
                DropdownButton<Team>(
                  value: _selectedTeam,
                  items: _dropDownMenuItems,
                  onChanged: isPlayersChoice ? changedDropDownItem : null,
                  hint: Text("Choose Team"),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        _createDialogButton(context, "Cancel",
            onPressed: () => Navigator.of(context).pop()),
        _createDialogButton(context, "Submit", onPressed: () {
          Navigator.of(context).pop();
          isPlayersChoice
              ? widget.onAddPlayersChoice(_selectedTeam)
              : widget.onAddTeamsChoice();
        }),
      ],
    );
  }

  _createDialogButton(BuildContext context, String text, {Function onPressed}) {
    return FlatButton(
      color: Theme
          .of(context)
          .accentColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
