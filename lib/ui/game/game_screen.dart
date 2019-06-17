import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/diamond.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/scoreboard.dart';

class GameScreen extends StatelessWidget {
  final GameStore gameStore;

  const GameScreen({Key key, this.gameStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    Observer(builder: (_) {
//      if (gameStore.batter == null) {
//        return Text("F");
//      }
//    });
    Color accentColor = Theme.of(context).accentColor;
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          "GAME",
          style: TextStyle(fontSize: 36),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              color: Colors.white,
              child: Observer(
                builder: (_) {
                  return ScoreBoard(
                    awayTeamName: "AWA",
                    homeTeamName: "HOM",
                    awayTeamRuns: 4,
                    homeTeamRuns: 2,
                    inning: 1,
                    outs: 0,
                    batterName: gameStore.batter?.name ?? "",
                    rbi: gameStore.batter?.rbi ?? 0,
                    runs: gameStore.batter?.runs ?? 0,
                    hr: gameStore.batter?.hrs ?? 0,
                    avg: gameStore.batter?.getAVG() ?? 0.0,
                  );
                },
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Observer(
              builder: (_) =>
                  Diamond(gameStore: gameStore, baseStore: gameStore.baseStore),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            onPressed: gameStore.onReset,
                            child: Text("RESET"),
                            color: accentColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Observer(builder: (_) {
                          return (gameStore.playResult != null &&
                                  gameStore.baseStore.bases[0] == null)
                              ? FlatButton(
                                  onPressed: gameStore.onSubmitPlay,
                                  child: Text("Submit Play"),
                                  color: accentColor,
                                )
                              : Container();
                        }),
                      ),
                    ],
                  ),
                  _resultButtons(row1, accentColor),
                  _resultButtons(row2, accentColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const List<String> row1 = [
    Player.LABEL_1B,
    Player.LABEL_2B,
    Player.LABEL_3B,
    Player.LABEL_HR,
    Player.LABEL_BB,
    Player.LABEL_K,
  ];
  static const List<String> row2 = [
    Player.LABEL_OUT,
    Player.LABEL_SF,
    "Sac Bunt",
    Player.LABEL_ROE,
    Player.LABEL_SB,
    Player.LABEL_HBP,
  ];

  Row _resultButtons(List<String> row, Color accentColor) {
    List<Widget> buttons = new List();
    row.forEach(
      (label) => buttons.add(
            Expanded(
              child: Observer(
                builder: (_) => MaterialButton(
                      shape: Border.all(color: accentColor),
                      padding: EdgeInsets.all(0),
                      onPressed: () => gameStore.setPlayResult(label),
                      child: Text(label),
                      color: label == gameStore.playResult
                          ? accentColor
                          : Colors.white,
                      highlightColor: accentColor,
                      minWidth: 8.0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
              ),
            ),
          ),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buttons,
    );
  }
}
