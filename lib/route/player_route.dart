import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_label.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stats_page.dart';

class PlayerRoute extends StatKeeperRoute {
  PlayerRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PlayerRouteState createState() => _PlayerRouteState();
}

class _PlayerRouteState extends State<PlayerRoute> {
  PlayerStatLabel label = PlayerStatLabel(stat: "Test", amount: 0,);
  String statToUpdate;


  @override
  void initState() {
    super.initState();
    statToUpdate = "---";
  }

  chooseStatToUpdate(String newStatToUpdate) {
    if(statToUpdate != newStatToUpdate) {
      setState(() => statToUpdate = newStatToUpdate);
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD PlayerRoute");
    return Column(children: <Widget>[
      PlayerStatsPage(onTap: (newStatToUpdate) => chooseStatToUpdate(newStatToUpdate),),
      PlayerStatControls(stat: statToUpdate,),
    ]);
  }
}
