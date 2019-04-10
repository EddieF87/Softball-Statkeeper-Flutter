import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';

class TeamRoute extends StatKeeperRoute {
  TeamRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TeamRouteState createState() => _TeamRouteState();
}

class _TeamRouteState extends State<TeamRoute> {

  @override
  Widget build(BuildContext context) {
    return Text("Team ${widget.title}");
  }
}