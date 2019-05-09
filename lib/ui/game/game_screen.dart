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
  List<Player> basesOccupied  = [null, null, null, null, null];
  List<Player> prevBasesOccupied  = [null, null, null, null, null];
  final runsScored = [];
  final lineup = [];
  int awayTeamRuns;
  int homeTeamRuns;
  bool inningChanged;
  int innings;
  int outs;
  bool inningRuns;
  int lineupNumber = 0;

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
      basesOccupied[0]  = batter;
      prevBasesOccupied[0]  = basesOccupied[0];
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
            ),
          ),
          Flexible(
            flex: 2,
            child: Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: onBack,
                  child: Text("BACK"),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: onForward,
                  child: Text("NEXT"),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: onReset,
                  child: Text("RESET"),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: onNextBatter,
                  child: Text("Next Batter"),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onBack() {
    decreaseLineup();
  }

  void onForward() {
    advanceLineup();
  }

  void onReset() {
    setState(() {
      debugPrint("onReset");
      basesOccupied.forEach((s) => debugPrint("basesOccupied  ${s?.name}"));
      prevBasesOccupied.forEach((s) => debugPrint("prevBasesOccupied  ${s?.name}"));
      resetBases();
    });
  }

  void onNextBatter() {
    advanceLineup();
    setState(() {
      debugPrint("onNextBatter");
      basesOccupied[0] = batter;
      updatePrevBases();
      basesOccupied.forEach((s) => debugPrint("basesOccupied  ${s?.name}"));
      prevBasesOccupied.forEach((s) => debugPrint("prevBasesOccupied  ${s?.name}"));
    });
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
}
