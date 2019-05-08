import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_statkeepers.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/ui/home/statkeeper_creator_dialog.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/league_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/statkeeper_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
//        color: Theme.of(context).primaryColorLight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              color: Theme.of(context).primaryColorDark,
              child: Text(
                "My StatKeepers",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: _buildStatKeeperWidgets(),
//              ),
              ),
            ),
          ],
        ),
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

    setState(() {
      sKList.add(sK);
    });
  }

  ///Callback received from CreateStatKeeperDialog with info of new StatKeeper
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

class StatKeeperLabel extends StatelessWidget {
  final StatKeeper statKeeper;

  const StatKeeperLabel({Key key, @required this.statKeeper})
      : assert(statKeeper != null),
        super(key: key);

  IconData _chooseIcon() {
    switch (statKeeper.type) {
      case StatKeeper.TYPE_PLAYER:
        return Icons.person;
      case StatKeeper.TYPE_TEAM:
        return Icons.people;
      case StatKeeper.TYPE_LEAGUE:
        return Icons.public;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            color: Theme.of(context).primaryColorDark,
            width: 2.0,
          ),
        ),
        elevation: 4.0,
        child: InkWell(
          onTap: () => _navigateToRoute(context, statKeeper),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    _chooseIcon(),
                    size: 48.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                Flexible(
                  child: Text(
                    statKeeper.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Gets StatKeeperRoute based on chosen statKeeper type
  StatKeeperScreen _getStatKeeperRouter(StatKeeper sK) {
    switch (sK.type) {
      case StatKeeper.TYPE_PLAYER:
        return PlayerScreen(
          title: sK.name,
          firestoreID: sK.firestoreID,
        );
        break;
      case StatKeeper.TYPE_TEAM:
        return TeamScreen(
          title: sK.name,
          firestoreID: sK.firestoreID,
        );
        break;
      case StatKeeper.TYPE_LEAGUE:
        return LeagueScreen(
          title: sK.name,
          firestoreID: sK.firestoreID,
        );
        break;
      default:
        return null;
    }
  }

  /// Navigates to the [StatkeeperRoute].
  void _navigateToRoute(BuildContext context, StatKeeper sK) {
    StatKeeperScreen statKeeperRoute = _getStatKeeperRouter(sK);
    if (statKeeperRoute == null) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor:
                sK.type == StatKeeper.TYPE_PLAYER ? Colors.white : null,
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                sK.name,
                style: TextStyle(fontSize: 36),
              ),
              centerTitle: true,
            ),
            body: statKeeperRoute,
          );
        },
      ),
    );
  }
}
