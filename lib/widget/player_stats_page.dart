import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_stats.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_label.dart';

class PlayerStatsPage extends StatefulWidget {
  final ValueChanged onTap;

  const PlayerStatsPage({Key key, this.onTap}) : super(key: key);

  @override
  _PlayerStatsPageState createState() => _PlayerStatsPageState();
}

class _PlayerStatsPageState extends State<PlayerStatsPage> {

  PlayerStats _playerStats = PlayerStats(
      id: 889333315,
      firestoreID: "firestoreID",
      name: "MAGIC JOGBSON",
      rbi: 99,
      runs: 70,
  hrs: 7,
  walks: 6, rOE: 2, outs: 3);

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD PlayerStatsPage");
    return _buildPage();
  }

  Widget _buildPage() {
    if (_playerStats == null) {
      return Text("NULLLLLL");
    } else {
      return
        Expanded(child: GridView.count(
          crossAxisCount: 6,
          children: _buildGrid(),
        ),
        );
    }
  }

  List<PlayerStatLabel> _buildGrid() {
    Map<String, num> statsMap = _playerStats.toStatsMap();
    statsMap.forEach((k, v) => debugPrint("mapping $k , $v"));
    List<PlayerStatLabel> list = [];
    statsMap.forEach((k, v) =>
        list.add(PlayerStatLabel(
          stat: k,
          amount: v,
          onTap: () => widget.onTap(k),
        )));
    return list;
  }
}