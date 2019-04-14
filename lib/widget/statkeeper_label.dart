import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:sleekstats_flutter_statkeeper/route/league_route.dart';
import 'package:sleekstats_flutter_statkeeper/route/player_route.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/route/team_route.dart';

class StatKeeperLabel extends StatelessWidget {
  final StatKeeper statKeeper;

  const StatKeeperLabel({Key key, @required this.statKeeper})
      : assert(statKeeper != null),
        super(key: key);

  IconData _chooseIcon() {
    switch (statKeeper.type) {
      case SKType.PLAYER:
        return Icons.person;
      case SKType.TEAM:
        return Icons.people;
      case SKType.LEAGUE:
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
  StatKeeperRoute _getStatKeeperRouter(StatKeeper sK) {
    switch (sK.type) {
      case SKType.PLAYER:
        return PlayerRoute(
          title: sK.name,
          firestoreID: sK.firestoreID,
        );
        break;
      case SKType.TEAM:
        return TeamRoute(
          title: sK.name,
        );
        break;
      case SKType.LEAGUE:
        return LeagueRoute(
          title: sK.name,
        );
        break;
      default:
        return null;
    }
  }

  /// Navigates to the [PlayerRoute].
  void _navigateToRoute(BuildContext context, StatKeeper sK) {
    StatKeeperRoute statKeeperRoute = _getStatKeeperRouter(sK);
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
                style: Theme.of(context).textTheme.display1,
              ),
              centerTitle: true,
              backgroundColor: Colors.yellow,
            ),
            body: statKeeperRoute);
      },
    ));
  }
}
