import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class SinglePlayerStatsDisplay extends StatelessWidget {
  final PlayerStore playerStore;

  const SinglePlayerStatsDisplay({Key key, this.playerStore})
      : assert(playerStore != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Expanded(
            child: Column(children: <Widget>[
              Text(
                playerStore.player.name,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 6,
                  children: _buildGrid(),
                ),
              ),
            ]),
          ),
    );
  }

  List<PlayerStatLabel> _buildGrid() {
    Map<String, num> statsMap = playerStore.player.toStatsMap();
    List<PlayerStatLabel> list = [];
    statsMap.forEach((stat, value) {
      list.add(PlayerStatLabel(
        stat: stat,
        amount: value,
        onTap: () => playerStore.setStatToUpdate(stat),
      ));
    });
    return list;
  }
}
