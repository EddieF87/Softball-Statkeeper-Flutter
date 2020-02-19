import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class SinglePlayerStatsDisplay extends StatelessWidget {
  final int playerIndex;

  const SinglePlayerStatsDisplay({Key key, this.playerIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            statKeeperStore.players[this.playerIndex].name,
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
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_AVG, isBig: true),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_SLG, isBig: true),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_OPS, isBig: true),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_HR, isBig: true),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_R, isBig: true),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_RBI, isBig: true),
              ],
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_1B),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_2B),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_3B),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_BB),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_HBP),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_PA),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_AB),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_H),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_OBP),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_OBPROE),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_ROE),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_OUT),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_SF),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_K),
                PlayerStatLabel(playerIndex: this.playerIndex, stat: Player.LABEL_SB),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
