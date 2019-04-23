import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class SinglePlayerStatsDisplay extends StatelessWidget {
  final ValueChanged onTap;
  final Player player;

  const SinglePlayerStatsDisplay({Key key, this.onTap, this.player})
      : assert(player != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: <Widget>[
        Text(
          player.name,
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
    );
  }

  List<PlayerStatLabel> _buildGrid() {
    Map<String, num> statsMap = player.toStatsMap();
    List<PlayerStatLabel> list = [];
    statsMap.forEach((k, v) {
      list.add(PlayerStatLabel(
        stat: k,
        amount: v,
        onTap: () => onTap(k),
      ));
    });
    return list;
  }
}