import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/game_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/add_teams_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/teams_pageview.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/league_standings_page.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/add_players_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/players_stats_table.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_controls.dart';

class LeagueScreen extends StatelessWidget {
  final String leagueFireID;
  final String title;

  const LeagueScreen({Key key, this.leagueFireID, this.title})
      : super(key: key);

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
                  LeagueStandingsPage(),
                  Padding(
                    padding: EdgeInsets.only(right: 32.0, left: 32.0),
                    child: PlayersStatsTable(
                      isLeague: true,
                      onTeamLinkClicked: (String teamFireID) =>
                          _navigateToTeamsPageViewByID(
                        context,
                        teamFireID,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Center(
                      child: RaisedButton(
                        onPressed: () => _goToGame(context),
                        child: Text("Start Game"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TeamControls(
              onAddButtonTapped: () => _showAddChoiceDialog(context),
              onScoresButtonTapped: () => _showScores(),
            ),
          ),
        ],
      ),
    );
  }

  _showAddChoiceDialog(BuildContext context) {
    //todo
    StatKeeperStore statKeeperStore =
        Provider.of<StatKeeperStore>(context, listen: false);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AddChoiceDialog(
          teams: statKeeperStore.teams,

          onAddPlayersChoice: (Team team) {
            int teamIndex = statKeeperStore.teams.indexOf(team);

            return _showAddPlayersDialog(
              context: context,
              teamIndex: teamIndex,
            );
          },

          onAddTeamsChoice: () => _showAddTeamsDialog(
            context: context,
            statkeeperFireID: leagueFireID,
          ),
        );
      },
    );
  }

  Future<void> _showAddTeamsDialog({
    BuildContext context,
    String statkeeperFireID,
  }) async =>
      showDialog<void>(
        context: context,
        builder: (BuildContext context) => AddTeamsDialog(
          sKFireID: statkeeperFireID,
          onNewTeamsSubmitted: () {
//            _retrieveTeams();
          },
        ),
      );

  Future<void> _showAddPlayersDialog({
    BuildContext context,
    int teamIndex,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AddPlayersDialog(teamIndex: teamIndex),
    );
  }

  _showScores() {}

  /// Navigates to the PageView of teams.
  void _navigateToTeamsPageViewByID(BuildContext context, String teamFireID) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    int i =
        statKeeperStore.teams.indexWhere((team) => team.fireID == teamFireID);
    if (i < 0) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) => TeamsPageView(
          startingIndex: i,
        ),
      ),
    );
  }

  _goToGame(BuildContext context) {
    //TODO
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context, listen: false);
    GameStore gameStore = GameStore(
        sKFireID: leagueFireID,
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

class AddChoiceDialog extends StatefulWidget {
  final List<Team> teams;
  final ValueSetter<Team> onAddPlayersChoice;
  final VoidCallback onAddTeamsChoice;

  const AddChoiceDialog({
    Key key,
    this.teams,
    this.onAddPlayersChoice,
    this.onAddTeamsChoice,
  })  : assert(teams != null),
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
              onChanged: (value) => setState(() {
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
                    onChanged: (value) => setState(() {
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
      color: Theme.of(context).accentColor,
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
