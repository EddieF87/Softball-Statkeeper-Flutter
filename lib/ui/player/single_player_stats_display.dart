import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/player_stat_label.dart';

class SinglePlayerStatsDisplay extends StatelessWidget {
  final String firestoreID;

  const SinglePlayerStatsDisplay({Key key, this.firestoreID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return Expanded(
      child: StreamBuilder(
        stream: statKeeperStore.watchPlayer(firestoreID),
        builder: (BuildContext context, AsyncSnapshot<Player> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: const Text('Loading...'));
            default:
              var test = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    test?.name ?? "",
                    style:
                        TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_AVG,
                          ),
                          statName: PlayerUtils.LABEL_AVG,
                          isBig: true,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_SLG,
                          ),
                          statName: PlayerUtils.LABEL_SLG,
                          isBig: true,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_OPS,
                          ),
                          statName: PlayerUtils.LABEL_OPS,
                          isBig: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_HR,
                          ),
                          statName: PlayerUtils.LABEL_HR,
                          isBig: true,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_R,
                          ),
                          statName: PlayerUtils.LABEL_R,
                          isBig: true,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_RBI,
                          ),
                          statName: PlayerUtils.LABEL_RBI,
                          isBig: true,
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_1B,
                          ),
                          statName: PlayerUtils.LABEL_1B,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_2B,
                          ),
                          statName: PlayerUtils.LABEL_2B,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_3B,
                          ),
                          statName: PlayerUtils.LABEL_3B,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_BB,
                          ),
                          statName: PlayerUtils.LABEL_BB,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_HBP,
                          ),
                          statName: PlayerUtils.LABEL_HBP,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_PA,
                          ),
                          statName: PlayerUtils.LABEL_PA,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_AB,
                          ),
                          statName: PlayerUtils.LABEL_AB,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_H,
                          ),
                          statName: PlayerUtils.LABEL_H,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_OBP,
                          ),
                          statName: PlayerUtils.LABEL_OBP,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_OBPROE,
                          ),
                          statName: PlayerUtils.LABEL_OBPROE,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_ROE,
                          ),
                          statName: PlayerUtils.LABEL_ROE,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_OUT,
                          ),
                          statName: PlayerUtils.LABEL_OUT,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_SF,
                          ),
                          statName: PlayerUtils.LABEL_SF,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_K,
                          ),
                          statName: PlayerUtils.LABEL_K,
                        ),
                        PlayerStatLabel(
                          statValue: PlayerUtils.getStat(
                            test,
                            PlayerUtils.LABEL_SB,
                          ),
                          statName: PlayerUtils.LABEL_SB,
                        ),
                      ],
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
