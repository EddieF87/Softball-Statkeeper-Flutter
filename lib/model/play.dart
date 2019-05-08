import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';

class Play {

  int id;
  int number;
  String statkeeperFirestoreID;
  String play;
  String batter;
  String onDeck;
  int team;
  int outs;
  int awayTeamRuns;
  int homeTeamRuns;
  bool inningChanged;
  int innings;
  bool inningRuns;

  var bases;
  var runsScored;

  Play({
    this.id,
    this.number,
    this.statkeeperFirestoreID,
    this.play,
    this.batter,
    this.onDeck,
    this.outs,
    this.awayTeamRuns,
    this.homeTeamRuns,
    this.inningChanged,
    this.innings,
    this.inningRuns,
    this.bases,
    this.runsScored
  }) : assert(statkeeperFirestoreID != null, id != null);

  Map<String, dynamic> toJson() => {
    DBContract.ID: this.id,
    DBContract.PLAY_NUMBER: this.number,
    DBContract.STATKEEPER_FIRESTORE_ID: this.statkeeperFirestoreID,
    DBContract.PLAY: this.play,
    DBContract.BATTER: this.batter,
    DBContract.ON_DECK: this.onDeck,
    DBContract.TEAM: this.team,
    DBContract.BASE1: this.bases[0],
    DBContract.BASE2: this.bases[1],
    DBContract.BASE3: this.bases[2],
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


  Play.fromJson(Map<String, dynamic> json) {
    this.id= json[DBContract.ID];
    this.number= json[DBContract.PLAY_NUMBER];
    this.statkeeperFirestoreID= json[DBContract.STATKEEPER_FIRESTORE_ID];
    this.play= json[DBContract.PLAY];
    this.batter= json[DBContract.BATTER];
    this.onDeck= json[DBContract.ON_DECK];
    this.team= json[DBContract.TEAM];
    this.outs= json[DBContract.OUTS];
    this.awayTeamRuns= json[DBContract.AWAY_RUNS];
    this.homeTeamRuns= json[DBContract.HOME_RUNS];
    this.inningChanged= json[DBContract.INNING_CHANGED];
    this.innings= json[DBContract.INNINGS];
    this.inningRuns = json[DBContract.INNING_RUNS];
    this.bases = {json[DBContract.BASE1], json[DBContract.BASE2], json[DBContract.BASE3]};
    this.runsScored = {json[DBContract.RUN1], json[DBContract.RUN2], json[DBContract.RUN3], json[DBContract.RUN4]};
  }

  @override
  String toString() {
    return "Play $play  id:$id  sKID:$statkeeperFirestoreID";
  }
}
