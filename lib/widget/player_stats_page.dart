import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_stats.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_label.dart';

class PlayerStatsPage extends StatefulWidget {
  final ValueChanged onTap;
  final PlayerStats playerStats;

  const PlayerStatsPage({Key key, this.onTap, this.playerStats})
      : super(key: key);

  @override
  _PlayerStatsPageState createState() => _PlayerStatsPageState();
}

class _PlayerStatsPageState extends State<PlayerStatsPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD PlayerStatsPage");
    return Expanded(
      child: GridView.count(
        crossAxisCount: 6,
        children: _buildGrid(),
      ),
    );
  }

  List<PlayerStatLabel> _buildGrid() {
    Map<String, num> statsMap = widget.playerStats.toStatsMap();
    statsMap.forEach((k, v) => debugPrint("mapping $k , $v"));
    List<PlayerStatLabel> list = [];
    statsMap.forEach((k, v) {
      list.add(PlayerStatLabel(
          stat: k,
          amount: v,
          onTap: () => widget.onTap(k),
        ));
    });
    return list;
  }
}
