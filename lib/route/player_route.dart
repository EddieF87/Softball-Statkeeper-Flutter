import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stats_page.dart';

class PlayerRoute extends StatKeeperRoute {
  final String title;
  final String firestoreID;

  PlayerRoute({
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _PlayerRouteState createState() => _PlayerRouteState();
}

class _PlayerRouteState extends State<PlayerRoute> {

  Future<Player> _retrievePlayer(String fID) async {
    return await RepositoryServicePlayers.getPlayer(fID);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _retrievePlayer(widget.firestoreID),
      builder: (BuildContext context, AsyncSnapshot<Player> snapshot) {
        if (snapshot.hasData) {
          return PlayerStatsPage(
            player: snapshot.data,
          );

        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: Couldn't find player!"),
          );

        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
