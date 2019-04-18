import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';

class LeagueRoute extends StatKeeperRoute {
  final String title;
  final String firestoreID;

  LeagueRoute({
    this.title,
    this.firestoreID,
  }) : assert(firestoreID != null);

  @override
  _LeagueRouteState createState() => _LeagueRouteState();
}

class _LeagueRouteState extends State<LeagueRoute> {
  @override
  Widget build(BuildContext context) {
    return Text("League ${widget.title}");
  }
}
