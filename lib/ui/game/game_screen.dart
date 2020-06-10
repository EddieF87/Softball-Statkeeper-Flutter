import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/game_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/diamond.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/scoreboard.dart';

class GameScreen extends StatelessWidget {
  final GameStore gameStore;

  const GameScreen({Key key, this.gameStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: ScoreBoard(
                gameStore: gameStore,
                awayTeamName: "AWA",
                homeTeamName: "HOM",
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child:
                Diamond(gameStore: gameStore, baseStore: gameStore.baseStore),
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
                          return (gameStore.playResult == PlayerUtils.LABEL_SB ||
                                  (gameStore.playResult != null &&
                                      gameStore.baseStore.bases[0] == null))
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
    PlayerUtils.LABEL_1B,
    PlayerUtils.LABEL_2B,
    PlayerUtils.LABEL_3B,
    PlayerUtils.LABEL_HR,
    PlayerUtils.LABEL_BB,
    PlayerUtils.LABEL_K,
  ];
  static const List<String> row2 = [
    PlayerUtils.LABEL_OUT,
    PlayerUtils.LABEL_SF,
    "Sac Bunt",
    PlayerUtils.LABEL_ROE,
    PlayerUtils.LABEL_SB,
    PlayerUtils.LABEL_HBP,
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
