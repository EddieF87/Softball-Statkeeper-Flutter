import 'package:meta/meta.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';

class Player {

  //Display labels for stats that are changeable.
  static const String LABEL_G = "G";
  static const String LABEL_1B = "1B";
  static const String LABEL_2B = "2B";
  static const String LABEL_3B = "3B";
  static const String LABEL_HR = "HR";
  static const String LABEL_BB = "BB";
  static const String LABEL_HBP = "HBP";
  static const String LABEL_ROE = "ROE";
  static const String LABEL_OUT = "OUT";
  static const String LABEL_K = "K";
  static const String LABEL_SF = "SF";
  static const String LABEL_SB = "SB";
  static const String LABEL_R = "R";
  static const String LABEL_RBI = "RBI";

  static const Set<String> CHANGEABLE_LABELS = {
    LABEL_G, LABEL_1B, LABEL_2B, LABEL_3B, LABEL_HR, LABEL_BB, LABEL_HBP,
  LABEL_ROE, LABEL_OUT, LABEL_K, LABEL_SF, LABEL_SB, LABEL_R, LABEL_RBI,
  };

  //Display labels for stats that are calculated from others.
  static const String LABEL_H = "H";
  static const String LABEL_AB = "AB";
  static const String LABEL_PA = "PA";
  static const String LABEL_AVG = "AVG";
  static const String LABEL_OBP = "OBP";
  static const String LABEL_SLG = "SLG";
  static const String LABEL_OPS = "OPS";
  static const String LABEL_OBPROE = "OBP+ROE";

  int id;
  String firestoreID;
  String teamFirestoreID;
  String name;
  String team;
  int games;
  int rbi;
  int runs;
  int singles;
  int doubles;
  int triples;
  int hrs;
  int outs;
  int walks;
  int sacFlies;
  int stolenBases;
  int strikeOuts;
  int hbp;
  int gender;
  int reachedOnErrors;

  Player({
//    @required
    this.id,
    @required this.firestoreID,
    @required this.name,
    this.team = "Free Agent",
    this.games = 0,
    this.rbi = 0,
    this.runs = 0,
    this.singles = 0,
    this.doubles = 0,
    this.triples = 0,
    this.hrs = 0,
    this.outs = 0,
    this.walks = 0,
    this.sacFlies = 0,
    this.stolenBases = 0,
    this.strikeOuts = 0,
    this.hbp = 0,
    this.gender = 0,
    this.reachedOnErrors = 0,
  })  : assert(firestoreID != null),
        assert(name != null);

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "firestoreID": this.firestoreID,
        "teamFirestoreID": this.teamFirestoreID,
        "name": this.name,
        "team": this.team,
        "games": this.games,
        "rbi": this.rbi,
        "runs": this.runs,
        "singles": this.singles,
        "doubles": this.doubles,
        "triples": this.triples,
        "hrs": this.hrs,
        "outs": this.outs,
        "walks": this.walks,
        "sacFlies": this.sacFlies,
        "stolenBases": this.stolenBases,
        "strikeOuts": this.strikeOuts,
        "hbp": this.hbp,
        "gender": this.gender,
        "rOE": this.reachedOnErrors,
      };

  Map<String, num> toStatsMap() => {
        LABEL_G: this.games,
        LABEL_RBI: this.rbi,
        LABEL_R: this.runs,
        LABEL_1B: this.singles,
        LABEL_2B: this.doubles,
        LABEL_3B: this.triples,
        LABEL_HR: this.hrs,
        LABEL_OUT: this.outs,
        LABEL_BB: this.walks,
        LABEL_SF: this.sacFlies,
        LABEL_SB: this.stolenBases,
        LABEL_K: this.strikeOuts,
        LABEL_HBP: this.hbp,
        LABEL_ROE: this.reachedOnErrors,
        LABEL_H: getHits(),
        LABEL_AB: getAB(),
        LABEL_PA: getPA(),
        LABEL_AVG: getAVG(),
        LABEL_OBP: getOBP(),
        LABEL_SLG: getSLG(),
        LABEL_OPS: getOPS(),
        LABEL_OBPROE: getOBPwithROE(),
      };

  Player.fromJson(Map<String, dynamic> json) {
    this.id = json[DBContract.id];
    this.firestoreID = json[DBContract.firestoreID];
    this.teamFirestoreID = json[DBContract.teamFirestoreID];
    this.name = json[DBContract.name];
    this.team = json[DBContract.team];
    this.gender = json[DBContract.gender];
    this.games = json[DBContract.games];
    this.singles = json[DBContract.singles];
    this.doubles = json[DBContract.doubles];
    this.triples = json[DBContract.triples];
    this.hrs = json[DBContract.hrs];
    this.walks = json[DBContract.walks];
    this.outs = json[DBContract.outs];
    this.sacFlies = json[DBContract.sacFlies];
    this.reachedOnErrors = json[DBContract.reachedOnErrors];
    this.strikeOuts = json[DBContract.strikeOuts];
    this.stolenBases = json[DBContract.stolenBases];
    this.runs = json[DBContract.runs];
    this.rbi = json[DBContract.rbi];
    this.hbp = json[DBContract.hbp];
  }

  int getHits() => singles + doubles + triples + hrs;

  int getTotalBases() => singles + doubles * 2 + triples * 3 + hrs * 4;

  int getOnBase() => getHits() + walks;

  int getOnBasePlusROE() => getOnBase() + reachedOnErrors;

  int getAB() => getHits() + outs + reachedOnErrors;

  int getPA() => getAB() + walks + sacFlies;

  double getAVG() {
    if (getAB() == 0) {
      return null;
    } else {
      return getHits() / getAB();
    }
  }

  double getOBP() {
    if (getPA() == 0) {
      return null;
    } else {
      return getOnBase() / getPA();
    }
  }

  double getSLG() {
    if (getAB() == 0) {
      return null;
    } else {

      return getTotalBases() / getAB();
    }
  }

  double getOPS() {
    if (getSLG() == null) {
      return getOBP();
    } else {
      return getSLG() + getOBP();
    }
  }

  double getOBPwithROE() {
    if (getPA() == 0) {
      return null;
    } else {
      return getOnBasePlusROE() / getPA();
    }
  }
}
