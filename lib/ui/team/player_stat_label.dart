import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class PlayerStatLabel extends StatelessWidget {
  final dynamic statValue;
  final String statName;
  final bool isBig;
  static const Color accentColorFaded = Color(0x55eabd53);

  PlayerStatLabel({
    this.statValue = 0,
    this.statName,
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
            border: PlayerUtils.CHANGEABLE_LABELS.contains(statName)
                ? Border.all(
                    width:
                        statName == statKeeperStore.playerStatToUpdate ? 4.0 : 1.0,
                    color: statName == statKeeperStore.playerStatToUpdate
                        ? primaryColor
                        : accentColorFaded,
                  )
                : null,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: () => {
              PlayerUtils.CHANGEABLE_LABELS.contains(statName)
                  ? statKeeperStore.setPlayerStatToUpdate(statName)
                  : null
            },
            customBorder: CircleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  statName ?? "- - -",
                  style: TextStyle(
                    fontSize: isBig ? 18 : 12,
                  ),
                ),
                Text(
                  StatFormatter.displayAmount(
                      amount: statValue,
                      statName: statName,
//                    PlayerUtils.getStat(
//                      statKeeperStore.players[this.statValue],
//                      statName,
//                    ),
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
