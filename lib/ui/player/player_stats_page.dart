import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/single_player_stats_display.dart';

class PlayerPage extends StatelessWidget {
  final int playerIndex;
  final String firestoreID;

  const PlayerPage({
    Key key,
    this.playerIndex = 0,
    this.firestoreID
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);
    debugPrint("PLAYERPAGE   playerIndex $playerIndex   ${statKeeperStore.players[playerIndex].name}");

    return Column(
      children: <Widget>[
        SinglePlayerStatsDisplay(firestoreID: firestoreID),
        PlayerStatControls(firestoreID: firestoreID),
      ],
    );
  }
}
