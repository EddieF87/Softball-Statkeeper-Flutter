import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_plays.dart';
import 'package:sleekstats_flutter_statkeeper/main.dart';
import 'package:sleekstats_flutter_statkeeper/model/play_test.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/utils/extensions.dart';

import 'base_store.dart';

part 'game_store.g.dart';

class GameStore = _GameStore with _$GameStore;

// The store-class
abstract class _GameStore with Store {
  final String sKFireID;
  final String awayFireID;
  final String homeFireID;
  final BaseStore baseStore = BaseStore();

  _GameStore({this.sKFireID, this.awayFireID, this.homeFireID}) {
    startGame();
  }

  @observable
  dynamic batter;

  @observable
  String batterID;

  String onDeckID;

  @observable
  bool playReset;

  @observable
  String playResult;

  @observable
  int awayTeamRuns = 0;

  @observable
  int homeTeamRuns = 0;

  int tempRuns = 0;
  int tempOuts = 0;

  bool inningChanged;

  @observable
  int innings;

  @observable
  int outs;

//  @observable
  List<String> awayLineup = List();

//  @observable
  List<String> homeLineup = List();

  List<PlayTest> plays = List<PlayTest>();

  int inningRuns = 0;
  int playNumber = 0;
  int lineupNumber = 0;
  bool undoRedo = false;

  List<Player> runsScored = [null, null, null, null];

  void startGame() async {
    await _retrieveTeamLineup(teamID: awayFireID);
    await _addPlay(playBatterID: null, playOnDeckID: batterID);
  }

  Future _retrieveTeamLineup({String teamID}) async {
    List<Player> playerList =
        await database.playerDao.getAllPlayersFromTeam(sKFireID, teamID);
    playerList.forEach((p) {
      print("jjjjjk  ${p.name}  ${p.battingOrder}");
      awayLineup.add(p.firestoreID);
    });
    if (awayLineup == null || awayLineup.isEmpty) {
      return;
    }
    batterID = awayLineup[lineupNumber];
    _retrieveBatter();
  }

  @action
  Future _retrieveBatter() async {
    batter =
        (await database.playerDao.getPlayer(sKFireID, batterID)).firstOrNull;
    baseStore.setBatter(batter);
    baseStore.updatePrevBases();
  }

  Future<List<Player>> populateBases(List<String> baseIDs) async {
    List<Player> players = [];
    for (var baseID in baseIDs) {
      Player player;
      if (baseID != null) {
        player =
            (await database.playerDao.getPlayer(sKFireID, baseID)).firstOrNull;
      }
      players.add(player);
    }
    return players;
  }

  String decreaseLineup(List<String> lineup) {
    playNumber--;
    if (playNumber < 0) {
      playNumber = 0;
    }
    lineupNumber--;
    if (lineupNumber < 0) {
      lineupNumber = lineup.length - 1;
    }
    return lineup[lineupNumber];
  }

  String increaseLineup(List<String> lineup) {
    playNumber++;
    lineupNumber++;
    if (lineupNumber >= lineup.length) {
      lineupNumber = 0;
    }
    return lineup[lineupNumber];
  }

  @action
  void onReset() {
    baseStore.resetBases();
    runsScored = [null, null, null, null];
    awayTeamRuns -= tempRuns;
    tempRuns = 0;
    playResult = null;
  }

  @action
  Future onSubmitPlay() async {
    if (undoRedo) {
      /*TODO
      deleteGameLogs();
      currentRunsLog.clear();
      currentRunsLog.addAll(tempRunsLog);
      */
      deletePlays();
    }

    if (playResult == null) {
      return;
    }

    tempRuns = 0; //todo for undoredo

    _onResultEntered(playResult);
    String oldBatterID = batterID;
    batterID = increaseLineup(awayLineup);
    await _addPlay(playBatterID: oldBatterID, playOnDeckID: batterID);
    _updatePlayerStats();

    runsScored = [null, null, null, null];
    nextBatter();
  }

  @action
  void nextBatter() {
    _retrieveBatter();
    playResult = null;
  }

  @action
  void _onResultEntered(String result) {
    switch (result) {
      case PlayerUtils.LABEL_1B:
        batter = batter.copyWith(singles: batter.singles + 1);
        break;
      case PlayerUtils.LABEL_2B:
        batter = batter.copyWith(doubles: batter.doubles + 1);
        break;
      case PlayerUtils.LABEL_3B:
        batter = batter.copyWith(triples: batter.triples + 1);
        break;
      case PlayerUtils.LABEL_HR:
        batter = batter.copyWith(hrs: batter.hrs + 1);
        break;
      case PlayerUtils.LABEL_ROE:
        batter = batter.copyWith(reachedOnErrors: batter.reachedOnErrors + 1);
        break;
      case PlayerUtils.LABEL_BB:
        batter = batter.copyWith(walks: batter.walks + 1);
        break;
      case PlayerUtils.LABEL_K:
        batter = batter.copyWith(strikeouts: batter.strikeouts + 1);
        break;
      case PlayerUtils.LABEL_OUT:
        batter = batter.copyWith(outs: batter.outs + 1);
        break;
      case PlayerUtils.LABEL_HBP:
        batter = batter.copyWith(hbp: batter.hbp + 1);
        break;
      case PlayerUtils.LABEL_SF:
        batter = batter.copyWith(sacFlies: batter.sacFlies + 1);
        break;
      case PlayerUtils.LABEL_SB:
        updateStolenBases();
        break;
    }
    database.playerDao.updatePlayer(batter);
  }

  void _updatePlayerStats() async {
    baseStore.prevBases.forEach((player) {
      if (player != null) {
        database.playerDao.updatePlayer(player);
      }
    });
  }

  @action
  addRunAndRBI(Player p) {
    tempRuns++;
    awayTeamRuns++;
    runsScored.add(p);
    database.playerDao.updatePlayer(p.copyWith(runs: p.runs + 1));
    database.playerDao.updatePlayer(batter.copyWith(rbis: batter.rbis + 1));
  }

  Future _addPlay({String playBatterID, String playOnDeckID}) async {
    PlayTest play = PlayTest(
      play: playResult,
      number: playNumber,
      statkeeperFireID: sKFireID,
      inningRuns: inningRuns,
      inningChanged: inningChanged,
      awayTeamRuns: awayTeamRuns,
      homeTeamRuns: homeTeamRuns,
      batterID: playBatterID,
      bases: baseStore.bases.map((player) => player?.firestoreID).toList(),
      innings: innings,
      onDeckID: playOnDeckID,
      outs: outs,
      runsScored: runsScored.map((player) => player?.firestoreID).toList(),
    );
    play.id = await RepositoryServicePlays.insertPlay(play);
    plays.add(play);
  }

  Future deletePlays() async {
    plays.removeRange(playNumber, plays.length);
  }

  @action
  Future retrievePlay() async {
    PlayTest play = await RepositoryServicePlays.getPlay(sKFireID, playNumber);

    playNumber = play.number;
    batterID = play.onDeckID;
    baseStore.setBases(await populateBases(play.bases));
    awayTeamRuns = play.awayTeamRuns;
    homeTeamRuns = play.homeTeamRuns;
    innings = play.innings;
    inningRuns = play.inningRuns;
    inningChanged = play.inningChanged;
    outs = play.outs;
    _retrieveBatter();
  }

  @action
  void setPlayResult(String result) {
    playResult = result;
  }

  void goBackward() {
    undoRedo = true;
    if (playNumber == 0) {
      return;
    }
    decreaseLineup(awayLineup);
    retrievePlay();
  }

  void goForward() {
    if (playNumber >= plays.length - 1) {
      undoRedo = false;
      return;
    }
    increaseLineup(awayLineup);
    retrievePlay();
    if (playNumber >= plays.length - 1) {
      undoRedo = false;
    }
  }

  void updateStolenBases() {
    for (int baseIndex = 1; baseIndex < 5; baseIndex++) {
      Player player = baseStore.bases[baseIndex];
      int oldBaseIndex = baseStore.prevBases.indexOf(player);
      if (player != null) {
        print("${player.name} stole ${baseIndex - oldBaseIndex} bases");
      }
    }
    runsScored.forEach((player) {
      print("runscored = ${player?.name}");
      if (player != null) {
        int oldBaseIndex = baseStore.prevBases.indexOf(player);
        print("${player.name} stole ${4 - oldBaseIndex} bases");
      }
    });
  }
}
