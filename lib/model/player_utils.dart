import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';

class PlayerUtils {
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
  static const String LABEL_ROE = "RoE";
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
  static const String LABEL_OBPROE = "OBP+RoE";


//  Map<String, dynamic> toJson() => {
//        DBContract.ID: this.id,
//        DBContract.FIRESTORE_ID: this.fireID,
//        DBContract.TEAM_FIRESTORE_ID: this.teamFireID,
//        DBContract.STATKEEPER_FIRESTORE_ID: this.statkeeperFireID,
//        DBContract.NAME: this.name,
//        DBContract.TEAM: this.team,
//        DBContract.GAMES: this.games,
//        DBContract.RBI: this.rbi,
//        DBContract.RUNS: this.runs,
//        DBContract.SINGLES: this.singles,
//        DBContract.DOUBLES: this.doubles,
//        DBContract.TRIPLES: this.triples,
//        DBContract.HRS: this.hrs,
//        DBContract.OUTS: this.outs,
//        DBContract.WALKS: this.walks,
//        DBContract.SAC_FLIES: this.sacFlies,
//        DBContract.STOLEN_BASES: this.stolenBases,
//        DBContract.STRIKEOUTS: this.strikeOuts,
//        DBContract.HBP: this.hbp,
//        DBContract.GENDER: this.gender,
//        DBContract.REACHED_ON_ERRORS: this.reachedOnErrors,
//        DBContract.BATTING_ORDER: this.battingOrder
//      };

  static Map<String, dynamic> toFirestore(Player player) => {
        DBContract.FIRESTORE_ID: player.firestoreID,
        DBContract.TEAM_FIRESTORE_ID: player.teamfirestoreid,
        DBContract.NAME: player.name,
        DBContract.TEAM: player.team,
        DBContract.GAMES: player.games,
        DBContract.RBI: player.rbis,
        DBContract.RUNS: player.runs,
        DBContract.SINGLES: player.singles,
        DBContract.DOUBLES: player.doubles,
        DBContract.TRIPLES: player.triples,
        DBContract.HRS: player.hrs,
        DBContract.OUTS: player.outs,
        DBContract.WALKS: player.walks,
        DBContract.SAC_FLIES: player.sacFlies,
        DBContract.STOLEN_BASES: player.stolenBases,
        DBContract.STRIKEOUTS: player.strikeouts,
        DBContract.HBP: player.hbp,
        DBContract.GENDER: player.gender,
        DBContract.REACHED_ON_ERRORS: player.reachedOnErrors,
      };

  static num getStat(Player player, String stat) {
    switch (stat) {
      case LABEL_G:
        return player.games;
      case LABEL_RBI:
        return player.rbis;
      case LABEL_R:
        return player.runs;
      case LABEL_1B:
        return player.singles;
      case LABEL_2B:
        return player.doubles;
      case LABEL_3B:
        return player.triples;
      case LABEL_HR:
        return player.hrs;
      case LABEL_OUT:
        return player.outs;
      case LABEL_BB:
        return player.walks;
      case LABEL_SF:
        return player.sacFlies;
      case LABEL_SB:
        return player.stolenBases;
      case LABEL_K:
        return player.strikeouts;
      case LABEL_HBP:
        return player.hbp;
      case LABEL_ROE:
        return player.reachedOnErrors;
      case LABEL_H:
        return player.getHits();
      case LABEL_AB:
        return player.getAB();
      case LABEL_PA:
        return player.getPA();
      case LABEL_AVG:
        return player.getAVG();
      case LABEL_OBP:
        return player.getOBP();
      case LABEL_SLG:
        return player.getSLG();
      case LABEL_OPS:
        return player.getOPS();
      case LABEL_OBPROE:
        return player.getOBPwithROE();
      default:
        return 0;
    }
  }

  static Map<String, num> toStatsMap(Player player) => {
        LABEL_G: player.games,
        LABEL_RBI: player.rbis,
        LABEL_R: player.runs,
        LABEL_1B: player.singles,
        LABEL_2B: player.doubles,
        LABEL_3B: player.triples,
        LABEL_HR: player.hrs,
        LABEL_OUT: player.outs,
        LABEL_BB: player.walks,
        LABEL_SF: player.sacFlies,
        LABEL_SB: player.stolenBases,
        LABEL_K: player.strikeouts,
        LABEL_HBP: player.hbp,
        LABEL_ROE: player.reachedOnErrors,
        LABEL_H: player.getHits(),
        LABEL_AB: player.getAB(),
        LABEL_PA: player.getPA(),
        LABEL_AVG: player.getAVG(),
        LABEL_OBP: player.getOBP(),
        LABEL_SLG: player.getSLG(),
        LABEL_OPS: player.getOPS(),
        LABEL_OBPROE: player.getOBPwithROE(),
      };

  static Player fromJson(Map<String, dynamic> json) => new Player(
        id: json[DBContract.ID],
        firestoreID: json[DBContract.FIRESTORE_ID],
        teamfirestoreid: json[DBContract.TEAM_FIRESTORE_ID],
        statkeeperFirestoreID: json[DBContract.STATKEEPER_FIRESTORE_ID],
        name: json[DBContract.NAME],
        team: json[DBContract.TEAM],
        gender: json[DBContract.GENDER],
        games: json[DBContract.GAMES],
        singles: json[DBContract.SINGLES],
        doubles: json[DBContract.DOUBLES],
        triples: json[DBContract.TRIPLES],
        hrs: json[DBContract.HRS],
        walks: json[DBContract.WALKS],
        outs: json[DBContract.OUTS],
        sacFlies: json[DBContract.SAC_FLIES],
        reachedOnErrors: json[DBContract.REACHED_ON_ERRORS],
        strikeouts: json[DBContract.STRIKEOUTS],
        stolenBases: json[DBContract.STOLEN_BASES],
        runs: json[DBContract.RUNS],
        rbis: json[DBContract.RBI],
        hbp: json[DBContract.HBP],
        battingOrder: json[DBContract.BATTING_ORDER] ?? 99,
      );

  static Player fromFirestore(
          Map<String, dynamic> data, String sKID, String fireID) =>
      new Player(
        firestoreID: fireID,
        teamfirestoreid: data[DBContract.TEAM_FIRESTORE_ID],
        statkeeperFirestoreID: sKID,
        name: data[DBContract.NAME],
        team: data[DBContract.TEAM],
        gender: data[DBContract.GENDER] ?? 0,
        games: data[DBContract.GAMES] ?? 0,
        singles: data[DBContract.SINGLES] ?? 0,
        doubles: data[DBContract.DOUBLES] ?? 0,
        triples: data[DBContract.TRIPLES] ?? 0,
        hrs: data[DBContract.HRS] ?? 0,
        walks: data[DBContract.WALKS] ?? 0,
        outs: data[DBContract.OUTS] ?? 0,
        sacFlies: data[DBContract.SAC_FLIES] ?? 0,
        reachedOnErrors: data[DBContract.REACHED_ON_ERRORS] ?? 0,
        strikeouts: data[DBContract.STRIKEOUTS] ?? 0,
        stolenBases: data[DBContract.STOLEN_BASES] ?? 0,
        runs: data[DBContract.RUNS] ?? 0,
        rbis: data[DBContract.RBI] ?? 0,
        hbp: data[DBContract.HBP] ?? 0,
        battingOrder: 99,
      );

  static Comparator<Player> nameComparator() =>
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase());

  static Comparator<Player> teamComparator() =>
      (a, b) => b.team.toLowerCase().compareTo(a.team.toLowerCase());

  static Comparator<Player> gameComparator() =>
      (a, b) => b.games.compareTo(a.games);

  static Comparator<Player> singleComparator() =>
      (a, b) => b.singles.compareTo(a.singles);

  static Comparator<Player> doubleComparator() =>
      (a, b) => b.doubles.compareTo(a.doubles);

  static Comparator<Player> tripleComparator() =>
      (a, b) => b.triples.compareTo(a.triples);

  static Comparator<Player> hrComparator() =>
      (a, b) => b.hrs.compareTo(a.hrs);

  static Comparator<Player> runComparator() =>
      (a, b) => b.runs.compareTo(a.runs);

  static Comparator<Player> rbiComparator() =>
      (a, b) => b.rbis.compareTo(a.rbis);

  static Comparator<Player> walkComparator() =>
      (a, b) => b.walks.compareTo(a.walks);

  static Comparator<Player> outComparator() =>
      (a, b) => b.outs.compareTo(a.outs);

  static Comparator<Player> sfComparator() =>
      (a, b) => b.sacFlies.compareTo(a.sacFlies);

  static Comparator<Player> stolenBaseComparator() =>
      (a, b) => b.stolenBases.compareTo(a.stolenBases);

  static Comparator<Player> roeComparator() =>
      (a, b) => b.reachedOnErrors.compareTo(a.reachedOnErrors);

  static Comparator<Player> kComparator() =>
      (a, b) => b.strikeouts.compareTo(a.strikeouts);

  static Comparator<Player> hbpComparator() =>
      (a, b) => b.hbp.compareTo(a.hbp);

  static Comparator<Player> abComparator() =>
      (a, b) => b.getAB().compareTo(a.getAB());

  static Comparator<Player> paComparator() =>
      (a, b) => b.getPA().compareTo(a.getPA());

  static Comparator<Player> hitComparator() =>
      (a, b) => b.getHits().compareTo(a.getHits());

  static Comparator<Player> avgComparator() =>
      (a, b) => b.getAVG().compareTo(a.getAVG());

  static Comparator<Player> obpComparator() =>
      (a, b) => b.getOBP().compareTo(a.getOBP());

  static Comparator<Player> slgComparator() =>
      (a, b) => b.getSLG().compareTo(a.getSLG());

  static Comparator<Player> opsComparator() =>
      (a, b) => b.getOPS().compareTo(a.getOPS());

  static Comparator<Player> obproeComparator() =>
      (a, b) => b.getOBPwithROE().compareTo(a.getOBPwithROE());

  static Comparator<Player> lineupComparator() =>
      (a, b) => a.battingOrder.compareTo(b.battingOrder);

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
        LABEL_OUT: outComparator(),
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

extension ExtendedPlayer on Player {

  int getHits() => singles + doubles + triples + hrs;

  int getTotalBases() => singles + doubles * 2 + triples * 3 + hrs * 4;

  int getOnBase() => getHits() + walks + hbp;

  int getOnBasePlusROE() => getOnBase() + reachedOnErrors;

  int getAB() => getHits() + outs + reachedOnErrors;

  int getPA() => getAB() + walks + sacFlies + hbp;

  double getAVG() {
    if (getAB() == 0) {
      return -1;
    } else {
      return getHits() / getAB();
    }
  }

  double getOBP() {
    if (getPA() == 0) {
      return -1;
    } else {
      return getOnBase() / getPA();
    }
  }

  double getSLG() {
    if (getAB() == 0) {
      return -1;
    } else {
      return getTotalBases() / getAB();
    }
  }

  double getOPS() {
    if (getSLG() < 0) {
      return getOBP();
    } else {
      return getSLG() + getOBP();
    }
  }

  double getOBPwithROE() {
    if (getPA() == 0) {
      return -1;
    } else {
      return getOnBasePlusROE() / getPA();
    }
  }
}