import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_screen.dart';
import 'package:sleekstats_flutter_statkeeper/ui/player/player_stats_page.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/stat_cell.dart';

class PlayerStatRow extends StatelessWidget {
  final Player player;
  final bool isColoredRow;

  const PlayerStatRow({
    this.player,
    this.isColoredRow = false,
  }) : assert(player != null);

  @override
  Widget build(BuildContext context) {
    Color primaryColorLight = Theme.of(context).primaryColorLight;

    return Container(
      color: isColoredRow ? primaryColorLight : null,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () => _navigateToRoute(context, player),
            child: StatCell(
              data: player.name,
              width: 100.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          StatCell(data: player.team, width: 70.0),
          StatCell(data: player.games),
          StatCell(data: player.getPA()),
          StatCell(data: player.getAB()),
          StatCell(data: player.getHits()),
          StatCell(data: player.singles),
          StatCell(data: player.doubles),
          StatCell(data: player.triples),
          StatCell(data: player.hrs),
          StatCell(data: player.runs),
          StatCell(data: player.rbi),
          StatCell(data: player.getAVG(), width: 70.0),
          StatCell(data: player.getOBP(), width: 70.0),
          StatCell(data: player.getSLG(), width: 70.0),
          StatCell(data: player.getOPS(), width: 70.0),
          StatCell(data: player.getOBPwithROE(), width: 70.0),
          StatCell(data: player.walks),
          StatCell(data: player.stolenBases),
          StatCell(data: player.outs),
          StatCell(data: player.sacFlies),
          StatCell(data: player.reachedOnErrors),
          StatCell(data: player.strikeOuts),
        ],
      ),
    );
  }

  /// Navigates to the [PlayerScreen].
  void _navigateToRoute(BuildContext context, Player player) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              player.name,
              style: TextStyle(fontSize: 36),
            ),
            centerTitle: true,
          ),
          body: PlayerStatsPage(
            player: player,
          ),
        );
      },
    ));
  }
}
