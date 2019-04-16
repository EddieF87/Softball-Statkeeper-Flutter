import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_statkeepers.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/widget/statkeeper_creator_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/widget/statkeeper_label.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  List<StatKeeper> sKList = [];

  @override
  void initState() {
    super.initState();
    _getAllStatKeepers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: _buildStatKeeperWidgets(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateSKDialog,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildStatKeeperWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => StatKeeperLabel(
            statKeeper: sKList[index],
          ),
      itemCount: sKList.length,
    );
  }

  ///Query statkeepers from repository
  _getAllStatKeepers() async {
    sKList = await RepositoryServiceStatKeepers.getAllStatKeepers();
    setState(() {
      sKList = sKList;
    });
  }

  ///Insert newly created statkeeper into repository
  _insertNewStatKeeper(StatKeeper sK) async {
    await RepositoryServiceStatKeepers.insertStatKeeper(sK);
    switch (sK.type) {
      case StatKeeper.TYPE_PLAYER:
        await _insertNewPlayer(sK);
        break;
      case StatKeeper.TYPE_TEAM:
        await _insertNewTeam(sK);
        break;
      case StatKeeper.TYPE_LEAGUE:
        break;
      default:
        return;
    }
    setState(() {
      sKList.add(sK);
    });
  }

  ///Insert newly created player into repository based off newly created SK
  _insertNewPlayer(StatKeeper sK) async {
    await RepositoryServicePlayers.insertPlayer(
      Player(
        name: sK.name,
        firestoreID: sK.firestoreID,
      ),
    );
  }

  ///Insert newly created team into repository based off newly created SK
  _insertNewTeam(StatKeeper sK) async {
    await RepositoryServiceTeams.insertTeam(
      Team(
        name: sK.name,
        firestoreID: sK.firestoreID,
      ),
    );
  }

  ///Callback received from CreateStatKeeperDialog with info of new StatKeeper
  ///(in future will insert all SK's into db as well)
  _onNewSKCreated(StatKeeper sK) {
    _insertNewStatKeeper(sK);
  }

  Future<void> _showCreateSKDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatKeeperCreatorDialog(
          onSKCreated: (StatKeeper sK) => _onNewSKCreated(sK),
        );
      },
    );
  }
}