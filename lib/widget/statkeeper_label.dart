import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/route/league_screen.dart';
import 'package:sleekstats_flutter_statkeeper/route/player_screen.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_screen.dart';
import 'package:sleekstats_flutter_statkeeper/route/team_screen.dart';

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
        return Icons.cake;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: InkWell(
        onTap: () => _navigateToRoute(context, statKeeper),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: Icon(
                  _chooseIcon(),
                  size: 48.0,
                ),
                padding: EdgeInsets.only(right: 32.0),
              ),
              Text(
                statKeeper.name,
//            textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0),
              ),
            ],
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

    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                sK.name,
                style: TextStyle(fontSize: 36),
              ),
              centerTitle: true,
            ),
            body: statKeeperRoute);
      },
    ));
  }
}
