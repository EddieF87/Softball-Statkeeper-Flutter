import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';

class PlayTest {
  int id;
  String statkeeperFireID;
  int number;
  String play;
  String batterID;
  String onDeckID;
  int team;
  int outs;
  int awayTeamRuns;
  int homeTeamRuns;
  bool inningChanged;
  int innings;
  int inningRuns;

  List<String> bases;
  List<String> runsScored;

  PlayTest(
      {this.id,
      this.statkeeperFireID,
      this.number,
      this.play,
      this.batterID,
      this.onDeckID,
      this.outs,
      this.awayTeamRuns,
      this.homeTeamRuns,
      this.inningChanged,
      this.innings,
      this.inningRuns,
      this.bases,
      this.runsScored})
      : assert(statkeeperFireID != null, id != null);

  Map<String, dynamic> toJson() => {
        DBContract.ID: this.id,
        DBContract.STATKEEPER_FIRESTORE_ID: this.statkeeperFireID,
        DBContract.PLAY_NUMBER: this.number,
        DBContract.PLAY: this.play,
        DBContract.BATTER: this.batterID,
        DBContract.ON_DECK: this.onDeckID,
        DBContract.TEAM: this.team,
        DBContract.BASE1: this.bases[1],
        DBContract.BASE2: this.bases[2],
        DBContract.BASE3: this.bases[3],
        DBContract.OUTS: this.outs,
        DBContract.AWAY_RUNS: this.awayTeamRuns,
        DBContract.HOME_RUNS: this.homeTeamRuns,
        DBContract.RUN1: this.runsScored[0],
        DBContract.RUN2: this.runsScored[1],
        DBContract.RUN3: this.runsScored[2],
        DBContract.RUN4: this.runsScored[3],
        DBContract.INNING_CHANGED: this.inningChanged,
        DBContract.INNINGS: this.innings,
        DBContract.INNING_RUNS: this.inningRuns,
      };

  PlayTest.fromJson(Map<String, dynamic> json) {
    this.id = json[DBContract.ID];
    this.statkeeperFireID = json[DBContract.STATKEEPER_FIRESTORE_ID];
    this.number = json[DBContract.PLAY_NUMBER];
    this.play = json[DBContract.PLAY];
    this.batterID = json[DBContract.BATTER];
    this.onDeckID = json[DBContract.ON_DECK];
    this.team = json[DBContract.TEAM];
    this.outs = json[DBContract.OUTS];
    this.awayTeamRuns = json[DBContract.AWAY_RUNS];
    this.homeTeamRuns = json[DBContract.HOME_RUNS];
    this.inningChanged = json[DBContract.INNING_CHANGED];
    this.innings = json[DBContract.INNINGS];
    this.inningRuns = json[DBContract.INNING_RUNS];
    this.bases = [
      this.batterID,
      json[DBContract.BASE1],
      json[DBContract.BASE2],
      json[DBContract.BASE3],
      null
    ];
    this.runsScored = [
      json[DBContract.RUN1],
      json[DBContract.RUN2],
      json[DBContract.RUN3],
      json[DBContract.RUN4]
    ];
  }

  @override
  String toString() {
    return "Play  num:$number  bID: $batterID    play:$play  "
//        "outs:$outs  inn:$innings  innchanged:$inningChanged  innruns:$inningRuns  "
        "bases:${bases[0]} ${bases[1]} ${bases[2]} ${bases[3]} ${bases[4]} "
//        "runsScored:${runsScored[0]} ${runsScored[1]} ${runsScored[2]} ${runsScored[3]}"
    ;
  }
}
