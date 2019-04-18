import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/group_players_stats_page.dart';

class TeamRoute extends StatKeeperRoute {
  TeamRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TeamRouteState createState() => _TeamRouteState();
}

class _TeamRouteState extends State<TeamRoute> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: <Widget>[
        Text("Team ${widget.title}"),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: GroupPlayersStatsPage(),
          ),
        )
      ],
    );
  }
}
