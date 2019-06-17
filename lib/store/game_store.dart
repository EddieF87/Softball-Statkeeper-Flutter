import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_plays.dart';
import 'package:sleekstats_flutter_statkeeper/model/play.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

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
    print("GAMESTORE CONSTRUCTED: $sKFireID");
    startGame();
  }

  @observable
  Player batter;

  @observable
  String batterID;

  String onDeckID;

  @observable
  bool playReset;

  @observable
  String playResult;

  @observable
  int awayTeamRuns;

  @observable
  int homeTeamRuns;

  bool inningChanged;

  @observable
  int innings;

  @observable
  int outs;

//  @observable
  List<String> awayLineup = List();

//  @observable
  List<String> homeLineup = List();

  List<Play> plays = List<Play>();

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
        await RepositoryServicePlayers.getAllPlayersFromTeam(sKFireID, teamID);
    playerList.forEach((p) => awayLineup.add(p.fireID));
    if (awayLineup == null || awayLineup.isEmpty) {
      return;
    }
    batterID = awayLineup[lineupNumber];
    _retrieveBatter();
  }

  @action
  Future _retrieveBatter() async {
    batter = await RepositoryServicePlayers.getPlayer(sKFireID, batterID);
    baseStore.setBatter(batter);
    baseStore.updatePrevBases();
  }

  Future<List<Player>> populateBases(List<String> baseIDs) async {
    List<Player> players = [];
    for (var baseID in baseIDs) {
      Player player;
      if (baseID != null) {
        player = await RepositoryServicePlayers.getPlayer(sKFireID, baseID);
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
    }

    if (playResult == null) {
      //TODO   TOAST!!
      return;
    }

    _onResultEntered(playResult);
    String oldBatterID = batterID;
    batterID = increaseLineup(awayLineup);
    await _addPlay(playBatterID: oldBatterID, playOnDeckID: batterID);
    _updatePlayerStats();

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

  void _updatePlayerStats() async {
    baseStore.prevBases.forEach((player) {
      if (player != null) {
        RepositoryServicePlayers.updatePlayer(player);
      }
    });
  }

  @action
  addRunAndRBI(Player p) {
    p.runs++;
    batter.rbi++;
  }

  Future _addPlay({String playBatterID, String playOnDeckID}) async {
    print("addPlay  $playNumber  $batterID");
    Play play = Play(
      play: playResult,
      number: playNumber,
      statkeeperFireID: sKFireID,
      inningRuns: inningRuns,
      inningChanged: inningChanged,
      awayTeamRuns: awayTeamRuns,
      homeTeamRuns: homeTeamRuns,
      batterID: playBatterID,
      bases: baseStore.prevBases.map((player) => player?.fireID).toList(),
      innings: innings,
      onDeckID: playOnDeckID,
      outs: outs,
      runsScored: runsScored.map((player) => player?.fireID).toList(),
    );
    play.id = await RepositoryServicePlays.insertPlay(play);
    plays.add(play);
  }

  @action
  Future retrievePlay() async {
    print("retrievePlay  $playNumber " );
    Play play = await RepositoryServicePlays.getPlay(sKFireID, playNumber);

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
    if(playNumber == 0) {
      return;
    }
    playNumber--;
    retrievePlay();
  }

  void goForward() {
    if(playNumber >= plays.length - 1) {
      return;
    }
    playNumber++;
    retrievePlay();
  }
}
