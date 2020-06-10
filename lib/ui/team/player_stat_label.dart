import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class PlayerStatLabel extends StatelessWidget {
  final int playerIndex;
  final String stat;
  final bool isBig;
  static const Color accentColorFaded = Color(0x55eabd53);

  PlayerStatLabel({
    this.playerIndex = 0,
    this.stat,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);
    Color primaryColor = Theme.of(context).primaryColor;

    return Expanded(
      flex: 1,
      child: Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: PlayerUtils.CHANGEABLE_LABELS.contains(stat)
                ? Border.all(
                    width:
                        stat == statKeeperStore.playerStatToUpdate ? 4.0 : 1.0,
                    color: stat == statKeeperStore.playerStatToUpdate
                        ? primaryColor
                        : accentColorFaded,
                  )
                : null,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: () => {
              PlayerUtils.CHANGEABLE_LABELS.contains(stat)
                  ? statKeeperStore.setPlayerStatToUpdate(stat)
                  : null
            },
            customBorder: CircleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  stat ?? "- - -",
                  style: TextStyle(
                    fontSize: isBig ? 18 : 12,
                  ),
                ),
                Text(
                  StatFormatter.displayAmount(
                    PlayerUtils.getStat(
                      statKeeperStore.players[this.playerIndex],
                      stat,
                    ),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isBig ? 24 : 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
