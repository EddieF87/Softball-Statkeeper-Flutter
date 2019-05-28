import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/league_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/team_screen.dart';

import 'model/statkeeper.dart';

class LoadingScreen extends StatefulWidget {
  final StatKeeper statKeeper;

  const LoadingScreen({Key key, this.statKeeper})
      : assert(statKeeper != null),
        super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _navigateToRoute(context, widget.statKeeper),
      builder: (BuildContext context, AsyncSnapshot snapshot) =>
          Center(child: CircularProgressIndicator()),
    );
  }

  /// Navigates to the [statKeeperScreen].
  Future _navigateToRoute(BuildContext context, StatKeeper sK) async {
    Widget statKeeperScreen = await _updateStatKeeper(context, sK);
    if (statKeeperScreen == null) {
      return;
    }

    Navigator.of(context).pushReplacement(
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
            body: statKeeperScreen,
          );
        },
      ),
    );
  }

  Future sleep(){
    return new Future.delayed(const Duration(seconds: 8), () => "delayeddelayed");
  }

  /// Get statKeeperScreen based on chosen statKeeper type
  Future<Widget> _updateStatKeeper(BuildContext context, StatKeeper sK) async {

    String fireID = sK.fireID;
    String name = sK.name;

    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);
    statKeeperStore.clearStatKeeper();
    statKeeperStore.statkeeperFireID = fireID;
    await statKeeperStore.populateStatKeeper(fireID);

    switch (sK.type) {
      case StatKeeper.TYPE_PLAYER:
        return PlayerScreen(
          title: name,
          fireID: fireID,
        );
        break;
      case StatKeeper.TYPE_TEAM:
        return TeamScreen(
          title: name,
          fireID: fireID,
        );
        break;
      case StatKeeper.TYPE_LEAGUE:
        return LeagueScreen(
          title: name,
          leagueFireID: fireID,
        );
        break;
      default:
        return null;
    }
  }
}
