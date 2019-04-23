import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/ui/statkeeper_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stats_page.dart';

class PlayerScreen extends StatKeeperScreen {
  final String title;
  final String firestoreID;

  PlayerScreen({
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

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
