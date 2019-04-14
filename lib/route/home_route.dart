import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
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
    _getAllPlayers();
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

  ///Query players from repository and change into SK's to add to SK list
  ///(in future will query all SK's directly)
  _getAllPlayers() async {
    List<Player> players = await RepositoryServicePlayers.getAllPlayers();
    for (Player player in players) {
      sKList.add(StatKeeper(
          id: player.firestoreID, name: player.name, type: SKType.PLAYER));
    }
    setState(() {
      sKList = sKList;
    });
  }

  ///Insert newly created player into repository based off newly created SK
  ///(in future will insert all SK's into db as well)
  _insertNewPlayer(StatKeeper sK) async {
    await RepositoryServicePlayers.insertPlayer(
      Player(
        name: sK.name,
        firestoreID: sK.id,
      ),
    );
    setState(() {
      sKList.add(sK);
    });
  }

  ///Callback received from CreateStatKeeperDialog with info of new StatKeeper
  ///(in future will insert all SK's into db as well)
  _onNewSKCreated(StatKeeper sK) {
    if (sK.type == SKType.PLAYER) {
      _insertNewPlayer(sK);
    }
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
