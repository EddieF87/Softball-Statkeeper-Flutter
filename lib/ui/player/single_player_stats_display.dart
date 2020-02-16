import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class SinglePlayerStatsDisplay extends StatelessWidget {
  const SinglePlayerStatsDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            statKeeperStore.players[statKeeperStore.currentPlayerIndex].name,
            style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(stat: Player.LABEL_AVG, isBig: true),
                PlayerStatLabel(stat: Player.LABEL_SLG, isBig: true),
                PlayerStatLabel(stat: Player.LABEL_OPS, isBig: true),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(stat: Player.LABEL_HR, isBig: true),
                PlayerStatLabel(stat: Player.LABEL_R, isBig: true),
                PlayerStatLabel(stat: Player.LABEL_RBI, isBig: true),
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(stat: Player.LABEL_AB),
                PlayerStatLabel(stat: Player.LABEL_H),
                PlayerStatLabel(stat: Player.LABEL_1B),
                PlayerStatLabel(stat: Player.LABEL_2B),
                PlayerStatLabel(stat: Player.LABEL_3B),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(stat: Player.LABEL_PA),
                PlayerStatLabel(stat: Player.LABEL_BB),
                PlayerStatLabel(stat: Player.LABEL_HBP),
                PlayerStatLabel(stat: Player.LABEL_OBP),
                PlayerStatLabel(stat: Player.LABEL_OBPROE),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(stat: Player.LABEL_ROE),
                PlayerStatLabel(stat: Player.LABEL_OUT),
                PlayerStatLabel(stat: Player.LABEL_SF),
                PlayerStatLabel(stat: Player.LABEL_K),
                PlayerStatLabel(stat: Player.LABEL_SB),
              ],
            ),
          ),
        ],
      ),
    );
  }

//  Widget PlayerStatLabel(BuildContext context, String stat, {bool isBig = false}) {
//    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);
//
//    return Expanded(
//        flex: 1,
//        child: Observer(
//          builder: (_) => PlayerStatLabel(
//            stat: stat,
//            amount: statKeeperStore.players[playerIndex].getStat(stat),
//            selected: statKeeperStore.playerStatToUpdate == stat,
//            isBig: isBig,
//            onTap: () => statKeeperStore.setPlayerStatToUpdate(stat),
//          ),
//        ),
//      );
//  }
}
