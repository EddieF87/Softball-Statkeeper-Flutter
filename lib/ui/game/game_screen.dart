import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_plays.dart';
import 'package:sleekstats_flutter_statkeeper/model/play.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/diamond.dart';
import 'package:sleekstats_flutter_statkeeper/ui/game/scoreboard.dart';

class GameScreen extends StatefulWidget {
  final String statkeeperFirestoreID;
  final String awayTeamFirestoreID;
  final String homeTeamFirestoreID;

  const GameScreen(
      {Key key,
      this.statkeeperFirestoreID,
      this.awayTeamFirestoreID,
      this.homeTeamFirestoreID})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  bool reset = false;
  String batterID;
  Player batter;
  String playResult;
  List<Player> basesOccupied = [null, null, null, null, null];
  List<Player> prevBasesOccupied = [null, null, null, null, null];
  final runsScored = [];
  final lineup = [];
  int awayTeamRuns;
  int homeTeamRuns;
  bool inningChanged;
  int innings;
  int outs;
  bool inningRuns;
  int lineupNumber = 0;
  Color accentColor;

  @override
  void initState() {
    super.initState();
    _retrieveLineup();
  }

  void _retrieveLineup() async {
    debugPrint("_retrieveLineup");
    List<Player> playerList = await RepositoryServicePlayers.getAllPlayers(
        widget.statkeeperFirestoreID);
    debugPrint("playerList ${playerList.length}");
    playerList.forEach((p) => lineup.add(p.firestoreID));
    if (lineup == null || lineup.isEmpty) {
      debugPrint("lineup == null");
      return;
    }
    _retrieveBatter();
  }

  void _retrieveBatter() async {
    batterID = lineup[lineupNumber];
    debugPrint("_retrieveBatter  $batterID   $lineupNumber");
    batter = await RepositoryServicePlayers.getPlayer(batterID);
    debugPrint("_retrieveBatter retrieved");
    setState(() {
      batter = batter;
      basesOccupied[0] = batter;
      prevBasesOccupied[0] = basesOccupied[0];
    });
    debugPrint("_retrieveBatter batterName =  ${batter.name}");
  }

  void _retrievePlay() async {
    Play play =
        await RepositoryServicePlays.getPlay(widget.statkeeperFirestoreID, 0);
    debugPrint("_retrievePlay");
    setState(() {
      batterID = play.batter;
      basesOccupied = play.bases;
      awayTeamRuns = play.awayTeamRuns;
      homeTeamRuns = play.homeTeamRuns;
      innings = play.innings;
      inningRuns = play.inningRuns;
      inningChanged = play.inningChanged;
    });
    debugPrint("grgtg  ${batter.name}");
  }

  @override
  Widget build(BuildContext context) {
    if (batter == null) {
      return Text("F");
    }
    accentColor = Theme.of(context).accentColor;
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
                awayTeamName: "AWA",
                homeTeamName: "HOM",
                awayTeamRuns: 4,
                homeTeamRuns: 2,
                inning: 1,
                outs: 0,
                batterName: batter.name,
                rbi: batter.rbi,
                runs: batter.runs,
                hr: batter.hrs,
                avg: batter.getAVG(),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Diamond(
              bases: basesOccupied,
              onRunScored: (Player p) => addRunAndRBI(p),
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
                            onPressed: onReset,
                            child: Text("RESET"),
                            color: accentColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: playResult != null
                            ? FlatButton(
                                onPressed: onSubmitPlay,
                                child: Text("Submit Play"),
                                color: accentColor,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  _resultButtons(row1),
                  _resultButtons(row2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<String> row1 = [
    Player.LABEL_1B,
    Player.LABEL_2B,
    Player.LABEL_3B,
    Player.LABEL_HR,
    Player.LABEL_BB,
    Player.LABEL_K,
  ];
  final List<String> row2 = [
    Player.LABEL_OUT,
    Player.LABEL_SF,
    "Sac Bunt",
    Player.LABEL_ROE,
    Player.LABEL_SB,
    Player.LABEL_HBP,
  ];

  Row _resultButtons(List<String> row) {
    List<Widget> buttons = new List();
    row.forEach((label) => buttons.add(
          Expanded(
            child: MaterialButton(
              shape: Border.all(color: accentColor),
              padding: EdgeInsets.all(0),
              onPressed: () => setState(() => playResult = label),
              child: Text(label),
              color: label == playResult ? accentColor : Colors.white,
              highlightColor: accentColor,
              minWidth: 8.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buttons,
    );
  }

  void _onResultEntered(String result) {
    switch (result) {
      case Player.LABEL_1B:
        batter.singles++;
        break;
      case Player.LABEL_2B:
        batter.doubles++;
        break;
      case Player.LABEL_3B:
        batter.triples++;
        break;
      case Player.LABEL_HR:
        batter.hrs++;
        break;
      case Player.LABEL_ROE:
        batter.reachedOnErrors++;
        break;
      case Player.LABEL_BB:
        batter.walks++;
        break;
      case Player.LABEL_K:
        batter.strikeOuts++;
        break;
      case Player.LABEL_OUT:
        batter.outs++;
        break;
      case Player.LABEL_HBP:
        batter.hbp++;
        break;
      case Player.LABEL_SF:
        batter.sacFlies++;
        break;
    }
  }

  void onBack() {
    decreaseLineup();
  }

  void onForward() {
    advanceLineup();
  }

  void onReset() {
    setState(() {
      _log("onReset");
      resetBases();
    });
  }

  void onSubmitPlay() {
    _onResultEntered(playResult);
    advanceLineup();
    setState(() {
      _log("onNextBatter");
      basesOccupied[0] = batter;
      _updatePlayerStats();
      updatePrevBases();
      playResult = null;
    });
  }

  void _updatePlayerStats() async {
    prevBasesOccupied.forEach((player) {
      if (player != null) {
        RepositoryServicePlayers.updatePlayer(player);
      }
    });
  }

  void _log(String name) {
    debugPrint(name);
    basesOccupied.forEach((s) =>
        debugPrint("basesOccupied  ${s?.name}   r:${s?.runs}  rbi:${s?.rbi}"));
    prevBasesOccupied.forEach((s) => debugPrint(
        "prevBasesOccupied  ${s?.name}   r:${s?.runs}  rbi:${s?.rbi}"));
  }

  void resetBases() {
    for (int i = 0; i < basesOccupied.length; i++) {
      basesOccupied[i] = prevBasesOccupied[i];
    }
  }

  void updatePrevBases() {
    for (int i = 0; i < prevBasesOccupied.length; i++) {
      prevBasesOccupied[i] = basesOccupied[i];
    }
  }

  decreaseLineup() {
    lineupNumber--;
    if (lineupNumber < 0) {
      lineupNumber = lineup.length - 1;
    }
    _retrieveBatter();
  }

  advanceLineup() {
    lineupNumber++;
    if (lineupNumber >= lineup.length) {
      debugPrint("lineuep $lineupNumber  >=  ${lineup.length}");
      lineupNumber = 0;
    }
    debugPrint("lineuep $lineupNumber");
    _retrieveBatter();
  }

  addRunAndRBI(Player p) {
    p.runs++;
    batter.rbi++;
  }
}
