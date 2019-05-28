import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stats_page.dart';

class PlayerScreen extends StatelessWidget {
  final String title;
  final String fireID;

  PlayerScreen({
    this.title,
    this.fireID,
  }) : assert(fireID != null);

  @override
  Widget build(BuildContext context) {
    return PlayerPage();
  }
}
