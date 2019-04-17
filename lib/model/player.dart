import 'package:meta/meta.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';

class Player {

  //Display labels for name/team/etc.
  static const String LABEL_NAME = "Name";
  static const String LABEL_TEAM = "Team";

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
    LABEL_G,
    LABEL_1B,
    LABEL_2B,
    LABEL_3B,
    LABEL_HR,
    LABEL_BB,
    LABEL_HBP,
    LABEL_ROE,
    LABEL_OUT,
    LABEL_K,
    LABEL_SF,
    LABEL_SB,
    LABEL_R,
    LABEL_RBI,
  };

  //Display labels for stats that are calculated from others.
  static const String LABEL_H = "H";
  static const String LABEL_AB = "AB";
  static const String LABEL_PA = "PA";
  static const String LABEL_AVG = "AVG";
  static const String LABEL_OBP = "OBP";
  static const String LABEL_SLG = "SLG";
  static const String LABEL_OPS = "OPS";
  static const String LABEL_OBPROE = "OBP+E";

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
        DBContract.ID: this.id,
        DBContract.FIRESTORE_ID: this.firestoreID,
        DBContract.TEAM_FIRESTORE_ID: this.teamFirestoreID,
        DBContract.NAME: this.name,
        DBContract.TEAM: this.team,
        DBContract.GAMES: this.games,
        DBContract.RBI: this.rbi,
        DBContract.RUNS: this.runs,
        DBContract.SINGLES: this.singles,
        DBContract.DOUBLES: this.doubles,
        DBContract.TRIPLES: this.triples,
        DBContract.HRS: this.hrs,
        DBContract.OUTS: this.outs,
        DBContract.WALKS: this.walks,
        DBContract.SAC_FLIES: this.sacFlies,
        DBContract.STOLEN_BASES: this.stolenBases,
        DBContract.STRIKEOUTS: this.strikeOuts,
        DBContract.HBP: this.hbp,
        DBContract.GENDER: this.gender,
        DBContract.REACHED_ON_ERRORS: this.reachedOnErrors,
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
    this.firestoreID = json[DBContract.FIRESTORE_ID];
    this.teamFirestoreID = json[DBContract.TEAM_FIRESTORE_ID];
    this.name = json[DBContract.NAME];
    this.team = json[DBContract.TEAM];
    this.gender = json[DBContract.GENDER];
    this.games = json[DBContract.GAMES];
    this.singles = json[DBContract.SINGLES];
    this.doubles = json[DBContract.DOUBLES];
    this.triples = json[DBContract.TRIPLES];
    this.hrs = json[DBContract.HRS];
    this.walks = json[DBContract.WALKS];
    this.outs = json[DBContract.OUTS];
    this.sacFlies = json[DBContract.SAC_FLIES];
    this.reachedOnErrors = json[DBContract.REACHED_ON_ERRORS];
    this.strikeOuts = json[DBContract.STRIKEOUTS];
    this.stolenBases = json[DBContract.STOLEN_BASES];
    this.runs = json[DBContract.RUNS];
    this.rbi = json[DBContract.RBI];
    this.hbp = json[DBContract.HBP];
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

  static Comparator<Player> nameComparator() => (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase());
  static Comparator<Player> teamComparator() => (a, b) => b.team.toLowerCase().compareTo(a.team.toLowerCase());
  static Comparator<Player> gameComparator() => (a, b) => b.games.compareTo(a.games);
  static Comparator<Player> singleComparator() => (a, b) => b.singles.compareTo(a.singles);
  static Comparator<Player> doubleComparator() => (a, b) => b.doubles.compareTo(a.doubles);
  static Comparator<Player> tripleComparator() => (a, b) => b.triples.compareTo(a.triples);
  static Comparator<Player> hrComparator() => (a, b) => b.hrs.compareTo(a.hrs);
  static Comparator<Player> runComparator() => (a, b) => b.runs.compareTo(a.runs);
  static Comparator<Player> rbiComparator() => (a, b) => b.rbi.compareTo(a.rbi);
  static Comparator<Player> walkComparator() => (a, b) => b.walks.compareTo(a.walks);
  static Comparator<Player> outBaseComparator() => (a, b) => b.outs.compareTo(a.outs);
  static Comparator<Player> sfComparator() => (a, b) => b.sacFlies.compareTo(a.sacFlies);
  static Comparator<Player> stolenBaseComparator() => (a, b) => b.stolenBases.compareTo(a.stolenBases);
  static Comparator<Player> roeComparator() => (a, b) => b.reachedOnErrors.compareTo(a.reachedOnErrors);
  static Comparator<Player> kComparator() => (a, b) => b.strikeOuts.compareTo(a.strikeOuts);
  static Comparator<Player> hbpComparator() => (a, b) => b.hbp.compareTo(a.hbp);
  static Comparator<Player> abComparator() => (a, b) => b.getAB().compareTo(a.getAB());
  static Comparator<Player> paComparator() => (a, b) => b.getPA().compareTo(a.getPA());
  static Comparator<Player> hitComparator() => (a, b) => b.getHits().compareTo(a.getHits());
  static Comparator<Player> avgComparator() => (a, b) => b.getAVG().compareTo(a.getAVG());
  static Comparator<Player> obpComparator() => (a, b) => b.getOBP().compareTo(a.getOBP());
  static Comparator<Player> slgComparator() => (a, b) => b.getSLG().compareTo(a.getSLG());
  static Comparator<Player> opsComparator() => (a, b) => b.getOPS().compareTo(a.getOPS());
  static Comparator<Player> obproeComparator() => (a, b) => b.getOnBasePlusROE().compareTo(a.getOnBasePlusROE());


  static Map<String, Comparator<Player>> toComparatorMap() => {
    LABEL_NAME: nameComparator(),
    LABEL_TEAM: teamComparator(),
    LABEL_G: gameComparator(),
    LABEL_RBI: rbiComparator(),
    LABEL_R: runComparator(),
    LABEL_1B: singleComparator(),
    LABEL_2B: doubleComparator(),
    LABEL_3B: tripleComparator(),
    LABEL_HR: hrComparator(),
    LABEL_OUT: outBaseComparator(),
    LABEL_BB: walkComparator(),
    LABEL_SF: sfComparator(),
    LABEL_SB: stolenBaseComparator(),
    LABEL_K: kComparator(),
    LABEL_HBP: hbpComparator(),
    LABEL_ROE: roeComparator(),
    LABEL_H: hitComparator(),
    LABEL_AB: abComparator(),
    LABEL_PA: paComparator(),
    LABEL_AVG: avgComparator(),
    LABEL_OBP: obpComparator(),
    LABEL_SLG: slgComparator(),
    LABEL_OPS: opsComparator(),
    LABEL_OBPROE: obproeComparator(),
  };

}
