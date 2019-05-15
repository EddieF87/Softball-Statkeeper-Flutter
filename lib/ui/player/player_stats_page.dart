import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/single_player_stats_display.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayerStore playerStore = Provider.of<PlayerStore>(context);

    return Column(
      children: <Widget>[
        SinglePlayerStatsDisplay(
          playerStore: playerStore,
        ),
        PlayerStatControls(
          playerStore: playerStore,
        ),
      ],
    );
  }
}
