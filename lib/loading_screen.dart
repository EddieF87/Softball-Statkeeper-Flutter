import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/league_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/team_store.dart';
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
  void initState() {
    super.initState();
//    _navigateToRoute(context, widget.statKeeper);
  }

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

    PlayerStore playerStore = Provider.of<PlayerStore>(context);
    TeamStore teamStore = Provider.of<TeamStore>(context);
    LeagueStore leagueStore = Provider.of<LeagueStore>(context);
    playerStore.clearPlayer();
    teamStore.clearTeam();
    leagueStore.clearLeague();

    switch (sK.type) {
      case StatKeeper.TYPE_PLAYER:
        await playerStore.setPlayerFromDB(fireID, fireID);
        return PlayerScreen(
          title: name,
          fireID: fireID,
        );
        break;
      case StatKeeper.TYPE_TEAM:
        await teamStore.getTeamFromDB(fireID, fireID);
        return TeamScreen(
          title: name,
          fireID: fireID,
        );
        break;
      case StatKeeper.TYPE_LEAGUE:
        await leagueStore.populateLeague(fireID);
        return LeagueScreen(
          title: name,
          fireID: fireID,
        );
        break;
      default:
        return null;
    }
  }
}
