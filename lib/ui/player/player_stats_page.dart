import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/single_player_stats_display.dart';

class PlayerStatsPage extends StatelessWidget {
  final Player player;

  const PlayerStatsPage({
    Key key,
    this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayerStore playerStore = Provider.of<PlayerStore>(context);

    return Column(
      children: <Widget>[
        Observer(
          builder: (_) {
            return SinglePlayerStatsDisplay(
              playerStore: playerStore,
            );
          },
        ),
        Observer(
          builder: (_) => PlayerStatControls(
                playerStore: playerStore,
              ),
        ),
      ],
    );
  }
}
