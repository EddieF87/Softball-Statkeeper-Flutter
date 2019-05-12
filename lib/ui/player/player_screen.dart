import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stats_page.dart';

class PlayerScreen extends StatelessWidget {
  final String title;
  final String firestoreID;

  PlayerScreen({
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  Widget build(BuildContext context) {
    debugPrint("_PlayerScreenState");
    PlayerStore playerStore = Provider.of<PlayerStore>(context);

    return FutureBuilder<Player>(
      future: playerStore.getPlayerFromDB(firestoreID, firestoreID),
      builder: (BuildContext context, AsyncSnapshot<Player> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return PlayerStatsPage(
              player: playerStore.player,
            );
          } else {
            return Center(
              child: Text("Couldn't find player!"),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
