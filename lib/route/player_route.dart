import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stats_page.dart';

class PlayerRoute extends StatKeeperRoute {
  PlayerRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PlayerRouteState createState() => _PlayerRouteState();
}

class _PlayerRouteState extends State<PlayerRoute> {

  @override
  Widget build(BuildContext context) {
    return PlayerStatsPage();
  }

}