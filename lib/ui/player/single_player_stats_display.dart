import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class SinglePlayerStatsDisplay extends StatelessWidget {
  final StatKeeperStore statKeeperStore;
  final int playerIndex;

  const SinglePlayerStatsDisplay({Key key, this.statKeeperStore, this.playerIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Expanded(
            child: Column(children: <Widget>[
              Text(
                statKeeperStore.players[playerIndex].name,
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
    Map<String, num> statsMap = statKeeperStore.players[playerIndex].toStatsMap();
    List<PlayerStatLabel> list = [];
    statsMap.forEach((stat, value) {
      list.add(PlayerStatLabel(
        stat: stat,
        amount: value,
        onTap: () => statKeeperStore.setPlayerStatToUpdate(stat),
      ));
    });
    return list;
  }
}
